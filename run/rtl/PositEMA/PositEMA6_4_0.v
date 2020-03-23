module PositEMA6_4_0(
  input         clock,
  input         reset,
  input         io_inValid,
  input  [3:0]  io_A,
  input  [3:0]  io_B,
  output [15:0] io_E,
  output        io_outValid
);
  wire  _T_1; // @[convert.scala 18:24]
  wire  _T_2; // @[convert.scala 18:40]
  wire  _T_3; // @[convert.scala 18:36]
  wire [1:0] _T_4; // @[convert.scala 19:24]
  wire [1:0] _T_5; // @[convert.scala 19:43]
  wire [1:0] _T_6; // @[convert.scala 19:39]
  wire  _T_7; // @[LZD.scala 39:14]
  wire  _T_8; // @[LZD.scala 39:21]
  wire  _T_9; // @[LZD.scala 39:30]
  wire  _T_10; // @[LZD.scala 39:27]
  wire  _T_11; // @[LZD.scala 39:25]
  wire [1:0] _T_12; // @[Cat.scala 29:58]
  wire [1:0] _T_13; // @[convert.scala 21:22]
  wire  _T_14; // @[convert.scala 22:36]
  wire  _T_15; // @[Shift.scala 16:24]
  wire  _T_16; // @[Shift.scala 17:37]
  wire  _T_18; // @[Shift.scala 63:39]
  wire  decA_fraction; // @[Shift.scala 16:10]
  wire  _T_22; // @[convert.scala 25:26]
  wire [1:0] _T_24; // @[convert.scala 25:42]
  wire [2:0] _T_25; // @[Cat.scala 29:58]
  wire [2:0] _T_27; // @[convert.scala 29:56]
  wire  _T_28; // @[convert.scala 29:60]
  wire  _T_29; // @[convert.scala 29:41]
  wire  decA_isNaR; // @[convert.scala 29:39]
  wire  _T_32; // @[convert.scala 30:19]
  wire  decA_isZero; // @[convert.scala 30:41]
  wire [2:0] decA_scale; // @[convert.scala 32:24]
  wire  _T_41; // @[convert.scala 18:24]
  wire  _T_42; // @[convert.scala 18:40]
  wire  _T_43; // @[convert.scala 18:36]
  wire [1:0] _T_44; // @[convert.scala 19:24]
  wire [1:0] _T_45; // @[convert.scala 19:43]
  wire [1:0] _T_46; // @[convert.scala 19:39]
  wire  _T_47; // @[LZD.scala 39:14]
  wire  _T_48; // @[LZD.scala 39:21]
  wire  _T_49; // @[LZD.scala 39:30]
  wire  _T_50; // @[LZD.scala 39:27]
  wire  _T_51; // @[LZD.scala 39:25]
  wire [1:0] _T_52; // @[Cat.scala 29:58]
  wire [1:0] _T_53; // @[convert.scala 21:22]
  wire  _T_54; // @[convert.scala 22:36]
  wire  _T_55; // @[Shift.scala 16:24]
  wire  _T_56; // @[Shift.scala 17:37]
  wire  _T_58; // @[Shift.scala 63:39]
  wire  decB_fraction; // @[Shift.scala 16:10]
  wire  _T_62; // @[convert.scala 25:26]
  wire [1:0] _T_64; // @[convert.scala 25:42]
  wire [2:0] _T_65; // @[Cat.scala 29:58]
  wire [2:0] _T_67; // @[convert.scala 29:56]
  wire  _T_68; // @[convert.scala 29:60]
  wire  _T_69; // @[convert.scala 29:41]
  wire  decB_isNaR; // @[convert.scala 29:39]
  wire  _T_72; // @[convert.scala 30:19]
  wire  decB_isZero; // @[convert.scala 30:41]
  wire [2:0] decB_scale; // @[convert.scala 32:24]
  wire  outIsNaR; // @[PositEMA.scala 53:29]
  wire [3:0] mulScale; // @[PositEMA.scala 54:35]
  wire  _T_80; // @[PositEMA.scala 55:33]
  wire  _T_81; // @[PositEMA.scala 55:46]
  wire  _T_82; // @[PositEMA.scala 55:44]
  wire [2:0] _T_84; // @[Cat.scala 29:58]
  wire [2:0] sigA; // @[PositEMA.scala 55:75]
  wire  _T_85; // @[PositEMA.scala 56:33]
  wire  _T_86; // @[PositEMA.scala 56:46]
  wire  _T_87; // @[PositEMA.scala 56:44]
  wire [2:0] _T_89; // @[Cat.scala 29:58]
  wire [2:0] sigB; // @[PositEMA.scala 56:75]
  wire [5:0] _T_90; // @[PositEMA.scala 57:24]
  wire [5:0] sigP; // @[PositEMA.scala 57:32]
  reg  inValid_phase2; // @[Valid.scala 117:22]
  reg [31:0] _RAND_0;
  reg  outIsNaR_phase2; // @[Reg.scala 15:16]
  reg [31:0] _RAND_1;
  reg [5:0] mulSig_phase2; // @[Reg.scala 15:16]
  reg [31:0] _RAND_2;
  reg [3:0] mulScale_phase2; // @[Reg.scala 15:16]
  reg [31:0] _RAND_3;
  wire  _T_103; // @[Abs.scala 10:21]
  wire [3:0] _T_105; // @[Bitwise.scala 71:12]
  wire [3:0] _T_106; // @[Abs.scala 10:31]
  wire [3:0] _T_107; // @[Abs.scala 10:26]
  wire [3:0] _GEN_10; // @[Abs.scala 10:39]
  wire [3:0] absScale; // @[Abs.scala 10:39]
  wire  _T_110; // @[PositEMA.scala 77:65]
  wire [7:0] _T_112; // @[Bitwise.scala 71:12]
  wire [15:0] extSig; // @[Cat.scala 29:58]
  wire  _T_117; // @[Shift.scala 12:21]
  wire [7:0] _T_118; // @[Shift.scala 64:52]
  wire [15:0] _T_120; // @[Cat.scala 29:58]
  wire [15:0] _T_121; // @[Shift.scala 64:27]
  wire [2:0] _T_122; // @[Shift.scala 66:70]
  wire  _T_123; // @[Shift.scala 12:21]
  wire [11:0] _T_124; // @[Shift.scala 64:52]
  wire [15:0] _T_126; // @[Cat.scala 29:58]
  wire [15:0] _T_127; // @[Shift.scala 64:27]
  wire [1:0] _T_128; // @[Shift.scala 66:70]
  wire  _T_129; // @[Shift.scala 12:21]
  wire [13:0] _T_130; // @[Shift.scala 64:52]
  wire [15:0] _T_132; // @[Cat.scala 29:58]
  wire [15:0] _T_133; // @[Shift.scala 64:27]
  wire  _T_134; // @[Shift.scala 66:70]
  wire [14:0] _T_136; // @[Shift.scala 64:52]
  wire [15:0] _T_137; // @[Cat.scala 29:58]
  wire  _T_142; // @[Shift.scala 12:21]
  wire [7:0] _T_144; // @[Bitwise.scala 71:12]
  wire [7:0] _T_145; // @[Shift.scala 83:71]
  wire [15:0] _T_146; // @[Cat.scala 29:58]
  wire [15:0] _T_147; // @[Shift.scala 83:22]
  wire  _T_150; // @[Shift.scala 12:21]
  wire [3:0] _T_152; // @[Bitwise.scala 71:12]
  wire [11:0] _T_153; // @[Shift.scala 83:71]
  wire [15:0] _T_154; // @[Cat.scala 29:58]
  wire [15:0] _T_155; // @[Shift.scala 83:22]
  wire  _T_158; // @[Shift.scala 12:21]
  wire [1:0] _T_160; // @[Bitwise.scala 71:12]
  wire [13:0] _T_161; // @[Shift.scala 83:71]
  wire [15:0] _T_162; // @[Cat.scala 29:58]
  wire [15:0] _T_163; // @[Shift.scala 83:22]
  wire  _T_166; // @[Shift.scala 12:21]
  wire [14:0] _T_167; // @[Shift.scala 83:71]
  wire [15:0] _T_168; // @[Cat.scala 29:58]
  reg  inValid_phase3; // @[Valid.scala 117:22]
  reg [31:0] _RAND_4;
  reg  outIsNaR_phase3; // @[Reg.scala 15:16]
  reg [31:0] _RAND_5;
  reg [15:0] shiftSig_phase3; // @[Reg.scala 15:16]
  reg [31:0] _RAND_6;
  reg [15:0] quireReg; // @[PositEMA.scala 104:27]
  reg [31:0] _RAND_7;
  wire  _T_184; // @[PositEMA.scala 105:40]
  wire [14:0] _T_185; // @[PositEMA.scala 105:60]
  wire  _T_186; // @[PositEMA.scala 105:64]
  wire  _T_187; // @[PositEMA.scala 105:46]
  wire  quireIsNaR; // @[PositEMA.scala 105:44]
  wire  _T_189; // @[PositEMA.scala 108:33]
  wire [15:0] _T_192; // @[PositEMA.scala 111:46]
  reg  _T_193; // @[Valid.scala 117:22]
  reg [31:0] _RAND_8;
  assign _T_1 = io_A[3]; // @[convert.scala 18:24]
  assign _T_2 = io_A[2]; // @[convert.scala 18:40]
  assign _T_3 = _T_1 ^ _T_2; // @[convert.scala 18:36]
  assign _T_4 = io_A[2:1]; // @[convert.scala 19:24]
  assign _T_5 = io_A[1:0]; // @[convert.scala 19:43]
  assign _T_6 = _T_4 ^ _T_5; // @[convert.scala 19:39]
  assign _T_7 = _T_6 != 2'h0; // @[LZD.scala 39:14]
  assign _T_8 = _T_6[1]; // @[LZD.scala 39:21]
  assign _T_9 = _T_6[0]; // @[LZD.scala 39:30]
  assign _T_10 = ~ _T_9; // @[LZD.scala 39:27]
  assign _T_11 = _T_8 | _T_10; // @[LZD.scala 39:25]
  assign _T_12 = {_T_7,_T_11}; // @[Cat.scala 29:58]
  assign _T_13 = ~ _T_12; // @[convert.scala 21:22]
  assign _T_14 = io_A[0:0]; // @[convert.scala 22:36]
  assign _T_15 = _T_13 < 2'h1; // @[Shift.scala 16:24]
  assign _T_16 = _T_13[0]; // @[Shift.scala 17:37]
  assign _T_18 = _T_16 ? 1'h0 : _T_14; // @[Shift.scala 63:39]
  assign decA_fraction = _T_15 & _T_18; // @[Shift.scala 16:10]
  assign _T_22 = _T_3 == 1'h0; // @[convert.scala 25:26]
  assign _T_24 = _T_3 ? _T_13 : _T_12; // @[convert.scala 25:42]
  assign _T_25 = {_T_22,_T_24}; // @[Cat.scala 29:58]
  assign _T_27 = io_A[2:0]; // @[convert.scala 29:56]
  assign _T_28 = _T_27 != 3'h0; // @[convert.scala 29:60]
  assign _T_29 = ~ _T_28; // @[convert.scala 29:41]
  assign decA_isNaR = _T_1 & _T_29; // @[convert.scala 29:39]
  assign _T_32 = _T_1 == 1'h0; // @[convert.scala 30:19]
  assign decA_isZero = _T_32 & _T_29; // @[convert.scala 30:41]
  assign decA_scale = $signed(_T_25); // @[convert.scala 32:24]
  assign _T_41 = io_B[3]; // @[convert.scala 18:24]
  assign _T_42 = io_B[2]; // @[convert.scala 18:40]
  assign _T_43 = _T_41 ^ _T_42; // @[convert.scala 18:36]
  assign _T_44 = io_B[2:1]; // @[convert.scala 19:24]
  assign _T_45 = io_B[1:0]; // @[convert.scala 19:43]
  assign _T_46 = _T_44 ^ _T_45; // @[convert.scala 19:39]
  assign _T_47 = _T_46 != 2'h0; // @[LZD.scala 39:14]
  assign _T_48 = _T_46[1]; // @[LZD.scala 39:21]
  assign _T_49 = _T_46[0]; // @[LZD.scala 39:30]
  assign _T_50 = ~ _T_49; // @[LZD.scala 39:27]
  assign _T_51 = _T_48 | _T_50; // @[LZD.scala 39:25]
  assign _T_52 = {_T_47,_T_51}; // @[Cat.scala 29:58]
  assign _T_53 = ~ _T_52; // @[convert.scala 21:22]
  assign _T_54 = io_B[0:0]; // @[convert.scala 22:36]
  assign _T_55 = _T_53 < 2'h1; // @[Shift.scala 16:24]
  assign _T_56 = _T_53[0]; // @[Shift.scala 17:37]
  assign _T_58 = _T_56 ? 1'h0 : _T_54; // @[Shift.scala 63:39]
  assign decB_fraction = _T_55 & _T_58; // @[Shift.scala 16:10]
  assign _T_62 = _T_43 == 1'h0; // @[convert.scala 25:26]
  assign _T_64 = _T_43 ? _T_53 : _T_52; // @[convert.scala 25:42]
  assign _T_65 = {_T_62,_T_64}; // @[Cat.scala 29:58]
  assign _T_67 = io_B[2:0]; // @[convert.scala 29:56]
  assign _T_68 = _T_67 != 3'h0; // @[convert.scala 29:60]
  assign _T_69 = ~ _T_68; // @[convert.scala 29:41]
  assign decB_isNaR = _T_41 & _T_69; // @[convert.scala 29:39]
  assign _T_72 = _T_41 == 1'h0; // @[convert.scala 30:19]
  assign decB_isZero = _T_72 & _T_69; // @[convert.scala 30:41]
  assign decB_scale = $signed(_T_65); // @[convert.scala 32:24]
  assign outIsNaR = decA_isNaR | decB_isNaR; // @[PositEMA.scala 53:29]
  assign mulScale = $signed(decA_scale) + $signed(decB_scale); // @[PositEMA.scala 54:35]
  assign _T_80 = ~ _T_1; // @[PositEMA.scala 55:33]
  assign _T_81 = ~ decA_isZero; // @[PositEMA.scala 55:46]
  assign _T_82 = _T_80 & _T_81; // @[PositEMA.scala 55:44]
  assign _T_84 = {_T_1,_T_82,decA_fraction}; // @[Cat.scala 29:58]
  assign sigA = $signed(_T_84); // @[PositEMA.scala 55:75]
  assign _T_85 = ~ _T_41; // @[PositEMA.scala 56:33]
  assign _T_86 = ~ decB_isZero; // @[PositEMA.scala 56:46]
  assign _T_87 = _T_85 & _T_86; // @[PositEMA.scala 56:44]
  assign _T_89 = {_T_41,_T_87,decB_fraction}; // @[Cat.scala 29:58]
  assign sigB = $signed(_T_89); // @[PositEMA.scala 56:75]
  assign _T_90 = $signed(sigA) * $signed(sigB); // @[PositEMA.scala 57:24]
  assign sigP = $unsigned(_T_90); // @[PositEMA.scala 57:32]
  assign _T_103 = mulScale_phase2[3:3]; // @[Abs.scala 10:21]
  assign _T_105 = _T_103 ? 4'hf : 4'h0; // @[Bitwise.scala 71:12]
  assign _T_106 = $unsigned(mulScale_phase2); // @[Abs.scala 10:31]
  assign _T_107 = _T_105 ^ _T_106; // @[Abs.scala 10:26]
  assign _GEN_10 = {{3'd0}, _T_103}; // @[Abs.scala 10:39]
  assign absScale = _T_107 + _GEN_10; // @[Abs.scala 10:39]
  assign _T_110 = mulSig_phase2[5:5]; // @[PositEMA.scala 77:65]
  assign _T_112 = _T_110 ? 8'hff : 8'h0; // @[Bitwise.scala 71:12]
  assign extSig = {_T_112,mulSig_phase2,2'h0}; // @[Cat.scala 29:58]
  assign _T_117 = absScale[3]; // @[Shift.scala 12:21]
  assign _T_118 = extSig[7:0]; // @[Shift.scala 64:52]
  assign _T_120 = {_T_118,8'h0}; // @[Cat.scala 29:58]
  assign _T_121 = _T_117 ? _T_120 : extSig; // @[Shift.scala 64:27]
  assign _T_122 = absScale[2:0]; // @[Shift.scala 66:70]
  assign _T_123 = _T_122[2]; // @[Shift.scala 12:21]
  assign _T_124 = _T_121[11:0]; // @[Shift.scala 64:52]
  assign _T_126 = {_T_124,4'h0}; // @[Cat.scala 29:58]
  assign _T_127 = _T_123 ? _T_126 : _T_121; // @[Shift.scala 64:27]
  assign _T_128 = _T_122[1:0]; // @[Shift.scala 66:70]
  assign _T_129 = _T_128[1]; // @[Shift.scala 12:21]
  assign _T_130 = _T_127[13:0]; // @[Shift.scala 64:52]
  assign _T_132 = {_T_130,2'h0}; // @[Cat.scala 29:58]
  assign _T_133 = _T_129 ? _T_132 : _T_127; // @[Shift.scala 64:27]
  assign _T_134 = _T_128[0:0]; // @[Shift.scala 66:70]
  assign _T_136 = _T_133[14:0]; // @[Shift.scala 64:52]
  assign _T_137 = {_T_136,1'h0}; // @[Cat.scala 29:58]
  assign _T_142 = extSig[15]; // @[Shift.scala 12:21]
  assign _T_144 = _T_142 ? 8'hff : 8'h0; // @[Bitwise.scala 71:12]
  assign _T_145 = extSig[15:8]; // @[Shift.scala 83:71]
  assign _T_146 = {_T_144,_T_145}; // @[Cat.scala 29:58]
  assign _T_147 = _T_117 ? _T_146 : extSig; // @[Shift.scala 83:22]
  assign _T_150 = _T_147[15]; // @[Shift.scala 12:21]
  assign _T_152 = _T_150 ? 4'hf : 4'h0; // @[Bitwise.scala 71:12]
  assign _T_153 = _T_147[15:4]; // @[Shift.scala 83:71]
  assign _T_154 = {_T_152,_T_153}; // @[Cat.scala 29:58]
  assign _T_155 = _T_123 ? _T_154 : _T_147; // @[Shift.scala 83:22]
  assign _T_158 = _T_155[15]; // @[Shift.scala 12:21]
  assign _T_160 = _T_158 ? 2'h3 : 2'h0; // @[Bitwise.scala 71:12]
  assign _T_161 = _T_155[15:2]; // @[Shift.scala 83:71]
  assign _T_162 = {_T_160,_T_161}; // @[Cat.scala 29:58]
  assign _T_163 = _T_129 ? _T_162 : _T_155; // @[Shift.scala 83:22]
  assign _T_166 = _T_163[15]; // @[Shift.scala 12:21]
  assign _T_167 = _T_163[15:1]; // @[Shift.scala 83:71]
  assign _T_168 = {_T_166,_T_167}; // @[Cat.scala 29:58]
  assign _T_184 = quireReg[15:15]; // @[PositEMA.scala 105:40]
  assign _T_185 = quireReg[14:0]; // @[PositEMA.scala 105:60]
  assign _T_186 = _T_185 != 15'h0; // @[PositEMA.scala 105:64]
  assign _T_187 = _T_186 == 1'h0; // @[PositEMA.scala 105:46]
  assign quireIsNaR = _T_184 & _T_187; // @[PositEMA.scala 105:44]
  assign _T_189 = quireIsNaR | outIsNaR_phase3; // @[PositEMA.scala 108:33]
  assign _T_192 = quireReg + shiftSig_phase3; // @[PositEMA.scala 111:46]
  assign io_E = quireReg; // @[PositEMA.scala 120:15]
  assign io_outValid = _T_193; // @[PositEMA.scala 119:15]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  inValid_phase2 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  outIsNaR_phase2 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  mulSig_phase2 = _RAND_2[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  mulScale_phase2 = _RAND_3[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  inValid_phase3 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  outIsNaR_phase3 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  shiftSig_phase3 = _RAND_6[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  quireReg = _RAND_7[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_193 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end
  always @(posedge clock) begin
    if (reset) begin
      inValid_phase2 <= 1'h0;
    end else begin
      inValid_phase2 <= io_inValid;
    end
    if (io_inValid) begin
      outIsNaR_phase2 <= outIsNaR;
    end
    if (io_inValid) begin
      mulSig_phase2 <= sigP;
    end
    if (io_inValid) begin
      mulScale_phase2 <= mulScale;
    end
    if (reset) begin
      inValid_phase3 <= 1'h0;
    end else begin
      inValid_phase3 <= inValid_phase2;
    end
    if (inValid_phase2) begin
      outIsNaR_phase3 <= outIsNaR_phase2;
    end
    if (inValid_phase2) begin
      if (_T_103) begin
        if (_T_134) begin
          shiftSig_phase3 <= _T_168;
        end else begin
          if (_T_129) begin
            shiftSig_phase3 <= _T_162;
          end else begin
            if (_T_123) begin
              shiftSig_phase3 <= _T_154;
            end else begin
              if (_T_117) begin
                shiftSig_phase3 <= _T_146;
              end else begin
                shiftSig_phase3 <= extSig;
              end
            end
          end
        end
      end else begin
        if (_T_134) begin
          shiftSig_phase3 <= _T_137;
        end else begin
          if (_T_129) begin
            shiftSig_phase3 <= _T_132;
          end else begin
            if (_T_123) begin
              shiftSig_phase3 <= _T_126;
            end else begin
              if (_T_117) begin
                shiftSig_phase3 <= _T_120;
              end else begin
                shiftSig_phase3 <= extSig;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      quireReg <= 16'h0;
    end else begin
      if (inValid_phase3) begin
        if (_T_189) begin
          quireReg <= 16'h8000;
        end else begin
          quireReg <= _T_192;
        end
      end
    end
    if (reset) begin
      _T_193 <= 1'h0;
    end else begin
      _T_193 <= inValid_phase3;
    end
  end
endmodule
