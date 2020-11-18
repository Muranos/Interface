local E, L, C = select(2, ...):unpack()

E.cdModifiedByTalent = {
	[275699] = { talent = 288848, duration = 45 },
	[48707]  = { talent = 205727, duration = 15 },
	[108199] = { talent = 206970, duration = 30 },
	[200166] = { talent = 235893, duration = 120},
	[207684] = { talent = 209281, duration = 18 },
	[202137] = { talent = 209281, duration = 12 },
	[204596] = { talent = 209281, duration = 6  },
	[102342] = { talent = 197061, duration = 15 },
	[186257] = { talent = 266921, duration = 36 },
	[288613] = { talent = 203129, duration = 20 },
	[110960] = { talent = 210476, duration = 45 },
	[109132] = { talent = 115173, duration = 5  },
	[119381] = { talent = 264348, duration = 10 },
	[116849] = { talent = 202424, duration = 25 },
	[119996] = { talent = 216255, duration = 15 },
	[47788]  = { talent = 196602, duration = 60 },
	[8122]   = { talent = 196704, duration = 30 },
	[15487]  = { talent = 263716, duration = 15 },
	[73325]  = { talent = 196611, duration = 45 },
	[15286]  = { talent = 199855, duration = 45 },
	[47585]  = { talent = 288733, duration = 30 },
	[195457] = { talent = 256188, duration = 30 },
	[1856]   = { talent = 212081, duration = 45 },
	[2094]   = { talent = 256165, duration = 30 },
	[51533]  = { talent = 262624, duration = 30 },
	[51514]  = { talent = 204268, duration = 20 },
	[79206]  = { talent = 192088, duration = 60 },
	[30283]  = { talent = 264874, duration = 15 },
	[97462]  = { talent = 235941, duration = 120},
	[1160]   = { talent = 199023, duration = 15 },
	[6544]   = { talent = 202163, duration = 15 },
	[18562]  = { talent = 200383, duration = 3  },
	[740]    = { talent = 197073, duration = 60 },
	[108853] = { talent = 205029, duration = 2  },
	[100]    = { talent = 103827, duration = 3  },
}

E.cdModifiedByTalentMult = {
	[47568]  = { talent = 233394, multiplier = .50 },
	[49028]  = { talent = 233412, multiplier = .50 },
	[179057] = { talent = 206477, multiplier = .66 },
	[207684] = { talent = 211489, multiplier = .75 },
	[202137] = { talent = 211489, multiplier = .75 },
	[202138] = { talent = 211489, multiplier = .75 },
	[204596] = { talent = 211489, multiplier = .75 },
	[22812]  = { talent = 203965, multiplier = .66 },
	[61336]  = { talent = 203965, multiplier = .66 },
	[186257] = { talent = 203235, multiplier = .50 },
	[186289] = { talent = 266921, multiplier = .80 },
	[186265] = { talent = 266921, multiplier = .80 },
	[235450] = { talent = 235463, multiplier = 0 },
	[115203] = { talent = 202107, multiplier = .50 },
	[115176] = { talent = 202200, multiplier = .25 },
	[642]    = { talent = 114154, multiplier = .70 },
	[498]    = { talent = 114154, multiplier = .70 },
	[633]    = { talent = 114154, multiplier = .70 },
	[184662] = { talent = 114154, multiplier = .70 }, -- Shield of Vengeance (Ret)
	[31850]  = { talent = 114154, multiplier = .70 }, -- Ardent Defender (Prot)
	[204018] = { talent = 216853, multiplier = .66 },
	[1022]   = { talent = 216853, multiplier = .66 },
	[6940]   = { talent = 216853, multiplier = .66 },
	[227847] = { talent = 236308, multiplier = .66 },
}

E.chModifiedByTalent = {
	[49576]  = { talent = 202727, charges = 1 },
	[122]    = { talent = 205036, charges = 1 },
	[109132] = { talent = 115173, charges = 1 },
	[1044]   = { talent = 199454, charges = 1 },
	[1022]   = { talent = 199454, charges = 1 },
	[190784] = { talent = 230332, charges = 1 },
	[2050]   = { talent = 235587, charges = 1 },
	[527]    = { talent = 196162, charges = 1 },
	[185313] = { talent = 238104, charges = 1 },
	[18562]  = { talent = 200383, charges = 1 },
	[100]    = { talent = 103827, charges = 1 },
	[7384]   = { talent = 262150, charges = 1 },
	[275779] = { talent = 204023, charges = 1 },
	[259489] = { talent = 269737, charges = 1 },
	[259495] = { talent = 264332, charges = 1 },
	[51505]  = { talent = 108283, charges = 1 },
	[5394]   = { talent = 108283, charges = 1 },
	[61295]  = { talent = 108283, charges = 1 },
	[108853] = { talent = 205029, charges = 1 },
}

E.mergedSpells = {
	[196770] = 287250,
	[196718] = 227635,
	[62618]  = 197590,
	[271466] = 197590,
	[57934]  = 221622,
	[22842]  = { 197491, 217615, 22842 },
	[215769] = 215982,
	[48020]  = 268358,
	[221527] = 205596,
	[198149] = 84714,
	[199448] = 199452,
	[204361] = 193876,
	[204362] = 193876,
	[204406] = 204403,
	[189110] = 205629,
	[77764]  = 77761,
	[106898] = 77761,
	[187650] = 203340,
	[30449]  = 198100,
	[32182]  = 2825,
	[211004] = 51514,
	[210873] = 51514,
	[211015] = 51514,
	[211010] = 51514,
	[277784] = 51514,
	[269352] = 51514,
	[277778] = 51514,
	[25046]  = 129597,
	[28730]  = 129597,
	[50613]  = 129597,
	[69179]  = 129597,
	[80483]  = 129597,
	[155145] = 129597,
	[202719] = 129597,
	[19647]  = 119898,
	[119910] = 119898,
	[132409] = 119898,
	[212623] = 119898,
	[6358]   = 119898,
	[261589] = 119898,
	[89808]  = 119898,
	[119905] = 119898,
	[132411] = 119898,
	[89766]  = 119898,
	[119914] = 119898,
	[53271]  = 272651,
	[272682] = 272651,
	[272678] = 272651,
	[264735] = 272651,
	[281195] = 272651,
	[272679] = 272651,
}

E.commandPet = {
	[19647]  = { 24 },
	[119910] = { 24 },
	[132409] = { 24 },
	[212623] = { 15 },
	[6358]   = { 30 },
	[261589] = { 30 },
	[89808]  = { 15 },
	[119905] = { 15 },
	[132411] = { 15 },
	[89766]  = { 30 },
	[119914] = { 30 },
	[53271]  = { 45 },
	[272682] = { 45 },
	[272678] = { 360 },
	[264735] = { 180 },
	[281195] = { 180 },
	[272679] = { 180 },
}

for k, v in pairs(E.commandPet) do
	local _, icon = GetSpellTexture(k)
	v[2] = icon
end

E.sharedCdWithTrinkets = {
	[208683] = { 59752, 20594, 7744, 265221},
	[214027] = { 59752, 20594, 7744, 265221},
	[195710] = { 59752, 20594, 7744, 265221},
	[59752]  = { 208683, 214027, 195710},
	[20594]  = { 208683, 214027, 195710},
	[7744]   = { 208683, 214027, 195710},
	[265221] = { 208683, 214027, 195710},
}

E.cdResettingCast = {
	[235219] = { 120, 45438, 122, 11426 },
	[212801] = 212653,  -- Shimmer
	[195676] = 1953,    -- Blink
}

E.cdReducingCast = {
	[47541]  = { target = {[275699]=1,[42650]=5,[63560]=1}, talent = 276837, default = 63560 },
	[207317] = { target = {[275699]=1,[42650]=5,[63560]=1}, talent = 276837, default = 63560 },
	[185358] = { target = 288613, talent = 260404, duration = 2.5 },
	[257620] = { target = 288613, talent = 260404, duration = 2.5 },
	[193455] = { target = 19574,  talent = 257891, duration = 1   },
	[217200] = { target = 19574,                   duration = 12  },
	[19434]  = { target = {[186265]=5,[109304]=5},talent = 248443 },
	[133]    = { target = 190319, talent = 203283, duration = 5   },
	[275773] = { target = 853,    talent = 198054, duration = 10  },
	[275779] = { target = 853,    talent = 198054, duration = 6   },
	[53600]  = { target = {[31884]=3,[184092]=3}, talent = 204074 },
	[585]    = { target = 88625,  talent = 196985, duration = 5.32, base = 4 },
	[139]    = { target = 34861,  talent = 196985, duration = 2.66, base = 2 },
	[596]    = { target = 34861,  talent = 196985, duration = 8,    base = 6 },
	[2060]   = { target = 2050,   talent = 196985, duration = 8,    base = 6 },
	[2061]   = { target = 2050,   talent = 196985, duration = 8,    base = 6 },
	[2050]   = { target = 265202,                  duration = 30  },
	[34861]  = { target = 265202,                  duration = 30  },
	[32546]  = { target = {[2050]=3,[34861]=3}, talent = 32546 },
}

E.cdReducingPowerSpenders = {
	-- Vampiric Blood, Red Thrist (Bonestorm is same tier)
	[206940] = { target = 55233,  talent = 205723, duration = 3    }, -- Mark of Blood
	[49998]  = { target = 55233,  talent = 205723, duration = 4.5  }, -- Death Strike
	[61999]  = { target = 55233,  talent = 205723, duration = 3    }, -- Raise Ally
	-- Rune Strike, Rune Strike
	[206931] = { target = 210764, talent = 210764, duration = 1    }, -- Blooddrinker
	[111673] = { target = 210764, talent = 210764, duration = 1    }, -- Control Undead
	[43265]  = { target = 210764, talent = 210764, duration = 1    }, -- Death and Decay
	[195292] = { target = 210764, talent = 210764, duration = 1    }, -- Death's Caress
	[206930] = { target = 210764, talent = 210764, duration = 1    }, -- Heart Strike
	[195182] = { target = 210764, talent = 210764, duration = 2    }, -- Marrowrend
	[3714]   = { target = 210764, talent = 210764, duration = 1    }, -- Path of Frost
	[194679] = { target = 210764, talent = 210764, duration = 1    }, -- Rune Tap
	[186270] = { target = 109304, talent = 270581, duration = 1.5  },
	[259387] = { target = 109304, talent = 270581, duration = 1.5  },
	[187708] = { target = 109304, talent = 270581, duration = 1.75 },
	[212436] = { target = 109304, talent = 270581, duration = 1.5  },
	[195645] = { target = 109304, talent = 270581, duration = 1.5  },
	[259391] = { target = 109304, talent = 270581, duration = 1.5  },
	[34026]  = { target = 109304, talent = 270581, duration = 1    },
	[259491] = { target = 109304, talent = 270581, duration = 1    },
	[271788] = { target = 109304, talent = 270581, duration = 0.5  },
	[131894] = { target = 109304, talent = 270581, duration = { [255] = 1.5, default = 1 } },
	[203155] = { target = 109304, talent = 270581, duration = 2    },
	[185358] = { target = 109304, talent = 270581, duration = 0.75 },
	[19434]  = { target = 109304, talent = 270581, duration = 1.5  },
	[212431] = { target = 109304, talent = 270581, duration = 1    },
	[198670] = { target = 109304, talent = 270581, duration = 1.75 },
	[186387] = { target = 109304, talent = 270581, duration = 0.5  },
	[2643]   = { target = 109304, talent = 270581, duration = 1.33 },
	[257620] = { target = 109304, talent = 270581, duration = 0.75 },
	[120360] = { target = 109304, talent = 270581, duration = { [254] = 1.5, [253] = 2 } },
	[208652] = { target = 109304, talent = 270581, duration = 1    },
	[205691] = { target = 109304, talent = 270581, duration = 2    },
	[193455] = { target = 109304, talent = 270581, duration = 1.17 },
	[120679] = { target = 109304, talent = 270581, duration = 0.83 },
	[982]    = { target = 109304, talent = 270581, duration = { [253] = 1.17, default = 1.75 } },
	[100784] = { target = 137639, talent = 280197, duration = 0.5  },
	[107428] = { target = 137639, talent = 280197, duration = 1    },
	[101546] = { target = 137639, talent = 280197, duration = 1    },
	[113656] = { target = 137639, talent = 280197, duration = 1.5  },
	[116847] = { target = 137639, talent = 280197, duration = 0.5  },
	[85256]  = { target = 853,    talent = 234299, duration = 6    },
	[53385]  = { target = 853,    talent = 234299, duration = 6    },
	[210191] = { target = 853,    talent = 234299, duration = 6    },
	[215661] = { target = 853,    talent = 234299, duration = 10   },
	[84963]  = { target = 853,    talent = 234299, duration = 6    },
	[2098]   = { target = {[199804]=1,[13750]=1,[195457]=1,[51690]=1,[2983]=1,[1856]=1,[137619]=1}, duration = 5 },
	[193316] = { target = {[199804]=1,[13750]=1,[195457]=1,[51690]=1,[2983]=1,[1856]=1,[137619]=1}, duration = 5 },
	[5171]   = { target = {[199804]=1,[13750]=1,[195457]=1,[51690]=1,[2983]=1,[1856]=1,[137619]=1}, duration = 5 },
	[269513] = { target = {[199804]=1,[13750]=1,[195457]=1,[51690]=1,[2983]=1,[1856]=1,[137619]=1}, duration = 5 },
	[199804] = { target = {[199804]=1,[13750]=1,[195457]=1,[51690]=1,[2983]=1,[1856]=1,[137619]=1}, duration = 5 },
	[196819] = { target = 185313, talent = 238104, duration = 12.5, base = 7.5 },
	[195452] = { target = 185313, talent = 238104, duration = 12.5, base = 7.5 },
	[280719] = { target = 185313, talent = 238104, duration = 12.5, base = 7.5 },
	[408]    = { target = 185313, talent = 238104, duration = 12.5, base = 7.5 },
	[156527] = { target = 185313, talent = 238104, duration = 12.5, base = 7.5 },
	[12323]  = { target = 1719,   talent = 152278, duration = 0.5  },
	[184367] = { target = 1719,   talent = 152278, duration = 4.25 },
	[1715]   = { target = {[262161]=1,[167105]=1,[50622]=1}, talent = 152278, duration = .5 },
	[772]    = { target = {[262161]=1,[167105]=1,[50622]=1}, talent = 152278, duration = 1  },
	[12294]  = { target = {[262161]=1,[167105]=1,[50622]=1}, talent = 152278, duration = 1  },
	[163201] = { target = {[262161]=1,[167105]=1,[50622]=1}, talent = 152278, duration = 1  },
	[1680]   = { target = {[262161]=1,[167105]=1,[50622]=1}, talent = 152278, duration = 1  },
	[1464]   = { target = {[262161]=1,[167105]=1,[50622]=1}, talent = 152278, duration = 1  },
	[190456] = { target = {[107574]=1,[871]=1,[12975]=1,[1160]=1}, talent = 152278, duration = 1 },
	--[6572]   = { target = {[107574]=1,[871]=1,[12975]=1,[1160]=1}, talent = 152278, duration = 1 }, -- Revenge (free proc 5302 doesn't reduce CD)
	[2565]   = { target = {[107574]=1,[871]=1,[12975]=1,[1160]=1}, talent = 152278, duration = 1 },
	[202168] = { target = {[107574]=0,[871]=1,[12975]=1,[1160]=1,[1719]=1,[262161]=1,[167105]=1,[50622]=1}, talent=152278, duration={[73]=1,default=.5} },
}

E.cdReducedByPowerSpent = {
	--[210764] = { duration = 1,   talent = 210764 }, -- [3]
	[55233]  = { duration = 0.1, talent = 205723 }, -- Vampiric Blood
	[109304] = { duration = { default = .05, [253] = .033 }, talent = 270581 },
	[137639] = { duration = 0.5, talent = 280197 },
	[853]    = { duration = { [70] = 2 }, talent = 234299 },
	[1719]   = { duration = .05, talent = 152278 },
	[167105] = { duration = .05, talent = 152278 },
	[262161] = { duration = .05, talent = 152278 },
	[227847] = { duration = .05, talent = 152278 },
	[107574] = { duration = { [73] = 0.1 }, talent = 152278 },
	[871]    = { duration = 0.1, talent = 152278 },
	[12975]  = { duration = 0.1, talent = 152278 },
	[1160]   = { duration = 0.1, talent = 152278 },
	[199804] = { duration = 1 },
	[13750]  = { duration = 1 },
	[195457] = { duration = 1 },
	[51690]  = { duration = 1 },
	[137619] = { duration = { [260] = 1 } },
	[2983]   = { duration = { [260] = 1 } },
	[1856]   = { duration = { [260] = 1 } },
	[185313] = { duration = 2.5, talent = 238104, base = 1.5 },
}

E.enabledSpells = {
	[202425] = true,
	[199483] = true,
	[248518] = true,
	[205025] = true,
	[210294] = true,
	[215652] = true,
	[213981] = true,
	[57934]  = true,
	[210918] = true,
	[256948] = true,
	[198817] = true,
}

E.cdStartingAuraRemoved = {
	[202425] = true,
	[199483] = true,
	[248518] = true,
	[205025] = true,
	[210294] = true,
	[215652] = true,
	[213981] = true,
	[210918] = true,
	[256948] = true,
	[198817] = true,
}

E.cdStartingAuraApplied = {
	[283167] = 214027,
	[209261] = 209258,
	[123981] = 114556,
	[87024]  = 86949,
	[45182]  = 31230,
	[286342] = 286342,
	[295047] = 295046,
}

E.cdReducingTotemDamage = {
	[118905] = { target = 192058, duration = 5,  talent = 265046, max = 4 }
}

E.cdReducingDamage = {
	[190357] = { target = 84714,  duration = 0.5 },
	[46968]  = { target = 46968,  duration = 15, talent = 275339, min = 3 },
}

E.cdReducingCritDamage = {
	[49143]  = { target = 51271,  duration = 2,  talent = 207126 },
	[49020]  = { target = 51271,  duration = 2,  talent = 207126 },
	[133]    = { target = 190319, duration = 1,  talent = 155148 },
	[11366]  = { target = 190319, duration = 1,  talent = 155148 },
	[108853] = { target = 190319, duration = 1,  talent = 155148 },
	[257541] = { target = 190319, duration = 1,  talent = 155148 },
}

E.cdReducingEnergize = {
	[193840] = { target = 200166, duration = 3,  talent = 258887 },
}

E.cdReducingInterrupts = {
	[93985]  = { target = {[5217]=1,[77761]=1,[61336]=1}, duration = 10, talent = 205673 },
}

E.cdDisablingAuraApplied = {
	[25771] = { [1022] = true, [204018] = true, [642] = true },
}

E.dispels = {
	[88423] = true,
	[115450] = true,
	[4987] = true,
	[527] = true,
	[77130] = true,
}
