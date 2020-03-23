package posit.make

import posit.rtl._
import scala.io.Source
import scala.collection.mutable.ListBuffer
import chisel3._

object ReadConfig {
	def readPosit(fileName: String) = {
		val nBits, eBits = new ListBuffer[Int]()

		for(line <- Source.fromFile(fileName).getLines()) {
			val posits = line.strip.toLowerCase.split(" ")
			for(p <- posits) {
				if(p.startsWith("posit")) {
					val num = p.substring(5).split("_")
					nBits += num(0).toInt
					eBits += num(1).toInt
				}
			}
		}

		(nBits.toList, eBits.toList)
	}

	def readQuire(fileName: String) = {
		val cBits, nBits, eBits = new ListBuffer[Int]()

		for(line <- Source.fromFile(fileName).getLines()) {
			val posits = line.strip.toLowerCase.strip.split(" ")
			for(p <- posits) {
				if(p.startsWith("quire")) {
					val num = p.substring(5).split("_")
					cBits += num(0).toInt
					nBits += num(1).toInt
					eBits += num(2).toInt
				}
			}
		}

		(cBits.toList, nBits.toList, eBits.toList)
	}
}

object MakePositAdder extends App {
	val (nBits, eBits) = ReadConfig.readPosit("posit.conf")
	val td = Array("-td", "./run/rtl/PositAdder")
	for(i <- 0 until nBits.length) {
		chisel3.Driver.execute(td, () => new PositAdder(nBits(i), eBits(i)))
	}
}

object MakePositMultiplier extends App {
	val (nBits, eBits) = ReadConfig.readPosit("posit.conf")
	val td = Array("-td", "./run/rtl/PositMultiplier")
	for(i <- 0 until nBits.length) {
		chisel3.Driver.execute(td, () => new PositMultiplier(nBits(i), eBits(i)))
	}
}

object MakePositFMA extends App {
	val (nBits, eBits) = ReadConfig.readPosit("posit.conf")
	val td = Array("-td", "./run/rtl/PositFMA")
	for(i <- 0 until nBits.length) {
		chisel3.Driver.execute(td, () => new PositFMA(nBits(i), eBits(i)))
	}
}

object MakePositEMA extends App {
	val (cBits, nBits, eBits) = ReadConfig.readQuire("posit.conf")
	val td = Array("-td", "./run/rtl/PositEMA")
	for(i <- 0 until cBits.length) {
		chisel3.Driver.execute(td, () => new PositEMA(cBits(i), nBits(i), eBits(i)))
	}
}

object MakePositDivisionSqrt extends App {
	val (nBits, eBits) = ReadConfig.readPosit("posit.conf")
	val td = Array("-td", "./run/rtl/PositDivisionSqrt")
	for(i <- 0 until nBits.length) {
		chisel3.Driver.execute(td, () => new PositDivisionSqrt(nBits(i), eBits(i)))
	}
}

object MakeQuireToPosit extends App {
	val (cBits, nBits, eBits) = ReadConfig.readQuire("posit.conf")
	val td = Array("-td", "./run/rtl/QuireToPosit")
	for(i <- 0 until cBits.length) {
		chisel3.Driver.execute(td, () => new QuireToPosit(cBits(i), nBits(i), eBits(i)))
	}
}