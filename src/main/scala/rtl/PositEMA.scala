// for Posit-AI accelerator

package posit.rtl

import chisel3._
import chisel3.util._
import posit.convert._
import posit.function._
import posit.function.Shift._

// this area is minimal
// left & right shift
class PositEMA(capacity: Int, nBits: Int, eBits: Int, latency: Int = 3) extends Module {

  require(latency <= 3 && latency >= 1) 

  override def desiredName = s"PositEMA${capacity}_${nBits}_${eBits}"

////////////////////////////////////////////////////////////////////////////
///////////////////////          parameters          ///////////////////////
////////////////////////////////////////////////////////////////////////////

  // posit
  val regimeWidth = log2Ceil(nBits - 1) + 1  // 1bit sign
  val fracWidth   = nBits - eBits - 3
  val maxScale    = (1 << eBits) * (nBits - 2)
  // quire
  val lower       = 2 * maxScale
  val upper       = lower + 1
  val qBits       = lower + upper + capacity + 1   // 1-bit sign

////////////////////////////////////////////////////////////////////////////
///////////////////////              io              ///////////////////////
////////////////////////////////////////////////////////////////////////////

  val io = IO(new Bundle {
    val inValid      = Input(Bool())
    val A            = Input(UInt(nBits.W))
    val B            = Input(UInt(nBits.W))
    /*--------------------------------------------------------------------
    *--------------------------------------------------------------------*/
    val E            = Output(UInt(qBits.W))
    val outValid     = Output(Bool())
  })

////////////////////////////////////////////////////////////////////////////
///////////////////       phase 1    multiplication      ///////////////////
////////////////////////////////////////////////////////////////////////////

  val decA = RawFloatFromPosit(io.A, nBits, eBits)
  val decB = RawFloatFromPosit(io.B, nBits, eBits)
  
  val outIsNaR = decA.isNaR || decB.isNaR
	val mulScale = decA.scale +& decB.scale
  val sigA     = Cat(decA.sign, ~decA.sign & ~decA.isZero, decA.fraction).asSInt
  val sigB     = Cat(decB.sign, ~decB.sign & ~decB.isZero, decB.fraction).asSInt
  val sigP     = (sigA * sigB).asUInt

  // pass to phase 2 shift
  val inValid_phase2   = Wire(Bool())
  val outIsNaR_phase2  = Wire(Bool())
  val mulSig_phase2    = Wire(UInt((2 * fracWidth + 4).W))
  val mulScale_phase2  = Wire(SInt((regimeWidth + eBits + 1).W))
  val shiftRegs        = if(latency > 1) 1 else 0
	
  inValid_phase2  := Pipe(io.inValid, false.B, shiftRegs).valid
  outIsNaR_phase2 := Pipe(io.inValid, outIsNaR, shiftRegs).bits
  mulSig_phase2   := Pipe(io.inValid, sigP, shiftRegs).bits
  mulScale_phase2 := Pipe(io.inValid, mulScale, shiftRegs).bits
  
////////////////////////////////////////////////////////////////////////////
///////////////////           phase 2    shift           ///////////////////
////////////////////////////////////////////////////////////////////////////

  val absScale = AbsXOR(mulScale_phase2)
  val extSig   = Cat(
                      Fill(qBits - lower - 4, mulSig_phase2.head(1)), 
                      mulSig_phase2, 
									    Fill(lower - 2 * fracWidth, 0.U)
                    )

	val leftShiftSig  = extSig.shiftLeftLogic(absScale)
	val rightShiftSig = extSig.shiftRightArith(absScale)
	val shiftSig      = Mux(
                            mulScale_phase2.head(1).asBool, 
                            rightShiftSig, 
                            leftShiftSig
                          )

	// pass to phase 3 add
  val inValid_phase3  = Wire(Bool())
  val outIsNaR_phase3 = Wire(Bool())
  val shiftSig_phase3 = Wire(UInt(extSig.getWidth.W))
  val addRegs         = if(latency == 3) 1 else 0
	
  inValid_phase3  := Pipe(inValid_phase2, false.B, addRegs).valid
  outIsNaR_phase3 := Pipe(inValid_phase2, outIsNaR_phase2, addRegs).bits
  shiftSig_phase3 := Pipe(inValid_phase2, shiftSig, addRegs).bits
  
////////////////////////////////////////////////////////////////////////////
///////////////////          phase 3    addition         ///////////////////
////////////////////////////////////////////////////////////////////////////

  val quireReg   = RegInit(0.U(qBits.W))
	val quireIsNaR = (quireReg.head(1) & !quireReg.tail(1).orR).asBool

	when(inValid_phase3) {
		when(quireIsNaR | outIsNaR_phase3) {
			quireReg := 1.U << (qBits - 1)
		} .otherwise {
			quireReg := quireReg + shiftSig_phase3
		}	
	}
  
////////////////////////////////////////////////////////////////////////////
///////////////////////             out              ///////////////////////
//////////////////////////////////////////////////////////////////////////// 

  io.outValid := Pipe(inValid_phase3, false.B, 1).valid
  io.E        := quireReg
} 