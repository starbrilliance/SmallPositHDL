package posit.convert

import chisel3._
import chisel3.util._
import posit.function._
import posit.function.Shift._

////////////////////////////////////////////////////////////////////////////
//////////          converting a rawfloat from/to UInt             /////////
//////////                   combination logic                     /////////
////////////////////////////////////////////////////////////////////////////

object RawFloatFromPosit {
  def apply(in: UInt, nBits: Int, eBits: Int) = {
    val out = Wire(new RawFloat(nBits, eBits))

    val realInput  = in(nBits - 1, 0)
    val regimeSign = in(nBits - 1) ^ in(nBits - 2)
    val regimeXor  = in(nBits - 2, 1) ^ in(nBits - 3, 0)
    val lzd        = LZD.lzd_dual(regimeXor)
    val rLength    = ~lzd
    val expFrac    = realInput.tail(3).shiftLeftLogic(rLength)
    val exp        = expFrac.head(eBits)
    val frac       = expFrac.tail(eBits)
    val regime     = Cat(!regimeSign, Mux(regimeSign, ~lzd, lzd))               
    val scale      = if(eBits > 0) Cat(regime, Mux(in(nBits - 1), ~exp, exp))
                     else regime

    out.isNaR := realInput(nBits - 1) & ~realInput.tail(1).orR
    out.isZero := !realInput(nBits - 1) & ~realInput.tail(1).orR
    out.sign := realInput(nBits - 1).asBool
    out.scale := scale.asSInt 
    out.fraction := frac
    out.grs := 0.U

    out  
  } 
}

object RawFloatToPosit {
  def apply(in: RawFloat) = {
    val nBits = in.nBits
    val eBits = in.eBits
    val out = Wire(UInt(nBits.W))
  
    val exp           = if(eBits > 0) Mux(in.sign, ~in.scale(eBits-1, 0), in.scale(eBits-1, 0))
                        else UInt()
    val regime        = in.scale >> eBits
    val rsign         = regime.head(1).asBool
    val rLength       = Mux(rsign, ~regime, regime)
    val fillSign      = rsign ^ in.sign
    val regimeExpFrac = if(eBits > 0) Cat(~fillSign, fillSign, exp, in.fraction, in.grs)
                        else Cat(~fillSign, fillSign, in.fraction, in.grs)
    val sticky_result = regimeExpFrac.shiftRightArithSticky(rLength)
    val last   = sticky_result(3)
    val gourd  = sticky_result(2)
    val round  = sticky_result(1)
    val sticky = sticky_result(0)
    val positive_near_zero_or_negtive_near_nar = ~sticky_result.head(nBits - 1).orR
    val negtive_near_zero_or_positive_near_nar =  sticky_result.head(nBits - 1).andR
    val rounding_increment = gourd & (last | round | sticky)
    val increment = positive_near_zero_or_negtive_near_nar | (~negtive_near_zero_or_positive_near_nar & rounding_increment)
    val result_rounded = sticky_result.head(nBits - 1) + increment

    out := MuxCase(Cat(in.sign, result_rounded),
                    Array(
                      in.isNaR -> (1.U << (nBits - 1)),
                      in.isZero -> 0.U
                    )
                  )

    out
  }
}