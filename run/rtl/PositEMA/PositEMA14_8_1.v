module PositEMA14_8_1(
  input         clock,
  input         reset,
  input         io_inValid,
  input  [7:0]  io_A,
  input  [7:0]  io_B,
  output [63:0] io_E,
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
  wire [4:0] _T_64; // @[Shift.scala 16:10]
  wire  _T_65; // @[convert.scala 23:34]
  wire [3:0] decA_fraction; // @[convert.scala 24:34]
  wire  _T_67; // @[convert.scala 25:26]
  wire [2:0] _T_69; // @[convert.scala 25:42]
  wire  _T_72; // @[convert.scala 26:67]
  wire  _T_73; // @[convert.scala 26:51]
  wire [4:0] _T_74; // @[Cat.scala 29:58]
  wire [6:0] _T_76; // @[convert.scala 29:56]
  wire  _T_77; // @[convert.scala 29:60]
  wire  _T_78; // @[convert.scala 29:41]
  wire  decA_isNaR; // @[convert.scala 29:39]
  wire  _T_81; // @[convert.scala 30:19]
  wire  decA_isZero; // @[convert.scala 30:41]
  wire [4:0] decA_scale; // @[convert.scala 32:24]
  wire  _T_90; // @[convert.scala 18:24]
  wire  _T_91; // @[convert.scala 18:40]
  wire  _T_92; // @[convert.scala 18:36]
  wire [5:0] _T_93; // @[convert.scala 19:24]
  wire [5:0] _T_94; // @[convert.scala 19:43]
  wire [5:0] _T_95; // @[convert.scala 19:39]
  wire [3:0] _T_96; // @[LZD.scala 43:32]
  wire [1:0] _T_97; // @[LZD.scala 43:32]
  wire  _T_98; // @[LZD.scala 39:14]
  wire  _T_99; // @[LZD.scala 39:21]
  wire  _T_100; // @[LZD.scala 39:30]
  wire  _T_101; // @[LZD.scala 39:27]
  wire  _T_102; // @[LZD.scala 39:25]
  wire [1:0] _T_103; // @[Cat.scala 29:58]
  wire [1:0] _T_104; // @[LZD.scala 44:32]
  wire  _T_105; // @[LZD.scala 39:14]
  wire  _T_106; // @[LZD.scala 39:21]
  wire  _T_107; // @[LZD.scala 39:30]
  wire  _T_108; // @[LZD.scala 39:27]
  wire  _T_109; // @[LZD.scala 39:25]
  wire [1:0] _T_110; // @[Cat.scala 29:58]
  wire  _T_111; // @[Shift.scala 12:21]
  wire  _T_112; // @[Shift.scala 12:21]
  wire  _T_113; // @[LZD.scala 49:16]
  wire  _T_114; // @[LZD.scala 49:27]
  wire  _T_115; // @[LZD.scala 49:25]
  wire  _T_116; // @[LZD.scala 49:47]
  wire  _T_117; // @[LZD.scala 49:59]
  wire  _T_118; // @[LZD.scala 49:35]
  wire [2:0] _T_120; // @[Cat.scala 29:58]
  wire [1:0] _T_121; // @[LZD.scala 44:32]
  wire  _T_122; // @[LZD.scala 39:14]
  wire  _T_123; // @[LZD.scala 39:21]
  wire  _T_124; // @[LZD.scala 39:30]
  wire  _T_125; // @[LZD.scala 39:27]
  wire  _T_126; // @[LZD.scala 39:25]
  wire [1:0] _T_127; // @[Cat.scala 29:58]
  wire  _T_128; // @[Shift.scala 12:21]
  wire [1:0] _T_130; // @[LZD.scala 55:32]
  wire [1:0] _T_131; // @[LZD.scala 55:20]
  wire [2:0] _T_132; // @[Cat.scala 29:58]
  wire [2:0] _T_133; // @[convert.scala 21:22]
  wire [4:0] _T_134; // @[convert.scala 22:36]
  wire  _T_135; // @[Shift.scala 16:24]
  wire  _T_137; // @[Shift.scala 12:21]
  wire  _T_138; // @[Shift.scala 64:52]
  wire [4:0] _T_140; // @[Cat.scala 29:58]
  wire [4:0] _T_141; // @[Shift.scala 64:27]
  wire [1:0] _T_142; // @[Shift.scala 66:70]
  wire  _T_143; // @[Shift.scala 12:21]
  wire [2:0] _T_144; // @[Shift.scala 64:52]
  wire [4:0] _T_146; // @[Cat.scala 29:58]
  wire [4:0] _T_147; // @[Shift.scala 64:27]
  wire  _T_148; // @[Shift.scala 66:70]
  wire [3:0] _T_150; // @[Shift.scala 64:52]
  wire [4:0] _T_151; // @[Cat.scala 29:58]
  wire [4:0] _T_152; // @[Shift.scala 64:27]
  wire [4:0] _T_153; // @[Shift.scala 16:10]
  wire  _T_154; // @[convert.scala 23:34]
  wire [3:0] decB_fraction; // @[convert.scala 24:34]
  wire  _T_156; // @[convert.scala 25:26]
  wire [2:0] _T_158; // @[convert.scala 25:42]
  wire  _T_161; // @[convert.scala 26:67]
  wire  _T_162; // @[convert.scala 26:51]
  wire [4:0] _T_163; // @[Cat.scala 29:58]
  wire [6:0] _T_165; // @[convert.scala 29:56]
  wire  _T_166; // @[convert.scala 29:60]
  wire  _T_167; // @[convert.scala 29:41]
  wire  decB_isNaR; // @[convert.scala 29:39]
  wire  _T_170; // @[convert.scala 30:19]
  wire  decB_isZero; // @[convert.scala 30:41]
  wire [4:0] decB_scale; // @[convert.scala 32:24]
  wire  outIsNaR; // @[PositEMA.scala 53:29]
  wire [5:0] mulScale; // @[PositEMA.scala 54:35]
  wire  _T_178; // @[PositEMA.scala 55:33]
  wire  _T_179; // @[PositEMA.scala 55:46]
  wire  _T_180; // @[PositEMA.scala 55:44]
  wire [5:0] _T_182; // @[Cat.scala 29:58]
  wire [5:0] sigA; // @[PositEMA.scala 55:75]
  wire  _T_183; // @[PositEMA.scala 56:33]
  wire  _T_184; // @[PositEMA.scala 56:46]
  wire  _T_185; // @[PositEMA.scala 56:44]
  wire [5:0] _T_187; // @[Cat.scala 29:58]
  wire [5:0] sigB; // @[PositEMA.scala 56:75]
  wire [11:0] _T_188; // @[PositEMA.scala 57:24]
  wire [11:0] sigP; // @[PositEMA.scala 57:32]
  reg  inValid_phase2; // @[Valid.scala 117:22]
  reg [31:0] _RAND_0;
  reg  outIsNaR_phase2; // @[Reg.scala 15:16]
  reg [31:0] _RAND_1;
  reg [11:0] mulSig_phase2; // @[Reg.scala 15:16]
  reg [31:0] _RAND_2;
  reg [5:0] mulScale_phase2; // @[Reg.scala 15:16]
  reg [31:0] _RAND_3;
  wire  _T_201; // @[Abs.scala 10:21]
  wire [5:0] _T_203; // @[Bitwise.scala 71:12]
  wire [5:0] _T_204; // @[Abs.scala 10:31]
  wire [5:0] _T_205; // @[Abs.scala 10:26]
  wire [5:0] _GEN_10; // @[Abs.scala 10:39]
  wire [5:0] absScale; // @[Abs.scala 10:39]
  wire  _T_208; // @[PositEMA.scala 77:65]
  wire [35:0] _T_210; // @[Bitwise.scala 71:12]
  wire [63:0] extSig; // @[Cat.scala 29:58]
  wire  _T_215; // @[Shift.scala 12:21]
  wire [31:0] _T_216; // @[Shift.scala 64:52]
  wire [63:0] _T_218; // @[Cat.scala 29:58]
  wire [63:0] _T_219; // @[Shift.scala 64:27]
  wire [4:0] _T_220; // @[Shift.scala 66:70]
  wire  _T_221; // @[Shift.scala 12:21]
  wire [47:0] _T_222; // @[Shift.scala 64:52]
  wire [63:0] _T_224; // @[Cat.scala 29:58]
  wire [63:0] _T_225; // @[Shift.scala 64:27]
  wire [3:0] _T_226; // @[Shift.scala 66:70]
  wire  _T_227; // @[Shift.scala 12:21]
  wire [55:0] _T_228; // @[Shift.scala 64:52]
  wire [63:0] _T_230; // @[Cat.scala 29:58]
  wire [63:0] _T_231; // @[Shift.scala 64:27]
  wire [2:0] _T_232; // @[Shift.scala 66:70]
  wire  _T_233; // @[Shift.scala 12:21]
  wire [59:0] _T_234; // @[Shift.scala 64:52]
  wire [63:0] _T_236; // @[Cat.scala 29:58]
  wire [63:0] _T_237; // @[Shift.scala 64:27]
  wire [1:0] _T_238; // @[Shift.scala 66:70]
  wire  _T_239; // @[Shift.scala 12:21]
  wire [61:0] _T_240; // @[Shift.scala 64:52]
  wire [63:0] _T_242; // @[Cat.scala 29:58]
  wire [63:0] _T_243; // @[Shift.scala 64:27]
  wire  _T_244; // @[Shift.scala 66:70]
  wire [62:0] _T_246; // @[Shift.scala 64:52]
  wire [63:0] _T_247; // @[Cat.scala 29:58]
  wire  _T_252; // @[Shift.scala 12:21]
  wire [31:0] _T_254; // @[Bitwise.scala 71:12]
  wire [31:0] _T_255; // @[Shift.scala 83:71]
  wire [63:0] _T_256; // @[Cat.scala 29:58]
  wire [63:0] _T_257; // @[Shift.scala 83:22]
  wire  _T_260; // @[Shift.scala 12:21]
  wire [15:0] _T_262; // @[Bitwise.scala 71:12]
  wire [47:0] _T_263; // @[Shift.scala 83:71]
  wire [63:0] _T_264; // @[Cat.scala 29:58]
  wire [63:0] _T_265; // @[Shift.scala 83:22]
  wire  _T_268; // @[Shift.scala 12:21]
  wire [7:0] _T_270; // @[Bitwise.scala 71:12]
  wire [55:0] _T_271; // @[Shift.scala 83:71]
  wire [63:0] _T_272; // @[Cat.scala 29:58]
  wire [63:0] _T_273; // @[Shift.scala 83:22]
  wire  _T_276; // @[Shift.scala 12:21]
  wire [3:0] _T_278; // @[Bitwise.scala 71:12]
  wire [59:0] _T_279; // @[Shift.scala 83:71]
  wire [63:0] _T_280; // @[Cat.scala 29:58]
  wire [63:0] _T_281; // @[Shift.scala 83:22]
  wire  _T_284; // @[Shift.scala 12:21]
  wire [1:0] _T_286; // @[Bitwise.scala 71:12]
  wire [61:0] _T_287; // @[Shift.scala 83:71]
  wire [63:0] _T_288; // @[Cat.scala 29:58]
  wire [63:0] _T_289; // @[Shift.scala 83:22]
  wire  _T_292; // @[Shift.scala 12:21]
  wire [62:0] _T_293; // @[Shift.scala 83:71]
  wire [63:0] _T_294; // @[Cat.scala 29:58]
  reg  inValid_phase3; // @[Valid.scala 117:22]
  reg [31:0] _RAND_4;
  reg  outIsNaR_phase3; // @[Reg.scala 15:16]
  reg [31:0] _RAND_5;
  reg [63:0] shiftSig_phase3; // @[Reg.scala 15:16]
  reg [63:0] _RAND_6;
  reg [63:0] quireReg; // @[PositEMA.scala 104:27]
  reg [63:0] _RAND_7;
  wire  _T_310; // @[PositEMA.scala 105:40]
  wire [62:0] _T_311; // @[PositEMA.scala 105:60]
  wire  _T_312; // @[PositEMA.scala 105:64]
  wire  _T_313; // @[PositEMA.scala 105:46]
  wire  quireIsNaR; // @[PositEMA.scala 105:44]
  wire  _T_315; // @[PositEMA.scala 108:33]
  wire [63:0] _T_318; // @[PositEMA.scala 111:46]
  reg  _T_319; // @[Valid.scala 117:22]
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
  assign _T_64 = _T_46 ? _T_63 : 5'h0; // @[Shift.scala 16:10]
  assign _T_65 = _T_64[4:4]; // @[convert.scala 23:34]
  assign decA_fraction = _T_64[3:0]; // @[convert.scala 24:34]
  assign _T_67 = _T_3 == 1'h0; // @[convert.scala 25:26]
  assign _T_69 = _T_3 ? _T_44 : _T_43; // @[convert.scala 25:42]
  assign _T_72 = ~ _T_65; // @[convert.scala 26:67]
  assign _T_73 = _T_1 ? _T_72 : _T_65; // @[convert.scala 26:51]
  assign _T_74 = {_T_67,_T_69,_T_73}; // @[Cat.scala 29:58]
  assign _T_76 = io_A[6:0]; // @[convert.scala 29:56]
  assign _T_77 = _T_76 != 7'h0; // @[convert.scala 29:60]
  assign _T_78 = ~ _T_77; // @[convert.scala 29:41]
  assign decA_isNaR = _T_1 & _T_78; // @[convert.scala 29:39]
  assign _T_81 = _T_1 == 1'h0; // @[convert.scala 30:19]
  assign decA_isZero = _T_81 & _T_78; // @[convert.scala 30:41]
  assign decA_scale = $signed(_T_74); // @[convert.scala 32:24]
  assign _T_90 = io_B[7]; // @[convert.scala 18:24]
  assign _T_91 = io_B[6]; // @[convert.scala 18:40]
  assign _T_92 = _T_90 ^ _T_91; // @[convert.scala 18:36]
  assign _T_93 = io_B[6:1]; // @[convert.scala 19:24]
  assign _T_94 = io_B[5:0]; // @[convert.scala 19:43]
  assign _T_95 = _T_93 ^ _T_94; // @[convert.scala 19:39]
  assign _T_96 = _T_95[5:2]; // @[LZD.scala 43:32]
  assign _T_97 = _T_96[3:2]; // @[LZD.scala 43:32]
  assign _T_98 = _T_97 != 2'h0; // @[LZD.scala 39:14]
  assign _T_99 = _T_97[1]; // @[LZD.scala 39:21]
  assign _T_100 = _T_97[0]; // @[LZD.scala 39:30]
  assign _T_101 = ~ _T_100; // @[LZD.scala 39:27]
  assign _T_102 = _T_99 | _T_101; // @[LZD.scala 39:25]
  assign _T_103 = {_T_98,_T_102}; // @[Cat.scala 29:58]
  assign _T_104 = _T_96[1:0]; // @[LZD.scala 44:32]
  assign _T_105 = _T_104 != 2'h0; // @[LZD.scala 39:14]
  assign _T_106 = _T_104[1]; // @[LZD.scala 39:21]
  assign _T_107 = _T_104[0]; // @[LZD.scala 39:30]
  assign _T_108 = ~ _T_107; // @[LZD.scala 39:27]
  assign _T_109 = _T_106 | _T_108; // @[LZD.scala 39:25]
  assign _T_110 = {_T_105,_T_109}; // @[Cat.scala 29:58]
  assign _T_111 = _T_103[1]; // @[Shift.scala 12:21]
  assign _T_112 = _T_110[1]; // @[Shift.scala 12:21]
  assign _T_113 = _T_111 | _T_112; // @[LZD.scala 49:16]
  assign _T_114 = ~ _T_112; // @[LZD.scala 49:27]
  assign _T_115 = _T_111 | _T_114; // @[LZD.scala 49:25]
  assign _T_116 = _T_103[0:0]; // @[LZD.scala 49:47]
  assign _T_117 = _T_110[0:0]; // @[LZD.scala 49:59]
  assign _T_118 = _T_111 ? _T_116 : _T_117; // @[LZD.scala 49:35]
  assign _T_120 = {_T_113,_T_115,_T_118}; // @[Cat.scala 29:58]
  assign _T_121 = _T_95[1:0]; // @[LZD.scala 44:32]
  assign _T_122 = _T_121 != 2'h0; // @[LZD.scala 39:14]
  assign _T_123 = _T_121[1]; // @[LZD.scala 39:21]
  assign _T_124 = _T_121[0]; // @[LZD.scala 39:30]
  assign _T_125 = ~ _T_124; // @[LZD.scala 39:27]
  assign _T_126 = _T_123 | _T_125; // @[LZD.scala 39:25]
  assign _T_127 = {_T_122,_T_126}; // @[Cat.scala 29:58]
  assign _T_128 = _T_120[2]; // @[Shift.scala 12:21]
  assign _T_130 = _T_120[1:0]; // @[LZD.scala 55:32]
  assign _T_131 = _T_128 ? _T_130 : _T_127; // @[LZD.scala 55:20]
  assign _T_132 = {_T_128,_T_131}; // @[Cat.scala 29:58]
  assign _T_133 = ~ _T_132; // @[convert.scala 21:22]
  assign _T_134 = io_B[4:0]; // @[convert.scala 22:36]
  assign _T_135 = _T_133 < 3'h5; // @[Shift.scala 16:24]
  assign _T_137 = _T_133[2]; // @[Shift.scala 12:21]
  assign _T_138 = _T_134[0:0]; // @[Shift.scala 64:52]
  assign _T_140 = {_T_138,4'h0}; // @[Cat.scala 29:58]
  assign _T_141 = _T_137 ? _T_140 : _T_134; // @[Shift.scala 64:27]
  assign _T_142 = _T_133[1:0]; // @[Shift.scala 66:70]
  assign _T_143 = _T_142[1]; // @[Shift.scala 12:21]
  assign _T_144 = _T_141[2:0]; // @[Shift.scala 64:52]
  assign _T_146 = {_T_144,2'h0}; // @[Cat.scala 29:58]
  assign _T_147 = _T_143 ? _T_146 : _T_141; // @[Shift.scala 64:27]
  assign _T_148 = _T_142[0:0]; // @[Shift.scala 66:70]
  assign _T_150 = _T_147[3:0]; // @[Shift.scala 64:52]
  assign _T_151 = {_T_150,1'h0}; // @[Cat.scala 29:58]
  assign _T_152 = _T_148 ? _T_151 : _T_147; // @[Shift.scala 64:27]
  assign _T_153 = _T_135 ? _T_152 : 5'h0; // @[Shift.scala 16:10]
  assign _T_154 = _T_153[4:4]; // @[convert.scala 23:34]
  assign decB_fraction = _T_153[3:0]; // @[convert.scala 24:34]
  assign _T_156 = _T_92 == 1'h0; // @[convert.scala 25:26]
  assign _T_158 = _T_92 ? _T_133 : _T_132; // @[convert.scala 25:42]
  assign _T_161 = ~ _T_154; // @[convert.scala 26:67]
  assign _T_162 = _T_90 ? _T_161 : _T_154; // @[convert.scala 26:51]
  assign _T_163 = {_T_156,_T_158,_T_162}; // @[Cat.scala 29:58]
  assign _T_165 = io_B[6:0]; // @[convert.scala 29:56]
  assign _T_166 = _T_165 != 7'h0; // @[convert.scala 29:60]
  assign _T_167 = ~ _T_166; // @[convert.scala 29:41]
  assign decB_isNaR = _T_90 & _T_167; // @[convert.scala 29:39]
  assign _T_170 = _T_90 == 1'h0; // @[convert.scala 30:19]
  assign decB_isZero = _T_170 & _T_167; // @[convert.scala 30:41]
  assign decB_scale = $signed(_T_163); // @[convert.scala 32:24]
  assign outIsNaR = decA_isNaR | decB_isNaR; // @[PositEMA.scala 53:29]
  assign mulScale = $signed(decA_scale) + $signed(decB_scale); // @[PositEMA.scala 54:35]
  assign _T_178 = ~ _T_1; // @[PositEMA.scala 55:33]
  assign _T_179 = ~ decA_isZero; // @[PositEMA.scala 55:46]
  assign _T_180 = _T_178 & _T_179; // @[PositEMA.scala 55:44]
  assign _T_182 = {_T_1,_T_180,decA_fraction}; // @[Cat.scala 29:58]
  assign sigA = $signed(_T_182); // @[PositEMA.scala 55:75]
  assign _T_183 = ~ _T_90; // @[PositEMA.scala 56:33]
  assign _T_184 = ~ decB_isZero; // @[PositEMA.scala 56:46]
  assign _T_185 = _T_183 & _T_184; // @[PositEMA.scala 56:44]
  assign _T_187 = {_T_90,_T_185,decB_fraction}; // @[Cat.scala 29:58]
  assign sigB = $signed(_T_187); // @[PositEMA.scala 56:75]
  assign _T_188 = $signed(sigA) * $signed(sigB); // @[PositEMA.scala 57:24]
  assign sigP = $unsigned(_T_188); // @[PositEMA.scala 57:32]
  assign _T_201 = mulScale_phase2[5:5]; // @[Abs.scala 10:21]
  assign _T_203 = _T_201 ? 6'h3f : 6'h0; // @[Bitwise.scala 71:12]
  assign _T_204 = $unsigned(mulScale_phase2); // @[Abs.scala 10:31]
  assign _T_205 = _T_203 ^ _T_204; // @[Abs.scala 10:26]
  assign _GEN_10 = {{5'd0}, _T_201}; // @[Abs.scala 10:39]
  assign absScale = _T_205 + _GEN_10; // @[Abs.scala 10:39]
  assign _T_208 = mulSig_phase2[11:11]; // @[PositEMA.scala 77:65]
  assign _T_210 = _T_208 ? 36'hfffffffff : 36'h0; // @[Bitwise.scala 71:12]
  assign extSig = {_T_210,mulSig_phase2,16'h0}; // @[Cat.scala 29:58]
  assign _T_215 = absScale[5]; // @[Shift.scala 12:21]
  assign _T_216 = extSig[31:0]; // @[Shift.scala 64:52]
  assign _T_218 = {_T_216,32'h0}; // @[Cat.scala 29:58]
  assign _T_219 = _T_215 ? _T_218 : extSig; // @[Shift.scala 64:27]
  assign _T_220 = absScale[4:0]; // @[Shift.scala 66:70]
  assign _T_221 = _T_220[4]; // @[Shift.scala 12:21]
  assign _T_222 = _T_219[47:0]; // @[Shift.scala 64:52]
  assign _T_224 = {_T_222,16'h0}; // @[Cat.scala 29:58]
  assign _T_225 = _T_221 ? _T_224 : _T_219; // @[Shift.scala 64:27]
  assign _T_226 = _T_220[3:0]; // @[Shift.scala 66:70]
  assign _T_227 = _T_226[3]; // @[Shift.scala 12:21]
  assign _T_228 = _T_225[55:0]; // @[Shift.scala 64:52]
  assign _T_230 = {_T_228,8'h0}; // @[Cat.scala 29:58]
  assign _T_231 = _T_227 ? _T_230 : _T_225; // @[Shift.scala 64:27]
  assign _T_232 = _T_226[2:0]; // @[Shift.scala 66:70]
  assign _T_233 = _T_232[2]; // @[Shift.scala 12:21]
  assign _T_234 = _T_231[59:0]; // @[Shift.scala 64:52]
  assign _T_236 = {_T_234,4'h0}; // @[Cat.scala 29:58]
  assign _T_237 = _T_233 ? _T_236 : _T_231; // @[Shift.scala 64:27]
  assign _T_238 = _T_232[1:0]; // @[Shift.scala 66:70]
  assign _T_239 = _T_238[1]; // @[Shift.scala 12:21]
  assign _T_240 = _T_237[61:0]; // @[Shift.scala 64:52]
  assign _T_242 = {_T_240,2'h0}; // @[Cat.scala 29:58]
  assign _T_243 = _T_239 ? _T_242 : _T_237; // @[Shift.scala 64:27]
  assign _T_244 = _T_238[0:0]; // @[Shift.scala 66:70]
  assign _T_246 = _T_243[62:0]; // @[Shift.scala 64:52]
  assign _T_247 = {_T_246,1'h0}; // @[Cat.scala 29:58]
  assign _T_252 = extSig[63]; // @[Shift.scala 12:21]
  assign _T_254 = _T_252 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 71:12]
  assign _T_255 = extSig[63:32]; // @[Shift.scala 83:71]
  assign _T_256 = {_T_254,_T_255}; // @[Cat.scala 29:58]
  assign _T_257 = _T_215 ? _T_256 : extSig; // @[Shift.scala 83:22]
  assign _T_260 = _T_257[63]; // @[Shift.scala 12:21]
  assign _T_262 = _T_260 ? 16'hffff : 16'h0; // @[Bitwise.scala 71:12]
  assign _T_263 = _T_257[63:16]; // @[Shift.scala 83:71]
  assign _T_264 = {_T_262,_T_263}; // @[Cat.scala 29:58]
  assign _T_265 = _T_221 ? _T_264 : _T_257; // @[Shift.scala 83:22]
  assign _T_268 = _T_265[63]; // @[Shift.scala 12:21]
  assign _T_270 = _T_268 ? 8'hff : 8'h0; // @[Bitwise.scala 71:12]
  assign _T_271 = _T_265[63:8]; // @[Shift.scala 83:71]
  assign _T_272 = {_T_270,_T_271}; // @[Cat.scala 29:58]
  assign _T_273 = _T_227 ? _T_272 : _T_265; // @[Shift.scala 83:22]
  assign _T_276 = _T_273[63]; // @[Shift.scala 12:21]
  assign _T_278 = _T_276 ? 4'hf : 4'h0; // @[Bitwise.scala 71:12]
  assign _T_279 = _T_273[63:4]; // @[Shift.scala 83:71]
  assign _T_280 = {_T_278,_T_279}; // @[Cat.scala 29:58]
  assign _T_281 = _T_233 ? _T_280 : _T_273; // @[Shift.scala 83:22]
  assign _T_284 = _T_281[63]; // @[Shift.scala 12:21]
  assign _T_286 = _T_284 ? 2'h3 : 2'h0; // @[Bitwise.scala 71:12]
  assign _T_287 = _T_281[63:2]; // @[Shift.scala 83:71]
  assign _T_288 = {_T_286,_T_287}; // @[Cat.scala 29:58]
  assign _T_289 = _T_239 ? _T_288 : _T_281; // @[Shift.scala 83:22]
  assign _T_292 = _T_289[63]; // @[Shift.scala 12:21]
  assign _T_293 = _T_289[63:1]; // @[Shift.scala 83:71]
  assign _T_294 = {_T_292,_T_293}; // @[Cat.scala 29:58]
  assign _T_310 = quireReg[63:63]; // @[PositEMA.scala 105:40]
  assign _T_311 = quireReg[62:0]; // @[PositEMA.scala 105:60]
  assign _T_312 = _T_311 != 63'h0; // @[PositEMA.scala 105:64]
  assign _T_313 = _T_312 == 1'h0; // @[PositEMA.scala 105:46]
  assign quireIsNaR = _T_310 & _T_313; // @[PositEMA.scala 105:44]
  assign _T_315 = quireIsNaR | outIsNaR_phase3; // @[PositEMA.scala 108:33]
  assign _T_318 = quireReg + shiftSig_phase3; // @[PositEMA.scala 111:46]
  assign io_E = quireReg; // @[PositEMA.scala 120:15]
  assign io_outValid = _T_319; // @[PositEMA.scala 119:15]
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
  mulSig_phase2 = _RAND_2[11:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  mulScale_phase2 = _RAND_3[5:0];
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
  _RAND_6 = {2{`RANDOM}};
  shiftSig_phase3 = _RAND_6[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {2{`RANDOM}};
  quireReg = _RAND_7[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_319 = _RAND_8[0:0];
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
      if (_T_201) begin
        if (_T_244) begin
          shiftSig_phase3 <= _T_294;
        end else begin
          if (_T_239) begin
            shiftSig_phase3 <= _T_288;
          end else begin
            if (_T_233) begin
              shiftSig_phase3 <= _T_280;
            end else begin
              if (_T_227) begin
                shiftSig_phase3 <= _T_272;
              end else begin
                if (_T_221) begin
                  shiftSig_phase3 <= _T_264;
                end else begin
                  if (_T_215) begin
                    shiftSig_phase3 <= _T_256;
                  end else begin
                    shiftSig_phase3 <= extSig;
                  end
                end
              end
            end
          end
        end
      end else begin
        if (_T_244) begin
          shiftSig_phase3 <= _T_247;
        end else begin
          if (_T_239) begin
            shiftSig_phase3 <= _T_242;
          end else begin
            if (_T_233) begin
              shiftSig_phase3 <= _T_236;
            end else begin
              if (_T_227) begin
                shiftSig_phase3 <= _T_230;
              end else begin
                if (_T_221) begin
                  shiftSig_phase3 <= _T_224;
                end else begin
                  if (_T_215) begin
                    shiftSig_phase3 <= _T_218;
                  end else begin
                    shiftSig_phase3 <= extSig;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      quireReg <= 64'h0;
    end else begin
      if (inValid_phase3) begin
        if (_T_315) begin
          quireReg <= 64'h8000000000000000;
        end else begin
          quireReg <= _T_318;
        end
      end
    end
    if (reset) begin
      _T_319 <= 1'h0;
    end else begin
      _T_319 <= inValid_phase3;
    end
  end
endmodule
