local E, L, C = select(2, ...):unpack()

E.modifierLT = {}

function E:CreateModifierLT()
	for _, v in ipairs({E.sharedCdWithTrinkets, E.mergedSpells, E.cdReducingCast, E.cdResettingCast, E.cdReducingPowerSpenders, E.cdReducingCastByAzerite}) do
		for id in pairs(v) do
			E.modifierLT[id] = true
		end
	end
end

E.bigSpells = {
	[205596] = "Interface\\Icons\\inv_misc_steelweaponchain",
	[227635] = "Interface\\Icons\\ability_demonhunter_darkness",
	[203340] = "Interface\\Icons\\ability_mage_coldasice",
	[199452] = "Interface\\Icons\\spell_holy_sealofsacrifice",
	[197590] = "Interface\\Icons\\spell_holy_powerwordbarrier",
	[228049] = "Interface\\Icons\\spell_holy_heroism",
}

E.buffFixNoCLEU = {
	[125174] = 10,
}

E.buffFixNoDuration = {
	[51052]  = 10,
	[116011] = 10,
	[228049] = 10,
	[81782]  = 10,
	[197590] = 10,
	[62618]  = 10,
	[236320] = 15,
}
