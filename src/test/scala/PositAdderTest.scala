package posit.wave

import chisel3._
import chisel3.iotesters._
import posit.rtl._
import org.scalatest.{FlatSpec, Matchers}
/*
class PositAdderTest(c: PositAdder) extends PeekPokeTester(c) {
  val x = List(
            BigInt("01011001100000000000000000000000", 2),   // 9.5
            BigInt("01111001001110001000011000000000", 2),   // 10000.75
            BigInt("11011000000000000000000000000000", 2),   // -0.125
            BigInt("10011011011110000000000000000000", 2),   // -36.25
            BigInt("10000000000000000000000000000000", 2),   // NaR
						BigInt("01000000000000000000000000000000", 2),   // 1
						BigInt("11000000000000000000000000000000", 2),   // -1
            BigInt("00000000000000000000000000000001", 2),   // 2^-120
            BigInt("01111111111111111111111111111111", 2),   // max
            BigInt("11111111111111111111111111111111", 2),   // -min
            BigInt("11111111111111111111111111111111", 2),   // -min
            BigInt("10000000000000000000000000000001", 2),   // -max
            BigInt("01011001100000000000000000000000", 2)    // 9.5
          )
  val y = List(
            BigInt("10011111011000000000000000000000", 2),   // -18.5
            BigInt("01101111000010000000000000000000", 2),   // 225
            BigInt("11100100000000000000000000000000", 2),   // -0.03125
            BigInt("01101010001000100000000000000000", 2),   // 98.125
            BigInt("00000000000000000000000000000000", 2),   // 0
						BigInt("11000000000000000000000000000000", 2),   // -1
						BigInt("01000000000000000000000000000000", 2),   // 1
            BigInt("00000000000000000000000000000000", 2),   // 0
            BigInt("01111111111111111111111111111111", 2),   // max
            BigInt("11111111111111111111111111111111", 2),   // -min
            BigInt("00000000000000000000000000000001", 2),   // min
            BigInt("01111111111111111111111111111111", 2),   // max
            BigInt("10100110100000000000000000000000", 2)    // -9.5
          )
  val z = List(
            BigInt("10100111000000000000000000000000", 2),   // -9
            BigInt("01111001001111111000111000000000", 2),   // 10225.75
            BigInt("11010110000000000000000000000000", 2),   // -0.15625
            BigInt("01100111101111000000000000000000", 2),   // 61.875
            BigInt("10000000000000000000000000000000", 2),   // NaR
						BigInt("00000000000000000000000000000000", 2),   // 0
						BigInt("00000000000000000000000000000000", 2),   // 0
            BigInt("00000000000000000000000000000001", 2),   // 2^-120
            BigInt("01111111111111111111111111111111", 2),   // max
            BigInt("11111111111111111111111111111111", 2),   // -min
            BigInt("00000000000000000000000000000000", 2),   // 0
            BigInt("00000000000000000000000000000000", 2),   // 0
            BigInt("00000000000000000000000000000000", 2)    // 0
          )
  for(i <- 0 until x.length) {
    poke(c.io.A, x(i))
    poke(c.io.B, y(i))
    step(1)
    expect(c.io.S, z(i))
  }
	step(5)
}
*/
class PositAdderTest(c: PositAdder) extends PeekPokeTester(c) {
  val x = List(
            BigInt("00000000000000000000000000000000", 2)   // 0
          )
  val y = List(          
            BigInt("11111111111111111111111111111111", 2)   // 2^-120
          )
  val z = List(
            BigInt("11111111111111111111111111111111", 2)   // 2^-120
          )
  for(i <- 0 until x.length) {
    poke(c.io.A, x(i))
    poke(c.io.B, y(i))
    step(1)
    expect(c.io.S, z(i))
  }
	step(5)
}


class PositAdderSpec extends FlatSpec with Matchers {

  val testOptions = new TesterOptionsManager {
  
    testerOptions = testerOptions.copy(
      isVerbose = true,
      backendName = "verilator"
    )
  
    commonOptions = commonOptions.copy(
      targetDirName = "./run/wave/PositAdder"
    )
  }

  behavior of "posit adder module"

  it should "properly add posit types" in {
    chisel3.iotesters.Driver.execute(() => new PositAdder(32, 0), testOptions) { c =>
      new PositAdderTest(c)
    } should be (true)
  }
}