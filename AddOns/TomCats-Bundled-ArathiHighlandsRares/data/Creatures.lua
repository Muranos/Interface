local TCL = select(2, ...).TomCatsLibs
TCL.Data.loadData(
	"Creatures",
	{ "Creature ID", "Vignette ID", "Alliance React", "Horde React", "Level", "Locations", "Alliance Tracking ID", "Horde Tracking ID", "World Quest ID", "Bonus Roll Tracking ID", "Loot", },
	{
		{ 137374, nil, 1, -1, nil, { nil, { 0.38967067, 0.395183563 }}, nil, 53001, 52848, 52274, {items = {163828,161455,161453,161457,161460,161454,161456,161459,161458,161463,161461,161462}}, }, -- The Lion's Roar
		{ 138122, nil, -1, 1, nil, {{ 0.38967067, 0.396477342 }, nil }, 53002, nil, 52847, 52273, {items = {163829,161464,161466,161468,161471,161465,161470,161469,161467,161472,161473,161474}}, }, -- Doom's Howl
		{ 141615, 3194, -1, -1, 122, {{ 0.306419045, 0.447245717 }, { 0.306419045, 0.447245717 }}, 53017, 53506, nil, nil, 163691, }, -- Burning Goliath
		{ 141618, 3195, -1, -1, 122, {{ 0.620794833, 0.315023124 }, { 0.620794833, 0.315023124 }}, 53018, 53531, nil, nil, 163700, }, -- Cresting Goliath
		{ 141620, 3198, -1, -1, 122, {{ 0.298632681, 0.598170519 }, { 0.298632681, 0.598170519 }}, 53021, 53523, nil, nil, 163701, }, -- Rumbling Goliath
		{ 141668, 3204, -1, -1, 122, {{ 0.570738435, 0.347373366 }, { 0.570738435, 0.347373366 }}, 53059, 53508, nil, nil, 163677, }, -- Echo of Myzrael
		{ 141942, 3202, -1, -1, 122, {{ 0.476612329, 0.780414104 }, { 0.476612329, 0.780414104 }}, 53057, 53516, nil, nil, 163775, }, -- Molok the Crusher
		{ 142112, 3203, -1, -1, 121, {{ 0.491810679, 0.841642618 }, { 0.491810679, 0.841642618 }}, 53058, 53513, nil, nil, 163744, }, -- Kor'gresh Coldrage
		{ 142419, 3200, -1, -1, 122, {{ 0.46337086, 0.52117449 }, { 0.46337086, 0.52117449 }}, 53023, 53527, nil, nil, 163698, }, -- Thundering Goliath
		{ 142423, 3191, -1, -1, 122, {{ 0.328270257, 0.387091994 }, { 0.276308686, 0.569207847 }}, 53014, 53518, nil, nil, 163646, }, -- Overseer Krix
		{ 142433, 3196, 0, 0, 122, {{ 0.593028247, 0.281546444 }, { 0.593028247, 0.281546444 }}, 53019, 53510, nil, nil, 163711, }, -- Fozruk
		{ 142435, 3197, -1, -1, 122, {{ 0.356397182, 0.643547714 }, { 0.356397182, 0.643547714 }}, 53020, 53519, nil, nil, 163690, }, -- Plaguefeather
		{ 142436, 3193, -1, -1, 122, {{ 0.186017409, 0.281048864 }, { 0.11987225, 0.520225346 }}, 53016, 53522, nil, nil, 163689, }, -- Ragebeak
		{ 142437, 3199, -1, -1, 122, {{ 0.573031962, 0.44277361 }, { 0.573031962, 0.44277361 }}, 53022, 53526, nil, nil, 163645, }, -- Skullripper
		{ 142438, 3201, -1, -1, 122, {{ 0.572603166, 0.541368783 }, { 0.572603166, 0.541368783 }}, 53024, 53528, nil, nil, 163648, }, -- Venomarus
		{ 142440, 3192, -1, -1, 122, {{ 0.145391405, 0.365858525 }, { 0.145391405, 0.365858525 }}, 53015, 53529, nil, nil, 163684, }, -- Yogursa
		{ 142508, 3190, -1, -1, 122, {{ 0.21437341, 0.217810437 }, { 0.21437341, 0.217810437 }}, 53013, 53505, nil, nil, 163650, }, -- Branchlord Aldrus
		{ 142662, 3205, -1, -1, 121, {{ 0.794278264, 0.294276774 }, { 0.794278264, 0.294276774 }}, 53060, 53511, nil, nil, 163713, }, -- Geomancer Flintdagger
		{ 142682, 3218, -1, -1, 121, {{ 0.628907323, 0.811282754 }, { 0.628907323, 0.811282754 }}, 53094, 53530, nil, nil, 163745, }, -- Zalas Witherbark
		{ 142683, 3216, -1, -1, 121, {{ 0.429001749, 0.564952791 }, { 0.429001749, 0.564952791 }}, 53092, 53524, nil, nil, 163741, }, -- Ruul Onestone
		{ 142684, 3213, -1, -1, 121, {{ 0.25219959, 0.485551804 }, { 0.25219959, 0.485551804 }}, 53089, 53514, nil, nil, 163750, }, -- Kovork
		{ 142686, 3210, -1, -1, 121, {{ 0.223221302, 0.511286736 }, { 0.223221302, 0.511286736 }}, 53086, 53509, nil, nil, 163735, }, -- Foulbelly
		{ 142688, 3208, -1, -1, 121, {{ 0.508718014, 0.36571756 }, { 0.503835559, 0.610285997 }}, 53084, 53507, nil, nil, 163652, }, -- Darbel Montrose
		{ 142690, 3217, -1, -1, 121, {{ 0.511774123, 0.399065793 }, { 0.505889535, 0.574513972 }}, 53093, 53525, nil, nil, 163738, }, -- Singer
		{ 142692, 3215, -1, -1, 121, {{ 0.676216185, 0.608678758 }, { 0.676216185, 0.608678758 }}, 53091, 53517, nil, nil, 163706, }, -- Nimar the Slayer
		{ 142709, 3207, -1, -1, 121, {{ 0.654105186, 0.709066153 }, { 0.654105186, 0.709066153 }}, 53083, 53504, nil, nil, 163644, }, -- Beastrider Kama
		{ 142716, 3214, -1, -1, 121, {{ 0.521666825, 0.7673949 }, { 0.521666825, 0.7673949 }}, 53090, 53515, nil, nil, 163712, }, -- Man-Hunter Rog
		{ 142725, 3211, -1, -1, 121, {{ 0.26741749, 0.325686961 }, { 0.193621472, 0.611910701 }}, 53087, 53512, nil, nil, 163736, }, -- Horrific Apparition
		{ 142739, 3212, 1, -1, 121, { nil, { 0.489078581, 0.399451733 }}, nil, 53088, nil, nil, 163578, }, -- Knight-Captain Aldrin
		{ 142741, 3209, -1, 1, 121, {{ 0.534679234, 0.577130377 }, nil }, 53085, nil, nil, nil, 163579, }, -- Doomrider Helgrim
	}
)

local L = TCL.Locales

for creatureID, creature in pairs(TCL.Data["Creatures"].records) do
	local key = creatureID .. "_DESC"
	local description = L[key]
	if description ~= key then
		if L.IsTranslationNeeded(key) then
			description = "(" .. L["Translator_Needed"] .. ")\n" .. description
		end
		creature["Description"] = description
	end
end
