local TCL = select(2, ...).TomCatsLibs
TCL.Data.loadData(
	"Creatures",
	{ "Creature ID", "Vignette ID", "Alliance React", "Horde React", "Level", "Locations", "Alliance Tracking ID", "Horde Tracking ID", "World Quest ID", "Bonus Roll Tracking ID", "Loot", },
	{
		{ 152415, 3711, -1, -1, 120, {{0.524, 0.417 }, { 0.524, 0.417 }}, 56279, 56279, nil, nil, { items = {170189,} }, }, -- Alga the Eyeless
		{ 152416, 3712, -1, -1, 120, {{0.6927, 0.396 }, { 0.6927, 0.396 }}, 56280, 56280, nil, nil, { items = {170188,} }, }, -- Allseer Oma'kil
		{ 152794, 3699, -1, -1, 120, {{0.722, 0.362 }, { 0.722, 0.362 }}, 56268, 56268, nil, nil, { items = {169363,} }, }, -- Amethyst Spireshell
		{ 152566, 3713, -1, -1, 120, {{0.588, 0.546 }, { 0.588, 0.546 }}, 56281, 56281, nil, nil, { items = {170184,169332,170183,} }, }, -- Anemonar
		{ 150191, 3597, -1, -1, 120, {{0.369, 0.112 }, { 0.369, 0.112 }}, 55584, 55584, nil, nil, { items = {169373,169612,169613,} }, }, -- Avarius
		{ 152361, 3714, -1, -1, 120, {{0.716, 0.542 }, { 0.716, 0.542 }}, 56282, 56282, nil, nil, { items = {170179,170177,} }, }, -- Banescale the Packfather
		{ 152712, 3700, -1, -1, 120, {{0.364, 0.8 }, { 0.364, 0.8 }}, 56269, 56269, nil, nil, { items = {169372,169332,170191,170190,} }, }, -- Blindlight
		{ 149653, 3598, -1, -1, 120, {{0.548, 0.42 }, { 0.548, 0.42 }}, 55366, 55366, nil, nil, { items = {169375,169611,} }, }, -- Carnivorous Lasher
		{ 152464, 3715, -1, -1, 120, {{0.4079, 0.0735 }, { 0.4079, 0.0735 }}, 56283, 56283, nil, nil, { items = {169356,170171,} }, }, -- Caverndark Terror
		{ 152556, 3701, -1, -1, 120, {{0.496, 0.882 }, { 0.496, 0.882 }}, 56270, 56270, nil, nil, { items = {170167,169234,} }, }, -- Chasm-Haunter
		{ 152756, 3702, -1, -1, 120, {{0.578, 0.396 }, { 0.578, 0.396 }}, 56271, 56271, nil, nil, { items = {169361,} }, }, -- Daggertooth Terror
		{ 152291, 3704, -1, -1, 120, {{0.574, 0.5 }, { 0.574, 0.5 }}, 56272, 56272, nil, nil, { items = {170176,} }, }, -- Deepglider
		{ 152414, 3716, -1, -1, 120, {{0.642, 0.356 }, { 0.642, 0.356 }}, 56284, 56284, nil, nil, { items = {170188,} }, }, -- Elder Unu
		{ 152555, 3717, -1, -1, 120, {{0.522, 0.74 }, { 0.522, 0.74 }}, 56285, 56285, nil, nil, { items = {169359,170167,} }, }, -- Elderspawn Nalaada
		{ 152553, 3705, -1, -1, 120, {{0.374, 0.402 }, { 0.374, 0.402 }}, 56273, 56273, nil, nil, { items = {170180,} }, }, -- Garnetscale
		{ 152448, 3718, -1, -1, 120, {{0.472, 0.55 }, { 0.472, 0.55 }}, 56286, 56286, nil, nil, { items = {169352,170171,} }, }, -- Iridescent Glimmershell
		{ 152567, 3719, -1, -1, 120, {{0.506, 0.692 }, { 0.506, 0.692 }}, 56287, 56287, nil, nil, { items = {170184,169332,170183,} }, }, -- Kelpwillow
		{ 152323, 3619, -1, -1, 120, {{0.288, 0.29 }, { 0.288, 0.29 }}, 55671, 55671, nil, nil, { items = {169371,169332,170190,} }, }, -- King Gakula
		{ 144644, 3706, -1, -1, 120, {{0.372, 0.132 }, { 0.372, 0.132 }}, 56274, 56274, nil, nil, { items = {169366,170172,} }, }, -- Mirecrawler
		{ 152465, 3707, -1, -1, 120, {{0.52, 0.172 }, { 0.52, 0.172 }}, 56275, 56275, nil, nil, { items = {169355,170171,} }, }, -- Needlespine
		{ 152397, 3720, -1, -1, 120, {{0.782, 0.256 }, { 0.782, 0.256 }}, 56288, 56288, nil, nil, { items = {170184,169332,170183,} }, }, -- Oronu
		{ 152681, 3721, -1, -1, 120, {{0.43, 0.876 }, { 0.43, 0.876 }}, 56289, 56289, nil, nil, { items = {169367,169332,} }, }, -- Prince Typhonus
		{ 152682, 3722, -1, -1, 120, {{0.43, 0.758 }, { 0.43, 0.758 }}, 56290, 56290, nil, nil, { items = {169368,169333,} }, }, -- Prince Vortran
		{ 150583, 3723, -1, -1, 120, {{0.606, 0.496 }, { 0.606, 0.496 }}, 56291, 56291, nil, nil, { items = {169374,169334,169332,170192,169480,169484,169485,169479,169483,169478,169481,169482,170512,} }, }, -- Rockweed Shambler
		{ 151870, 3708, -1, -1, 120, {{0.5, 0.5 }, { 0.5, 0.5 }}, 56276, 56276, nil, nil, { items = {169369,169334,170512,} }, }, -- Sandcastle
		{ 152795, 3709, -1, -1, 120, {{0.648, 0.406 }, { 0.648, 0.406 }}, 56277, 56277, nil, nil, { items = {169350,170171,} }, }, -- Sandclaw Stoneshell
		{ 152548, 3724, -1, -1, 120, {{0.356, 0.412 }, { 0.356, 0.412 }}, 56292, 56292, nil, nil, { items = {169370,170185,168519,} }, }, -- Scale Matriarch Gratinax
		{ 152545, 3725, -1, -1, 120, {{0.276, 0.368 }, { 0.276, 0.368 }}, 56293, 56293, nil, nil, { items = {169370,170185,} }, }, -- Scale Matriarch Vynara
		{ 152542, 3726, -1, -1, 120, {{0.287, 0.463 }, { 0.287, 0.463 }}, 56294, 56294, nil, nil, { items = {169370,170185,} }, }, -- Scale Matriarch Zodia
		{ 152552, 3727, -1, -1, 120, {{0.634, 0.116 }, { 0.634, 0.116 }}, 56295, 56295, nil, nil, { items = {170187,170167,} }, }, -- Shassera
		{ 153658, 3728, -1, -1, 120, {{0.41, 0.11 }, { 0.41, 0.11 }}, 56296, 56296, nil, nil, { items = {170182,170181,} }, }, -- Shiz'narasz the Consumer
		{ 152359, 3729, -1, -1, 120, {{0.714, 0.548 }, { 0.714, 0.548 }}, 56297, 56297, nil, nil, { items = {170179,170177,168198,} }, }, -- Siltstalker the Packmother
		{ 152290, 3730, -1, -1, 120, {{0.546, 0.504 }, { 0.546, 0.504 }}, 56298, 56298, nil, nil, { items = {169163,170176,} }, }, -- Soundless
		{ 153898, 3675, -1, -1, 120, {{0.6245, 0.2964 }, { 0.6245, 0.2964 }}, 56122, 56122, nil, nil, { items = {170502,169332,170512,} }, }, -- Tidelord Aquatus
		{ 153928, 3676, -1, -1, 120, {{0.586, 0.27 }, { 0.586, 0.27 }}, 56123, 56123, nil, nil, { items = {170502,169332,170193,} }, }, -- Tidelord Dispersius
		{ 154148, 3674, -1, -1, 120, {{0.6716, 0.2323 }, { 0.6716, 0.2323 }}, 56106, 56106, nil, nil, { items = {170196,169333,170195,} }, }, -- Tidemistress Leth'sindra
		{ 152360, 3710, -1, -1, 120, {{0.648, 0.464 }, { 0.648, 0.464 }}, 56278, 56278, nil, nil, { items = {170178,170177,170179,} }, }, -- Toxigore the Alpha
		{ 152568, 3731, -1, -1, 120, {{0.316, 0.306 }, { 0.316, 0.306 }}, 56299, 56299, nil, nil, { items = {170184,170183,} }, }, -- Urduu
		{ 151719, 3732, -1, -1, 120, {{0.678, 0.348 }, { 0.678, 0.348 }}, 56300, 56300, nil, nil, { items = {170186,} }, }, -- Voice in the Deeps
		{ 150468, 3599, -1, -1, 120, {{0.4834, 0.2399 }, { 0.4834, 0.2399 }}, 55603, 55603, nil, nil, { items = {169376,168650,170066,170067,170181,} }, }, -- Vor'koth
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
