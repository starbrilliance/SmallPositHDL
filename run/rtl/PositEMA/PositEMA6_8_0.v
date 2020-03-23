module PositEMA6_8_0(
  input         clock,
  input         reset,
  input         io_inValid,
  input  [7:0]  io_A,
  input  [7:0]  io_B,
  output [31:0] io_E,
  output        io_outValid
);
  wire  _T_1; // @[convert.scala 18:24]
  wire  _T_2; // @[convert.scala 18:40]
  wire  _T_3; // @[convert.scala 18:36]
  wire [5:0] _T_4; // @[convert.scala 19:24]
  wire [5:0] _T_5; // @[convert.scala 19:43]
  wire [5:0] _T_6; // @[convert.scala 19:39]
  wire [3:0] _T_7; // @[LZD.scala 43:32]
  wire [1:0] _T_8; // @[LZD.scala 43:32]
  wire  _T_9; // @[LZD.scala 39:14]
  wire  _T_10; // @[LZD.scala 39:21]
  wire  _T_11; // @[LZD.scala 39:30]
  wire  _T_12; // @[LZD.scala 39:27]
  wire  _T_13; // @[LZD.scala 39:25]
  wire [1:0] _T_14; // @[Cat.scala 29:58]
  wire [1:0] _T_15; // @[LZD.scala 44:32]
  wire  _T_16; // @[LZD.scala 39:14]
  wire  _T_17; // @[LZD.scala 39:21]
  wire  _T_18; // @[LZD.scala 39:30]
  wire  _T_19; // @[LZD.scala 39:27]
  wire  _T_20; // @[LZD.scala 39:25]
  wire [1:0] _T_21; // @[Cat.scala 29:58]
  wire  _T_22; // @[Shift.scala 12:21]
  wire  _T_23; // @[Shift.scala 12:21]
  wire  _T_24; // @[LZD.scala 49:16]
  wire  _T_25; // @[LZD.scala 49:27]
  wire  _T_26; // @[LZD.scala 49:25]
  wire  _T_27; // @[LZD.scala 49:47]
  wire  _T_28; // @[LZD.scala 49:59]
  wire  _T_29; // @[LZD.scala 49:35]
  wire [2:0] _T_31; // @[Cat.scala 29:58]
  wire [1:0] _T_32; // @[LZD.scala 44:32]
  wire  _T_33; // @[LZD.scala 39:14]
  wire  _T_34; // @[LZD.scala 39:21]
  wire  _T_35; // @[LZD.scala 39:30]
  wire  _T_36; // @[LZD.scala 39:27]
  wire  _T_37; // @[LZD.scala 39:25]
  wire [1:0] _T_38; // @[Cat.scala 29:58]
  wire  _T_39; // @[Shift.scala 12:21]
  wire [1:0] _T_41; // @[LZD.scala 55:32]
  wire [1:0] _T_42; // @[LZD.scala 55:20]
  wire [2:0] _T_43; // @[Cat.scala 29:58]
  wire [2:0] _T_44; // @[convert.scala 21:22]
  wire [4:0] _T_45; // @[convert.scala 22:36]
  wire  _T_46; // @[Shift.scala 16:24]
  wire  _T_48; // @[Shift.scala 12:21]
  wire  _T_49; // @[Shift.scala 64:52]
  wire [4:0] _T_51; // @[Cat.scala 29:58]
  wire [4:0] _T_52; // @[Shift.scala 64:27]
  wire [1:0] _T_53; // @[Shift.scala 66:70]
  wire  _T_54; // @[Shift.scala 12:21]
  wire [2:0] _T_55; // @[Shift.scala 64:52]
  wire [4:0] _T_57; // @[Cat.scala 29:58]
  wire [4:0] _T_58; // @[Shift.scala 64:27]
  wire  _T_59; // @[Shift.scala 66:70]
  wire [3:0] _T_61; // @[Shift.scala 64:52]
  wire [4:0] _T_62; // @[Cat.scala 29:58]
  wire [4:0] _T_63; // @[Shift.scala 64:27]
  wire [4:0] decA_fraction; // @[Shift.scala 16:10]
  wire  _T_67; // @[convert.scala 25:26]
  wire [2:0] _T_69; // @[convert.scala 25:42]
  wire [3:0] _T_70; // @[Cat.scala 29:58]
  wire [6:0] _T_72; // @[convert.scala 29:56]
  wire  _T_73; // @[convert.scala 29:60]
  wire  _T_74; // @[convert.scala 29:41]
  wire  decA_isNaR; // @[convert.scala 29:39]
  wire  _T_77; // @[convert.scala 30:19]
  wire  decA_isZero; // @[convert.scala 30:41]
  wire [3:0] decA_scale; // @[convert.scala 32:24]
  wire  _T_86; // @[convert.scala 18:24]
  wire  _T_87; // @[convert.scala 18:40]
  wire  _T_88; // @[convert.scala 18:36]
  wire [5:0] _T_89; // @[convert.scala 19:24]
  wire [5:0] _T_90; // @[convert.scala 19:43]
  wire [5:0] _T_91; // @[convert.scala 19:39]
  wire [3:0] _T_92; // @[LZD.scala 43:32]
  wire [1:0] _T_93; // @[LZD.scala 43:32]
  wire  _T_94; // @[LZD.scala 39:14]
  wire  _T_95; // @[LZD.scala 39:21]
  wire  _T_96; // @[LZD.scala 39:30]
  wire  _T_97; // @[LZD.scala 39:27]
  wire  _T_98; // @[LZD.scala 39:25]
  wire [1:0] _T_99; // @[Cat.scala 29:58]
  wire [1:0] _T_100; // @[LZD.scala 44:32]
  wire  _T_101; // @[LZD.scala 39:14]
  wire  _T_102; // @[LZD.scala 39:21]
  wire  _T_103; // @[LZD.scala 39:30]
  wire  _T_104; // @[LZD.scala 39:27]
  wire  _T_105; // @[LZD.scala 39:25]
  wire [1:0] _T_106; // @[Cat.scala 29:58]
  wire  _T_107; // @[Shift.scala 12:21]
  wire  _T_108; // @[Shift.scala 12:21]
  wire  _T_109; // @[LZD.scala 49:16]
  wire  _T_110; // @[LZD.scala 49:27]
  wire  _T_111; // @[LZD.scala 49:25]
  wire  _T_112; // @[LZD.scala 49:47]
  wire  _T_113; // @[LZD.scala 49:59]
  wire  _T_114; // @[LZD.scala 49:35]
  wire [2:0] _T_116; // @[Cat.scala 29:58]
  wire [1:0] _T_117; // @[LZD.scala 44:32]
  wire  _T_118; // @[LZD.scala 39:14]
  wire  _T_119; // @[LZD.scala 39:21]
  wire  _T_120; // @[LZD.scala 39:30]
  wire  _T_121; // @[LZD.scala 39:27]
  wire  _T_122; // @[LZD.scala 39:25]
  wire [1:0] _T_123; // @[Cat.scala 29:58]
  wire  _T_124; // @[Shift.scala 12:21]
  wire [1:0] _T_126; // @[LZD.scala 55:32]
  wire [1:0] _T_127; // @[LZD.scala 55:20]
  wire [2:0] _T_128; // @[Cat.scala 29:58]
  wire [2:0] _T_129; // @[convert.scala 21:22]
  wire [4:0] _T_130; // @[convert.scala 22:36]
  wire  _T_131; // @[Shift.scala 16:24]
  wire  _T_133; // @[Shift.scala 12:21]
  wire  _T_134; // @[Shift.scala 64:52]
  wire [4:0] _T_136; // @[Cat.scala 29:58]
  wire [4:0] _T_137; // @[Shift.scala 64:27]
  wire [1:0] _T_138; // @[Shift.scala 66:70]
  wire  _T_139; // @[Shift.scala 12:21]
  wire [2:0] _T_140; // @[Shift.scala 64:52]
  wire [4:0] _T_142; // @[Cat.scala 29:58]
  wire [4:0] _T_143; // @[Shift.scala 64:27]
  wire  _T_144; // @[Shift.scala 66:70]
  wire [3:0] _T_146; // @[Shift.scala 64:52]
  wire [4:0] _T_147; // @[Cat.scala 29:58]
  wire [4:0] _T_148; // @[Shift.scala 64:27]
  wire [4:0] decB_fraction; // @[Shift.scala 16:10]
  wire  _T_152; // @[convert.scala 25:26]
  wire [2:0] _T_154; // @[convert.scala 25:42]
  wire [3:0] _T_155; // @[Cat.scala 29:58]
  wire [6:0] _T_157; // @[convert.scala 29:56]
  wire  _T_158; // @[convert.scala 29:60]
  wire  _T_159; // @[convert.scala 29:41]
  wire  decB_isNaR; // @[convert.scala 29:39]
  wire  _T_162; // @[convert.scala 30:19]
  wire  decB_isZero; // @[convert.scala 30:41]
  wire [3:0] decB_scale; // @[convert.scala 32:24]
  wire  outIsNaR; // @[PositEMA.scala 53:29]
  wire [4:0] mulScale; // @[PositEMA.scala 54:35]
  wire  _T_170; // @[PositEMA.scala 55:33]
  wire  _T_171; // @[PositEMA.scala 55:46]
  wire  _T_172; // @[PositEMA.scala 55:44]
  wire [6:0] _T_174; // @[Cat.scala 29:58]
  wire [6:0] sigA; // @[PositEMA.scala 55:75]
  wire  _T_175; // @[PositEMA.scala 56:33]
  wire  _T_176; // @[PositEMA.scala 56:46]
  wire  _T_177; // @[PositEMA.scala 56:44]
  wire [6:0] _T_179; // @[Cat.scala 29:58]
  wire [6:0] sigB; // @[PositEMA.scala 56:75]
  wire [13:0] _T_180; // @[PositEMA.scala 57:24]
  wire [13:0] sigP; // @[PositEMA.scala 57:32]
  reg  inValid_phase2; // @[Valid.scala 117:22]
  reg [31:0] _RAND_0;
  reg  outIsNaR_phase2; // @[Reg.scala 15:16]
  reg [31:0] _RAND_1;
  reg [13:0] mulSig_phase2; // @[Reg.scala 15:16]
  reg [31:0] _RAND_2;
  reg [4:0] mulScale_phase2; // @[Reg.scala 15:16]
  reg [31:0] _RAND_3;
  wire  _T_193; // @[Abs.scala 10:21]
  wire [4:0] _T_195; // @[Bitwise.scala 71:12]
  wire [4:0] _T_196; // @[Abs.scala 10:31]
  wire [4:0] _T_197; // @[Abs.scala 10:26]
  wire [4:0] _GEN_10; // @[Abs.scala 10:39]
  wire [4:0] absScale; // @[Abs.scala 10:39]
  wire  _T_200; // @[PositEMA.scala 77:65]
  wire [15:0] _T_202; // @[Bitwise.scala 71:12]
  wire [31:0] extSig; // @[Cat.scala 29:58]
  wire  _T_207; // @[Shift.scala 12:21]
  wire [15:0] _T_208; // @[Shift.scala 64:52]
  wire [31:0] _T_210; // @[Cat.scala 29:58]
  wire [31:0] _T_211; // @[Shift.scala 64:27]
  wire [3:0] _T_212; // @[Shift.scala 66:70]
  wire  _T_213; // @[Shift.scala 12:21]
  wire [23:0] _T_214; // @[Shift.scala 64:52]
  wire [31:0] _T_216; // @[Cat.scala 29:58]
  wire [31:0] _T_217; // @[Shift.scala 64:27]
  wire [2:0] _T_218; // @[Shift.scala 66:70]
  wire  _T_219; // @[Shift.scala 12:21]
  wire [27:0] _T_220; // @[Shift.scala 64:52]
  wire [31:0] _T_222; // @[Cat.scala 29:58]
  wire [31:0] _T_223; // @[Shift.scala 64:27]
  wire [1:0] _T_224; // @[Shift.scala 66:70]
  wire  _T_225; // @[Shift.scala 12:21]
  wire [29:0] _T_226; // @[Shift.scala 64:52]
  wire [31:0] _T_228; // @[Cat.scala 29:58]
  wire [31:0] _T_229; // @[Shift.scala 64:27]
  wire  _T_230; // @[Shift.scala 66:70]
  wire [30:0] _T_232; // @[Shift.scala 64:52]
  wire [31:0] _T_233; // @[Cat.scala 29:58]
  wire  _T_238; // @[Shift.scala 12:21]
  wire [15:0] _T_240; // @[Bitwise.scala 71:12]
  wire [15:0] _T_241; // @[Shift.scala 83:71]
  wire [31:0] _T_242; // @[Cat.scala 29:58]
  wire [31:0] _T_243; // @[Shift.scala 83:22]
  wire  _T_246; // @[Shift.scala 12:21]
  wire [7:0] _T_248; // @[Bitwise.scala 71:12]
  wire [23:0] _T_249; // @[Shift.scala 83:71]
  wire [31:0] _T_250; // @[Cat.scala 29:58]
  wire [31:0] _T_251; // @[Shift.scala 83:22]
  wire  _T_254; // @[Shift.scala 12:21]
  wire [3:0] _T_256; // @[Bitwise.scala 71:12]
  wire [27:0] _T_257; // @[Shift.scala 83:71]
  wire [31:0] _T_258; // @[Cat.scala 29:58]
  wire [31:0] _T_259; // @[Shift.scala 83:22]
  wire  _T_262; // @[Shift.scala 12:21]
  wire [1:0] _T_264; // @[Bitwise.scala 71:12]
  wire [29:0] _T_265; // @[Shift.scala 83:71]
  wire [31:0] _T_266; // @[Cat.scala 29:58]
  wire [31:0] _T_267; // @[Shift.scala 83:22]
  wire  _T_270; // @[Shift.scala 12:21]
  wire [30:0] _T_271; // @[Shift.scala 83:71]
  wire [31:0] _T_272; // @[Cat.scala 29:58]
  reg  inValid_phase3; // @[Valid.scala 117:22]
  reg [31:0] _RAND_4;
  reg  outIsNaR_phase3; // @[Reg.scala 15:16]
  reg [31:0] _RAND_5;
  reg [31:0] shiftSig_phase3; // @[Reg.scala 15:16]
  reg [31:0] _RAND_6;
  reg [31:0] quireReg; // @[PositEMA.scala 104:27]
  reg [31:0] _RAND_7;
  wire  _T_288; // @[PositEMA.scala 105:40]
  wire [30:0] _T_289; // @[PositEMA.scala 105:60]
  wire  _T_290; // @[PositEMA.scala 105:64]
  wire  _T_291; // @[PositEMA.scala 105:46]
  wire  quireIsNaR; // @[PositEMA.scala 105:44]
  wire  _T_293; // @[PositEMA.scala 108:33]
  wire [31:0] _T_296; // @[PositEMA.scala 111:46]
  reg  _T_297; // @[Valid.scala 117:22]
  reg [31:0] _RAND_8;
  assign _T_1 = io_A[7]; // @[convert.scala 18:24]
  assign _T_2 = io_A[6]; // @[convert.scala 18:40]
  assign _T_3 = _T_1 ^ _T_2; // @[convert.scala 18:36]
  assign _T_4 = io_A[6:1]; // @[convert.scala 19:24]
  assign _T_5 = io_A[5:0]; // @[convert.scala 19:43]
  assign _T_6 = _T_4 ^ _T_5; // @[convert.scala 19:39]
  assign _T_7 = _T_6[5:2]; // @[LZD.scala 43:32]
  assign _T_8 = _T_7[3:2]; // @[LZD.scala 43:32]
  assign _T_9 = _T_8 != 2'h0; // @[LZD.scala 39:14]
  assign _T_10 = _T_8[1]; // @[LZD.scala 39:21]
  assign _T_11 = _T_8[0]; // @[LZD.scala 39:30]
  assign _T_12 = ~ _T_11; // @[LZD.scala 39:27]
  assign _T_13 = _T_10 | _T_12; // @[LZD.scala 39:25]
  assign _T_14 = {_T_9,_T_13}; // @[Cat.scala 29:58]
  assign _T_15 = _T_7[1:0]; // @[LZD.scala 44:32]
  assign _T_16 = _T_15 != 2'h0; // @[LZD.scala 39:14]
  assign _T_17 = _T_15[1]; // @[LZD.scala 39:21]
  assign _T_18 = _T_15[0]; // @[LZD.scala 39:30]
  assign _T_19 = ~ _T_18; // @[LZD.scala 39:27]
  assign _T_20 = _T_17 | _T_19; // @[LZD.scala 39:25]
  assign _T_21 = {_T_16,_T_20}; // @[Cat.scala 29:58]
  assign _T_22 = _T_14[1]; // @[Shift.scala 12:21]
  assign _T_23 = _T_21[1]; // @[Shift.scala 12:21]
  assign _T_24 = _T_22 | _T_23; // @[LZD.scala 49:16]
  assign _T_25 = ~ _T_23; // @[LZD.scala 49:27]
  assign _T_26 = _T_22 | _T_25; // @[LZD.scala 49:25]
  assign _T_27 = _T_14[0:0]; // @[LZD.scala 49:47]
  assign _T_28 = _T_21[0:0]; // @[LZD.scala 49:59]
  assign _T_29 = _T_22 ? _T_27 : _T_28; // @[LZD.scala 49:35]
  assign _T_31 = {_T_24,_T_26,_T_29}; // @[Cat.scala 29:58]
  assign _T_32 = _T_6[1:0]; // @[LZD.scala 44:32]
  assign _T_33 = _T_32 != 2'h0; // @[LZD.scala 39:14]
  assign _T_34 = _T_32[1]; // @[LZD.scala 39:21]
  assign _T_35 = _T_32[0]; // @[LZD.scala 39:30]
  assign _T_36 = ~ _T_35; // @[LZD.scala 39:27]
  assign _T_37 = _T_34 | _T_36; // @[LZD.scala 39:25]
  assign _T_38 = {_T_33,_T_37}; // @[Cat.scala 29:58]
  assign _T_39 = _T_31[2]; // @[Shift.scala 12:21]
  assign _T_41 = _T_31[1:0]; // @[LZD.scala 55:32]
  assign _T_42 = _T_39 ? _T_41 : _T_38; // @[LZD.scala 55:20]
  assign _T_43 = {_T_39,_T_42}; // @[Cat.scala 29:58]
  assign _T_44 = ~ _T_43; // @[convert.scala 21:22]
  assign _T_45 = io_A[4:0]; // @[convert.scala 22:36]
  assign _T_46 = _T_44 < 3'h5; // @[Shift.scala 16:24]
  assign _T_48 = _T_44[2]; // @[Shift.scala 12:21]
  assign _T_49 = _T_45[0:0]; // @[Shift.scala 64:52]
  assign _T_51 = {_T_49,4'h0}; // @[Cat.scala 29:58]
  assign _T_52 = _T_48 ? _T_51 : _T_45; // @[Shift.scala 64:27]
  assign _T_53 = _T_44[1:0]; // @[Shift.scala 66:70]
  assign _T_54 = _T_53[1]; // @[Shift.scala 12:21]
  assign _T_55 = _T_52[2:0]; // @[Shift.scala 64:52]
  assign _T_57 = {_T_55,2'h0}; // @[Cat.scala 29:58]
  assign _T_58 = _T_54 ? _T_57 : _T_52; // @[Shift.scala 64:27]
  assign _T_59 = _T_53[0:0]; // @[Shift.scala 66:70]
  assign _T_61 = _T_58[3:0]; // @[Shift.scala 64:52]
  assign _T_62 = {_T_61,1'h0}; // @[Cat.scala 29:58]
  assign _T_63 = _T_59 ? _T_62 : _T_58; // @[Shift.scala 64:27]
  assign decA_fraction = _T_46 ? _T_63 : 5'h0; // @[Shift.scala 16:10]
  assign _T_67 = _T_3 == 1'h0; // @[convert.scala 25:26]
  assign _T_69 = _T_3 ? _T_44 : _T_43; // @[convert.scala 25:42]
  assign _T_70 = {_T_67,_T_69}; // @[Cat.scala 29:58]
  assign _T_72 = io_A[6:0]; // @[convert.scala 29:56]
  assign _T_73 = _T_72 != 7'h0; // @[convert.scala 29:60]
  assign _T_74 = ~ _T_73; // @[convert.scala 29:41]
  assign decA_isNaR = _T_1 & _T_74; // @[convert.scala 29:39]
  assign _T_77 = _T_1 == 1'h0; // @[convert.scala 30:19]
  assign decA_isZero = _T_77 & _T_74; // @[convert.scala 30:41]
  assign decA_scale = $signed(_T_70); // @[convert.scala 32:24]
  assign _T_86 = io_B[7]; // @[convert.scala 18:24]
  assign _T_87 = io_B[6]; // @[convert.scala 18:40]
  assign _T_88 = _T_86 ^ _T_87; // @[convert.scala 18:36]
  assign _T_89 = io_B[6:1]; // @[convert.scala 19:24]
  assign _T_90 = io_B[5:0]; // @[convert.scala 19:43]
  assign _T_91 = _T_89 ^ _T_90; // @[convert.scala 19:39]
  assign _T_92 = _T_91[5:2]; // @[LZD.scala 43:32]
  assign _T_93 = _T_92[3:2]; // @[LZD.scala 43:32]
  assign _T_94 = _T_93 != 2'h0; // @[LZD.scala 39:14]
  assign _T_95 = _T_93[1]; // @[LZD.scala 39:21]
  assign _T_96 = _T_93[0]; // @[LZD.scala 39:30]
  assign _T_97 = ~ _T_96; // @[LZD.scala 39:27]
  assign _T_98 = _T_95 | _T_97; // @[LZD.scala 39:25]
  assign _T_99 = {_T_94,_T_98}; // @[Cat.scala 29:58]
  assign _T_100 = _T_92[1:0]; // @[LZD.scala 44:32]
  assign _T_101 = _T_100 != 2'h0; // @[LZD.scala 39:14]
  assign _T_102 = _T_100[1]; // @[LZD.scala 39:21]
  assign _T_103 = _T_100[0]; // @[LZD.scala 39:30]
  assign _T_104 = ~ _T_103; // @[LZD.scala 39:27]
  assign _T_105 = _T_102 | _T_104; // @[LZD.scala 39:25]
  assign _T_106 = {_T_101,_T_105}; // @[Cat.scala 29:58]
  assign _T_107 = _T_99[1]; // @[Shift.scala 12:21]
  assign _T_108 = _T_106[1]; // @[Shift.scala 12:21]
  assign _T_109 = _T_107 | _T_108; // @[LZD.scala 49:16]
  assign _T_110 = ~ _T_108; // @[LZD.scala 49:27]
  assign _T_111 = _T_107 | _T_110; // @[LZD.scala 49:25]
  assign _T_112 = _T_99[0:0]; // @[LZD.scala 49:47]
  assign _T_113 = _T_106[0:0]; // @[LZD.scala 49:59]
  assign _T_114 = _T_107 ? _T_112 : _T_113; // @[LZD.scala 49:35]
  assign _T_116 = {_T_109,_T_111,_T_114}; // @[Cat.scala 29:58]
  assign _T_117 = _T_91[1:0]; // @[LZD.scala 44:32]
  assign _T_118 = _T_117 != 2'h0; // @[LZD.scala 39:14]
  assign _T_119 = _T_117[1]; // @[LZD.scala 39:21]
  assign _T_120 = _T_117[0]; // @[LZD.scala 39:30]
  assign _T_121 = ~ _T_120; // @[LZD.scala 39:27]
  assign _T_122 = _T_119 | _T_121; // @[LZD.scala 39:25]
  assign _T_123 = {_T_118,_T_122}; // @[Cat.scala 29:58]
  assign _T_124 = _T_116[2]; // @[Shift.scala 12:21]
  assign _T_126 = _T_116[1:0]; // @[LZD.scala 55:32]
  assign _T_127 = _T_124 ? _T_126 : _T_123; // @[LZD.scala 55:20]
  assign _T_128 = {_T_124,_T_127}; // @[Cat.scala 29:58]
  assign _T_129 = ~ _T_128; // @[convert.scala 21:22]
  assign _T_130 = io_B[4:0]; // @[convert.scala 22:36]
  assign _T_131 = _T_129 < 3'h5; // @[Shift.scala 16:24]
  assign _T_133 = _T_129[2]; // @[Shift.scala 12:21]
  assign _T_134 = _T_130[0:0]; // @[Shift.scala 64:52]
  assign _T_136 = {_T_134,4'h0}; // @[Cat.scala 29:58]
  assign _T_137 = _T_133 ? _T_136 : _T_130; // @[Shift.scala 64:27]
  assign _T_138 = _T_129[1:0]; // @[Shift.scala 66:70]
  assign _T_139 = _T_138[1]; // @[Shift.scala 12:21]
  assign _T_140 = _T_137[2:0]; // @[Shift.scala 64:52]
  assign _T_142 = {_T_140,2'h0}; // @[Cat.scala 29:58]
  assign _T_143 = _T_139 ? _T_142 : _T_137; // @[Shift.scala 64:27]
  assign _T_144 = _T_138[0:0]; // @[Shift.scala 66:70]
  assign _T_146 = _T_143[3:0]; // @[Shift.scala 64:52]
  assign _T_147 = {_T_146,1'h0}; // @[Cat.scala 29:58]
  assign _T_148 = _T_144 ? _T_147 : _T_143; // @[Shift.scala 64:27]
  assign decB_fraction = _T_131 ? _T_148 : 5'h0; // @[Shift.scala 16:10]
  assign _T_152 = _T_88 == 1'h0; // @[convert.scala 25:26]
  assign _T_154 = _T_88 ? _T_129 : _T_128; // @[convert.scala 25:42]
  assign _T_155 = {_T_152,_T_154}; // @[Cat.scala 29:58]
  assign _T_157 = io_B[6:0]; // @[convert.scala 29:56]
  assign _T_158 = _T_157 != 7'h0; // @[convert.scala 29:60]
  assign _T_159 = ~ _T_158; // @[convert.scala 29:41]
  assign decB_isNaR = _T_86 & _T_159; // @[convert.scala 29:39]
  assign _T_162 = _T_86 == 1'h0; // @[convert.scala 30:19]
  assign decB_isZero = _T_162 & _T_159; // @[convert.scala 30:41]
  assign decB_scale = $signed(_T_155); // @[convert.scala 32:24]
  assign outIsNaR = decA_isNaR | decB_isNaR; // @[PositEMA.scala 53:29]
  assign mulScale = $signed(decA_scale) + $signed(decB_scale); // @[PositEMA.scala 54:35]
  assign _T_170 = ~ _T_1; // @[PositEMA.scala 55:33]
  assign _T_171 = ~ decA_isZero; // @[PositEMA.scala 55:46]
  assign _T_172 = _T_170 & _T_171; // @[PositEMA.scala 55:44]
  assign _T_174 = {_T_1,_T_172,decA_fraction}; // @[Cat.scala 29:58]
  assign sigA = $signed(_T_174); // @[PositEMA.scala 55:75]
  assign _T_175 = ~ _T_86; // @[PositEMA.scala 56:33]
  assign _T_176 = ~ decB_isZero; // @[PositEMA.scala 56:46]
  assign _T_177 = _T_175 & _T_176; // @[PositEMA.scala 56:44]
  assign _T_179 = {_T_86,_T_177,decB_fraction}; // @[Cat.scala 29:58]
  assign sigB = $signed(_T_179); // @[PositEMA.scala 56:75]
  assign _T_180 = $signed(sigA) * $signed(sigB); // @[PositEMA.scala 57:24]
  assign sigP = $unsigned(_T_180); // @[PositEMA.scala 57:32]
  assign _T_193 = mulScale_phase2[4:4]; // @[Abs.scala 10:21]
  assign _T_195 = _T_193 ? 5'h1f : 5'h0; // @[Bitwise.scala 71:12]
  assign _T_196 = $unsigned(mulScale_phase2); // @[Abs.scala 10:31]
  assign _T_197 = _T_195 ^ _T_196; // @[Abs.scala 10:26]
  assign _GEN_10 = {{4'd0}, _T_193}; // @[Abs.scala 10:39]
  assign absScale = _T_197 + _GEN_10; // @[Abs.scala 10:39]
  assign _T_200 = mulSig_phase2[13:13]; // @[PositEMA.scala 77:65]
  assign _T_202 = _T_200 ? 16'hffff : 16'h0; // @[Bitwise.scala 71:12]
  assign extSig = {_T_202,mulSig_phase2,2'h0}; // @[Cat.scala 29:58]
  assign _T_207 = absScale[4]; // @[Shift.scala 12:21]
  assign _T_208 = extSig[15:0]; // @[Shift.scala 64:52]
  assign _T_210 = {_T_208,16'h0}; // @[Cat.scala 29:58]
  assign _T_211 = _T_207 ? _T_210 : extSig; // @[Shift.scala 64:27]
  assign _T_212 = absScale[3:0]; // @[Shift.scala 66:70]
  assign _T_213 = _T_212[3]; // @[Shift.scala 12:21]
  assign _T_214 = _T_211[23:0]; // @[Shift.scala 64:52]
  assign _T_216 = {_T_214,8'h0}; // @[Cat.scala 29:58]
  assign _T_217 = _T_213 ? _T_216 : _T_211; // @[Shift.scala 64:27]
  assign _T_218 = _T_212[2:0]; // @[Shift.scala 66:70]
  assign _T_219 = _T_218[2]; // @[Shift.scala 12:21]
  assign _T_220 = _T_217[27:0]; // @[Shift.scala 64:52]
  assign _T_222 = {_T_220,4'h0}; // @[Cat.scala 29:58]
  assign _T_223 = _T_219 ? _T_222 : _T_217; // @[Shift.scala 64:27]
  assign _T_224 = _T_218[1:0]; // @[Shift.scala 66:70]
  assign _T_225 = _T_224[1]; // @[Shift.scala 12:21]
  assign _T_226 = _T_223[29:0]; // @[Shift.scala 64:52]
  assign _T_228 = {_T_226,2'h0}; // @[Cat.scala 29:58]
  assign _T_229 = _T_225 ? _T_228 : _T_223; // @[Shift.scala 64:27]
  assign _T_230 = _T_224[0:0]; // @[Shift.scala 66:70]
  assign _T_232 = _T_229[30:0]; // @[Shift.scala 64:52]
  assign _T_233 = {_T_232,1'h0}; // @[Cat.scala 29:58]
  assign _T_238 = extSig[31]; // @[Shift.scala 12:21]
  assign _T_240 = _T_238 ? 16'hffff : 16'h0; // @[Bitwise.scala 71:12]
  assign _T_241 = extSig[31:16]; // @[Shift.scala 83:71]
  assign _T_242 = {_T_240,_T_241}; // @[Cat.scala 29:58]
  assign _T_243 = _T_207 ? _T_242 : extSig; // @[Shift.scala 83:22]
  assign _T_246 = _T_243[31]; // @[Shift.scala 12:21]
  assign _T_248 = _T_246 ? 8'hff : 8'h0; // @[Bitwise.scala 71:12]
  assign _T_249 = _T_243[31:8]; // @[Shift.scala 83:71]
  assign _T_250 = {_T_248,_T_249}; // @[Cat.scala 29:58]
  assign _T_251 = _T_213 ? _T_250 : _T_243; // @[Shift.scala 83:22]
  assign _T_254 = _T_251[31]; // @[Shift.scala 12:21]
  assign _T_256 = _T_254 ? 4'hf : 4'h0; // @[Bitwise.scala 71:12]
  assign _T_257 = _T_251[31:4]; // @[Shift.scala 83:71]
  assign _T_258 = {_T_256,_T_257}; // @[Cat.scala 29:58]
  assign _T_259 = _T_219 ? _T_258 : _T_251; // @[Shift.scala 83:22]
  assign _T_262 = _T_259[31]; // @[Shift.scala 12:21]
  assign _T_264 = _T_262 ? 2'h3 : 2'h0; // @[Bitwise.scala 71:12]
  assign _T_265 = _T_259[31:2]; // @[Shift.scala 83:71]
  assign _T_266 = {_T_264,_T_265}; // @[Cat.scala 29:58]
  assign _T_267 = _T_225 ? _T_266 : _T_259; // @[Shift.scala 83:22]
  assign _T_270 = _T_267[31]; // @[Shift.scala 12:21]
  assign _T_271 = _T_267[31:1]; // @[Shift.scala 83:71]
  assign _T_272 = {_T_270,_T_271}; // @[Cat.scala 29:58]
  assign _T_288 = quireReg[31:31]; // @[PositEMA.scala 105:40]
  assign _T_289 = quireReg[30:0]; // @[PositEMA.scala 105:60]
  assign _T_290 = _T_289 != 31'h0; // @[PositEMA.scala 105:64]
  assign _T_291 = _T_290 == 1'h0; // @[PositEMA.scala 105:46]
  assign quireIsNaR = _T_288 & _T_291; // @[PositEMA.scala 105:44]
  assign _T_293 = quireIsNaR | outIsNaR_phase3; // @[PositEMA.scala 108:33]
  assign _T_296 = quireReg + shiftSig_phase3; // @[PositEMA.scala 111:46]
  assign io_E = quireReg; // @[PositEMA.scala 120:15]
  assign io_outValid = _T_297; // @[PositEMA.scala 119:15]
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
  mulSig_phase2 = _RAND_2[13:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  mulScale_phase2 = _RAND_3[4:0];
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
  shiftSig_phase3 = _RAND_6[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  quireReg = _RAND_7[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_297 = _RAND_8[0:0];
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
      if (_T_193) begin
        if (_T_230) begin
          shiftSig_phase3 <= _T_272;
        end else begin
          if (_T_225) begin
            shiftSig_phase3 <= _T_266;
          end else begin
            if (_T_219) begin
              shiftSig_phase3 <= _T_258;
            end else begin
              if (_T_213) begin
                shiftSig_phase3 <= _T_250;
              end else begin
                if (_T_207) begin
                  shiftSig_phase3 <= _T_242;
                end else begin
                  shiftSig_phase3 <= extSig;
                end
              end
            end
          end
        end
      end else begin
        if (_T_230) begin
          shiftSig_phase3 <= _T_233;
        end else begin
          if (_T_225) begin
            shiftSig_phase3 <= _T_228;
          end else begin
            if (_T_219) begin
              shiftSig_phase3 <= _T_222;
            end else begin
              if (_T_213) begin
                shiftSig_phase3 <= _T_216;
              end else begin
                if (_T_207) begin
                  shiftSig_phase3 <= _T_210;
                end else begin
                  shiftSig_phase3 <= extSig;
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      quireReg <= 32'h0;
    end else begin
      if (inValid_phase3) begin
        if (_T_293) begin
          quireReg <= 32'h80000000;
        end else begin
          quireReg <= _T_296;
        end
      end
    end
    if (reset) begin
      _T_297 <= 1'h0;
    end else begin
      _T_297 <= inValid_phase3;
    end
  end
endmodule
