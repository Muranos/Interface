--
-- Generated on 2021-12-03T07:11:44Z. DO NOT EDIT.
--
-- Ranges: {"epic":[2151,3075],"superior":[1851,2150],"uncommon":[576,1850],"common":[200,575]}
--
local _, ns = ...

ns.scoreTiers = {
	[1] = { ["score"] = 3075, ["color"] = { 1.00, 0.50, 0.00 } },		-- |cffff80003075+|r
	[2] = { ["score"] = 3015, ["color"] = { 1.00, 0.49, 0.08 } },		-- |cfffe7e153015+|r
	[3] = { ["score"] = 2990, ["color"] = { 0.99, 0.49, 0.13 } },		-- |cfffd7c222990+|r
	[4] = { ["score"] = 2965, ["color"] = { 0.99, 0.48, 0.17 } },		-- |cfffc7a2c2965+|r
	[5] = { ["score"] = 2940, ["color"] = { 0.98, 0.47, 0.20 } },		-- |cfffa78342940+|r
	[6] = { ["score"] = 2915, ["color"] = { 0.98, 0.46, 0.24 } },		-- |cfff9753c2915+|r
	[7] = { ["score"] = 2895, ["color"] = { 0.97, 0.45, 0.26 } },		-- |cfff873422895+|r
	[8] = { ["score"] = 2870, ["color"] = { 0.97, 0.44, 0.29 } },		-- |cfff771492870+|r
	[9] = { ["score"] = 2845, ["color"] = { 0.96, 0.44, 0.31 } },		-- |cfff56f4f2845+|r
	[10] = { ["score"] = 2820, ["color"] = { 0.96, 0.43, 0.33 } },		-- |cfff46d552820+|r
	[11] = { ["score"] = 2795, ["color"] = { 0.95, 0.42, 0.36 } },		-- |cfff26b5b2795+|r
	[12] = { ["score"] = 2775, ["color"] = { 0.95, 0.41, 0.38 } },		-- |cfff169612775+|r
	[13] = { ["score"] = 2750, ["color"] = { 0.94, 0.40, 0.40 } },		-- |cffef67672750+|r
	[14] = { ["score"] = 2725, ["color"] = { 0.93, 0.40, 0.43 } },		-- |cffed656d2725+|r
	[15] = { ["score"] = 2700, ["color"] = { 0.93, 0.38, 0.45 } },		-- |cffec62722700+|r
	[16] = { ["score"] = 2675, ["color"] = { 0.92, 0.38, 0.47 } },		-- |cffea60782675+|r
	[17] = { ["score"] = 2655, ["color"] = { 0.91, 0.37, 0.49 } },		-- |cffe85e7d2655+|r
	[18] = { ["score"] = 2630, ["color"] = { 0.90, 0.36, 0.51 } },		-- |cffe65c822630+|r
	[19] = { ["score"] = 2605, ["color"] = { 0.89, 0.35, 0.53 } },		-- |cffe45a882605+|r
	[20] = { ["score"] = 2580, ["color"] = { 0.89, 0.35, 0.55 } },		-- |cffe2588d2580+|r
	[21] = { ["score"] = 2555, ["color"] = { 0.87, 0.34, 0.58 } },		-- |cffdf56932555+|r
	[22] = { ["score"] = 2535, ["color"] = { 0.87, 0.33, 0.60 } },		-- |cffdd54982535+|r
	[23] = { ["score"] = 2510, ["color"] = { 0.85, 0.32, 0.62 } },		-- |cffda529d2510+|r
	[24] = { ["score"] = 2485, ["color"] = { 0.85, 0.31, 0.64 } },		-- |cffd850a32485+|r
	[25] = { ["score"] = 2460, ["color"] = { 0.84, 0.31, 0.66 } },		-- |cffd54ea82460+|r
	[26] = { ["score"] = 2435, ["color"] = { 0.82, 0.30, 0.68 } },		-- |cffd24cad2435+|r
	[27] = { ["score"] = 2415, ["color"] = { 0.82, 0.29, 0.70 } },		-- |cffd04ab32415+|r
	[28] = { ["score"] = 2390, ["color"] = { 0.80, 0.28, 0.72 } },		-- |cffcc48b82390+|r
	[29] = { ["score"] = 2365, ["color"] = { 0.79, 0.27, 0.74 } },		-- |cffc946bd2365+|r
	[30] = { ["score"] = 2340, ["color"] = { 0.78, 0.27, 0.76 } },		-- |cffc644c32340+|r
	[31] = { ["score"] = 2315, ["color"] = { 0.76, 0.26, 0.78 } },		-- |cffc242c82315+|r
	[32] = { ["score"] = 2295, ["color"] = { 0.75, 0.25, 0.80 } },		-- |cffbf40cd2295+|r
	[33] = { ["score"] = 2270, ["color"] = { 0.73, 0.24, 0.83 } },		-- |cffbb3ed32270+|r
	[34] = { ["score"] = 2245, ["color"] = { 0.71, 0.24, 0.85 } },		-- |cffb63cd82245+|r
	[35] = { ["score"] = 2220, ["color"] = { 0.70, 0.23, 0.87 } },		-- |cffb23ade2220+|r
	[36] = { ["score"] = 2195, ["color"] = { 0.68, 0.22, 0.89 } },		-- |cffad38e32195+|r
	[37] = { ["score"] = 2175, ["color"] = { 0.66, 0.22, 0.91 } },		-- |cffa837e92175+|r
	[38] = { ["score"] = 2150, ["color"] = { 0.64, 0.21, 0.93 } },		-- |cffa335ee2150+|r
	[39] = { ["score"] = 2115, ["color"] = { 0.61, 0.24, 0.93 } },		-- |cff9c3eed2115+|r
	[40] = { ["score"] = 2090, ["color"] = { 0.58, 0.27, 0.92 } },		-- |cff9445eb2090+|r
	[41] = { ["score"] = 2065, ["color"] = { 0.55, 0.29, 0.92 } },		-- |cff8c4bea2065+|r
	[42] = { ["score"] = 2040, ["color"] = { 0.51, 0.32, 0.91 } },		-- |cff8351e82040+|r
	[43] = { ["score"] = 2015, ["color"] = { 0.48, 0.34, 0.91 } },		-- |cff7b56e72015+|r
	[44] = { ["score"] = 1995, ["color"] = { 0.44, 0.36, 0.90 } },		-- |cff715be51995+|r
	[45] = { ["score"] = 1970, ["color"] = { 0.40, 0.37, 0.89 } },		-- |cff675fe41970+|r
	[46] = { ["score"] = 1945, ["color"] = { 0.36, 0.39, 0.89 } },		-- |cff5c63e31945+|r
	[47] = { ["score"] = 1920, ["color"] = { 0.31, 0.40, 0.88 } },		-- |cff4f67e11920+|r
	[48] = { ["score"] = 1895, ["color"] = { 0.25, 0.42, 0.88 } },		-- |cff406ae01895+|r
	[49] = { ["score"] = 1875, ["color"] = { 0.17, 0.43, 0.87 } },		-- |cff2c6dde1875+|r
	[50] = { ["score"] = 1850, ["color"] = { 0.00, 0.44, 0.87 } },		-- |cff0070dd1850+|r
	[51] = { ["score"] = 1775, ["color"] = { 0.09, 0.45, 0.85 } },		-- |cff1773da1775+|r
	[52] = { ["score"] = 1750, ["color"] = { 0.14, 0.46, 0.84 } },		-- |cff2375d71750+|r
	[53] = { ["score"] = 1725, ["color"] = { 0.17, 0.47, 0.84 } },		-- |cff2b78d51725+|r
	[54] = { ["score"] = 1700, ["color"] = { 0.20, 0.48, 0.82 } },		-- |cff327bd21700+|r
	[55] = { ["score"] = 1680, ["color"] = { 0.22, 0.49, 0.81 } },		-- |cff387dcf1680+|r
	[56] = { ["score"] = 1655, ["color"] = { 0.24, 0.50, 0.80 } },		-- |cff3c80cc1655+|r
	[57] = { ["score"] = 1630, ["color"] = { 0.25, 0.51, 0.79 } },		-- |cff4183c91630+|r
	[58] = { ["score"] = 1605, ["color"] = { 0.27, 0.52, 0.78 } },		-- |cff4485c61605+|r
	[59] = { ["score"] = 1580, ["color"] = { 0.28, 0.53, 0.76 } },		-- |cff4888c31580+|r
	[60] = { ["score"] = 1560, ["color"] = { 0.29, 0.55, 0.76 } },		-- |cff4b8bc11560+|r
	[61] = { ["score"] = 1535, ["color"] = { 0.31, 0.56, 0.75 } },		-- |cff4e8ebe1535+|r
	[62] = { ["score"] = 1510, ["color"] = { 0.31, 0.56, 0.73 } },		-- |cff5090bb1510+|r
	[63] = { ["score"] = 1485, ["color"] = { 0.32, 0.58, 0.72 } },		-- |cff5293b81485+|r
	[64] = { ["score"] = 1460, ["color"] = { 0.33, 0.59, 0.71 } },		-- |cff5496b51460+|r
	[65] = { ["score"] = 1440, ["color"] = { 0.34, 0.60, 0.70 } },		-- |cff5699b21440+|r
	[66] = { ["score"] = 1415, ["color"] = { 0.35, 0.61, 0.69 } },		-- |cff589baf1415+|r
	[67] = { ["score"] = 1390, ["color"] = { 0.35, 0.62, 0.67 } },		-- |cff599eac1390+|r
	[68] = { ["score"] = 1365, ["color"] = { 0.35, 0.63, 0.66 } },		-- |cff5aa1a91365+|r
	[69] = { ["score"] = 1340, ["color"] = { 0.36, 0.64, 0.65 } },		-- |cff5ca4a61340+|r
	[70] = { ["score"] = 1320, ["color"] = { 0.36, 0.65, 0.64 } },		-- |cff5da6a31320+|r
	[71] = { ["score"] = 1295, ["color"] = { 0.36, 0.66, 0.63 } },		-- |cff5da9a01295+|r
	[72] = { ["score"] = 1270, ["color"] = { 0.37, 0.67, 0.62 } },		-- |cff5eac9d1270+|r
	[73] = { ["score"] = 1245, ["color"] = { 0.37, 0.69, 0.60 } },		-- |cff5faf9a1245+|r
	[74] = { ["score"] = 1220, ["color"] = { 0.37, 0.70, 0.59 } },		-- |cff5fb2971220+|r
	[75] = { ["score"] = 1200, ["color"] = { 0.37, 0.71, 0.58 } },		-- |cff5fb4941200+|r
	[76] = { ["score"] = 1175, ["color"] = { 0.37, 0.72, 0.56 } },		-- |cff5fb7901175+|r
	[77] = { ["score"] = 1150, ["color"] = { 0.37, 0.73, 0.55 } },		-- |cff5fba8d1150+|r
	[78] = { ["score"] = 1125, ["color"] = { 0.37, 0.74, 0.54 } },		-- |cff5fbd8a1125+|r
	[79] = { ["score"] = 1100, ["color"] = { 0.37, 0.75, 0.53 } },		-- |cff5fc0861100+|r
	[80] = { ["score"] = 1080, ["color"] = { 0.37, 0.76, 0.51 } },		-- |cff5fc2831080+|r
	[81] = { ["score"] = 1055, ["color"] = { 0.37, 0.77, 0.50 } },		-- |cff5ec5801055+|r
	[82] = { ["score"] = 1030, ["color"] = { 0.36, 0.78, 0.49 } },		-- |cff5dc87c1030+|r
	[83] = { ["score"] = 1005, ["color"] = { 0.36, 0.80, 0.47 } },		-- |cff5dcb791005+|r
	[84] = { ["score"] = 980, ["color"] = { 0.36, 0.81, 0.46 } },		-- |cff5cce75980+|r
	[85] = { ["score"] = 960, ["color"] = { 0.36, 0.82, 0.44 } },		-- |cff5bd171960+|r
	[86] = { ["score"] = 935, ["color"] = { 0.35, 0.83, 0.43 } },		-- |cff59d46d935+|r
	[87] = { ["score"] = 910, ["color"] = { 0.35, 0.84, 0.41 } },		-- |cff58d669910+|r
	[88] = { ["score"] = 885, ["color"] = { 0.34, 0.85, 0.40 } },		-- |cff56d965885+|r
	[89] = { ["score"] = 860, ["color"] = { 0.33, 0.86, 0.38 } },		-- |cff54dc61860+|r
	[90] = { ["score"] = 840, ["color"] = { 0.32, 0.87, 0.36 } },		-- |cff52df5d840+|r
	[91] = { ["score"] = 815, ["color"] = { 0.31, 0.89, 0.35 } },		-- |cff50e258815+|r
	[92] = { ["score"] = 790, ["color"] = { 0.30, 0.90, 0.33 } },		-- |cff4de554790+|r
	[93] = { ["score"] = 765, ["color"] = { 0.29, 0.91, 0.31 } },		-- |cff4be84f765+|r
	[94] = { ["score"] = 740, ["color"] = { 0.28, 0.92, 0.29 } },		-- |cff47eb49740+|r
	[95] = { ["score"] = 720, ["color"] = { 0.27, 0.93, 0.27 } },		-- |cff44ee44720+|r
	[96] = { ["score"] = 695, ["color"] = { 0.25, 0.94, 0.24 } },		-- |cff40f03d695+|r
	[97] = { ["score"] = 670, ["color"] = { 0.23, 0.95, 0.21 } },		-- |cff3bf336670+|r
	[98] = { ["score"] = 645, ["color"] = { 0.21, 0.96, 0.18 } },		-- |cff36f62f645+|r
	[99] = { ["score"] = 620, ["color"] = { 0.19, 0.98, 0.15 } },		-- |cff30f925620+|r
	[100] = { ["score"] = 600, ["color"] = { 0.16, 0.99, 0.09 } },		-- |cff28fc18600+|r
	[101] = { ["score"] = 575, ["color"] = { 0.12, 1.00, 0.00 } },		-- |cff1eff00575+|r
	[102] = { ["score"] = 550, ["color"] = { 0.28, 1.00, 0.18 } },		-- |cff48ff2e550+|r
	[103] = { ["score"] = 525, ["color"] = { 0.38, 1.00, 0.27 } },		-- |cff60ff45525+|r
	[104] = { ["score"] = 500, ["color"] = { 0.45, 1.00, 0.34 } },		-- |cff74ff57500+|r
	[105] = { ["score"] = 475, ["color"] = { 0.52, 1.00, 0.41 } },		-- |cff84ff68475+|r
	[106] = { ["score"] = 450, ["color"] = { 0.58, 1.00, 0.47 } },		-- |cff93ff77450+|r
	[107] = { ["score"] = 425, ["color"] = { 0.63, 1.00, 0.52 } },		-- |cffa0ff85425+|r
	[108] = { ["score"] = 400, ["color"] = { 0.68, 1.00, 0.58 } },		-- |cffadff94400+|r
	[109] = { ["score"] = 375, ["color"] = { 0.73, 1.00, 0.63 } },		-- |cffb9ffa1375+|r
	[110] = { ["score"] = 350, ["color"] = { 0.77, 1.00, 0.69 } },		-- |cffc4ffaf350+|r
	[111] = { ["score"] = 325, ["color"] = { 0.81, 1.00, 0.74 } },		-- |cffcfffbc325+|r
	[112] = { ["score"] = 300, ["color"] = { 0.85, 1.00, 0.79 } },		-- |cffd9ffca300+|r
	[113] = { ["score"] = 275, ["color"] = { 0.89, 1.00, 0.84 } },		-- |cffe3ffd7275+|r
	[114] = { ["score"] = 250, ["color"] = { 0.93, 1.00, 0.89 } },		-- |cffedffe4250+|r
	[115] = { ["score"] = 225, ["color"] = { 0.96, 1.00, 0.95 } },		-- |cfff6fff2225+|r
	[116] = { ["score"] = 200, ["color"] = { 1.00, 1.00, 1.00 } },		-- |cffffffff200+|r
}

ns.scoreTiersSimple = {
	[1] = { ["score"] = 2200, ["quality"] = 6 },
	[2] = { ["score"] = 1800, ["quality"] = 5 },
	[3] = { ["score"] = 1500, ["quality"] = 4 },
	[4] = { ["score"] = 1000, ["quality"] = 3 },
	[5] = { ["score"] = 0, ["quality"] = 2 }
}
