--
-- Generated on 2022-09-11T07:06:31Z. DO NOT EDIT.
--
-- Ranges: {"epic":[2251,3225],"superior":[1976,2250],"uncommon":[601,1975],"common":[200,600]}
--
local _, ns = ...

ns.scoreTiers = {
	[1] = { ["score"] = 3225, ["color"] = { 1.00, 0.50, 0.00 } },		-- |cffff80003225+|r
	[2] = { ["score"] = 3160, ["color"] = { 1.00, 0.49, 0.08 } },		-- |cfffe7e153160+|r
	[3] = { ["score"] = 3135, ["color"] = { 0.99, 0.49, 0.13 } },		-- |cfffd7c213135+|r
	[4] = { ["score"] = 3115, ["color"] = { 0.99, 0.48, 0.16 } },		-- |cfffc7a2a3115+|r
	[5] = { ["score"] = 3090, ["color"] = { 0.98, 0.47, 0.20 } },		-- |cfffb78323090+|r
	[6] = { ["score"] = 3065, ["color"] = { 0.98, 0.46, 0.23 } },		-- |cfff9763a3065+|r
	[7] = { ["score"] = 3040, ["color"] = { 0.97, 0.45, 0.25 } },		-- |cfff874403040+|r
	[8] = { ["score"] = 3015, ["color"] = { 0.97, 0.45, 0.28 } },		-- |cfff772473015+|r
	[9] = { ["score"] = 2995, ["color"] = { 0.96, 0.44, 0.30 } },		-- |cfff6704d2995+|r
	[10] = { ["score"] = 2970, ["color"] = { 0.96, 0.43, 0.33 } },		-- |cfff46e532970+|r
	[11] = { ["score"] = 2945, ["color"] = { 0.95, 0.42, 0.35 } },		-- |cfff36c582945+|r
	[12] = { ["score"] = 2920, ["color"] = { 0.95, 0.42, 0.37 } },		-- |cfff16a5e2920+|r
	[13] = { ["score"] = 2895, ["color"] = { 0.94, 0.41, 0.39 } },		-- |cfff068632895+|r
	[14] = { ["score"] = 2875, ["color"] = { 0.93, 0.40, 0.41 } },		-- |cffee66692875+|r
	[15] = { ["score"] = 2850, ["color"] = { 0.93, 0.39, 0.43 } },		-- |cffed646e2850+|r
	[16] = { ["score"] = 2825, ["color"] = { 0.92, 0.38, 0.45 } },		-- |cffeb62732825+|r
	[17] = { ["score"] = 2800, ["color"] = { 0.91, 0.38, 0.47 } },		-- |cffe960792800+|r
	[18] = { ["score"] = 2775, ["color"] = { 0.91, 0.37, 0.49 } },		-- |cffe85e7e2775+|r
	[19] = { ["score"] = 2755, ["color"] = { 0.90, 0.36, 0.51 } },		-- |cffe65c832755+|r
	[20] = { ["score"] = 2730, ["color"] = { 0.89, 0.35, 0.53 } },		-- |cffe45a882730+|r
	[21] = { ["score"] = 2705, ["color"] = { 0.89, 0.35, 0.55 } },		-- |cffe2588d2705+|r
	[22] = { ["score"] = 2680, ["color"] = { 0.87, 0.34, 0.57 } },		-- |cffdf56922680+|r
	[23] = { ["score"] = 2655, ["color"] = { 0.87, 0.33, 0.59 } },		-- |cffdd54972655+|r
	[24] = { ["score"] = 2635, ["color"] = { 0.86, 0.32, 0.61 } },		-- |cffdb529c2635+|r
	[25] = { ["score"] = 2610, ["color"] = { 0.85, 0.31, 0.63 } },		-- |cffd950a12610+|r
	[26] = { ["score"] = 2585, ["color"] = { 0.84, 0.31, 0.65 } },		-- |cffd64ea62585+|r
	[27] = { ["score"] = 2560, ["color"] = { 0.83, 0.30, 0.67 } },		-- |cffd34cac2560+|r
	[28] = { ["score"] = 2535, ["color"] = { 0.82, 0.29, 0.69 } },		-- |cffd14ab12535+|r
	[29] = { ["score"] = 2515, ["color"] = { 0.81, 0.28, 0.71 } },		-- |cffce48b62515+|r
	[30] = { ["score"] = 2490, ["color"] = { 0.80, 0.27, 0.73 } },		-- |cffcb46bb2490+|r
	[31] = { ["score"] = 2465, ["color"] = { 0.78, 0.27, 0.75 } },		-- |cffc845c02465+|r
	[32] = { ["score"] = 2440, ["color"] = { 0.77, 0.26, 0.77 } },		-- |cffc443c52440+|r
	[33] = { ["score"] = 2415, ["color"] = { 0.76, 0.25, 0.79 } },		-- |cffc141ca2415+|r
	[34] = { ["score"] = 2395, ["color"] = { 0.74, 0.25, 0.81 } },		-- |cffbd3fcf2395+|r
	[35] = { ["score"] = 2370, ["color"] = { 0.73, 0.24, 0.83 } },		-- |cffba3dd42370+|r
	[36] = { ["score"] = 2345, ["color"] = { 0.71, 0.24, 0.85 } },		-- |cffb63cd92345+|r
	[37] = { ["score"] = 2320, ["color"] = { 0.69, 0.23, 0.87 } },		-- |cffb13adf2320+|r
	[38] = { ["score"] = 2295, ["color"] = { 0.68, 0.22, 0.89 } },		-- |cffad38e42295+|r
	[39] = { ["score"] = 2275, ["color"] = { 0.66, 0.22, 0.91 } },		-- |cffa837e92275+|r
	[40] = { ["score"] = 2250, ["color"] = { 0.64, 0.21, 0.93 } },		-- |cffa335ee2250+|r
	[41] = { ["score"] = 2215, ["color"] = { 0.61, 0.24, 0.93 } },		-- |cff9b3eec2215+|r
	[42] = { ["score"] = 2190, ["color"] = { 0.57, 0.27, 0.92 } },		-- |cff9246eb2190+|r
	[43] = { ["score"] = 2165, ["color"] = { 0.54, 0.30, 0.91 } },		-- |cff8a4de92165+|r
	[44] = { ["score"] = 2140, ["color"] = { 0.50, 0.33, 0.91 } },		-- |cff8053e82140+|r
	[45] = { ["score"] = 2120, ["color"] = { 0.46, 0.35, 0.90 } },		-- |cff7658e62120+|r
	[46] = { ["score"] = 2095, ["color"] = { 0.42, 0.36, 0.90 } },		-- |cff6c5de52095+|r
	[47] = { ["score"] = 2070, ["color"] = { 0.38, 0.38, 0.89 } },		-- |cff6062e32070+|r
	[48] = { ["score"] = 2045, ["color"] = { 0.33, 0.40, 0.89 } },		-- |cff5366e22045+|r
	[49] = { ["score"] = 2020, ["color"] = { 0.26, 0.41, 0.88 } },		-- |cff4369e02020+|r
	[50] = { ["score"] = 2000, ["color"] = { 0.18, 0.43, 0.87 } },		-- |cff2e6ddf2000+|r
	[51] = { ["score"] = 1975, ["color"] = { 0.00, 0.44, 0.87 } },		-- |cff0070dd1975+|r
	[52] = { ["score"] = 1895, ["color"] = { 0.09, 0.45, 0.85 } },		-- |cff1672da1895+|r
	[53] = { ["score"] = 1870, ["color"] = { 0.13, 0.46, 0.85 } },		-- |cff2175d81870+|r
	[54] = { ["score"] = 1845, ["color"] = { 0.16, 0.47, 0.84 } },		-- |cff2977d51845+|r
	[55] = { ["score"] = 1825, ["color"] = { 0.19, 0.48, 0.83 } },		-- |cff307ad31825+|r
	[56] = { ["score"] = 1800, ["color"] = { 0.21, 0.49, 0.82 } },		-- |cff367cd01800+|r
	[57] = { ["score"] = 1775, ["color"] = { 0.23, 0.50, 0.80 } },		-- |cff3a7fcd1775+|r
	[58] = { ["score"] = 1750, ["color"] = { 0.25, 0.51, 0.80 } },		-- |cff3f81cb1750+|r
	[59] = { ["score"] = 1725, ["color"] = { 0.26, 0.52, 0.78 } },		-- |cff4284c81725+|r
	[60] = { ["score"] = 1705, ["color"] = { 0.27, 0.53, 0.77 } },		-- |cff4686c51705+|r
	[61] = { ["score"] = 1680, ["color"] = { 0.29, 0.54, 0.76 } },		-- |cff4989c31680+|r
	[62] = { ["score"] = 1655, ["color"] = { 0.29, 0.55, 0.75 } },		-- |cff4b8bc01655+|r
	[63] = { ["score"] = 1630, ["color"] = { 0.31, 0.56, 0.74 } },		-- |cff4e8ebd1630+|r
	[64] = { ["score"] = 1605, ["color"] = { 0.31, 0.56, 0.73 } },		-- |cff5090bb1605+|r
	[65] = { ["score"] = 1585, ["color"] = { 0.32, 0.58, 0.72 } },		-- |cff5293b81585+|r
	[66] = { ["score"] = 1560, ["color"] = { 0.33, 0.59, 0.71 } },		-- |cff5496b51560+|r
	[67] = { ["score"] = 1535, ["color"] = { 0.34, 0.60, 0.70 } },		-- |cff5698b31535+|r
	[68] = { ["score"] = 1510, ["color"] = { 0.34, 0.61, 0.69 } },		-- |cff579bb01510+|r
	[69] = { ["score"] = 1485, ["color"] = { 0.35, 0.62, 0.68 } },		-- |cff599dad1485+|r
	[70] = { ["score"] = 1465, ["color"] = { 0.35, 0.63, 0.67 } },		-- |cff5aa0aa1465+|r
	[71] = { ["score"] = 1440, ["color"] = { 0.36, 0.64, 0.65 } },		-- |cff5ba2a71440+|r
	[72] = { ["score"] = 1415, ["color"] = { 0.36, 0.65, 0.65 } },		-- |cff5ca5a51415+|r
	[73] = { ["score"] = 1390, ["color"] = { 0.36, 0.66, 0.64 } },		-- |cff5da8a21390+|r
	[74] = { ["score"] = 1365, ["color"] = { 0.37, 0.67, 0.62 } },		-- |cff5eaa9f1365+|r
	[75] = { ["score"] = 1345, ["color"] = { 0.37, 0.68, 0.61 } },		-- |cff5ead9c1345+|r
	[76] = { ["score"] = 1320, ["color"] = { 0.37, 0.69, 0.60 } },		-- |cff5faf991320+|r
	[77] = { ["score"] = 1295, ["color"] = { 0.37, 0.70, 0.59 } },		-- |cff5fb2961295+|r
	[78] = { ["score"] = 1270, ["color"] = { 0.37, 0.71, 0.58 } },		-- |cff5fb4931270+|r
	[79] = { ["score"] = 1245, ["color"] = { 0.37, 0.72, 0.56 } },		-- |cff5fb7901245+|r
	[80] = { ["score"] = 1225, ["color"] = { 0.37, 0.73, 0.55 } },		-- |cff5fba8d1225+|r
	[81] = { ["score"] = 1200, ["color"] = { 0.37, 0.74, 0.54 } },		-- |cff5fbc8a1200+|r
	[82] = { ["score"] = 1175, ["color"] = { 0.37, 0.75, 0.53 } },		-- |cff5fbf871175+|r
	[83] = { ["score"] = 1150, ["color"] = { 0.37, 0.76, 0.52 } },		-- |cff5fc2841150+|r
	[84] = { ["score"] = 1125, ["color"] = { 0.37, 0.77, 0.51 } },		-- |cff5ec4811125+|r
	[85] = { ["score"] = 1105, ["color"] = { 0.37, 0.78, 0.49 } },		-- |cff5ec77e1105+|r
	[86] = { ["score"] = 1080, ["color"] = { 0.36, 0.79, 0.48 } },		-- |cff5dc97b1080+|r
	[87] = { ["score"] = 1055, ["color"] = { 0.36, 0.80, 0.47 } },		-- |cff5ccc771055+|r
	[88] = { ["score"] = 1030, ["color"] = { 0.36, 0.81, 0.45 } },		-- |cff5bcf741030+|r
	[89] = { ["score"] = 1005, ["color"] = { 0.35, 0.82, 0.44 } },		-- |cff5ad1701005+|r
	[90] = { ["score"] = 985, ["color"] = { 0.35, 0.83, 0.43 } },		-- |cff59d46d985+|r
	[91] = { ["score"] = 960, ["color"] = { 0.35, 0.84, 0.41 } },		-- |cff58d769960+|r
	[92] = { ["score"] = 935, ["color"] = { 0.34, 0.85, 0.40 } },		-- |cff56d965935+|r
	[93] = { ["score"] = 910, ["color"] = { 0.33, 0.86, 0.38 } },		-- |cff54dc61910+|r
	[94] = { ["score"] = 885, ["color"] = { 0.33, 0.87, 0.36 } },		-- |cff53df5d885+|r
	[95] = { ["score"] = 865, ["color"] = { 0.31, 0.88, 0.35 } },		-- |cff50e159865+|r
	[96] = { ["score"] = 840, ["color"] = { 0.31, 0.89, 0.33 } },		-- |cff4ee455840+|r
	[97] = { ["score"] = 815, ["color"] = { 0.30, 0.91, 0.31 } },		-- |cff4ce750815+|r
	[98] = { ["score"] = 790, ["color"] = { 0.29, 0.91, 0.30 } },		-- |cff49e94c790+|r
	[99] = { ["score"] = 765, ["color"] = { 0.27, 0.93, 0.27 } },		-- |cff46ec46765+|r
	[100] = { ["score"] = 745, ["color"] = { 0.26, 0.94, 0.25 } },		-- |cff42ef41745+|r
	[101] = { ["score"] = 720, ["color"] = { 0.24, 0.95, 0.23 } },		-- |cff3ef13b720+|r
	[102] = { ["score"] = 695, ["color"] = { 0.23, 0.96, 0.20 } },		-- |cff3af434695+|r
	[103] = { ["score"] = 670, ["color"] = { 0.21, 0.97, 0.18 } },		-- |cff35f72d670+|r
	[104] = { ["score"] = 645, ["color"] = { 0.18, 0.98, 0.14 } },		-- |cff2ffa23645+|r
	[105] = { ["score"] = 625, ["color"] = { 0.15, 0.99, 0.09 } },		-- |cff27fc17625+|r
	[106] = { ["score"] = 600, ["color"] = { 0.12, 1.00, 0.00 } },		-- |cff1eff00600+|r
	[107] = { ["score"] = 575, ["color"] = { 0.27, 1.00, 0.18 } },		-- |cff46ff2d575+|r
	[108] = { ["score"] = 550, ["color"] = { 0.37, 1.00, 0.26 } },		-- |cff5eff43550+|r
	[109] = { ["score"] = 525, ["color"] = { 0.44, 1.00, 0.33 } },		-- |cff70ff54525+|r
	[110] = { ["score"] = 500, ["color"] = { 0.50, 1.00, 0.39 } },		-- |cff80ff64500+|r
	[111] = { ["score"] = 475, ["color"] = { 0.56, 1.00, 0.45 } },		-- |cff8eff72475+|r
	[112] = { ["score"] = 450, ["color"] = { 0.61, 1.00, 0.50 } },		-- |cff9bff80450+|r
	[113] = { ["score"] = 425, ["color"] = { 0.66, 1.00, 0.55 } },		-- |cffa8ff8d425+|r
	[114] = { ["score"] = 400, ["color"] = { 0.70, 1.00, 0.61 } },		-- |cffb3ff9b400+|r
	[115] = { ["score"] = 375, ["color"] = { 0.75, 1.00, 0.65 } },		-- |cffbeffa7375+|r
	[116] = { ["score"] = 350, ["color"] = { 0.78, 1.00, 0.71 } },		-- |cffc8ffb4350+|r
	[117] = { ["score"] = 325, ["color"] = { 0.82, 1.00, 0.76 } },		-- |cffd2ffc1325+|r
	[118] = { ["score"] = 300, ["color"] = { 0.86, 1.00, 0.80 } },		-- |cffdbffcd300+|r
	[119] = { ["score"] = 275, ["color"] = { 0.90, 1.00, 0.85 } },		-- |cffe5ffda275+|r
	[120] = { ["score"] = 250, ["color"] = { 0.93, 1.00, 0.90 } },		-- |cffeeffe6250+|r
	[121] = { ["score"] = 225, ["color"] = { 0.96, 1.00, 0.95 } },		-- |cfff6fff3225+|r
	[122] = { ["score"] = 200, ["color"] = { 1.00, 1.00, 1.00 } },		-- |cffffffff200+|r
}

ns.scoreTiersSimple = {
	[1] = { ["score"] = 2200, ["quality"] = 6 },
	[2] = { ["score"] = 1800, ["quality"] = 5 },
	[3] = { ["score"] = 1500, ["quality"] = 4 },
	[4] = { ["score"] = 1000, ["quality"] = 3 },
	[5] = { ["score"] = 0, ["quality"] = 2 }
}
