package posit.rtl

import chisel3._
import chisel3.util._
import posit.function._
import posit.function.Shift._
import posit.convert._

class PositAdder(nBits: Int, eBits: Int) extends Module {
  val io = IO(new Bundle {
    val A = Input(UInt(nBits.W))
    val B = Input(UInt(nBits.W))
    val S = Output(UInt(nBits.W))   
  })

  // param
  val fracWidth = nBits - eBits - 3
  val maxScale  = (1 << eBits) * (nBits - 2)
  override def desiredName = s"PositAdder${nBits}_${eBits}" 

  val decA = RawFloatFromPosit(io.A, nBits, eBits)
  val decB = RawFloatFromPosit(io.B, nBits, eBits)

  val aGTb        = decA.scale > decB.scale
  val greaterSign = Mux(aGTb, decA.sign, decB.sign)
  val smallerSign = Mux(aGTb, decB.sign, decA.sign)
  val greaterExp  = Mux(aGTb, decA.scale, decB.scale).asSInt
  val smallerExp  = Mux(aGTb, decB.scale, decA.scale).asSInt
  val greaterFrac = Mux(aGTb, decA.fraction, decB.fraction)
  val smallerFrac = Mux(aGTb, decB.fraction, decA.fraction)
  val scale_diff  = greaterExp - smallerExp
  val greaterSig  = Cat(greaterSign, ~greaterSign, greaterFrac)
  val smallerSig  = Cat(smallerSign, ~smallerSign, smallerFrac, 
                        0.U(3.W)).shiftRightArithSticky(scale_diff.asUInt)
  val rawSumSig   = greaterSig +& smallerSig(fracWidth + 4, 3)
  val sumSign     = decA.sign ^ decB.sign ^ rawSumSig.head(1)
  val signSumSig  = Cat(sumSign, rawSumSig.tail(1), smallerSig(2, 0))
  val sumWidth    = signSumSig.getWidth
  val sumXor      = signSumSig(sumWidth - 1, 1) ^ signSumSig.tail(1)
  val sumLZD      = LZD.lzd_dual(sumXor)
  val scaleBias   = Cat(1.U, sumLZD).asSInt + 2.S
  val sumScale    = greaterExp +& scaleBias
  val overflow    = sumScale > maxScale.S
  val normalShift = (~sumLZD).asUInt
  val shiftSig    = signSumSig.tail(2).shiftLeftLogic(normalShift)

  val decS        = Wire(new RawFloat(nBits, eBits))

  decS.sign      := sumSign
  decS.scale     := Mux(overflow, maxScale.S, sumScale)
  decS.fraction  := shiftSig.head(fracWidth) 
  decS.isNaR     := decA.isNaR || decB.isNaR
  decS.isZero    := ~signSumSig.orR || decA.isZero && decB.isZero
  decS.grs       := Cat(shiftSig(3, 2), shiftSig(1) | shiftSig(0))

  io.S := RawFloatToPosit(decS)
}