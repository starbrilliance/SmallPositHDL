package posit.wave

import chisel3._
import chisel3.iotesters._
import posit.rtl._
import org.scalatest.{FlatSpec, Matchers}
/*
// posit<32, 2>
class PositMultiplierTest(c: PositMultiplier) extends PeekPokeTester(c) {
  val x = List(
						BigInt("11000000000000000000000000000000", 2),   // -1
						BigInt("11000000000000000000000000000000", 2),   // -1
            BigInt("01011001100000000000000000000000", 2),   // 9.5
            BigInt("01111001001110001000011000000000", 2),   // 10000.75
            BigInt("11011000000000000000000000000000", 2),   // -0.125
            BigInt("10011011011110000000000000000000", 2),   // -36.25
            BigInt("10000000000000000000000000000000", 2),   // NaR
            BigInt("10000000000000000000000000000000", 2),   // NaR
            BigInt("01111111111111111111111111111111", 2),   // maxpos
            BigInt("11111111111111111111111111111111", 2)    // -minpos
          )
  val y = List(
						BigInt("01000000000000000000000000000000", 2),   // 1
						BigInt("11000000000000000000000000000000", 2),   // -1
            BigInt("10011111011000000000000000000000", 2),   // -18.5
            BigInt("01101111000010000000000000000000", 2),   // 225
            BigInt("11100100000000000000000000000000", 2),   // -0.03125
            BigInt("01101010001000100000000000000000", 2),   // 98.125
            BigInt("00000000000000000000000000000000", 2),   // 0
            BigInt("01011001100000000000000000000000", 2),   // 9.5
            BigInt("01111111111111111111111111111111", 2),   // maxpos
            BigInt("00000000000000000000000000000001", 2)    // minpos
          )
  val z = List(
						BigInt("11000000000000000000000000000000", 2),   // -1
						BigInt("01000000000000000000000000000000", 2),   // 1
            BigInt("10010010100000100000000000000000", 2),   // -175.75
            BigInt("01111110010001001010101101110010", 2),   // 2250169.0
            BigInt("00010000000000000000000000000000", 2),   // 0.00390625
            BigInt("10001000100001101011111000000000", 2),   // -3557.03125
            BigInt("10000000000000000000000000000000", 2),   // NaR
            BigInt("10000000000000000000000000000000", 2),   // NaR
            BigInt("01111111111111111111111111111111", 2),   // maxpos
            BigInt("11111111111111111111111111111111", 2)    // -minpos
          )
  for(i <- 0 until x.length) {
    poke(c.io.A, x(i))
    poke(c.io.B, y(i))
    step(1)
    expect(c.io.M, z(i))
  }
	step(5)
}
*/
// posit<32, 0>
class PositMultiplierTest(c: PositMultiplier) extends PeekPokeTester(c) {
  val x = List(
            BigInt("01011000000000000000000000000000", 2),   // minpos
            BigInt("11111111111111111111111111111111", 2),   // -minpos
            BigInt("11111111111111111111111111111111", 2),   // -minpos
            BigInt("00111000000000000000000000000000", 2)    // minpos
          )
  val y = List(
            BigInt("00000000000000000000000000000001", 2),   // minpos
            BigInt("01011000000000000000000000000000", 2),   // minpos
            BigInt("00111000000000000000000000000000", 2),   // minpos
            BigInt("00000000000000000000000000000001", 2)    // minpos
          )
  val z = List(
						BigInt("00000000000000000000000000000010", 2),   // minpos
            BigInt("11111111111111111111111111111110", 2),   // -minpos
            BigInt("11111111111111111111111111111111", 2),   // -minpos
            BigInt("00000000000000000000000000000001", 2)    // minpos
          )
  for(i <- 0 until x.length) {
    poke(c.io.A, x(i))
    poke(c.io.B, y(i))
    step(1)
    expect(c.io.M, z(i))
  }
	step(5)
}

class PositMulSpec extends FlatSpec with Matchers {

  val testOptions = new TesterOptionsManager {
  
    testerOptions = testerOptions.copy(
      isVerbose = true,
      backendName = "verilator"
    )
  
    commonOptions = commonOptions.copy(
      targetDirName = "./run/wave/PositMultiplier"
    )
  }

  behavior of "posit multiplier module"

  it should "properly multiply posit types" in {
    chisel3.iotesters.Driver.execute(() => new PositMultiplier(32, 0), testOptions) { c =>
      new PositMultiplierTest(c)
    } should be (true)
  }
}