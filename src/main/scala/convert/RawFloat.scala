package posit.convert

import chisel3._
import chisel3.util.log2Ceil

class RawFloat(
                val nBits: Int, 
                val eBits: Int
              ) extends Bundle {

  // scala parameters
  val regimeWidth = log2Ceil(nBits - 1) + 1
  val fracWidth   = nBits - eBits - 3

  // bundle fields
  val isNaR    = Bool()              // overrides all other fields
  val isZero   = Bool()              // overrides 'sign', 'scale' & 'fraction'
  val sign     = Bool()              // sign
  val scale    = SInt((regimeWidth + eBits).W)  // {regime, exponent}, 2's complement
  val fraction = UInt(fracWidth.W)  // 1.fraction, original code, hidden bit is always 1
  val grs      = UInt(3.W)              // for truncating significand

  override def cloneType = (new RawFloat(nBits, eBits)).asInstanceOf[this.type]
}