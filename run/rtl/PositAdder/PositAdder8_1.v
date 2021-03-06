module PositAdder8_1(
  input        clock,
  input        reset,
  input  [7:0] io_A,
  input  [7:0] io_B,
  output [7:0] io_S
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
  wire  aGTb; // @[PositAdder.scala 24:32]
  wire  greaterSign; // @[PositAdder.scala 25:24]
  wire  smallerSign; // @[PositAdder.scala 26:24]
  wire [4:0] greaterExp; // @[PositAdder.scala 27:24]
  wire [4:0] smallerExp; // @[PositAdder.scala 28:24]
  wire [3:0] greaterFrac; // @[PositAdder.scala 29:24]
  wire [3:0] smallerFrac; // @[PositAdder.scala 30:24]
  wire [4:0] _T_179; // @[PositAdder.scala 31:32]
  wire [4:0] scale_diff; // @[PositAdder.scala 31:32]
  wire  _T_180; // @[PositAdder.scala 32:38]
  wire [5:0] greaterSig; // @[Cat.scala 29:58]
  wire  _T_182; // @[PositAdder.scala 33:38]
  wire [8:0] _T_185; // @[Cat.scala 29:58]
  wire [4:0] _T_186; // @[PositAdder.scala 34:68]
  wire  _T_187; // @[Shift.scala 39:24]
  wire [3:0] _T_188; // @[Shift.scala 40:44]
  wire  _T_189; // @[Shift.scala 90:30]
  wire [7:0] _T_190; // @[Shift.scala 90:48]
  wire  _T_191; // @[Shift.scala 90:57]
  wire  _T_192; // @[Shift.scala 90:39]
  wire  _T_193; // @[Shift.scala 12:21]
  wire  _T_194; // @[Shift.scala 12:21]
  wire [7:0] _T_196; // @[Bitwise.scala 71:12]
  wire [8:0] _T_197; // @[Cat.scala 29:58]
  wire [8:0] _T_198; // @[Shift.scala 91:22]
  wire [2:0] _T_199; // @[Shift.scala 92:77]
  wire [4:0] _T_200; // @[Shift.scala 90:30]
  wire [3:0] _T_201; // @[Shift.scala 90:48]
  wire  _T_202; // @[Shift.scala 90:57]
  wire [4:0] _GEN_0; // @[Shift.scala 90:39]
  wire [4:0] _T_203; // @[Shift.scala 90:39]
  wire  _T_204; // @[Shift.scala 12:21]
  wire  _T_205; // @[Shift.scala 12:21]
  wire [3:0] _T_207; // @[Bitwise.scala 71:12]
  wire [8:0] _T_208; // @[Cat.scala 29:58]
  wire [8:0] _T_209; // @[Shift.scala 91:22]
  wire [1:0] _T_210; // @[Shift.scala 92:77]
  wire [6:0] _T_211; // @[Shift.scala 90:30]
  wire [1:0] _T_212; // @[Shift.scala 90:48]
  wire  _T_213; // @[Shift.scala 90:57]
  wire [6:0] _GEN_1; // @[Shift.scala 90:39]
  wire [6:0] _T_214; // @[Shift.scala 90:39]
  wire  _T_215; // @[Shift.scala 12:21]
  wire  _T_216; // @[Shift.scala 12:21]
  wire [1:0] _T_218; // @[Bitwise.scala 71:12]
  wire [8:0] _T_219; // @[Cat.scala 29:58]
  wire [8:0] _T_220; // @[Shift.scala 91:22]
  wire  _T_221; // @[Shift.scala 92:77]
  wire [7:0] _T_222; // @[Shift.scala 90:30]
  wire  _T_223; // @[Shift.scala 90:48]
  wire [7:0] _GEN_2; // @[Shift.scala 90:39]
  wire [7:0] _T_225; // @[Shift.scala 90:39]
  wire  _T_227; // @[Shift.scala 12:21]
  wire [8:0] _T_228; // @[Cat.scala 29:58]
  wire [8:0] _T_229; // @[Shift.scala 91:22]
  wire [8:0] _T_232; // @[Bitwise.scala 71:12]
  wire [8:0] smallerSig; // @[Shift.scala 39:10]
  wire [5:0] _T_233; // @[PositAdder.scala 35:45]
  wire [6:0] rawSumSig; // @[PositAdder.scala 35:32]
  wire  _T_234; // @[PositAdder.scala 36:31]
  wire  _T_235; // @[PositAdder.scala 36:59]
  wire  sumSign; // @[PositAdder.scala 36:43]
  wire [5:0] _T_236; // @[PositAdder.scala 37:48]
  wire [2:0] _T_237; // @[PositAdder.scala 37:63]
  wire [9:0] signSumSig; // @[Cat.scala 29:58]
  wire [8:0] _T_239; // @[PositAdder.scala 39:31]
  wire [8:0] _T_240; // @[PositAdder.scala 39:66]
  wire [8:0] sumXor; // @[PositAdder.scala 39:49]
  wire [7:0] _T_241; // @[LZD.scala 43:32]
  wire [3:0] _T_242; // @[LZD.scala 43:32]
  wire [1:0] _T_243; // @[LZD.scala 43:32]
  wire  _T_244; // @[LZD.scala 39:14]
  wire  _T_245; // @[LZD.scala 39:21]
  wire  _T_246; // @[LZD.scala 39:30]
  wire  _T_247; // @[LZD.scala 39:27]
  wire  _T_248; // @[LZD.scala 39:25]
  wire [1:0] _T_249; // @[Cat.scala 29:58]
  wire [1:0] _T_250; // @[LZD.scala 44:32]
  wire  _T_251; // @[LZD.scala 39:14]
  wire  _T_252; // @[LZD.scala 39:21]
  wire  _T_253; // @[LZD.scala 39:30]
  wire  _T_254; // @[LZD.scala 39:27]
  wire  _T_255; // @[LZD.scala 39:25]
  wire [1:0] _T_256; // @[Cat.scala 29:58]
  wire  _T_257; // @[Shift.scala 12:21]
  wire  _T_258; // @[Shift.scala 12:21]
  wire  _T_259; // @[LZD.scala 49:16]
  wire  _T_260; // @[LZD.scala 49:27]
  wire  _T_261; // @[LZD.scala 49:25]
  wire  _T_262; // @[LZD.scala 49:47]
  wire  _T_263; // @[LZD.scala 49:59]
  wire  _T_264; // @[LZD.scala 49:35]
  wire [2:0] _T_266; // @[Cat.scala 29:58]
  wire [3:0] _T_267; // @[LZD.scala 44:32]
  wire [1:0] _T_268; // @[LZD.scala 43:32]
  wire  _T_269; // @[LZD.scala 39:14]
  wire  _T_270; // @[LZD.scala 39:21]
  wire  _T_271; // @[LZD.scala 39:30]
  wire  _T_272; // @[LZD.scala 39:27]
  wire  _T_273; // @[LZD.scala 39:25]
  wire [1:0] _T_274; // @[Cat.scala 29:58]
  wire [1:0] _T_275; // @[LZD.scala 44:32]
  wire  _T_276; // @[LZD.scala 39:14]
  wire  _T_277; // @[LZD.scala 39:21]
  wire  _T_278; // @[LZD.scala 39:30]
  wire  _T_279; // @[LZD.scala 39:27]
  wire  _T_280; // @[LZD.scala 39:25]
  wire [1:0] _T_281; // @[Cat.scala 29:58]
  wire  _T_282; // @[Shift.scala 12:21]
  wire  _T_283; // @[Shift.scala 12:21]
  wire  _T_284; // @[LZD.scala 49:16]
  wire  _T_285; // @[LZD.scala 49:27]
  wire  _T_286; // @[LZD.scala 49:25]
  wire  _T_287; // @[LZD.scala 49:47]
  wire  _T_288; // @[LZD.scala 49:59]
  wire  _T_289; // @[LZD.scala 49:35]
  wire [2:0] _T_291; // @[Cat.scala 29:58]
  wire  _T_292; // @[Shift.scala 12:21]
  wire  _T_293; // @[Shift.scala 12:21]
  wire  _T_294; // @[LZD.scala 49:16]
  wire  _T_295; // @[LZD.scala 49:27]
  wire  _T_296; // @[LZD.scala 49:25]
  wire [1:0] _T_297; // @[LZD.scala 49:47]
  wire [1:0] _T_298; // @[LZD.scala 49:59]
  wire [1:0] _T_299; // @[LZD.scala 49:35]
  wire [3:0] _T_301; // @[Cat.scala 29:58]
  wire  _T_302; // @[LZD.scala 44:32]
  wire  _T_304; // @[Shift.scala 12:21]
  wire [2:0] _T_307; // @[Cat.scala 29:58]
  wire [2:0] _T_308; // @[LZD.scala 55:32]
  wire [2:0] _T_309; // @[LZD.scala 55:20]
  wire [3:0] sumLZD; // @[Cat.scala 29:58]
  wire [4:0] _T_310; // @[Cat.scala 29:58]
  wire [4:0] _T_311; // @[PositAdder.scala 41:38]
  wire [4:0] _T_313; // @[PositAdder.scala 41:45]
  wire [4:0] scaleBias; // @[PositAdder.scala 41:45]
  wire [5:0] sumScale; // @[PositAdder.scala 42:32]
  wire  overflow; // @[PositAdder.scala 43:30]
  wire [3:0] normalShift; // @[PositAdder.scala 44:22]
  wire [7:0] _T_314; // @[PositAdder.scala 45:36]
  wire  _T_315; // @[Shift.scala 16:24]
  wire [2:0] _T_316; // @[Shift.scala 17:37]
  wire  _T_317; // @[Shift.scala 12:21]
  wire [3:0] _T_318; // @[Shift.scala 64:52]
  wire [7:0] _T_320; // @[Cat.scala 29:58]
  wire [7:0] _T_321; // @[Shift.scala 64:27]
  wire [1:0] _T_322; // @[Shift.scala 66:70]
  wire  _T_323; // @[Shift.scala 12:21]
  wire [5:0] _T_324; // @[Shift.scala 64:52]
  wire [7:0] _T_326; // @[Cat.scala 29:58]
  wire [7:0] _T_327; // @[Shift.scala 64:27]
  wire  _T_328; // @[Shift.scala 66:70]
  wire [6:0] _T_330; // @[Shift.scala 64:52]
  wire [7:0] _T_331; // @[Cat.scala 29:58]
  wire [7:0] _T_332; // @[Shift.scala 64:27]
  wire [7:0] shiftSig; // @[Shift.scala 16:10]
  wire [5:0] _T_333; // @[PositAdder.scala 50:24]
  wire [3:0] decS_fraction; // @[PositAdder.scala 51:34]
  wire  decS_isNaR; // @[PositAdder.scala 52:32]
  wire  _T_336; // @[PositAdder.scala 53:33]
  wire  _T_337; // @[PositAdder.scala 53:21]
  wire  _T_338; // @[PositAdder.scala 53:52]
  wire  decS_isZero; // @[PositAdder.scala 53:37]
  wire [1:0] _T_340; // @[PositAdder.scala 54:33]
  wire  _T_341; // @[PositAdder.scala 54:49]
  wire  _T_342; // @[PositAdder.scala 54:63]
  wire  _T_343; // @[PositAdder.scala 54:53]
  wire [4:0] _GEN_3; // @[PositAdder.scala 47:25 PositAdder.scala 50:18]
  wire [4:0] decS_scale; // @[PositAdder.scala 47:25 PositAdder.scala 50:18]
  wire  _T_346; // @[convert.scala 46:61]
  wire  _T_347; // @[convert.scala 46:52]
  wire  _T_349; // @[convert.scala 46:42]
  wire [3:0] _T_350; // @[convert.scala 48:34]
  wire  _T_351; // @[convert.scala 49:36]
  wire [3:0] _T_353; // @[convert.scala 50:36]
  wire [3:0] _T_354; // @[convert.scala 50:36]
  wire [3:0] _T_355; // @[convert.scala 50:28]
  wire  _T_356; // @[convert.scala 51:31]
  wire  _T_357; // @[convert.scala 52:43]
  wire [9:0] _T_361; // @[Cat.scala 29:58]
  wire [3:0] _T_362; // @[Shift.scala 39:17]
  wire  _T_363; // @[Shift.scala 39:24]
  wire [1:0] _T_365; // @[Shift.scala 90:30]
  wire [7:0] _T_366; // @[Shift.scala 90:48]
  wire  _T_367; // @[Shift.scala 90:57]
  wire [1:0] _GEN_4; // @[Shift.scala 90:39]
  wire [1:0] _T_368; // @[Shift.scala 90:39]
  wire  _T_369; // @[Shift.scala 12:21]
  wire  _T_370; // @[Shift.scala 12:21]
  wire [7:0] _T_372; // @[Bitwise.scala 71:12]
  wire [9:0] _T_373; // @[Cat.scala 29:58]
  wire [9:0] _T_374; // @[Shift.scala 91:22]
  wire [2:0] _T_375; // @[Shift.scala 92:77]
  wire [5:0] _T_376; // @[Shift.scala 90:30]
  wire [3:0] _T_377; // @[Shift.scala 90:48]
  wire  _T_378; // @[Shift.scala 90:57]
  wire [5:0] _GEN_5; // @[Shift.scala 90:39]
  wire [5:0] _T_379; // @[Shift.scala 90:39]
  wire  _T_380; // @[Shift.scala 12:21]
  wire  _T_381; // @[Shift.scala 12:21]
  wire [3:0] _T_383; // @[Bitwise.scala 71:12]
  wire [9:0] _T_384; // @[Cat.scala 29:58]
  wire [9:0] _T_385; // @[Shift.scala 91:22]
  wire [1:0] _T_386; // @[Shift.scala 92:77]
  wire [7:0] _T_387; // @[Shift.scala 90:30]
  wire [1:0] _T_388; // @[Shift.scala 90:48]
  wire  _T_389; // @[Shift.scala 90:57]
  wire [7:0] _GEN_6; // @[Shift.scala 90:39]
  wire [7:0] _T_390; // @[Shift.scala 90:39]
  wire  _T_391; // @[Shift.scala 12:21]
  wire  _T_392; // @[Shift.scala 12:21]
  wire [1:0] _T_394; // @[Bitwise.scala 71:12]
  wire [9:0] _T_395; // @[Cat.scala 29:58]
  wire [9:0] _T_396; // @[Shift.scala 91:22]
  wire  _T_397; // @[Shift.scala 92:77]
  wire [8:0] _T_398; // @[Shift.scala 90:30]
  wire  _T_399; // @[Shift.scala 90:48]
  wire [8:0] _GEN_7; // @[Shift.scala 90:39]
  wire [8:0] _T_401; // @[Shift.scala 90:39]
  wire  _T_403; // @[Shift.scala 12:21]
  wire [9:0] _T_404; // @[Cat.scala 29:58]
  wire [9:0] _T_405; // @[Shift.scala 91:22]
  wire [9:0] _T_408; // @[Bitwise.scala 71:12]
  wire [9:0] _T_409; // @[Shift.scala 39:10]
  wire  _T_410; // @[convert.scala 55:31]
  wire  _T_411; // @[convert.scala 56:31]
  wire  _T_412; // @[convert.scala 57:31]
  wire  _T_413; // @[convert.scala 58:31]
  wire [6:0] _T_414; // @[convert.scala 59:69]
  wire  _T_415; // @[convert.scala 59:81]
  wire  _T_416; // @[convert.scala 59:50]
  wire  _T_418; // @[convert.scala 60:81]
  wire  _T_419; // @[convert.scala 61:44]
  wire  _T_420; // @[convert.scala 61:52]
  wire  _T_421; // @[convert.scala 61:36]
  wire  _T_422; // @[convert.scala 62:63]
  wire  _T_423; // @[convert.scala 62:103]
  wire  _T_424; // @[convert.scala 62:60]
  wire [6:0] _GEN_8; // @[convert.scala 63:56]
  wire [6:0] _T_427; // @[convert.scala 63:56]
  wire [7:0] _T_428; // @[Cat.scala 29:58]
  wire [7:0] _T_430; // @[Mux.scala 87:16]
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
  assign aGTb = $signed(decA_scale) > $signed(decB_scale); // @[PositAdder.scala 24:32]
  assign greaterSign = aGTb ? _T_1 : _T_90; // @[PositAdder.scala 25:24]
  assign smallerSign = aGTb ? _T_90 : _T_1; // @[PositAdder.scala 26:24]
  assign greaterExp = aGTb ? $signed(decA_scale) : $signed(decB_scale); // @[PositAdder.scala 27:24]
  assign smallerExp = aGTb ? $signed(decB_scale) : $signed(decA_scale); // @[PositAdder.scala 28:24]
  assign greaterFrac = aGTb ? decA_fraction : decB_fraction; // @[PositAdder.scala 29:24]
  assign smallerFrac = aGTb ? decB_fraction : decA_fraction; // @[PositAdder.scala 30:24]
  assign _T_179 = $signed(greaterExp) - $signed(smallerExp); // @[PositAdder.scala 31:32]
  assign scale_diff = $signed(_T_179); // @[PositAdder.scala 31:32]
  assign _T_180 = ~ greaterSign; // @[PositAdder.scala 32:38]
  assign greaterSig = {greaterSign,_T_180,greaterFrac}; // @[Cat.scala 29:58]
  assign _T_182 = ~ smallerSign; // @[PositAdder.scala 33:38]
  assign _T_185 = {smallerSign,_T_182,smallerFrac,3'h0}; // @[Cat.scala 29:58]
  assign _T_186 = $unsigned(scale_diff); // @[PositAdder.scala 34:68]
  assign _T_187 = _T_186 < 5'h9; // @[Shift.scala 39:24]
  assign _T_188 = _T_186[3:0]; // @[Shift.scala 40:44]
  assign _T_189 = _T_185[8:8]; // @[Shift.scala 90:30]
  assign _T_190 = _T_185[7:0]; // @[Shift.scala 90:48]
  assign _T_191 = _T_190 != 8'h0; // @[Shift.scala 90:57]
  assign _T_192 = _T_189 | _T_191; // @[Shift.scala 90:39]
  assign _T_193 = _T_188[3]; // @[Shift.scala 12:21]
  assign _T_194 = _T_185[8]; // @[Shift.scala 12:21]
  assign _T_196 = _T_194 ? 8'hff : 8'h0; // @[Bitwise.scala 71:12]
  assign _T_197 = {_T_196,_T_192}; // @[Cat.scala 29:58]
  assign _T_198 = _T_193 ? _T_197 : _T_185; // @[Shift.scala 91:22]
  assign _T_199 = _T_188[2:0]; // @[Shift.scala 92:77]
  assign _T_200 = _T_198[8:4]; // @[Shift.scala 90:30]
  assign _T_201 = _T_198[3:0]; // @[Shift.scala 90:48]
  assign _T_202 = _T_201 != 4'h0; // @[Shift.scala 90:57]
  assign _GEN_0 = {{4'd0}, _T_202}; // @[Shift.scala 90:39]
  assign _T_203 = _T_200 | _GEN_0; // @[Shift.scala 90:39]
  assign _T_204 = _T_199[2]; // @[Shift.scala 12:21]
  assign _T_205 = _T_198[8]; // @[Shift.scala 12:21]
  assign _T_207 = _T_205 ? 4'hf : 4'h0; // @[Bitwise.scala 71:12]
  assign _T_208 = {_T_207,_T_203}; // @[Cat.scala 29:58]
  assign _T_209 = _T_204 ? _T_208 : _T_198; // @[Shift.scala 91:22]
  assign _T_210 = _T_199[1:0]; // @[Shift.scala 92:77]
  assign _T_211 = _T_209[8:2]; // @[Shift.scala 90:30]
  assign _T_212 = _T_209[1:0]; // @[Shift.scala 90:48]
  assign _T_213 = _T_212 != 2'h0; // @[Shift.scala 90:57]
  assign _GEN_1 = {{6'd0}, _T_213}; // @[Shift.scala 90:39]
  assign _T_214 = _T_211 | _GEN_1; // @[Shift.scala 90:39]
  assign _T_215 = _T_210[1]; // @[Shift.scala 12:21]
  assign _T_216 = _T_209[8]; // @[Shift.scala 12:21]
  assign _T_218 = _T_216 ? 2'h3 : 2'h0; // @[Bitwise.scala 71:12]
  assign _T_219 = {_T_218,_T_214}; // @[Cat.scala 29:58]
  assign _T_220 = _T_215 ? _T_219 : _T_209; // @[Shift.scala 91:22]
  assign _T_221 = _T_210[0:0]; // @[Shift.scala 92:77]
  assign _T_222 = _T_220[8:1]; // @[Shift.scala 90:30]
  assign _T_223 = _T_220[0:0]; // @[Shift.scala 90:48]
  assign _GEN_2 = {{7'd0}, _T_223}; // @[Shift.scala 90:39]
  assign _T_225 = _T_222 | _GEN_2; // @[Shift.scala 90:39]
  assign _T_227 = _T_220[8]; // @[Shift.scala 12:21]
  assign _T_228 = {_T_227,_T_225}; // @[Cat.scala 29:58]
  assign _T_229 = _T_221 ? _T_228 : _T_220; // @[Shift.scala 91:22]
  assign _T_232 = _T_194 ? 9'h1ff : 9'h0; // @[Bitwise.scala 71:12]
  assign smallerSig = _T_187 ? _T_229 : _T_232; // @[Shift.scala 39:10]
  assign _T_233 = smallerSig[8:3]; // @[PositAdder.scala 35:45]
  assign rawSumSig = greaterSig + _T_233; // @[PositAdder.scala 35:32]
  assign _T_234 = _T_1 ^ _T_90; // @[PositAdder.scala 36:31]
  assign _T_235 = rawSumSig[6:6]; // @[PositAdder.scala 36:59]
  assign sumSign = _T_234 ^ _T_235; // @[PositAdder.scala 36:43]
  assign _T_236 = greaterSig + _T_233; // @[PositAdder.scala 37:48]
  assign _T_237 = smallerSig[2:0]; // @[PositAdder.scala 37:63]
  assign signSumSig = {sumSign,_T_236,_T_237}; // @[Cat.scala 29:58]
  assign _T_239 = signSumSig[9:1]; // @[PositAdder.scala 39:31]
  assign _T_240 = signSumSig[8:0]; // @[PositAdder.scala 39:66]
  assign sumXor = _T_239 ^ _T_240; // @[PositAdder.scala 39:49]
  assign _T_241 = sumXor[8:1]; // @[LZD.scala 43:32]
  assign _T_242 = _T_241[7:4]; // @[LZD.scala 43:32]
  assign _T_243 = _T_242[3:2]; // @[LZD.scala 43:32]
  assign _T_244 = _T_243 != 2'h0; // @[LZD.scala 39:14]
  assign _T_245 = _T_243[1]; // @[LZD.scala 39:21]
  assign _T_246 = _T_243[0]; // @[LZD.scala 39:30]
  assign _T_247 = ~ _T_246; // @[LZD.scala 39:27]
  assign _T_248 = _T_245 | _T_247; // @[LZD.scala 39:25]
  assign _T_249 = {_T_244,_T_248}; // @[Cat.scala 29:58]
  assign _T_250 = _T_242[1:0]; // @[LZD.scala 44:32]
  assign _T_251 = _T_250 != 2'h0; // @[LZD.scala 39:14]
  assign _T_252 = _T_250[1]; // @[LZD.scala 39:21]
  assign _T_253 = _T_250[0]; // @[LZD.scala 39:30]
  assign _T_254 = ~ _T_253; // @[LZD.scala 39:27]
  assign _T_255 = _T_252 | _T_254; // @[LZD.scala 39:25]
  assign _T_256 = {_T_251,_T_255}; // @[Cat.scala 29:58]
  assign _T_257 = _T_249[1]; // @[Shift.scala 12:21]
  assign _T_258 = _T_256[1]; // @[Shift.scala 12:21]
  assign _T_259 = _T_257 | _T_258; // @[LZD.scala 49:16]
  assign _T_260 = ~ _T_258; // @[LZD.scala 49:27]
  assign _T_261 = _T_257 | _T_260; // @[LZD.scala 49:25]
  assign _T_262 = _T_249[0:0]; // @[LZD.scala 49:47]
  assign _T_263 = _T_256[0:0]; // @[LZD.scala 49:59]
  assign _T_264 = _T_257 ? _T_262 : _T_263; // @[LZD.scala 49:35]
  assign _T_266 = {_T_259,_T_261,_T_264}; // @[Cat.scala 29:58]
  assign _T_267 = _T_241[3:0]; // @[LZD.scala 44:32]
  assign _T_268 = _T_267[3:2]; // @[LZD.scala 43:32]
  assign _T_269 = _T_268 != 2'h0; // @[LZD.scala 39:14]
  assign _T_270 = _T_268[1]; // @[LZD.scala 39:21]
  assign _T_271 = _T_268[0]; // @[LZD.scala 39:30]
  assign _T_272 = ~ _T_271; // @[LZD.scala 39:27]
  assign _T_273 = _T_270 | _T_272; // @[LZD.scala 39:25]
  assign _T_274 = {_T_269,_T_273}; // @[Cat.scala 29:58]
  assign _T_275 = _T_267[1:0]; // @[LZD.scala 44:32]
  assign _T_276 = _T_275 != 2'h0; // @[LZD.scala 39:14]
  assign _T_277 = _T_275[1]; // @[LZD.scala 39:21]
  assign _T_278 = _T_275[0]; // @[LZD.scala 39:30]
  assign _T_279 = ~ _T_278; // @[LZD.scala 39:27]
  assign _T_280 = _T_277 | _T_279; // @[LZD.scala 39:25]
  assign _T_281 = {_T_276,_T_280}; // @[Cat.scala 29:58]
  assign _T_282 = _T_274[1]; // @[Shift.scala 12:21]
  assign _T_283 = _T_281[1]; // @[Shift.scala 12:21]
  assign _T_284 = _T_282 | _T_283; // @[LZD.scala 49:16]
  assign _T_285 = ~ _T_283; // @[LZD.scala 49:27]
  assign _T_286 = _T_282 | _T_285; // @[LZD.scala 49:25]
  assign _T_287 = _T_274[0:0]; // @[LZD.scala 49:47]
  assign _T_288 = _T_281[0:0]; // @[LZD.scala 49:59]
  assign _T_289 = _T_282 ? _T_287 : _T_288; // @[LZD.scala 49:35]
  assign _T_291 = {_T_284,_T_286,_T_289}; // @[Cat.scala 29:58]
  assign _T_292 = _T_266[2]; // @[Shift.scala 12:21]
  assign _T_293 = _T_291[2]; // @[Shift.scala 12:21]
  assign _T_294 = _T_292 | _T_293; // @[LZD.scala 49:16]
  assign _T_295 = ~ _T_293; // @[LZD.scala 49:27]
  assign _T_296 = _T_292 | _T_295; // @[LZD.scala 49:25]
  assign _T_297 = _T_266[1:0]; // @[LZD.scala 49:47]
  assign _T_298 = _T_291[1:0]; // @[LZD.scala 49:59]
  assign _T_299 = _T_292 ? _T_297 : _T_298; // @[LZD.scala 49:35]
  assign _T_301 = {_T_294,_T_296,_T_299}; // @[Cat.scala 29:58]
  assign _T_302 = sumXor[0:0]; // @[LZD.scala 44:32]
  assign _T_304 = _T_301[3]; // @[Shift.scala 12:21]
  assign _T_307 = {2'h3,_T_302}; // @[Cat.scala 29:58]
  assign _T_308 = _T_301[2:0]; // @[LZD.scala 55:32]
  assign _T_309 = _T_304 ? _T_308 : _T_307; // @[LZD.scala 55:20]
  assign sumLZD = {_T_304,_T_309}; // @[Cat.scala 29:58]
  assign _T_310 = {1'h1,_T_304,_T_309}; // @[Cat.scala 29:58]
  assign _T_311 = $signed(_T_310); // @[PositAdder.scala 41:38]
  assign _T_313 = $signed(_T_311) + $signed(5'sh2); // @[PositAdder.scala 41:45]
  assign scaleBias = $signed(_T_313); // @[PositAdder.scala 41:45]
  assign sumScale = $signed(greaterExp) + $signed(scaleBias); // @[PositAdder.scala 42:32]
  assign overflow = $signed(sumScale) > $signed(6'shc); // @[PositAdder.scala 43:30]
  assign normalShift = ~ sumLZD; // @[PositAdder.scala 44:22]
  assign _T_314 = signSumSig[7:0]; // @[PositAdder.scala 45:36]
  assign _T_315 = normalShift < 4'h8; // @[Shift.scala 16:24]
  assign _T_316 = normalShift[2:0]; // @[Shift.scala 17:37]
  assign _T_317 = _T_316[2]; // @[Shift.scala 12:21]
  assign _T_318 = _T_314[3:0]; // @[Shift.scala 64:52]
  assign _T_320 = {_T_318,4'h0}; // @[Cat.scala 29:58]
  assign _T_321 = _T_317 ? _T_320 : _T_314; // @[Shift.scala 64:27]
  assign _T_322 = _T_316[1:0]; // @[Shift.scala 66:70]
  assign _T_323 = _T_322[1]; // @[Shift.scala 12:21]
  assign _T_324 = _T_321[5:0]; // @[Shift.scala 64:52]
  assign _T_326 = {_T_324,2'h0}; // @[Cat.scala 29:58]
  assign _T_327 = _T_323 ? _T_326 : _T_321; // @[Shift.scala 64:27]
  assign _T_328 = _T_322[0:0]; // @[Shift.scala 66:70]
  assign _T_330 = _T_327[6:0]; // @[Shift.scala 64:52]
  assign _T_331 = {_T_330,1'h0}; // @[Cat.scala 29:58]
  assign _T_332 = _T_328 ? _T_331 : _T_327; // @[Shift.scala 64:27]
  assign shiftSig = _T_315 ? _T_332 : 8'h0; // @[Shift.scala 16:10]
  assign _T_333 = overflow ? $signed(6'shc) : $signed(sumScale); // @[PositAdder.scala 50:24]
  assign decS_fraction = shiftSig[7:4]; // @[PositAdder.scala 51:34]
  assign decS_isNaR = decA_isNaR | decB_isNaR; // @[PositAdder.scala 52:32]
  assign _T_336 = signSumSig != 10'h0; // @[PositAdder.scala 53:33]
  assign _T_337 = ~ _T_336; // @[PositAdder.scala 53:21]
  assign _T_338 = decA_isZero & decB_isZero; // @[PositAdder.scala 53:52]
  assign decS_isZero = _T_337 | _T_338; // @[PositAdder.scala 53:37]
  assign _T_340 = shiftSig[3:2]; // @[PositAdder.scala 54:33]
  assign _T_341 = shiftSig[1]; // @[PositAdder.scala 54:49]
  assign _T_342 = shiftSig[0]; // @[PositAdder.scala 54:63]
  assign _T_343 = _T_341 | _T_342; // @[PositAdder.scala 54:53]
  assign _GEN_3 = _T_333[4:0]; // @[PositAdder.scala 47:25 PositAdder.scala 50:18]
  assign decS_scale = $signed(_GEN_3); // @[PositAdder.scala 47:25 PositAdder.scala 50:18]
  assign _T_346 = decS_scale[0]; // @[convert.scala 46:61]
  assign _T_347 = ~ _T_346; // @[convert.scala 46:52]
  assign _T_349 = sumSign ? _T_347 : _T_346; // @[convert.scala 46:42]
  assign _T_350 = decS_scale[4:1]; // @[convert.scala 48:34]
  assign _T_351 = _T_350[3:3]; // @[convert.scala 49:36]
  assign _T_353 = ~ _T_350; // @[convert.scala 50:36]
  assign _T_354 = $signed(_T_353); // @[convert.scala 50:36]
  assign _T_355 = _T_351 ? $signed(_T_354) : $signed(_T_350); // @[convert.scala 50:28]
  assign _T_356 = _T_351 ^ sumSign; // @[convert.scala 51:31]
  assign _T_357 = ~ _T_356; // @[convert.scala 52:43]
  assign _T_361 = {_T_357,_T_356,_T_349,decS_fraction,_T_340,_T_343}; // @[Cat.scala 29:58]
  assign _T_362 = $unsigned(_T_355); // @[Shift.scala 39:17]
  assign _T_363 = _T_362 < 4'ha; // @[Shift.scala 39:24]
  assign _T_365 = _T_361[9:8]; // @[Shift.scala 90:30]
  assign _T_366 = _T_361[7:0]; // @[Shift.scala 90:48]
  assign _T_367 = _T_366 != 8'h0; // @[Shift.scala 90:57]
  assign _GEN_4 = {{1'd0}, _T_367}; // @[Shift.scala 90:39]
  assign _T_368 = _T_365 | _GEN_4; // @[Shift.scala 90:39]
  assign _T_369 = _T_362[3]; // @[Shift.scala 12:21]
  assign _T_370 = _T_361[9]; // @[Shift.scala 12:21]
  assign _T_372 = _T_370 ? 8'hff : 8'h0; // @[Bitwise.scala 71:12]
  assign _T_373 = {_T_372,_T_368}; // @[Cat.scala 29:58]
  assign _T_374 = _T_369 ? _T_373 : _T_361; // @[Shift.scala 91:22]
  assign _T_375 = _T_362[2:0]; // @[Shift.scala 92:77]
  assign _T_376 = _T_374[9:4]; // @[Shift.scala 90:30]
  assign _T_377 = _T_374[3:0]; // @[Shift.scala 90:48]
  assign _T_378 = _T_377 != 4'h0; // @[Shift.scala 90:57]
  assign _GEN_5 = {{5'd0}, _T_378}; // @[Shift.scala 90:39]
  assign _T_379 = _T_376 | _GEN_5; // @[Shift.scala 90:39]
  assign _T_380 = _T_375[2]; // @[Shift.scala 12:21]
  assign _T_381 = _T_374[9]; // @[Shift.scala 12:21]
  assign _T_383 = _T_381 ? 4'hf : 4'h0; // @[Bitwise.scala 71:12]
  assign _T_384 = {_T_383,_T_379}; // @[Cat.scala 29:58]
  assign _T_385 = _T_380 ? _T_384 : _T_374; // @[Shift.scala 91:22]
  assign _T_386 = _T_375[1:0]; // @[Shift.scala 92:77]
  assign _T_387 = _T_385[9:2]; // @[Shift.scala 90:30]
  assign _T_388 = _T_385[1:0]; // @[Shift.scala 90:48]
  assign _T_389 = _T_388 != 2'h0; // @[Shift.scala 90:57]
  assign _GEN_6 = {{7'd0}, _T_389}; // @[Shift.scala 90:39]
  assign _T_390 = _T_387 | _GEN_6; // @[Shift.scala 90:39]
  assign _T_391 = _T_386[1]; // @[Shift.scala 12:21]
  assign _T_392 = _T_385[9]; // @[Shift.scala 12:21]
  assign _T_394 = _T_392 ? 2'h3 : 2'h0; // @[Bitwise.scala 71:12]
  assign _T_395 = {_T_394,_T_390}; // @[Cat.scala 29:58]
  assign _T_396 = _T_391 ? _T_395 : _T_385; // @[Shift.scala 91:22]
  assign _T_397 = _T_386[0:0]; // @[Shift.scala 92:77]
  assign _T_398 = _T_396[9:1]; // @[Shift.scala 90:30]
  assign _T_399 = _T_396[0:0]; // @[Shift.scala 90:48]
  assign _GEN_7 = {{8'd0}, _T_399}; // @[Shift.scala 90:39]
  assign _T_401 = _T_398 | _GEN_7; // @[Shift.scala 90:39]
  assign _T_403 = _T_396[9]; // @[Shift.scala 12:21]
  assign _T_404 = {_T_403,_T_401}; // @[Cat.scala 29:58]
  assign _T_405 = _T_397 ? _T_404 : _T_396; // @[Shift.scala 91:22]
  assign _T_408 = _T_370 ? 10'h3ff : 10'h0; // @[Bitwise.scala 71:12]
  assign _T_409 = _T_363 ? _T_405 : _T_408; // @[Shift.scala 39:10]
  assign _T_410 = _T_409[3]; // @[convert.scala 55:31]
  assign _T_411 = _T_409[2]; // @[convert.scala 56:31]
  assign _T_412 = _T_409[1]; // @[convert.scala 57:31]
  assign _T_413 = _T_409[0]; // @[convert.scala 58:31]
  assign _T_414 = _T_409[9:3]; // @[convert.scala 59:69]
  assign _T_415 = _T_414 != 7'h0; // @[convert.scala 59:81]
  assign _T_416 = ~ _T_415; // @[convert.scala 59:50]
  assign _T_418 = _T_414 == 7'h7f; // @[convert.scala 60:81]
  assign _T_419 = _T_410 | _T_412; // @[convert.scala 61:44]
  assign _T_420 = _T_419 | _T_413; // @[convert.scala 61:52]
  assign _T_421 = _T_411 & _T_420; // @[convert.scala 61:36]
  assign _T_422 = ~ _T_418; // @[convert.scala 62:63]
  assign _T_423 = _T_422 & _T_421; // @[convert.scala 62:103]
  assign _T_424 = _T_416 | _T_423; // @[convert.scala 62:60]
  assign _GEN_8 = {{6'd0}, _T_424}; // @[convert.scala 63:56]
  assign _T_427 = _T_414 + _GEN_8; // @[convert.scala 63:56]
  assign _T_428 = {sumSign,_T_427}; // @[Cat.scala 29:58]
  assign _T_430 = decS_isZero ? 8'h0 : _T_428; // @[Mux.scala 87:16]
  assign io_S = decS_isNaR ? 8'h80 : _T_430; // @[PositAdder.scala 56:8]
endmodule
