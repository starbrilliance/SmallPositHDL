package test

import chisel3._
import chisel3.util._
import posit.function._
//import posit.function.Shift._
//import posit.convert._

class LZDTest(width: Int) extends Module {

	override def desiredName = s"LZD_${width}"

	val io = IO(new Bundle {
		val in = Input(UInt(width.W))
		val out = Output(UInt())		
	})

	io.out := LZD.lzd(io.in)
}

class InvLZDTest(width: Int) extends Module {

	override def desiredName = s"InvLZD_${width}"

	val io = IO(new Bundle {
		val in = Input(UInt(width.W))
		val out = Output(UInt())	
	})

	io.out := ~LZD.lzd(io.in)
}

class AntiLZDTest(width: Int) extends Module {

	override def desiredName = s"AntiLZD_${width}"

	val io = IO(new Bundle {
		val in = Input(UInt(width.W))
		val out = Output(UInt())		
	})

	io.out := LZD.lzd_dual(io.in)
}

class InvAntiLZDTest(width: Int) extends Module {

	override def desiredName = s"InvAntiLZD_${width}"

	val io = IO(new Bundle {
		val in = Input(UInt(width.W))
		val out = Output(UInt())		
	})

	io.out := ~LZD.lzd_dual(io.in)
}

object MakeLZD extends App {
	val width = List(8, 16, 32, 64, 128, 256, 512, 1024)
	val td = Array("-td", "./run/rtl/lzd")
	for(w <- width) {
		chisel3.Driver.execute(td, () => new LZDTest(w))
		chisel3.Driver.execute(td, () => new InvLZDTest(w))
		chisel3.Driver.execute(td, () => new AntiLZDTest(w))
		chisel3.Driver.execute(td, () => new InvAntiLZDTest(w))
	}
}