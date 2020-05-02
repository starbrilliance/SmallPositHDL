package posit.rtl

import chisel3._
import chisel3.util._
import posit.function._
import posit.function.Shift._
import posit.convert._

/*
                    table of mantissa production
          
poly          positive                     negative
range          [1, 4]                      (-4, -1)        
        decimal      binary          decimal       binary     
          1.0      0001.0000...       -1.0      doesn't exist
          1.f      0001.xxxx...       -1.f      1110.xxxx...
          2.0      0010.0000...       -2.0      1110.0000...
          2.f      0010.xxxx...       -2.f      1101.xxxx...
          3.0      0011.0000...       -3.0      1101.0000...
          3.f      0011.xxxx...       -3.f      1100.xxxx...
          4.0      0100.0000...       -4.0      doesn't exist

*/

class PositMultiplier(nBits: Int, eBits: Int) extends Module {
  val io = IO(new Bundle {
    val A = Input(UInt(nBits.W))
    val B = Input(UInt(nBits.W))
    val M = Output(UInt(nBits.W))      
  })

	override def desiredName = s"PositMultiplier${nBits}_${eBits}"

	// parameters
	val fracWidth = nBits - eBits - 3
  val maxScale  = (1 << eBits) * (nBits - 2)
  val minScale  = -maxScale - 1


  val decA = RawFloatFromPosit(io.A, nBits, eBits)
  val decB = RawFloatFromPosit(io.B, nBits, eBits)

  val sigA      = Cat(decA.sign, ~decA.sign, decA.fraction).asSInt
  val sigB      = Cat(decB.sign, ~decB.sign, decB.fraction).asSInt
  val sigP      = (sigA * sigB).asUInt
  val head2     = sigP.head(2)
	val addTwo    = ~head2(1) & head2(0)
	// -2 doesn't  need addOne
  val addOne    = sigP(2 * fracWidth + 3) ^ sigP(2 * fracWidth + 1) 
  val expBias   = Cat(addTwo, addOne).zext
  val frac      = Mux(
                      addOne, 
								 	    sigP(2 * fracWidth, 0), 
									    sigP(2 * fracWidth - 1, 0) << 1
								    ) 
  val mulScale  = decA.scale +& decB.scale + expBias
  val underflow = mulScale < minScale.S
  val overflow  = mulScale > maxScale.S
  
  val decM      = Wire(new RawFloat(nBits, eBits))

  decM.sign     := sigP.head(1).asBool
  decM.scale    := MuxCase(
                            mulScale, 
                            Array(
                                  overflow  -> maxScale.S,
                                  underflow -> minScale.S
                                )
                   		    )
  decM.fraction := frac.head(fracWidth)
  decM.isNaR    := decA.isNaR || decB.isNaR
  decM.isZero   := decA.isZero || decB.isZero

  // grs
  val grsTmp      = frac.tail(fracWidth)
  val grsTmpWidth = grsTmp.getWidth
  if(grsTmpWidth >= 3) {
    decM.grs := Cat(grsTmp.head(2), grsTmp.tail(2).orR)
  } else {
    val fillWidth = 3 - grsTmpWidth
    val grsFull   = Cat(grsTmp, 0.U(fillWidth.W))

    decM.grs := grsFull
  }

  io.M := RawFloatToPosit(decM)
}