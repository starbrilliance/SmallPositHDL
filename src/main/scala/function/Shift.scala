package posit.function

import chisel3._
import chisel3.util._
import scala.math.{pow, min}

object Shift {
  implicit class BitsImprovements[T <: Bits](bits: T) {
    val N = bits.getWidth
    val S = log2Up(N)

    def first = bits(bits.getWidth-1)

    def shiftLeftLogic[TS <: Bits](shift: TS) : Bits = {
      val SW = S min shift.getWidth
      Mux(shift.asUInt < N.U,
        doShiftLeftLogic(bits, shift(SW-1,0)),
        0.U(N.W))
    }
    def shiftLeftRotate[TS <: Bits](shift: TS) : Bits = {
      val SW = S min shift.getWidth
      assert(shift.asUInt < N.U)
      doShiftLeftRotate(bits, shift(SW-1,0))
    }
    def shiftRightLogic[TS <: Bits](shift: TS) : Bits = {
      val SW = S min shift.getWidth
      Mux(shift.asUInt < N.U,
        doShiftRightLogic(bits, shift(SW-1,0)),
        Fill(N, 0.U))
    }
    def shiftRightArith[TS <: Bits](shift: TS) : Bits = {
      val SW = S min shift.getWidth
      Mux(shift.asUInt < N.U,
        doShiftRightArith(bits, shift(SW-1,0)),
        Fill(N, bits.first))
    }
    def shiftRightArithSticky[TS <: Bits](shift: TS) : Bits = {
      val SW = S min shift.getWidth
      Mux(shift.asUInt < N.U,
        doShiftRightArithSticky(bits, shift(SW-1,0)),
        Fill(N, bits.first))
    }
    def shiftRightArithStickyWidth[TS <: Bits](width: Int = N)(shift: TS) : Bits = {
      val SW = log2Up(width) min shift.getWidth
      val sticky  = bits.tail(width).orR
      val shifted = doShiftRightArithSticky(bits.head(width), shift(SW-1,0))
      Mux(shift.asUInt < width.U,
        shifted.asUInt | sticky,
        Fill(width, bits.first))
    }
    def shiftRightArithStickyRounded[TS <: Bits](width: Int)(shift: TS) : Bits = {
      val length = shift.getWidth
      val SW = log2Up(width) min length
      val (sticky, shifted) = doShiftRightArithStickyRounded(bits.head(width), shift(SW-1,0))
      
      shifted.asUInt | sticky.asUInt
    }
  }
  def doShiftLeftLogic[TI <: Bits, TS <: Bits](in: TI, shift: TS) : Bits = {
    val length = shift.getWidth
    val inWidth = in.getWidth
    val amount = pow(2, length-1).intValue
    val shifted = if(inWidth == 1) Mux(shift.first, 0.U, in)
                  else Mux(shift.first, Cat(in.tail(amount), Fill(amount, 0.U)), in)
    
    if(length == 1) shifted else doShiftLeftLogic(shifted, shift.tail(1))
  }
  def doShiftLeftRotate[TI <: Bits, TS <: Bits](in: TI, shift: TS) : Bits = {
    val length = shift.getWidth
    val amount = pow(2, length-1).intValue
    val shifted = Mux(shift.first, Cat(in.tail(amount), in.head(amount)), in)
    if(length == 1) shifted else doShiftLeftRotate(shifted, shift.tail(1))
  }
  def doShiftRightLogic[TI <: Bits, TS <: Bits](in: TI, shift: TS) : Bits = {
    val length = shift.getWidth
    val amount = pow(2, length-1).intValue
    val shifted = Mux(shift.first, Cat(Fill(amount, 0.U), in.head(in.getWidth-amount)), in)
    if(length == 1) shifted else doShiftRightLogic(shifted, shift.tail(1))
  }
  def doShiftRightArith[TI <: Bits, TS <: Bits](in: TI, shift: TS) : Bits = {
    val length = shift.getWidth
    val amount = pow(2, length-1).intValue
    val shifted = Mux(shift.first, Cat(Fill(amount, in.first), in.head(in.getWidth-amount)), in)
    if(length == 1) shifted else doShiftRightArith(shifted, shift.tail(1))
  }
  def doShiftRightArithSticky[TI <: Bits, TS <: Bits](in: TI, shift: TS) : Bits = {
    val length = shift.getWidth
    val amount = pow(2, length-1).intValue
    val remain = in.getWidth - amount
    val remain_bits = in.head(remain) | in.tail(remain).orR
    val shifted = Mux(shift.first, Cat(Fill(amount, in.first), remain_bits), in)
    if(length == 1) shifted else doShiftRightArithSticky(shifted, shift.tail(1))
  }
  def doShiftRightArithStickyRounded[TI <: Bits, TS <: Bits](in: TI, shift: TS) : (Bool, Bits) = {
    val length = shift.getWidth
    val amount = pow(2, length-1).intValue
    val remain = in.getWidth - amount
    val remain_bits = in.head(remain)
    val shifted = Mux(shift.first, Cat(Fill(amount, in.first), remain_bits), in)
    val sticky = shift.first & in.tail(remain).orR
    if(length == 1) {
      (sticky, shifted)
    }
    else {
      val (nextSticky, nextShifted) = doShiftRightArithStickyRounded(shifted, shift.tail(1))
      (sticky | nextSticky, nextShifted)
    }
  }
}