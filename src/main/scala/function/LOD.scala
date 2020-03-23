package posit.function

import chisel3._
import chisel3.util._

object LOD {
  def apply(in: UInt): UInt = lod(in)

  def lod(in: UInt): UInt = {
    import Shift._
    val w = in.getWidth
    
    if(w == 1) {
      in(0)
    }
    else if(w == 2) {
      Cat(in.andR, in(1) & ~in(0))
    }
    else {
      val h = 1 << (log2Ceil(w) - 1)
      
      val nh = lod(in.head(h))
      val nl = lod(in.tail(h))
      val vh = nh.first
      val vl = nl.first
      
      if(h == w - h) {
        Cat(vh & vl, vh & ~vl, Mux(vh, nl.tail(1), nh.tail(1)))
      }
      else
        Cat(vh, Mux(vh, nl, nh.tail(1)))
    }
  }

  // ~lod is better
  def lod_dual(in: UInt): UInt = {
    import Shift._
    val w = in.getWidth
  
    if(w == 1) {
      ~in(0)
    }
    else if(w == 2) {
      Cat(~(in.andR), ~in(1) | in(0))
    }
    else {
      val h = 1 << (log2Ceil(w) - 1)
      
      val nh = lod_dual(in.head(h))
      val nl = lod_dual(in.tail(h))
      val vh = nh.first
      val vl = nl.first
    
      if(h == w - h) {
        Cat(vh | vl, vh | ~vl, Mux(vh, nh.tail(1), nl.tail(1)))
      }
      else {
        val nlFillOne = if(nh.getWidth == nl.getWidth+1) 
                          nl 
                        else 
                          Cat(Fill(nh.getWidth-1-nl.getWidth, 1.U), nl)
        Cat(vh, Mux(vh, nh.tail(1), nlFillOne))
      }
    }
  }
}
