// for Posit-AI accelerator

package posit.rtl

import chisel3._
import chisel3.util._
import posit.convert._
import posit.function._
import posit.function.Shift._

class QuireToPosit(capacity: Int, nBits: Int, eBits: Int) extends Module {
	
	override def desiredName = s"QuireToPosit${capacity}_${nBits}_${eBits}"

////////////////////////////////////////////////////////////////////////////
///////////////////////          parameters          ///////////////////////
////////////////////////////////////////////////////////////////////////////

  // posit
  val regimeWidth = log2Ceil(nBits - 1) + 1  // 1bit sign
  val fracWidth   = nBits - eBits - 3
  val sigWidth    = fracWidth + 1
  val maxScale    = (1 << eBits) * (nBits - 2)
  val minScale    = -maxScale - 1
  // quire
  val lower       = 2 * maxScale
  val upper       = lower + 1
  val qBits       = lower + upper + capacity + 1   // 1-bit sign

////////////////////////////////////////////////////////////////////////////
///////////////////////              io              ///////////////////////
////////////////////////////////////////////////////////////////////////////

  val io = IO(new Bundle {
    val inValid  = Input(Bool())
    val quireIn  = Input(UInt(qBits.W))
    /*--------------------------------------------------------------------
    *--------------------------------------------------------------------*/
    val positOut = Output(UInt(nBits.W))
    val outValid = Output(Bool())
  })

	// raw float
	val outRawFloat = Wire(new RawFloat(nBits, eBits))

	// exception
	val tailIsZero  = ~io.quireIn.tail(1).orR

	outRawFloat.isNaR := io.quireIn.head(1) & tailIsZero
	outRawFloat.isZero := ~io.quireIn.head(1) & tailIsZero

	// sign
	outRawFloat.sign := io.quireIn.head(1)

	// scale
	val quireScaleWidth = log2Ceil(qBits + 1) + 1  // 1bit sign
	val baseScale       = (upper + capacity).S(quireScaleWidth.W)
	val quireXOR        = io.quireIn(qBits - 1, 1) ^ io.quireIn(qBits - 2, 0)
	val quireLZD        = LZD.lzd_dual(quireXOR)
	val scaleBias       = Cat(1.U, quireLZD)
	val realScale       = baseScale + scaleBias.asSInt
	val underflow       = realScale < minScale.S
  val overflow        = realScale > maxScale.S

	outRawFloat.scale := MuxCase(
																realScale, 
																Array(
                                    		overflow  -> maxScale.S,
                                    		underflow -> minScale.S
                                  		)
                   						)


	// fraction & grs

	// 6_8_0 is better
	// val shiftValue = ~quireLZD
	// val quireShift = io.quireIn.tail(2).shiftLeftLogic(shiftValue) 
	// outRawFloat.fraction := quireShift.head(fracWidth)
	// outRawFloat.grs := Cat(
	// 												quireShift.tail(fracWidth).head(2),
	// 												quireShift.tail(fracWidth + 2).orR
	// 											)

	// it's not suitable for all kinds of quire
	val absRealScale    = AbsXOR(realScale)
	val quireLeftShift  = io.quireIn.shiftLeftLogic(absRealScale) 
	val quireRightShift = io.quireIn.shiftRightLogic(absRealScale)
	val realFGRSTmp1    = Cat(quireLeftShift(lower - 1, lower - fracWidth - 2),
												 		quireLeftShift(lower - fracWidth - 3, 0).orR)	
	val realFGRSTmp2    = Cat(quireRightShift(lower - 1, lower - fracWidth - 2),
												 		quireRightShift(lower - fracWidth - 3, 0).orR)
	val realFGRS        = Mux(realScale.head(1).asBool, realFGRSTmp1, realFGRSTmp2)
	
	outRawFloat.fraction := realFGRS.head(fracWidth)
	outRawFloat.grs      := realFGRS.tail(fracWidth)

	// out
	val outPosit = RawFloatToPosit(outRawFloat)
	io.outValid := Pipe(io.inValid, false.B, 1).valid
  io.positOut := Pipe(io.inValid, outPosit, 1).bits 
}