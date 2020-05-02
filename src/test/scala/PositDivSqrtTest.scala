package posit.wave

import chisel3._
import chisel3.iotesters._
import posit.rtl._
import org.scalatest.{FlatSpec, Matchers}
/*
class PositDivSqrtTest(c: PositDivisionSqrt) extends PeekPokeTester(c) {
  val x = List(
						BigInt("01000000000000000000000000000000", 2),   // 1
						BigInt("11000000000000000000000000000000", 2),   // -1
						BigInt("01000000000000000000000000000000", 2),   // 1
						BigInt("11000000000000000000000000000000", 2),   // -1
            BigInt("01011001100000000000000000000000", 2),   // 9.5
            BigInt("01111001001110001000011000000000", 2),   // 10000.75
            BigInt("11011000000000000000000000000000", 2),   // -0.125
            BigInt("10011011011110000000000000000000", 2),   // -36.25
            BigInt("10000000000000000000000000000000", 2),   // NaR
            BigInt("01011001100000000000000000000000", 2),   // 9.5
            BigInt("00000000000000000000000000000000", 2),   // 0
            BigInt("01111111111111111111111111111111", 2),   // maxpos
            BigInt("00000000000000000000000000000001", 2)    // minpos
          )
  val y = List(
						BigInt("11000000000000000000000000000000", 2),   // -1
						BigInt("01000000000000000000000000000000", 2),   // 1
						BigInt("01000000000000000000000000000000", 2),   // 1
						BigInt("11000000000000000000000000000000", 2),   // -1
            BigInt("10011111011000000000000000000000", 2),   // -18.5
            BigInt("01101111000010000000000000000000", 2),   // 225
            BigInt("11100100000000000000000000000000", 2),   // -0.03125
            BigInt("01101010001000100000000000000000", 2),   // 98.125
            BigInt("01011001100000000000000000000000", 2),   // 9.5
            BigInt("00000000000000000000000000000000", 2),   // 0
            BigInt("00000000000000000000000000000000", 2),   // 0
            BigInt("11111111111111111111111111111111", 2),   // -minpos
            BigInt("01111111111111111111111111111111", 2)    // maxpos
          )
  val z_div = List(
								BigInt("11000000000000000000000000000000", 2),   // -1
								BigInt("11000000000000000000000000000000", 2),   // -1
								BigInt("01000000000000000000000000000000", 2),   // 1
								BigInt("01000000000000000000000000000000", 2),   // 1
                BigInt("11000111110010001010011000001110", 2),   // -0.5135135129094124
                BigInt("01100101100011100101010000110010", 2),   // 44.44777774810791
                BigInt("01010000000000000000000000000000", 2),   // 4.0
                BigInt("11001100001011011010011111110011", 2),   // -0.3694267515093088
                BigInt("10000000000000000000000000000000", 2),   // NaR
                BigInt("10000000000000000000000000000000", 2),   // NaR
                BigInt("10000000000000000000000000000000", 2),   // NaR
                BigInt("10000000000000000000000000000001", 2),   // -maxpos
                BigInt("00000000000000000000000000000001", 2)    // minpos
              )
  val z_sqrt = List(
								BigInt("01000000000000000000000000000000", 2),   // 1
								BigInt("10000000000000000000000000000000", 2),   // NaR
								BigInt("01000000000000000000000000000000", 2),   // 1
								BigInt("10000000000000000000000000000000", 2),   // NaR
                BigInt("01001100010101000010111000010010", 2),   // 3.0822069942951202
                BigInt("01101010010000000000111101011100", 2),   // 100.00374984741211
                BigInt("10000000000000000000000000000000", 2),   // NaR
                BigInt("10000000000000000000000000000000", 2),   // NaR
                BigInt("10000000000000000000000000000000", 2),   // NaR
                BigInt("01001100010101000010111000010010", 2),   // 3.0822069942951202
                BigInt("00000000000000000000000000000000", 2),   // 0
                BigInt("01111111111111111000000000000000", 2),   // 2^60
                BigInt("00000000000000001000000000000000", 2)    // 2^-60              
              )
  
  for(i <- 0 until x.length) {
    poke(c.io.A, x(i))
    poke(c.io.B, y(i))
    poke(c.io.inValid, 1)
    poke(c.io.sqrtOp, 0)
    step(1)
    poke(c.io.inValid, 0)
    step(30)
    expect(c.io.Q, z_div(i))
    step(5)
  }

  for(i <- 0 until x.length) {
    poke(c.io.A, x(i))
    poke(c.io.inValid, 1)
    poke(c.io.sqrtOp, 1)
    step(1)
    poke(c.io.inValid, 0)
    step(28)
    expect(c.io.Q, z_sqrt(i))
    step(5)
  }
}
*/

class PositDivSqrtTest(c: PositDivisionSqrt) extends PeekPokeTester(c) {
  val x = List(
            BigInt("00010010", 2),    // minpos
            BigInt("01011100", 2),    // minpos
            BigInt("00101101", 2),    // minpos
            BigInt("01100101", 2)     // minpos
          )
  val z_sqrt = List(
                BigInt("00100010", 2),    // 2^-60
                BigInt("01001100", 2),    // 2^-60 
                BigInt("00110110", 2),    // 2^-60 
                BigInt("01010100", 2)     // 2^-60               
              )


  for(i <- 0 until x.length) {
    poke(c.io.A, x(i))
    poke(c.io.inValid, 1)
    poke(c.io.sqrtOp, 1)
    step(1)
    poke(c.io.inValid, 0)
    step(9)
    expect(c.io.Q, z_sqrt(i))
    step(5)
  }
}

// Scala style testing
class PositDivSqrtSpec extends FlatSpec with Matchers {

  val testOptions = new TesterOptionsManager {
  
    testerOptions = testerOptions.copy(
      isVerbose = true,
      backendName = "verilator"
    )
  
    commonOptions = commonOptions.copy(
      targetDirName = "./run/wave/PositDivisionSqrt"
    )
  }

  behavior of "posit divsqrt module"

  it should "properly div/sqrt posit types" in {
    chisel3.iotesters.Driver.execute(() => new PositDivisionSqrt(8, 0), testOptions) { c =>
      new PositDivSqrtTest(c)
    } should be (true)
  }
}