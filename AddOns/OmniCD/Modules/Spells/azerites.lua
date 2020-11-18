local E, L, C = select(2, ...):unpack()

E.cxModifiedByAzerite = {
	[48792]  = { azerite = 288424, duration = 15},
	[48265]  = { azerite = 280011, duration = 5 },
	[109304] = { azerite = 287938, duration = 15},
	[116849] = { azerite = 277667, duration = 20},
	[190784] = { azerite = 280017, duration = 5 },
	[1122]   = { azerite = 277705, duration = 15},
	[12051]  = { azerite = 273330, charges = 2 },
	[-1]     = { azerite = 273338, duration = 0 },
	[-2]     = { azerite = 278541, duration = 0 },
}

E.cdReducingCastByAzerite = {
	[5221]   = { target = { [106951]=0.3,[102543]=0.2 }, azerite = 273338 },
	[106830] = { target = { [106951]=0.3,[102543]=0.2 }, azerite = 273338 },
	[106785] = { target = { [106951]=0.3,[102543]=0.2 }, azerite = 273338 },
	[274837] = { target = { [106951]=0.3,[102543]=0.2 }, azerite = 273338 },
	[1822]   = { target = { [106951]=0.3,[102543]=0.2 }, azerite = 273338 },
	[202028] = { target = { [106951]=0.3,[102543]=0.2 }, azerite = 273338 },
	[30455]  = { target = { [84714]=0.5 }, azerite = 278541 },
}

E.cdReducingAzeriteDamage = {
	[283810] = { target = 1719, duration = 0.1 },
	[278565] = { target = {186265, 186289, 193530, 186257}, duration = 1 },
}

for _, v in pairs(E.cxModifiedByAzerite) do
	local name = GetSpellInfo(v.azerite)
	v.name = name
end
