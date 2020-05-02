// // for Posit-AI accelerator

// package posit.rtl

// import chisel3._
// import chisel3.util._
// import posit.convert._
// import posit.function._
// import posit.function.Shift._

// right shift
// class PositEMA3(capacity: Int, nBits: Int, eBits: Int, latency: Int = 3) extends Module {

//   require(latency <= 3 && latency >= 1) 

//   override def desiredName = s"RSPositEMA${capacity}_${nBits}_${eBits}"

// ////////////////////////////////////////////////////////////////////////////
// ///////////////////////          parameters          ///////////////////////
// ////////////////////////////////////////////////////////////////////////////

//   // posit
//   val regimeWidth = log2Ceil(nBits - 1) + 1  // 1bit sign
//   val fracWidth = nBits - eBits - 3
//   val sigWidth = fracWidth + 1
//   val maxScalingFactor = (1 << eBits) * (nBits - 2)
//   val minScalingFactor = -maxScalingFactor
//   // quire
//   val lower = 2 * maxScalingFactor
//   val upper = lower + 1
//   val qBits = lower + upper + capacity + 1   // 1-bit sign

// ////////////////////////////////////////////////////////////////////////////
// ///////////////////////              io              ///////////////////////
// ////////////////////////////////////////////////////////////////////////////

//   val io = IO(new Bundle {
//     val inValid        = Input(Bool())
//     val in_A           = Input(UInt(nBits.W))
//     val in_B           = Input(UInt(nBits.W))
//     /*--------------------------------------------------------------------
//     *--------------------------------------------------------------------*/
//     val out            = Output(UInt(qBits.W))
//     val outValid       = Output(Bool())
//   })

// ////////////////////////////////////////////////////////////////////////////
// ///////////////////       phase 1    multiplication      ///////////////////
// ////////////////////////////////////////////////////////////////////////////

//   val decA = RawFloatFromPosit(io.in_A, nBits, eBits)
//   val decB = RawFloatFromPosit(io.in_B, nBits, eBits)
  
//   val outIsNaR = decA.isNaR || decB.isNaR

//   val aSignificand = Cat(decA.sign, ~decA.sign & ~decA.isZero, decA.fraction).asSInt
//   val bSignificand = Cat(decB.sign, ~decB.sign & ~decB.isZero, decB.fraction).asSInt
//   val sig_product = (aSignificand * bSignificand).asUInt
// 	val mulScale = decA.scale +& decB.scale
// 	val mulScaleBias = mulScale +& (2 * minScalingFactor).S
//   val leftShiftValue = AbsXOR(mulScaleBias)


//   // pass to phase 2 shift
//   val inValid_phase2   = Wire(Bool())
//   val outIsNaR_phase2  = Wire(Bool())
//   val mulSig_phase2    = Wire(UInt((2 * fracWidth + 4).W))
//   val lsValue_phase2   = Wire(UInt((regimeWidth + eBits + 1).W))


//   val shift_regs = if(latency > 1) 1 else 0
// 	inValid_phase2    := Pipe(io.inValid, false.B, shift_regs).valid
//   outIsNaR_phase2   := Pipe(io.inValid, outIsNaR, shift_regs).bits
//   mulSig_phase2     := Pipe(io.inValid, sig_product, shift_regs).bits
//   lsValue_phase2    := Pipe(io.inValid, leftShiftValue, shift_regs).bits
  

// ////////////////////////////////////////////////////////////////////////////
// ///////////////////           phase 2    shift           ///////////////////
// ////////////////////////////////////////////////////////////////////////////

// 	val fixpointTmp = Cat(
// 													Fill(capacity - 2, mulSig_phase2.head(1)),
// 													mulSig_phase2, 
// 													Fill(2 * (lower - fracWidth), 0.U)
// 												)
// 	val fixpoint = fixpointTmp.shiftRightArith(lsValue_phase2)

// 	// pass to phase 3 add
//   val inValid_phase3    = Wire(Bool())
//   val outIsNaR_phase3   = Wire(Bool())
//   val shiftSig_phase3   = Wire(UInt(qBits.W))
  

//   val add_regs = if(latency == 3) 1 else 0
// 	inValid_phase3    := Pipe(inValid_phase2, false.B, add_regs).valid
//   outIsNaR_phase3   := Pipe(inValid_phase2, outIsNaR_phase2, add_regs).bits
//   shiftSig_phase3   := Pipe(inValid_phase2, fixpoint, add_regs).bits
  

// ////////////////////////////////////////////////////////////////////////////
// ///////////////////          phase 3    addition         ///////////////////
// ////////////////////////////////////////////////////////////////////////////

//   val quire_reg = RegInit(0.U(qBits.W))

// 	val quireIsNaR = (quire_reg.head(1) & !quire_reg.tail(1).orR).asBool

// 	when(inValid_phase3) {
// 		when(quireIsNaR | outIsNaR_phase3) {
// 			quire_reg := 1.U << (qBits - 1)
// 		} .otherwise {
// 			quire_reg := quire_reg + shiftSig_phase3
// 		}	
// 	}
  

// ////////////////////////////////////////////////////////////////////////////
// ///////////////////////             out              ///////////////////////
// //////////////////////////////////////////////////////////////////////////// 

//   io.outValid := Pipe(inValid_phase3, false.B, 1).valid
//   io.out      := quire_reg
// } 


// object MakePositEMA3 extends App {
//     chisel3.Driver.execute(Array("-td", "./run/main/EMA3/RSEMA6_4_0"), 
//                             () => new PositEMA3(6, 4, 0))
//     chisel3.Driver.execute(Array("-td", "./run/main/EMA3/RSEMA6_8_0"), 
//                             () => new PositEMA3(6, 8, 0))
//     chisel3.Driver.execute(Array("-td", "./run/main/EMA3/RSEMA14_8_1"), 
//                             () => new PositEMA3(14, 8, 1))
//     chisel3.Driver.execute(Array("-td", "./run/main/EMA3/RSEMA30_8_2"), 
//                             () => new PositEMA3(30, 8, 2))
// }