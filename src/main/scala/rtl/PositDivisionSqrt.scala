package posit.rtl

import chisel3._
import chisel3.util._
import posit.function._
import posit.function.Shift._
import posit.convert._


/*
                    table of mantissa quotient
          
poly          positive                     negative
range         (0.5, 2)                    [-2, -0.5]        
        decimal      binary          decimal       binary     
          0.5     doesn't exist       -0.5      111.10000...
          0.f      000.1xxxx...       -0.f      111.0xxxx...
          1.0      001.00000...       -1.0      111.00000...
          1.f      001.xxxxx...       -1.f      110.xxxxx...
          2.0     doesn't exist       -2.0      110.00000...
*/


// 2's complement
class PositDivisionSqrt(nBits: Int, eBits: Int) extends Module {

  override def desiredName = s"PositDivSqrter${nBits}_${eBits}"

////////////////////////////////////////////////////////////////////////////
///////////////////////          parameters          ///////////////////////
////////////////////////////////////////////////////////////////////////////

  // posit
  val regimeWidth = log2Ceil(nBits - 1) + 1  // 1bit sign
  val fracWidth   = nBits - eBits - 3
  val sigWidth    = fracWidth + 1
  val maxScale    = (1 << eBits) * (nBits - 2)
  val minScale    = -maxScale - 1

////////////////////////////////////////////////////////////////////////////
///////////////////////              io              ///////////////////////
////////////////////////////////////////////////////////////////////////////

  val io = IO(new Bundle {
    /*--------------------------------------------------------------------
    *--------------------------------------------------------------------*/
    val inReady    = Output(Bool())
    val inValid    = Input(Bool())
    val sqrtOp     = Input(Bool())
    val A          = Input(UInt(nBits.W))
    val B          = Input(UInt(nBits.W))
    /*--------------------------------------------------------------------
    *--------------------------------------------------------------------*/
    val diviValid  = Output(Bool())
    val sqrtValid  = Output(Bool())
    val invalidExc = Output(Bool())
    val Q          = Output(UInt(nBits.W))
  })

  /*------------------------------------------------------------------------
  *------------------------------------------------------------------------*/

  val cycleNum  = RegInit(0.U(log2Up(sigWidth + 6).W))

  val sqrtOp_Z  = Reg(Bool())
  val isNaR_Z   = Reg(Bool())
  val isZero_Z  = Reg(Bool())
  val scale_Z   = Reg(SInt((regimeWidth + eBits + 1).W))
	val signB_Z   = Reg(Bool())
  val fractB_Z  = Reg(UInt(fracWidth.W))
  val rem_Z     = Reg(UInt((sigWidth + 6).W))
  val sigX_Z    = Reg(UInt((sigWidth + 6).W))

  /*------------------------------------------------------------------------
  *------------------------------------------------------------------------*/

  val decA = RawFloatFromPosit(io.A, nBits, eBits)
  val decB = RawFloatFromPosit(io.B, nBits, eBits)

  val sigA_S = Cat(Fill(3, decA.sign), ~decA.sign, decA.fraction, 0.U(3.W))
  // sigB_S = sigB << 2
  val sigB_S = Cat(decB.sign, ~decB.sign, decB.fraction, 0.U(5.W))

  val invalidDivision = decB.isZero
  val invalidSqrt     = !decA.isNaR && decA.sign    
  val isNaR_S         = Mux(
                              io.sqrtOp,
                              decA.isNaR || invalidSqrt,    
                              decA.isNaR || decB.isNaR || invalidDivision
                            )
  val isZero_S        = Mux(
                              io.sqrtOp, 
                              decA.isZero, 
                              decA.isZero && !decB.isZero && !decB.isNaR
                            )

  val specialCaseA_S    = decA.isNaR || decA.isZero
  val specialCaseB_S    = decB.isNaR || decB.isZero
  val normalCase_S_div  = !specialCaseA_S && !specialCaseB_S
  val normalCase_S_sqrt = !specialCaseA_S && !decA.sign
  val normalCase_S      = Mux(io.sqrtOp, normalCase_S_sqrt, normalCase_S_div)

  val sExpQuot_S_div    = decA.scale -& decB.scale
  val oddSqrt_S         = io.sqrtOp && decA.scale(0)

  /*------------------------------------------------------------------------
  *------------------------------------------------------------------------*/

  val idle                = (cycleNum === 0.U)
  val ready               = (cycleNum <= 1.U)
  val entering            = ready && io.inValid
  val entering_normalCase = entering && normalCase_S
  val scaleNotChange      = sigX_Z(sigWidth + 5) ^ sigX_Z(sigWidth + 3)
  val skipCycle2          = (cycleNum === 3.U) && scaleNotChange

  when(!idle || io.inValid) {
    cycleNum := Mux(entering & !normalCase_S, 1.U,        0.U) |
                Mux(entering_normalCase,      
                      Mux(io.sqrtOp, 
                            (sigWidth + 4).U, 
                            (sigWidth + 6).U
                          ),                              0.U) |
                Mux(!idle && !skipCycle2, cycleNum - 1.U, 0.U) |
                Mux(!idle &&  skipCycle2, 1.U,            0.U)
  }

  when(entering) {
    sqrtOp_Z := io.sqrtOp
    isNaR_Z  := isNaR_S
    isZero_Z := isZero_S
  }

  when(entering_normalCase) {
    scale_Z := Mux(io.sqrtOp, decA.scale >> 1, sExpQuot_S_div)
  }

  when(entering_normalCase && !io.sqrtOp) {
		signB_Z  := decB.sign
    fractB_Z := decB.fraction
  }

  /*------------------------------------------------------------------------
  *------------------------------------------------------------------------*/

  val bitMask = Wire(UInt((sigWidth + 5).W))
  bitMask    := (1.U << cycleNum) >> 2

  val rem = Mux(ready && !oddSqrt_S, sigA_S,                0.U) |
            Mux(ready &&  oddSqrt_S, (sigA_S << 1).tail(1), 0.U) |
            Mux(!ready,              rem_Z,                 0.U)

  val trialTerm = Mux(ready && !io.sqrtOp, sigB_S,                                     0.U) |
                  Mux(ready &&  io.sqrtOp, (BigInt(1) << (fracWidth + 3)).U,           0.U) |
                  Mux(!ready && !sqrtOp_Z, Cat(signB_Z, ~signB_Z, fractB_Z, 0.U(5.W)), 0.U) | 
                  Mux(!ready &&  sqrtOp_Z, sigX_Z | 
                                           (bitMask & Fill(fracWidth + 3, rem.head(1))) | 
                                           (bitMask >> 1),                             0.U)

	val trialRem = Mux(
                      ready,
											Mux(
                          (rem.head(1) ^ trialTerm.head(1)).asBool, 
											    rem + trialTerm,
											    rem - trialTerm
										    ),
                      Mux(
                          (rem.head(1) ^ trialTerm.head(1)).asBool, 
											    (rem << 1).tail(1) + trialTerm,
											    (rem << 1).tail(1) - trialTerm
										    )
                    )

	val trIsZero  = !trialRem.orR
	val remIsZero = !rem.orR
  val newBit    = MuxCase(
                            ~(trialTerm.head(1) ^ trialRem.head(1)),
										        Array(
                                    trIsZero -> ~sigX_Z.head(1),
							 			                remIsZero -> sigX_Z.head(1)
                                  )
									        )
							
  when(entering_normalCase || (cycleNum > 2.U) && !remIsZero) {
    rem_Z := trialRem
  }

  when(entering_normalCase || (!ready && newBit.asBool)) {
    sigX_Z := Mux(ready && !io.sqrtOp, newBit << (sigWidth + 5),        0.U) |
              Mux(ready &&  io.sqrtOp, (BigInt(1) << (sigWidth + 3)).U, 0.U) |
              Mux(!ready,              sigX_Z | bitMask,                0.U)
  }

  /*------------------------------------------------------------------------
  *------------------------------------------------------------------------*/

  val sigXBias = Mux(scaleNotChange, sigX_Z.head(1) << 1, sigX_Z.head(1))
  val realSigX = sigX_Z + sigXBias
  val realFrac = Mux(
											scaleNotChange, 
											realSigX(fracWidth + 3, 4), 
											realSigX(fracWidth + 2, 3)
										) 

  val decQ          = Wire(new RawFloat(nBits, eBits))
  val scaleNeedSub  = ~(realSigX(sigWidth + 5) ^ realSigX(sigWidth + 3))
  val notNeedSubTwo = realSigX(sigWidth + 5) ^ realSigX(sigWidth + 2)
  val scaleSubOne   = scaleNeedSub & notNeedSubTwo
  val scaleSubTwo   = scaleNeedSub & ~notNeedSubTwo
  val realExp       = scale_Z - Cat(scaleSubTwo, scaleSubOne).zext 
  val underflow     = realExp < minScale.S
  val overflow      = realExp > maxScale.S

  decQ.isNaR    := isNaR_Z
  decQ.isZero   := isZero_Z
  decQ.sign     := realSigX.head(1)
	decQ.scale    := MuxCase(
                            realExp, 
                            Array(
                                    overflow  -> maxScale.S,
                                    underflow -> minScale.S
                                  )
                   			  ) 
  decQ.fraction := realFrac
  decQ.grs      := Mux(scaleNotChange, realSigX(3, 1), realSigX(2, 0))

/*----------------------------------------------------------------------------
*----------------------------------------------------------------------------*/

  val outValid = (cycleNum === 1.U)

  io.inReady    := ready
  io.diviValid  := outValid && !sqrtOp_Z
  io.sqrtValid  := outValid &&  sqrtOp_Z
  io.invalidExc := isNaR_Z
  io.Q          := RawFloatToPosit(decQ)  
}