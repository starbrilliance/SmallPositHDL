package posit.wave

import chisel3._
import chisel3.iotesters._
import posit.rtl._
import org.scalatest.{FlatSpec, Matchers}

// posit<4, 0>
class PositEMATest40(c: PositEMA) extends PeekPokeTester(c) {
  val x = List(
            BigInt("0111", 2),   // 4
            BigInt("1100", 2),   // -1
            BigInt("0000", 2),   // 0
            BigInt("1110", 2),   // -0.5
            BigInt("1100", 2),   // -1
            BigInt("0001", 2)    // 0.25
          )
  val y = List(
            BigInt("0001", 2),   // 0.25
            BigInt("0100", 2),   // 1
            BigInt("0100", 2),   // 1
            BigInt("0111", 2),   // 4
            BigInt("1100", 2),   // -1
            BigInt("0001", 2)    // 0.25
          )

  val out = List(
            BigInt("0010", 16),   // 1
            BigInt("0000", 16),   // 0
            BigInt("0000", 16),   // 0
            BigInt("FFE0", 16),   // -2
            BigInt("FFF0", 16),   // -1
            BigInt("FFF1", 16)    // -0.9375
          )

	for(i <- 0 until (x.length + 2)) {
		poke(c.io.inValid, 1)
		poke(c.io.A, x(i % x.length))
    poke(c.io.B, y(i % x.length))
    step(1)
    if(i > 1) {
      expect(c.io.E, out(i - 2))
			expect(c.io.outValid, 1)
    }
	}
  step(1)
}

// posit<8, 0>
class PositEMATest80(c: PositEMA) extends PeekPokeTester(c) {
  val x = List(
            BigInt("01111111", 2),   // max
            BigInt("10001011", 2),   // -6.5
            BigInt("01101001", 2),   // 3.125
            BigInt("00000000", 2),   // 0
            BigInt("11101000", 2),   // -0.375
            BigInt("11000000", 2),   // -1
            BigInt("00010000", 2),   // 0.25
            BigInt("10000000", 2)    // NaR
          )
  val y = List(
            BigInt("00000001", 2),   // min
            BigInt("11000000", 2),   // -1
            BigInt("01111000", 2),   // 8
            BigInt("01000000", 2),   // 1
            BigInt("11000000", 2),   // -1
            BigInt("01000000", 2),   // 1
            BigInt("01111000", 2),   // 8
            BigInt("00010000", 2)    // 0.25
          )
  val out = List(
            BigInt("00001000", 16),   // 1
            BigInt("00007800", 16),   // 7.5
            BigInt("00020800", 16),   // 32.5
            BigInt("00020800", 16),   // 32.5
            BigInt("00020E00", 16),   // 32.875
            BigInt("0001FE00", 16),   // 31.875
            BigInt("00021E00", 16),   // 33.875
            BigInt("80000000", 16)    // NaR
          )

	for(i <- 0 until (x.length + 2)) {
		poke(c.io.inValid, 1)
		poke(c.io.A, x(i % x.length))
    poke(c.io.B, y(i % x.length))
    step(1)
    if(i > 1) {
      expect(c.io.E, out(i - 2))
			expect(c.io.outValid, 1)
    }
	}
  step(1)
}

// posit<8, 1>
class PositEMATest81(c: PositEMA) extends PeekPokeTester(c) {
  val x = List(
            BigInt("01111111", 2),   // 4096
            BigInt("10011011", 2),   // -6.5
            BigInt("01011001", 2),   // 3.125
            BigInt("00000000", 2),   // 0
            BigInt("11011000", 2),   // -0.375
            BigInt("11000000", 2),   // -1
            BigInt("00100000", 2),   // 0.25
            BigInt("01111111", 2)    // 4096
          )
  val y = List(
            BigInt("00000001", 2),   // 1/4096
            BigInt("01000000", 2),   // 1
            BigInt("11000000", 2),   // -1
            BigInt("01000000", 2),   // 1
            BigInt("01101000", 2),   // 8
            BigInt("11000000", 2),   // -1
            BigInt("00100000", 2),   // 0.25
            BigInt("01111111", 2)    // 4096
          )

  val out = List(
              BigInt("0" * 9 + "1" + "0" * 6, 16),   // 1
              BigInt("F" * 9 + "A8" + "0" * 5, 16),   // -5.5
              BigInt("F" * 9 + "76" + "0" * 5, 16),   // -8.625
              BigInt("F" * 9 + "76" + "0" * 5, 16),   // -8.625
              BigInt("F" * 9 + "46" + "0" * 5, 16),   // -11.625
              BigInt("F" * 9 + "56" + "0" * 5, 16),   // -10.625
              BigInt("F" * 9 + "57" + "0" * 5, 16),   // -10.5625
              BigInt("0" * 4 + "F" * 5 + "57" + "0" * 5, 16)  // 16777206.4375
          )

	for(i <- 0 until (x.length + 2)) {
		poke(c.io.inValid, 1)
		poke(c.io.A, x(i % x.length))
    poke(c.io.B, y(i % x.length))
    step(1)
    if(i > 1) {
      expect(c.io.E, out(i - 2))
			expect(c.io.outValid, 1)
    }
	}
  step(1)
}

// posit<8, 2>
class PositEMATest82(c: PositEMA) extends PeekPokeTester(c) {
  val x = List(
            BigInt("11000000", 2),   // -1
            BigInt("01111111", 2),   // 2^24
            BigInt("10101011", 2),   // -6.5
            BigInt("01001101", 2),   // 3.25
            BigInt("00000000", 2),   // 0
            BigInt("11001100", 2),   // -0.375
            BigInt("11000000", 2),   // -1
            BigInt("00110000", 2)    // 0.25
          )
  val y = List(
            BigInt("00000000", 2),   // 0
            BigInt("00000001", 2),   // 2^-24
            BigInt("01000000", 2),   // 1
            BigInt("11000000", 2),   // -1
            BigInt("01000000", 2),   // 1
            BigInt("01011000", 2),   // 8
            BigInt("11000000", 2),   // -1
            BigInt("00110000", 2)    // 0.25
          )
  val out = List(
            BigInt("0", 16),  // 0
            BigInt("0" * 19 + "1" + "0" * 12, 16),  // 1
            BigInt("F" * 19 + "A8" + "0" * 11, 16), // -5.5
            BigInt("F" * 19 + "74" + "0" * 11, 16), // -8.75
            BigInt("F" * 19 + "74" + "0" * 11, 16), // -8.75
            BigInt("F" * 19 + "44" + "0" * 11, 16), // -11.75
            BigInt("F" * 19 + "54" + "0" * 11, 16), // -10.75
            BigInt("F" * 19 + "55" + "0" * 11, 16)  // -10.6875
          )

	for(i <- 0 until (x.length + 2)) {
		poke(c.io.inValid, 1)
		poke(c.io.A, x(i % x.length))
    poke(c.io.B, y(i % x.length))
    step(1)
    if(i > 1) {
      expect(c.io.E, out(i - 2))
			expect(c.io.outValid, 1)
    }
	}
  step(1)
}

// Scala style testing
class PositEMASpec extends FlatSpec with Matchers {
	val testOptions1 = new TesterOptionsManager {
  
    testerOptions = testerOptions.copy(
      isVerbose = true,
      backendName = "verilator"
    )
  
    commonOptions = commonOptions.copy(
      targetDirName = "./run/wave/PositEMA/PositEMA6_4_0"
    )
  }

  behavior of "posit ema module"

  it should "properly mul/add posit<4, 0> types" in {
    chisel3.iotesters.Driver.execute(() => new PositEMA(6, 4, 0), testOptions1) { c =>
      new PositEMATest40(c)
    } should be (true)
  }

	val testOptions2 = new TesterOptionsManager {
  
    testerOptions = testerOptions.copy(
      isVerbose = true,
      backendName = "verilator"
    )
  
    commonOptions = commonOptions.copy(
      targetDirName = "./run/wave/PositEMA/PositEMA6_8_0"
    )
  }

  it should "properly mul/add posit<8, 0> types" in {
    chisel3.iotesters.Driver.execute(() => new PositEMA(6, 8, 0), testOptions2) { c =>
      new PositEMATest80(c)
    } should be (true)
  }

  val testOptions3 = new TesterOptionsManager {
  
    testerOptions = testerOptions.copy(
      isVerbose = true,
      backendName = "verilator"
    )
  
    commonOptions = commonOptions.copy(
      targetDirName = "./run/wave/PositEMA/PositEMA14_8_1"
    )
  }

  it should "properly mul/add posit<8, 1> types" in {
    chisel3.iotesters.Driver.execute(() => new PositEMA(14, 8, 1), testOptions3) { c =>
      new PositEMATest81(c)
    } should be (true)
  }

	val testOptions4 = new TesterOptionsManager {
  
    testerOptions = testerOptions.copy(
      isVerbose = true,
      backendName = "verilator"
    )
  
    commonOptions = commonOptions.copy(
      targetDirName = "./run/wave/PositEMA/PositEMA30_8_2"
    )
  }

	it should "properly mul/add posit<8, 2> types" in {
    chisel3.iotesters.Driver.execute(() => new PositEMA(30, 8, 2), testOptions4) { c =>
      new PositEMATest82(c)
    } should be (true)
  }
}
