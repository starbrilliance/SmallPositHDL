package posit.wave

import chisel3._
import chisel3.iotesters._
import posit.rtl._
import org.scalatest.{FlatSpec, Matchers}

// posit<4, 0>
class QuireToPositTest40(c: QuireToPosit) extends PeekPokeTester(c) {
  val in  = List(
            BigInt("0010", 16),   // 1
            BigInt("8000", 16),   // NaR
            BigInt("0000", 16),   // 0
            BigInt("FFE0", 16),   // -2
            BigInt("FFF0", 16),   // -1
            BigInt("FFF1", 16)    // -0.9375
          )
	val out = List(
            BigInt("0100", 2),   // 1
            BigInt("1000", 2),   // NaR
            BigInt("0000", 2),   // 0
            BigInt("1010", 2),   // -2
            BigInt("1100", 2),   // -1
            BigInt("1100", 2)    // -1
          )

	for(i <- 0 until in.length) {
		poke(c.io.inValid, 1)
		poke(c.io.quireIn, in(i))
    step(1)
    expect(c.io.positOut, out(i))
		expect(c.io.outValid, 1)
	}
  step(1)
}

// posit<8, 0>
class QuireToPositTest80(c: QuireToPosit) extends PeekPokeTester(c) {
  val in  = List(
						BigInt("00000000", 16),   // 0
            BigInt("00001000", 16),   // 1
            BigInt("00007800", 16),   // 7.5
            BigInt("00020800", 16),   // 32.5
            BigInt("0001FE00", 16),   // 31.875
            BigInt("00021E00", 16),   // 33.875
            BigInt("80000000", 16)    // NaR
          )
	val out = List(
						BigInt("00000000", 2),   // 0
            BigInt("01000000", 2),   // 1
            BigInt("01110111", 2),   // 7.5
            BigInt("01111110", 2),   // 32
            BigInt("01111110", 2),   // 32
            BigInt("01111110", 2),   // 32
            BigInt("10000000", 2)    // NaR
          )
for(i <- 0 until in.length) {
		poke(c.io.inValid, 1)
		poke(c.io.quireIn, in(i))
    step(1)
    expect(c.io.positOut, out(i))
		expect(c.io.outValid, 1)
	}
  step(1)
}

// posit<8, 1>
class QuireToPositTest81(c: QuireToPosit) extends PeekPokeTester(c) {
  val in  = List(
              BigInt("0" * 9 + "1" + "0" * 6, 16),   // 1
              BigInt("F" * 9 + "A8" + "0" * 5, 16),   // -5.5
              BigInt("F" * 9 + "76" + "0" * 5, 16),   // -8.625
              BigInt("F" * 9 + "46" + "0" * 5, 16),   // -11.625
              BigInt("F" * 9 + "56" + "0" * 5, 16),   // -10.625
              BigInt("F" * 9 + "57" + "0" * 5, 16),   // -10.5625
              BigInt("0" * 4 + "F" * 5 + "57" + "0" * 5, 16)  // 16777206.4375
            )
	val out = List(
              BigInt("01000000", 2),  // 1
              BigInt("10011101", 2),  // -5.5
              BigInt("10010111", 2),  // -9
              BigInt("10010100", 2),  // -12
              BigInt("10010101", 2),  // -11
              BigInt("10010101", 2),  // -11
              BigInt("01111111", 2)   // 4096
          	)

	for(i <- 0 until in.length) {
		poke(c.io.inValid, 1)
		poke(c.io.quireIn, in(i))
    step(1)
    expect(c.io.positOut, out(i))
		expect(c.io.outValid, 1)
	}
  step(1)
}

// posit<8, 2>
class QuireToPositTest82(c: QuireToPosit) extends PeekPokeTester(c) {
  val in  = List(
            BigInt("0", 16),  // 0
            BigInt("0" * 19 + "1" + "0" * 12, 16),  // 1
            BigInt("F" * 19 + "A8" + "0" * 11, 16), // -5.5
            BigInt("F" * 19 + "74" + "0" * 11, 16), // -8.75
            BigInt("F" * 19 + "44" + "0" * 11, 16), // -11.75
            BigInt("F" * 19 + "54" + "0" * 11, 16), // -10.75
            BigInt("F" * 19 + "55" + "0" * 11, 16)  // -10.6875
          )
	val out = List(
            BigInt("00000000", 2), // 0
            BigInt("01000000", 2), // 1
            BigInt("10101101", 2), // -5.5
            BigInt("10100111", 2), // -9
            BigInt("10100100", 2), // -12
            BigInt("10100101", 2), // -11
            BigInt("10100101", 2)  // -11
          )

	for(i <- 0 until in.length) {
		poke(c.io.inValid, 1)
		poke(c.io.quireIn, in(i))
    step(1)
    expect(c.io.positOut, out(i))
		expect(c.io.outValid, 1)
	}
  step(1)
}

// Scala style testing
class QuireToPositSpec extends FlatSpec with Matchers {
	val testOptions1 = new TesterOptionsManager {
  
    testerOptions = testerOptions.copy(
      isVerbose = true,
      backendName = "verilator"
    )
  
    commonOptions = commonOptions.copy(
      targetDirName = "./run/wave/QuireToPosit/QuireToPosit6_4_0"
    )
  }

  behavior of "quire to posit module"

  it should "properly convert to posit<4, 0> types" in {
    chisel3.iotesters.Driver.execute(() => new QuireToPosit(6, 4, 0), testOptions1) { c =>
      new QuireToPositTest40(c)
    } should be (true)
  }

	val testOptions2 = new TesterOptionsManager {
  
    testerOptions = testerOptions.copy(
      isVerbose = true,
      backendName = "verilator"
    )
  
    commonOptions = commonOptions.copy(
      targetDirName = "./run/wave/QuireToPosit/QuireToPosit6_8_0"
    )
  }

  it should "properly convert to posit<8, 0> types" in {
    chisel3.iotesters.Driver.execute(() => new QuireToPosit(6, 8, 0), testOptions2) { c =>
      new QuireToPositTest80(c)
    } should be (true)
  }

  val testOptions3 = new TesterOptionsManager {
  
    testerOptions = testerOptions.copy(
      isVerbose = true,
      backendName = "verilator"
    )
  
    commonOptions = commonOptions.copy(
      targetDirName = "./run/wave/QuireToPosit/QuireToPosit14_8_1"
    )
  }

  it should "properly convert to posit<8, 1> types" in {
    chisel3.iotesters.Driver.execute(() => new QuireToPosit(14, 8, 1), testOptions3) { c =>
      new QuireToPositTest81(c)
    } should be (true)
  }

	val testOptions4 = new TesterOptionsManager {
  
    testerOptions = testerOptions.copy(
      isVerbose = true,
      backendName = "verilator"
    )
  
    commonOptions = commonOptions.copy(
      targetDirName = "./run/wave/QuireToPosit/QuireToPosit30_8_2"
    )
  }

	it should "properly convert to posit<8, 2> types" in {
    chisel3.iotesters.Driver.execute(() => new QuireToPosit(30, 8, 2), testOptions4) { c =>
      new QuireToPositTest82(c)
    } should be (true)
  }
}
