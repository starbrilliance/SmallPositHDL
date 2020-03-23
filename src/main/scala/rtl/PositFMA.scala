package posit.rtl

import chisel3._
import chisel3.util._
import posit.convert._
import posit.function._
import posit.function.Shift._

class PositFMA(nBits: Int, eBits: Int, latency: Int = 2) extends Module {

  require(latency <= 2) 

  override def desiredName = s"PositFMA${nBits}_${eBits}"

////////////////////////////////////////////////////////////////////////////
///////////////////////          parameters          ///////////////////////
////////////////////////////////////////////////////////////////////////////

  val regimeWidth = log2Ceil(nBits - 1) + 1  // 1bit sign
  val fracWidth   = nBits - eBits - 3
  val sigWidth    = fracWidth + 1
  val maxScale    = (1 << eBits) * (nBits - 2)
  val minScale    = -maxScale

////////////////////////////////////////////////////////////////////////////
///////////////////////              io              ///////////////////////
////////////////////////////////////////////////////////////////////////////

  val io = IO(new Bundle {
    /*--------------------------------------------------------------------
    *--------------------------------------------------------------------*/
    val inValid  = Input(Bool())
    val fmaOp    = Input(UInt(2.W))
    val A        = Input(UInt(nBits.W))
    val B        = Input(UInt(nBits.W))
    val C        = Input(UInt(nBits.W))
    /*--------------------------------------------------------------------
    *--------------------------------------------------------------------*/
    val F        = Output(UInt(nBits.W))
    val outValid = Output(Bool())
  })

////////////////////////////////////////////////////////////////////////////
///////////////////           phase 1    decode          ///////////////////
////////////////////////////////////////////////////////////////////////////

  val realA = (Fill(nBits, io.fmaOp(1)) ^ io.A) + io.fmaOp(1)
  val realC = (Fill(nBits, io.fmaOp(0)) ^ io.C) + io.fmaOp(0)

  val decA = RawFloatFromPosit(realA, nBits, eBits)
  val decB = RawFloatFromPosit(io.B, nBits, eBits)
  val decC = RawFloatFromPosit(realC, nBits, eBits)

////////////////////////////////////////////////////////////////////////////
///////////////////       phase 2    multiplication      ///////////////////
////////////////////////////////////////////////////////////////////////////

  val outIsNaR  = decA.isNaR || decB.isNaR || decC.isNaR 
  val sigA      = Cat(decA.sign, ~decA.sign & ~decA.isZero, decA.fraction).asSInt
  val sigB      = Cat(decB.sign, ~decB.sign & ~decB.isZero, decB.fraction).asSInt
  val sigP      = (sigA * sigB).asUInt
  val head2     = sigP.head(2)
	val addTwo    = ~head2(1) & head2(0)
	// -2 doesn't  need addOne
  val addOne    = sigP(2 * fracWidth + 3) ^ sigP(2 * fracWidth + 1) 
  val expBias   = Cat(addTwo, addOne).zext
  val mulSign   = sigP.head(1)
  val addSign   = decC.sign
  val mulScale  = decA.scale +& decB.scale + expBias
  val mulSigTmp = Mux(
                        addOne, 
                        sigP(2 * fracWidth + 1, 0), 
                        sigP(2 * fracWidth, 0) << 1
                      )
  val mulSig    = Cat(
                        sigP.head(1), 
                        mulSigTmp.head(1) | addTwo, 
                        mulSigTmp.tail(1)
                      )

  // pass to phase 2 add
  val inValid_phase2  = Wire(Bool())
  val outIsNaR_phase2 = Wire(Bool())
  val mulSig_phase2   = Wire(UInt((2 * fracWidth + 3).W))
  val addFrac_phase2  = Wire(UInt(fracWidth.W))
  val mulScale_phase2 = Wire(SInt((regimeWidth + eBits + 1).W))
  val addScale_phase2 = Wire(SInt((regimeWidth + eBits).W))
  val addSign_phase2  = Wire(Bool())
  val addZero_phase2  = Wire(Bool())
  val addRegs         = if(latency > 0) 1 else 0

  outIsNaR_phase2 := Pipe(io.inValid, outIsNaR, addRegs).bits
  mulSig_phase2   := Pipe(io.inValid, mulSig, addRegs).bits
  addFrac_phase2  := Pipe(io.inValid, decC.fraction, addRegs).bits
  mulScale_phase2 := Pipe(io.inValid, mulScale, addRegs).bits
  addScale_phase2 := Pipe(io.inValid, decC.scale, addRegs).bits
  addSign_phase2  := Pipe(io.inValid, addSign, addRegs).bits
  addZero_phase2  := Pipe(io.inValid, decC.isZero, addRegs).bits
  inValid_phase2  := Pipe(io.inValid, false.B, addRegs).valid

////////////////////////////////////////////////////////////////////////////
///////////////////          phase 3    addition         ///////////////////
////////////////////////////////////////////////////////////////////////////
  
  val extAddSig     = Cat(
                            addSign_phase2, 
                            ~addSign_phase2 & ~addZero_phase2, 
                            addFrac_phase2, 
                            0.U(sigWidth.W)
                          )
  val mulGreater    = mulScale_phase2 > addScale_phase2  
  val greaterScale  = Mux(mulGreater, mulScale_phase2, addScale_phase2).asSInt
  val smallerScale  = Mux(mulGreater, addScale_phase2, mulScale_phase2).asSInt
  val scaleDiff     = greaterScale - smallerScale
  val greaterSig    = Mux(mulGreater, mulSig_phase2, extAddSig)
  val smallerSigTmp = Mux(mulGreater, extAddSig, mulSig_phase2)
  val smallerSig    = smallerSigTmp.shiftRightArithSticky(scaleDiff.asUInt)
  val rawSumSig     = greaterSig +& smallerSig.asUInt
  val sumSign       = (mulSig_phase2.head(1) ^ addSign_phase2 ^ rawSumSig.head(1)).asBool
  val signSumSig    = Cat(sumSign, rawSumSig.tail(1))
  
  // normalization
  val sumWidth      = signSumSig.getWidth
  val sumXor        = signSumSig(sumWidth - 1, 1) ^ signSumSig.tail(1)
  val sumLZD        = LZD.lzd_dual(sumXor)
  val shiftValue    = (~sumLZD).asUInt
  val normalFracTmp = signSumSig.tail(2).shiftLeftLogic(shiftValue)

  // sum
  val sumScale      = greaterScale + 2.S + Cat(1.U, sumLZD).asSInt
  val sumFrac       = normalFracTmp.head(fracWidth)
  
  // grs
  val grsTmp        = normalFracTmp.tail(fracWidth)
  val grsTmpWidth   = grsTmp.getWidth
  val grsFull       = if(grsTmpWidth >= 3) 
                        Cat(grsTmp.head(2), grsTmp.tail(2).orR)
                      else {
                        val fillWidth = 3 - grsTmpWidth
                        Cat(grsTmp, 0.U(fillWidth.W))
                      }
  
  // exception 
  val underflow     = sumScale < minScale.S
  val overflow      = sumScale > maxScale.S

////////////////////////////////////////////////////////////////////////////
///////////////////////             decF             ///////////////////////
//////////////////////////////////////////////////////////////////////////// 

  val decF = Wire(new RawFloat(nBits, eBits))

  decF.isNaR    := outIsNaR_phase2
  decF.isZero   := ~signSumSig.orR
  decF.sign     := sumSign
  decF.fraction := sumFrac
  decF.scale    := MuxCase(
                            sumScale, 
                            Array(
                                    overflow  -> maxScale.S,
                                    underflow -> minScale.S
                                  )
                   		    )
  decF.grs      := grsFull

////////////////////////////////////////////////////////////////////////////
///////////////////////            code              ///////////////////////
////////////////////////////////////////////////////////////////////////////

  val outRegs = if(latency == 2) 1 else 0
  val outTmp  = RawFloatToPosit(decF)

  io.outValid := Pipe(inValid_phase2, false.B, outRegs).valid
  io.F        := Pipe(inValid_phase2, outTmp, outRegs).bits
} 