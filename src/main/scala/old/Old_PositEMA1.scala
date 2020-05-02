// // for Posit-AI accelerator

// package posit.rtl

// import chisel3._
// import chisel3.util._
// import posit.convert._
// import posit.function._
// import posit.function.Shift._

// left shift
// class PositEMA2(capacity: Int, nBits: Int, eBits: Int, latency: Int = 3) extends Module {

//   require(latency <= 3 && latency >= 1) 

//   override def desiredName = s"LSPositEMA${capacity}_${nBits}_${eBits}"

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
// 	val mulIsZero = decA.isZero || decB.isZero

//   val aSignificand = Cat(decA.sign, ~decA.sign & ~decA.isZero, decA.fraction).asSInt
//   val bSignificand = Cat(decB.sign, ~decB.sign & ~decB.isZero, decB.fraction).asSInt
//   val sig_product = (aSignificand * bSignificand).asUInt
// 	val eqTwo = ~sig_product.tail(3).orR
// 	val eqFour = ~sig_product(2 * fracWidth + 1) & eqTwo
// 	// -2 doesn't need geTwo
//   val geTwo = sig_product(2 * fracWidth + 3) ^ sig_product(2 * fracWidth + 1) 
//   val exp_mod = Cat(eqFour, geTwo).zext
//   val frac = Mux(geTwo, 
// 									sig_product(2 * fracWidth, 0), 
// 									sig_product(2 * fracWidth - 1, 0) << 1
// 								)
// 	val mulScale = decA.scale +& decB.scale + exp_mod
//   val leftShiftValue = mulScale.asUInt + (2 * maxScalingFactor + 1).U
// 	val mulSign = sig_product.head(1).asBool

//   // pass to phase 2 shift
//   val inValid_phase2   = Wire(Bool())
//   val outIsNaR_phase2  = Wire(Bool())
// 	val mulIsZero_phase2 = Wire(Bool())
// 	val mulSign_phase2   = Wire(Bool())
//   val mulFrac_phase2   = Wire(UInt((2 * fracWidth + 1).W))
//   val lsValue_phase2   = Wire(UInt((regimeWidth + eBits + 1).W))


//   val shift_regs = if(latency > 1) 1 else 0
// 	inValid_phase2    := Pipe(io.inValid, false.B, shift_regs).valid
//   outIsNaR_phase2   := Pipe(io.inValid, outIsNaR, shift_regs).bits
// 	mulIsZero_phase2  := Pipe(io.inValid, mulIsZero, shift_regs).bits
// 	mulSign_phase2    := Pipe(io.inValid, mulSign, shift_regs).bits
//   mulFrac_phase2    := Pipe(io.inValid, frac, shift_regs).bits
//   lsValue_phase2    := Pipe(io.inValid, leftShiftValue, shift_regs).bits
  

// ////////////////////////////////////////////////////////////////////////////
// ///////////////////           phase 2    shift           ///////////////////
// ////////////////////////////////////////////////////////////////////////////

// 	val fixpointTmp = Cat(
// 													Fill(qBits, mulSign_phase2),
// 													~mulSign_phase2 & ~mulIsZero_phase2, 
// 													mulFrac_phase2
// 												)
// 	val fixpoint = fixpointTmp.shiftLeftLogic(lsValue_phase2)

// 	// pass to phase 3 add
//   val inValid_phase3    = Wire(Bool())
//   val outIsNaR_phase3   = Wire(Bool())
//   val shiftSig_phase3   = Wire(UInt(qBits.W))
  

//   val add_regs = if(latency == 3) 1 else 0
// 	inValid_phase3    := Pipe(inValid_phase2, false.B, add_regs).valid
//   outIsNaR_phase3   := Pipe(inValid_phase2, outIsNaR_phase2, add_regs).bits
//   shiftSig_phase3   := Pipe(inValid_phase2, fixpoint.head(qBits), add_regs).bits
  

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


// object MakePositEMA2 extends App {
//     chisel3.Driver.execute(Array("-td", "./run/main/EMA2/NewEMA6_4_0"), 
//                             () => new PositEMA2(6, 4, 0))
//     chisel3.Driver.execute(Array("-td", "./run/main/EMA2/NewEMA6_8_0"), 
//                             () => new PositEMA2(6, 8, 0))
//     chisel3.Driver.execute(Array("-td", "./run/main/EMA2/NewEMA14_8_1"), 
//                             () => new PositEMA2(14, 8, 1))
//     chisel3.Driver.execute(Array("-td", "./run/main/EMA2/NewEMA30_8_2"), 
//                             () => new PositEMA2(30, 8, 2))
// }