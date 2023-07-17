--
-- Generated on 2023-07-17T09:14:46Z. DO NOT EDIT.
--
-- Ranges: {"epic":[2626,3550],"superior":[2226,2625],"uncommon":[851,2225],"common":[200,850]}
--
local _, ns = ...

ns.scoreTiers = {
	[1] = { ["score"] = 3550, ["color"] = { 1.00, 0.50, 0.00 } },		-- |cffff80003550+|r
	[2] = { ["score"] = 3490, ["color"] = { 1.00, 0.49, 0.08 } },		-- |cfffe7e153490+|r
	[3] = { ["score"] = 3465, ["color"] = { 0.99, 0.49, 0.13 } },		-- |cfffd7c223465+|r
	[4] = { ["score"] = 3440, ["color"] = { 0.99, 0.48, 0.17 } },		-- |cfffc7a2c3440+|r
	[5] = { ["score"] = 3415, ["color"] = { 0.98, 0.47, 0.20 } },		-- |cfffa78343415+|r
	[6] = { ["score"] = 3390, ["color"] = { 0.98, 0.46, 0.24 } },		-- |cfff9753c3390+|r
	[7] = { ["score"] = 3370, ["color"] = { 0.97, 0.45, 0.26 } },		-- |cfff873423370+|r
	[8] = { ["score"] = 3345, ["color"] = { 0.97, 0.44, 0.29 } },		-- |cfff771493345+|r
	[9] = { ["score"] = 3320, ["color"] = { 0.96, 0.44, 0.31 } },		-- |cfff56f4f3320+|r
	[10] = { ["score"] = 3295, ["color"] = { 0.96, 0.43, 0.33 } },		-- |cfff46d553295+|r
	[11] = { ["score"] = 3270, ["color"] = { 0.95, 0.42, 0.36 } },		-- |cfff26b5b3270+|r
	[12] = { ["score"] = 3250, ["color"] = { 0.95, 0.41, 0.38 } },		-- |cfff169613250+|r
	[13] = { ["score"] = 3225, ["color"] = { 0.94, 0.40, 0.40 } },		-- |cffef67673225+|r
	[14] = { ["score"] = 3200, ["color"] = { 0.93, 0.40, 0.43 } },		-- |cffed656d3200+|r
	[15] = { ["score"] = 3175, ["color"] = { 0.93, 0.38, 0.45 } },		-- |cffec62723175+|r
	[16] = { ["score"] = 3150, ["color"] = { 0.92, 0.38, 0.47 } },		-- |cffea60783150+|r
	[17] = { ["score"] = 3130, ["color"] = { 0.91, 0.37, 0.49 } },		-- |cffe85e7d3130+|r
	[18] = { ["score"] = 3105, ["color"] = { 0.90, 0.36, 0.51 } },		-- |cffe65c823105+|r
	[19] = { ["score"] = 3080, ["color"] = { 0.89, 0.35, 0.53 } },		-- |cffe45a883080+|r
	[20] = { ["score"] = 3055, ["color"] = { 0.89, 0.35, 0.55 } },		-- |cffe2588d3055+|r
	[21] = { ["score"] = 3030, ["color"] = { 0.87, 0.34, 0.58 } },		-- |cffdf56933030+|r
	[22] = { ["score"] = 3010, ["color"] = { 0.87, 0.33, 0.60 } },		-- |cffdd54983010+|r
	[23] = { ["score"] = 2985, ["color"] = { 0.85, 0.32, 0.62 } },		-- |cffda529d2985+|r
	[24] = { ["score"] = 2960, ["color"] = { 0.85, 0.31, 0.64 } },		-- |cffd850a32960+|r
	[25] = { ["score"] = 2935, ["color"] = { 0.84, 0.31, 0.66 } },		-- |cffd54ea82935+|r
	[26] = { ["score"] = 2910, ["color"] = { 0.82, 0.30, 0.68 } },		-- |cffd24cad2910+|r
	[27] = { ["score"] = 2890, ["color"] = { 0.82, 0.29, 0.70 } },		-- |cffd04ab32890+|r
	[28] = { ["score"] = 2865, ["color"] = { 0.80, 0.28, 0.72 } },		-- |cffcc48b82865+|r
	[29] = { ["score"] = 2840, ["color"] = { 0.79, 0.27, 0.74 } },		-- |cffc946bd2840+|r
	[30] = { ["score"] = 2815, ["color"] = { 0.78, 0.27, 0.76 } },		-- |cffc644c32815+|r
	[31] = { ["score"] = 2790, ["color"] = { 0.76, 0.26, 0.78 } },		-- |cffc242c82790+|r
	[32] = { ["score"] = 2770, ["color"] = { 0.75, 0.25, 0.80 } },		-- |cffbf40cd2770+|r
	[33] = { ["score"] = 2745, ["color"] = { 0.73, 0.24, 0.83 } },		-- |cffbb3ed32745+|r
	[34] = { ["score"] = 2720, ["color"] = { 0.71, 0.24, 0.85 } },		-- |cffb63cd82720+|r
	[35] = { ["score"] = 2695, ["color"] = { 0.70, 0.23, 0.87 } },		-- |cffb23ade2695+|r
	[36] = { ["score"] = 2670, ["color"] = { 0.68, 0.22, 0.89 } },		-- |cffad38e32670+|r
	[37] = { ["score"] = 2650, ["color"] = { 0.66, 0.22, 0.91 } },		-- |cffa837e92650+|r
	[38] = { ["score"] = 2625, ["color"] = { 0.64, 0.21, 0.93 } },		-- |cffa335ee2625+|r
	[39] = { ["score"] = 2585, ["color"] = { 0.62, 0.24, 0.93 } },		-- |cff9d3ced2585+|r
	[40] = { ["score"] = 2560, ["color"] = { 0.60, 0.26, 0.93 } },		-- |cff9842ec2560+|r
	[41] = { ["score"] = 2535, ["color"] = { 0.57, 0.28, 0.92 } },		-- |cff9247eb2535+|r
	[42] = { ["score"] = 2510, ["color"] = { 0.55, 0.29, 0.92 } },		-- |cff8c4bea2510+|r
	[43] = { ["score"] = 2490, ["color"] = { 0.53, 0.31, 0.91 } },		-- |cff8650e92490+|r
	[44] = { ["score"] = 2465, ["color"] = { 0.50, 0.33, 0.91 } },		-- |cff7f54e82465+|r
	[45] = { ["score"] = 2440, ["color"] = { 0.47, 0.34, 0.91 } },		-- |cff7857e72440+|r
	[46] = { ["score"] = 2415, ["color"] = { 0.44, 0.36, 0.90 } },		-- |cff715be52415+|r
	[47] = { ["score"] = 2390, ["color"] = { 0.42, 0.37, 0.89 } },		-- |cff6a5ee42390+|r
	[48] = { ["score"] = 2370, ["color"] = { 0.38, 0.38, 0.89 } },		-- |cff6261e32370+|r
	[49] = { ["score"] = 2345, ["color"] = { 0.35, 0.39, 0.89 } },		-- |cff5964e22345+|r
	[50] = { ["score"] = 2320, ["color"] = { 0.31, 0.40, 0.88 } },		-- |cff4f67e12320+|r
	[51] = { ["score"] = 2295, ["color"] = { 0.27, 0.41, 0.88 } },		-- |cff4469e02295+|r
	[52] = { ["score"] = 2270, ["color"] = { 0.22, 0.42, 0.87 } },		-- |cff376cdf2270+|r
	[53] = { ["score"] = 2250, ["color"] = { 0.15, 0.43, 0.87 } },		-- |cff256ede2250+|r
	[54] = { ["score"] = 2225, ["color"] = { 0.00, 0.44, 0.87 } },		-- |cff0070dd2225+|r
	[55] = { ["score"] = 2145, ["color"] = { 0.09, 0.45, 0.85 } },		-- |cff1672da2145+|r
	[56] = { ["score"] = 2120, ["color"] = { 0.13, 0.46, 0.85 } },		-- |cff2175d82120+|r
	[57] = { ["score"] = 2095, ["color"] = { 0.16, 0.47, 0.84 } },		-- |cff2977d52095+|r
	[58] = { ["score"] = 2075, ["color"] = { 0.19, 0.48, 0.83 } },		-- |cff307ad32075+|r
	[59] = { ["score"] = 2050, ["color"] = { 0.21, 0.49, 0.82 } },		-- |cff367cd02050+|r
	[60] = { ["score"] = 2025, ["color"] = { 0.23, 0.50, 0.80 } },		-- |cff3a7fcd2025+|r
	[61] = { ["score"] = 2000, ["color"] = { 0.25, 0.51, 0.80 } },		-- |cff3f81cb2000+|r
	[62] = { ["score"] = 1975, ["color"] = { 0.26, 0.52, 0.78 } },		-- |cff4284c81975+|r
	[63] = { ["score"] = 1955, ["color"] = { 0.27, 0.53, 0.77 } },		-- |cff4686c51955+|r
	[64] = { ["score"] = 1930, ["color"] = { 0.29, 0.54, 0.76 } },		-- |cff4989c31930+|r
	[65] = { ["score"] = 1905, ["color"] = { 0.29, 0.55, 0.75 } },		-- |cff4b8bc01905+|r
	[66] = { ["score"] = 1880, ["color"] = { 0.31, 0.56, 0.74 } },		-- |cff4e8ebd1880+|r
	[67] = { ["score"] = 1855, ["color"] = { 0.31, 0.56, 0.73 } },		-- |cff5090bb1855+|r
	[68] = { ["score"] = 1835, ["color"] = { 0.32, 0.58, 0.72 } },		-- |cff5293b81835+|r
	[69] = { ["score"] = 1810, ["color"] = { 0.33, 0.59, 0.71 } },		-- |cff5496b51810+|r
	[70] = { ["score"] = 1785, ["color"] = { 0.34, 0.60, 0.70 } },		-- |cff5698b31785+|r
	[71] = { ["score"] = 1760, ["color"] = { 0.34, 0.61, 0.69 } },		-- |cff579bb01760+|r
	[72] = { ["score"] = 1735, ["color"] = { 0.35, 0.62, 0.68 } },		-- |cff599dad1735+|r
	[73] = { ["score"] = 1715, ["color"] = { 0.35, 0.63, 0.67 } },		-- |cff5aa0aa1715+|r
	[74] = { ["score"] = 1690, ["color"] = { 0.36, 0.64, 0.65 } },		-- |cff5ba2a71690+|r
	[75] = { ["score"] = 1665, ["color"] = { 0.36, 0.65, 0.65 } },		-- |cff5ca5a51665+|r
	[76] = { ["score"] = 1640, ["color"] = { 0.36, 0.66, 0.64 } },		-- |cff5da8a21640+|r
	[77] = { ["score"] = 1615, ["color"] = { 0.37, 0.67, 0.62 } },		-- |cff5eaa9f1615+|r
	[78] = { ["score"] = 1595, ["color"] = { 0.37, 0.68, 0.61 } },		-- |cff5ead9c1595+|r
	[79] = { ["score"] = 1570, ["color"] = { 0.37, 0.69, 0.60 } },		-- |cff5faf991570+|r
	[80] = { ["score"] = 1545, ["color"] = { 0.37, 0.70, 0.59 } },		-- |cff5fb2961545+|r
	[81] = { ["score"] = 1520, ["color"] = { 0.37, 0.71, 0.58 } },		-- |cff5fb4931520+|r
	[82] = { ["score"] = 1495, ["color"] = { 0.37, 0.72, 0.56 } },		-- |cff5fb7901495+|r
	[83] = { ["score"] = 1475, ["color"] = { 0.37, 0.73, 0.55 } },		-- |cff5fba8d1475+|r
	[84] = { ["score"] = 1450, ["color"] = { 0.37, 0.74, 0.54 } },		-- |cff5fbc8a1450+|r
	[85] = { ["score"] = 1425, ["color"] = { 0.37, 0.75, 0.53 } },		-- |cff5fbf871425+|r
	[86] = { ["score"] = 1400, ["color"] = { 0.37, 0.76, 0.52 } },		-- |cff5fc2841400+|r
	[87] = { ["score"] = 1375, ["color"] = { 0.37, 0.77, 0.51 } },		-- |cff5ec4811375+|r
	[88] = { ["score"] = 1355, ["color"] = { 0.37, 0.78, 0.49 } },		-- |cff5ec77e1355+|r
	[89] = { ["score"] = 1330, ["color"] = { 0.36, 0.79, 0.48 } },		-- |cff5dc97b1330+|r
	[90] = { ["score"] = 1305, ["color"] = { 0.36, 0.80, 0.47 } },		-- |cff5ccc771305+|r
	[91] = { ["score"] = 1280, ["color"] = { 0.36, 0.81, 0.45 } },		-- |cff5bcf741280+|r
	[92] = { ["score"] = 1255, ["color"] = { 0.35, 0.82, 0.44 } },		-- |cff5ad1701255+|r
	[93] = { ["score"] = 1235, ["color"] = { 0.35, 0.83, 0.43 } },		-- |cff59d46d1235+|r
	[94] = { ["score"] = 1210, ["color"] = { 0.35, 0.84, 0.41 } },		-- |cff58d7691210+|r
	[95] = { ["score"] = 1185, ["color"] = { 0.34, 0.85, 0.40 } },		-- |cff56d9651185+|r
	[96] = { ["score"] = 1160, ["color"] = { 0.33, 0.86, 0.38 } },		-- |cff54dc611160+|r
	[97] = { ["score"] = 1135, ["color"] = { 0.33, 0.87, 0.36 } },		-- |cff53df5d1135+|r
	[98] = { ["score"] = 1115, ["color"] = { 0.31, 0.88, 0.35 } },		-- |cff50e1591115+|r
	[99] = { ["score"] = 1090, ["color"] = { 0.31, 0.89, 0.33 } },		-- |cff4ee4551090+|r
	[100] = { ["score"] = 1065, ["color"] = { 0.30, 0.91, 0.31 } },		-- |cff4ce7501065+|r
	[101] = { ["score"] = 1040, ["color"] = { 0.29, 0.91, 0.30 } },		-- |cff49e94c1040+|r
	[102] = { ["score"] = 1015, ["color"] = { 0.27, 0.93, 0.27 } },		-- |cff46ec461015+|r
	[103] = { ["score"] = 995, ["color"] = { 0.26, 0.94, 0.25 } },		-- |cff42ef41995+|r
	[104] = { ["score"] = 970, ["color"] = { 0.24, 0.95, 0.23 } },		-- |cff3ef13b970+|r
	[105] = { ["score"] = 945, ["color"] = { 0.23, 0.96, 0.20 } },		-- |cff3af434945+|r
	[106] = { ["score"] = 920, ["color"] = { 0.21, 0.97, 0.18 } },		-- |cff35f72d920+|r
	[107] = { ["score"] = 895, ["color"] = { 0.18, 0.98, 0.14 } },		-- |cff2ffa23895+|r
	[108] = { ["score"] = 875, ["color"] = { 0.15, 0.99, 0.09 } },		-- |cff27fc17875+|r
	[109] = { ["score"] = 850, ["color"] = { 0.12, 1.00, 0.00 } },		-- |cff1eff00850+|r
	[110] = { ["score"] = 825, ["color"] = { 0.23, 1.00, 0.13 } },		-- |cff3aff21825+|r
	[111] = { ["score"] = 800, ["color"] = { 0.30, 1.00, 0.20 } },		-- |cff4cff32800+|r
	[112] = { ["score"] = 775, ["color"] = { 0.35, 1.00, 0.25 } },		-- |cff5aff40775+|r
	[113] = { ["score"] = 750, ["color"] = { 0.40, 1.00, 0.29 } },		-- |cff67ff4b750+|r
	[114] = { ["score"] = 725, ["color"] = { 0.45, 1.00, 0.33 } },		-- |cff72ff55725+|r
	[115] = { ["score"] = 700, ["color"] = { 0.49, 1.00, 0.37 } },		-- |cff7cff5f700+|r
	[116] = { ["score"] = 675, ["color"] = { 0.52, 1.00, 0.41 } },		-- |cff85ff68675+|r
	[117] = { ["score"] = 650, ["color"] = { 0.55, 1.00, 0.44 } },		-- |cff8dff71650+|r
	[118] = { ["score"] = 625, ["color"] = { 0.59, 1.00, 0.48 } },		-- |cff96ff7a625+|r
	[119] = { ["score"] = 600, ["color"] = { 0.62, 1.00, 0.51 } },		-- |cff9dff82600+|r
	[120] = { ["score"] = 575, ["color"] = { 0.65, 1.00, 0.54 } },		-- |cffa5ff8a575+|r
	[121] = { ["score"] = 550, ["color"] = { 0.67, 1.00, 0.58 } },		-- |cffacff93550+|r
	[122] = { ["score"] = 525, ["color"] = { 0.70, 1.00, 0.61 } },		-- |cffb3ff9b525+|r
	[123] = { ["score"] = 500, ["color"] = { 0.73, 1.00, 0.64 } },		-- |cffbaffa2500+|r
	[124] = { ["score"] = 475, ["color"] = { 0.75, 1.00, 0.67 } },		-- |cffc0ffaa475+|r
	[125] = { ["score"] = 450, ["color"] = { 0.78, 1.00, 0.70 } },		-- |cffc6ffb2450+|r
	[126] = { ["score"] = 425, ["color"] = { 0.80, 1.00, 0.73 } },		-- |cffcdffba425+|r
	[127] = { ["score"] = 400, ["color"] = { 0.83, 1.00, 0.76 } },		-- |cffd3ffc2400+|r
	[128] = { ["score"] = 375, ["color"] = { 0.85, 1.00, 0.79 } },		-- |cffd9ffc9375+|r
	[129] = { ["score"] = 350, ["color"] = { 0.87, 1.00, 0.82 } },		-- |cffdeffd1350+|r
	[130] = { ["score"] = 325, ["color"] = { 0.89, 1.00, 0.85 } },		-- |cffe4ffd9325+|r
	[131] = { ["score"] = 300, ["color"] = { 0.92, 1.00, 0.88 } },		-- |cffeaffe0300+|r
	[132] = { ["score"] = 275, ["color"] = { 0.94, 1.00, 0.91 } },		-- |cffefffe8275+|r
	[133] = { ["score"] = 250, ["color"] = { 0.96, 1.00, 0.94 } },		-- |cfff4fff0250+|r
	[134] = { ["score"] = 225, ["color"] = { 0.98, 1.00, 0.97 } },		-- |cfffafff7225+|r
	[135] = { ["score"] = 200, ["color"] = { 1.00, 1.00, 1.00 } },		-- |cffffffff200+|r
}

ns.scoreTiersSimple = {
	[1] = { ["score"] = 2200, ["quality"] = 6 },
	[2] = { ["score"] = 1800, ["quality"] = 5 },
	[3] = { ["score"] = 1500, ["quality"] = 4 },
	[4] = { ["score"] = 1000, ["quality"] = 3 },
	[5] = { ["score"] = 0, ["quality"] = 2 }
}
