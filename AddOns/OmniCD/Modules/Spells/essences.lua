local E, L, C = select(2, ...):unpack()

E.essRank2 = {}
E.essData = {}

local essIDs = {
	[2]  = {293019,294668, 298080,298082, 298081,298083, 298081,298083},
	[3]  = {293031,294910, 300009,300012, 300010,300013, 300010,300013},
	[4]  = {295186,295078, 298628,298627, 299334,299333, 299334,299333},
	[5]  = {295258,295246, 299336,299335, 299338,299337, 299338,299337},
	[6]  = {295337,295293, 299345,299343, 299347,299346, 299347,299346},
	[7]  = {294926,294964, 300002,300004, 300003,300005, 300003,300005},
	[12] = {295373,295365, 299349,299348, 299353,299350, 299353,299350},
	[13] = {295746,295750, 300015,300018, 300016,300020, 300016,300020},
	[14] = {295840,295834, 299355,299354, 299358,299357, 299358,299357},
	[15] = {302731,302916, 302982,302984, 302983,302985, 302983,302985},
	[17] = {296072,296050, 299875,299878, 299876,299879, 299876,299879},
	[18] = {296094,296081, 299882,299885, 299883,299887, 299883,299887},
	[19] = {296197,296136, 299932,299935, 299933,299936, 299933,299936},
	[20] = {293032,296207, 299943,299939, 299944,299940, 299944,299940},
	[21] = {296230,303448, 299958,303474, 299959,303476, 299959,303476},
	[22] = {296325,296320, 299368,299367, 299370,299369, 299370,299369},
	[23] = {297108,297147, 298273,298274, 298277,298275, 298277,298275},
	[25] = {298168,298193, 299273,299274, 299275,299277, 299275,299277},
	[27] = {298357,298268, 299372,299371, 299374,299373, 299374,299373},
	[28] = {298452,298407, 299376,299375, 299378,299377, 299378,299377},
	[32] = {303823,304081, 304088,304089, 304121,304123, 304121,304123},
	[16] = {296036,293030, 310425,310422, 310442,310426, 310442,310426},
	[24] = {297375,297411, 298309,298302, 298312,298304, 298312,298304},
	[33] = {295046,295164, 299984,299989, 299988,299991, 299988,299991},
	[34] = {310592,310603, 310601,310607, 310602,310608, 310602,310608},
	[35] = {310690,310712, 311194,311197, 311195,311198, 311195,311198},
	[36] = {311203,311210, 311302,311304, 311303,311306, 311303,311306},
	[37] = {312725,312771, 313921,313919, 313922,313920, 313922,313920},
}

for k, v in pairs(essIDs) do
	for i = 1, 2 do
		local rank = v[(i - 1) * 2 + 3]
		E.essRank2[rank] = v[1]
	end
end

for k, v in pairs(essIDs) do
	local essLink = C_AzeriteEssence.GetEssenceHyperlink(k, 1)
	if essLink and essLink ~= "" then
		essLink = essLink:match("%[(.-)%]"):gsub("%-","%%-")
		local currData = { name = essLink }

		for i = 1, 4 do
			for j = 0, 1 do
				local id = v[(i - 1) * 2 + 1 + j]
				currData[j == 0 and i or -i] = id
			end
		end
		E.essData[#E.essData + 1] = currData
	end
end

E.essRank2CdFix = {
	[293019] = 15,
	[293031] = 15,
	[294926] = 30,
	[295746] = 42,
	[296230] = 15,
	[297108] = 30,
	[298168] = 30,
	[298452] = 15,
}

E.essRank3ChFix = {
	[295373] = {299353, 1},
}

E.essConflict = {
	[303823] = true,
	[304088] = true,
	[304121] = true,
}

E.essConflictPvPTalents = {
	[62]  = 198111,
	[63]  = 198111,
	[64]  = 198111,
	[65]  = 210294,
	[66]  = nil,
	[70]  = nil,
	[71]  = 198817,
	[72]  = nil,
	[73]  = nil,
	[102] = 305497,
	[103] = 305497,
	[104] = nil,
	[105] = 203651,
	[250] = 202727,
	[251] = 305392,
	[252] = nil,
	[253] = 236776,
	[254] = 236776,
	[255] = 236776,
	[256] = 305498,
	[257] = 213610,
	[258] = 108968,
	[259] = nil,
	[260] = nil,
	[261] = nil,
	[262] = 305483,
	[263] = nil,
	[264] = nil,
	[265] = nil,
	[266] = 212295,
	[267] = nil,
	[268] = nil,
	[269] = 287771,
	[270] = 216113,
	[577] = 235893,
	[581] = nil,
}

E.essStrive = {
	[296320] = true,
	[299367] = true,
	[299369] = true,
}

E.cdModifiedByEssence = {
	[275699] = true,
	[47568]  = true,
	[55233]  = true,
	[200166] = true,
	[187827] = true,
	[193530] = true,
	[266779] = true,
	[288613] = true,
	[194223] = true,
	[102560] = true,
	[106951] = true,
	[102543] = true,
	[61336]  = 104,
	[740]    = true,
	[12042]  = true,
	[190319] = true,
	[12472]  = true,
	[115203] = true,
	[115310] = true,
	[137639] = true,
	[152173] = true,
	[31884]  = true,
	[216331] = true,
	[231895] = true,
	[64843]  = true,
	[34433]  = true,
	[123040] = true,
	[13750]  = true,
	[121471] = true,
	[79140]  = true,
	[51533]  = true,
	[198067] = true,
	[108280] = true,
	[192249] = true,
	[205180] = true,
	[265187] = true,
	[1122]   = true,
	[107574] = 73,
	[227847] = true,
	[152277] = true,
	[1719]   = true,
}