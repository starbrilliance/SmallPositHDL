package posit.function

import chisel3._
import chisel3.util.Fill

// xor is better than mux
object AbsXOR {
  def apply(in: Bits): UInt = {
    val w = in.getWidth
    (Fill(w, in.head(1)) ^ in.asUInt) + in.head(1)
  }
}

object AbsMUX {
  def apply(in: Bits): UInt = {
    Mux(in.head(1).asBool, (~in).asUInt + 1.U, in).asUInt
  }
}