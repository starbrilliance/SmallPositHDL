package posit.wave

import chisel3._
import chisel3.iotesters._
import posit.rtl._
import org.scalatest.{FlatSpec, Matchers}

class PositFMATest(c: PositFMA) extends PeekPokeTester(c) {
  val x = List(
            BigInt("10000000000000000000000000000000", 2),   // NaR
            BigInt("01111001001110001000011000000000", 2),   // 10000.75
            BigInt("10011011011110000000000000000000", 2),   // -36.25
            BigInt("01011001100000000000000000000000", 2),   // 9.5
            BigInt("01011001100000000000000000000000", 2),   // 9.5
            BigInt("00000000000000000000000000000000", 2),   // 0
            BigInt("11011000000000000000000000000000", 2),   // -0.125
            BigInt("01100100100010000000000000000000", 2),   // 36.25
            BigInt("01100100100010000000000000000000", 2),   // 36.25
            BigInt("11000000000000000000000000000000", 2),   // -1
            BigInt("01111001001110001000011000000000", 2),  // 10000.75
            BigInt("11000000000000000000000000000000", 2)    // -1
          )
  val y = List(
            BigInt("01101111000010000000000000000000", 2),   // 225
            BigInt("01101111000010000000000000000000", 2),   // 225
            BigInt("01101010001000100000000000000000", 2),   // 98.125
            BigInt("01000000000000000000000000000000", 2),   // 1
            BigInt("01000000000000000000000000000000", 2),   // 1
            BigInt("01000000000000000000000000000000", 2),   // 1
            BigInt("11100100000000000000000000000000", 2),   // -0.03125
            BigInt("01000000000000000000000000000000", 2),   // 1
            BigInt("00000000000000000000000000000000", 2),   // 0
            BigInt("01000000000000000000000000000000", 2),   // 1
            BigInt("01101111000010000000000000000000", 2),  // 225
            BigInt("11000000000000000000000000000000", 2)    // -1
          )
  val z = List(
            BigInt("00000000000000000000000000000001", 2),   // 2^-120
            BigInt("00000000000000000000000000000001", 2),   // 2^-120
            BigInt("00000000000000000000000000000000", 2),   // 0
            BigInt("10011111011000000000000000000000", 2),   // -18.5
            BigInt("00000000000000000000000000000000", 2),   // 0
            BigInt("00000000000000000000000000000001", 2),   // 2^-120
            BigInt("00000000000000000000000000000000", 2),   // 0
            BigInt("01100100100010000000000000000000", 2),   // 36.25
            BigInt("00000000000000000000000000000000", 2),   // 0
            BigInt("01000000000000000000000000000000", 2),   // 1
            BigInt("00000000000000000000000000000001", 2),  // 2^-120
            BigInt("11000000000000000000000000000000", 2)    // -1
          )

  val out = List(
              BigInt("10000000000000000000000000000000", 2),   // x(0) * y(0) + z(0)
              BigInt("01111110010001001010101101110010", 2),   // x(1) * y(1) + z(1) == x(1) * y(1) + 1ULP
              BigInt("10001000100001101011111000000000", 2),   // x(2) * y(2) + 0
              BigInt("01100011000000000000000000000000", 2),   // x(3) * y(3) - z(3)
              BigInt("01011001100000000000000000000000", 2),   // x(4) * y(4) + z(4) == x(3) + 0 == x(3)
              BigInt("00000000000000000000000000000001", 2),   // x(5) * y(5) + z(5) == 0 + z(5) == z(5)
              BigInt("00010000000000000000000000000000", 2),   // x(6) * y(6) + 0
              BigInt("00000000000000000000000000000000", 2),   // x(7) * y(7) - z(7) == 0
              BigInt("00000000000000000000000000000000", 2),   // x(8) * y(8) + z(8)
              BigInt("00000000000000000000000000000000", 2),   // x(9) * y(9) + z(9)
              BigInt("01111110010001001010101101110001", 2),  // x(10) * y(10) - z(10) == x(10) * y(10)
              BigInt("00000000000000000000000000000000", 2)    // x(11) * y(11) + z(11)
            )

  val ambpc  = 0 
  val ambsc  = 1 
  val nambpc = 2 
  val nambsc = 3 

  val opCode = List(ambpc, ambpc, ambpc, ambsc, ambpc, ambpc, ambpc, ambsc, ambpc, ambpc, ambsc, ambpc)

  for(i <- 0 until (x.length + 1)) {
		poke(c.io.inValid, 1)
    poke(c.io.fmaOp, opCode(i % x.length)) 
		poke(c.io.A, x(i % x.length))
    poke(c.io.B, y(i % x.length))
    poke(c.io.C, z(i % x.length))
    step(1)
    if(i > 0) {
      expect(c.io.F, out(i - 1))
			expect(c.io.outValid, 1)
    }
	}
  step(1)
}

// Scala style testing
class PositFMASpec extends FlatSpec with Matchers {

  val testOptions = new TesterOptionsManager {
  
    testerOptions = testerOptions.copy(
      isVerbose = true,
      backendName = "verilator"
    )
  
    commonOptions = commonOptions.copy(
      targetDirName = "./run/wave/PositFMA"
    )
  }

  behavior of "posit fma module"

  it should "properly mul/add posit types" in {
    chisel3.iotesters.Driver.execute(() => new PositFMA(32, 2), testOptions) { c =>
      new PositFMATest(c)
    } should be (true)
  }
}
