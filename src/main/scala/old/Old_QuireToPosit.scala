// // for Posit-AI accelerator

// package posit.rtl

// import chisel3._
// import chisel3.util._
// import posit.convert._
// import posit.function._
// import posit.function.Shift._

// class QuireToPosit(capacity: Int, nBits: Int, eBits: Int) extends Module {
	
// 	override def desiredName = s"QuireToPosit${capacity}_${nBits}_${eBits}"

// ////////////////////////////////////////////////////////////////////////////
// ///////////////////////          parameters          ///////////////////////
// ////////////////////////////////////////////////////////////////////////////

//   // posit
//   val regimeWidth = log2Ceil(nBits - 1) + 1  // 1bit sign
//   val fracWidth = nBits - eBits - 3
//   val sigWidth = fracWidth + 1
//   val maxScalingFactor = (1 << eBits) * (nBits - 2)
//   val minScalingFactor = -maxScalingFactor
//   // quire
//   val lower = 2 * maxScalingFactor
//   val upper = lower + 1
//   val qBits = lower + upper + capacity + 1   // 1-bit sign

// ////////////////////////////////////////////////////////////////////////////
// ///////////////////////              io              ///////////////////////
// ////////////////////////////////////////////////////////////////////////////

//   val io = IO(new Bundle {
//     val inValid  = Input(Bool())
//     val quireIn  = Input(UInt(qBits.W))
//     /*--------------------------------------------------------------------
//     *--------------------------------------------------------------------*/
//     val positOut = Output(UInt(nBits.W))
//     val outValid = Output(Bool())
//   })

// 	// raw float
// 	val outRawFloat = Wire(new RawFloat(nBits, eBits))

// 	// exception
// 	val tailIsZero = ~io.quireIn.tail(1).orR
// 	outRawFloat.isNaR := io.quireIn.head(1) & tailIsZero
// 	outRawFloat.isZero := ~io.quireIn.head(1) & tailIsZero

// 	// sign
// 	outRawFloat.sign := io.quireIn.head(1)

// 	// scale
// 	val quireScaleWidth = log2Ceil(qBits + 1) + 1  // 1bit sign
// 	val baseScale = (upper + capacity).U(quireScaleWidth.W)
// 	val quireLOD = ~LOD.lod(io.quireIn)
// 	val quireLZD = LZD.lzd_dual(io.quireIn)
// 	val realScaleTmp1 = Mux(io.quireIn.head(1).asBool, quireLOD, quireLZD)
// 	val realScaleTmp2 = Cat(1.U, realScaleTmp1) + 1.U
// 	val realScale = (baseScale + realScaleTmp2).asSInt
// 	val underflow = realScale < minScalingFactor.S
//   val overflow  = realScale > maxScalingFactor.S
// 	val underScale = Mux(io.quireIn.head(1).asBool, (minScalingFactor - 1).S, minScalingFactor.S) 
// 	outRawFloat.scale := Mux(overflow,  maxScalingFactor.S, 0.S) |
//                   		 Mux(underflow, underScale, 0.S) |
//                   		 Mux(!overflow && !underflow, realScale, 0.S)


// 	// fraction & grs
// 	val absRealScale = AbsXOR(realScale)
// 	val quireLeftShift = io.quireIn.shiftLeftLogic(absRealScale) 
// 	val quireRightShift = io.quireIn.shiftRightLogic(absRealScale)
// 	val realFGRSTmp1 = Cat(quireLeftShift(lower - 1, lower - fracWidth - 2),
// 												 quireLeftShift(lower - fracWidth - 3, 0).orR)	
// 	val realFGRSTmp2 = Cat(quireRightShift(lower - 1, lower - fracWidth - 2),
// 												 quireRightShift(lower - fracWidth - 3, 0).orR)
// 	val realFGRS = Mux(realScale.head(1).asBool, realFGRSTmp1, realFGRSTmp2)
// 	outRawFloat.fraction := realFGRS.head(fracWidth)
// 	outRawFloat.grs := realFGRS.tail(fracWidth)

// 	// out
// 	val outPosit = RawFloatToPosit(outRawFloat)
// 	io.outValid := Pipe(io.inValid, false.B, 1).valid
//   io.positOut := Pipe(io.inValid, outPosit, 1).bits 
// }



// // Scala style testing
// object MakeQuireToPosit extends App {
//   chisel3.Driver.execute(Array("-td", "./run/main/QuireToPosit/6_4_0"), 
//                         () => new QuireToPosit(6, 4, 0))
//   chisel3.Driver.execute(Array("-td", "./run/main/QuireToPosit/6_8_0"), 
//                         () => new QuireToPosit(6, 8, 0))
//   chisel3.Driver.execute(Array("-td", "./run/main/QuireToPosit/14_8_1"), 
//                         () => new QuireToPosit(14, 8, 1))
//   chisel3.Driver.execute(Array("-td", "./run/main/QuireToPosit/30_8_2"), 
//                         () => new QuireToPosit(30, 8, 2))
// }