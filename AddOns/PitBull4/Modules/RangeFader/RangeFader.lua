
local PitBull4 = _G.PitBull4
local L = PitBull4.L

local PitBull4_RangeFader = PitBull4:NewModule("RangeFader")

PitBull4_RangeFader:SetModuleType("fader")
PitBull4_RangeFader:SetName(L["Range fader"])
PitBull4_RangeFader:SetDescription(L["Make the unit frame fade if out of range."])
PitBull4_RangeFader:SetDefaults({
	enabled = false,
	out_of_range_opacity = 0.6,
	check_method = "class",
})

function PitBull4_RangeFader:OnEnable()
	self:ScheduleRepeatingTimer("UpdateNonWacky", 0.7)
end

local friendly_spells = {}
local pet_spells = {}
local enemy_spells = {}
local long_enemy_spells = {}
local res_spells = {}

do
	local class = UnitClassBase("player")
	if class == "DEATHKNIGHT" then
		enemy_spells[#enemy_spells+1] = GetSpellInfo(47541) -- Death Coil (30)
		res_spells[#res_spells+1] = GetSpellInfo(61999) -- Raise Ally
	elseif class == "DEMONHUNTER" then
		enemy_spells[#enemy_spells+1] = GetSpellInfo(344862) -- Chaos Strike (Melee)
		long_enemy_spells[#long_enemy_spells+1] = GetSpellInfo(185245) -- Torment (30)
	elseif class == "DRUID" then
		enemy_spells[#enemy_spells+1] = GetSpellInfo(5176) -- Wrath (40)
		friendly_spells[#friendly_spells+1] = GetSpellInfo(8936) -- Regrowth
		res_spells[#res_spells+1] = GetSpellInfo(50769) -- Revive
	elseif class == "EVOKER" then
		enemy_spells[#enemy_spells+1] = GetSpellInfo(361469) -- Living Flame (25)
		friendly_spells[#friendly_spells+1] = GetSpellInfo(355913) -- Emerald Blossom (25)
		res_spells[#res_spells+1] = GetSpellInfo(361227) -- Return
	elseif class == "HUNTER" then
		enemy_spells[#enemy_spells+1] = GetSpellInfo(185358) -- Arcane Shot (40)
		pet_spells[#pet_spells+1] = GetSpellInfo(136) -- Mend Pet
	elseif class == "MAGE" then
		-- enemy_spells[#enemy_spells+1] = GetSpellInfo(118) -- Polymorph (35)
		enemy_spells[#enemy_spells+1] = GetSpellInfo(116) -- Frostbolt (40)
		friendly_spells[#friendly_spells+1] = GetSpellInfo(130) -- Slow Fall
	elseif class == "MONK" then
		enemy_spells[#enemy_spells+1] = GetSpellInfo(115546) -- Provoke (30)
		long_enemy_spells[#long_enemy_spells+1] = GetSpellInfo(117952) -- Crackling Jade Lightning (40)
		friendly_spells[#friendly_spells+1] = GetSpellInfo(116670) -- Vivify
		res_spells[#res_spells+1] = GetSpellInfo(115178) -- Resuscitate
	elseif class == "PALADIN" then
		enemy_spells[#enemy_spells+1] = GetSpellInfo(62124) -- Hand of Reckoning (30)
		friendly_spells[#friendly_spells+1] = GetSpellInfo(1044) -- Hand of Freedom
		res_spells[#res_spells+1] = GetSpellInfo(7328) -- Redemption
	elseif class == "PRIEST" then
		-- enemy_spells[#enemy_spells+1] = GetSpellInfo(528) -- Dispel Magic (30)
		enemy_spells[#enemy_spells+1] = GetSpellInfo(585) -- Smite (40)
		friendly_spells[#friendly_spells+1] = GetSpellInfo(2061) -- Flash Heal
		res_spells[#res_spells+1] = GetSpellInfo(2006) -- Resurrection
	elseif class == "ROGUE" then
		enemy_spells[#enemy_spells+1] = GetSpellInfo(185763) -- Pistol Shot (20 - Outlaw)
		enemy_spells[#enemy_spells+1] = GetSpellInfo(36554) -- Shadowstep (25)
		enemy_spells[#enemy_spells+1] = GetSpellInfo(1752) -- Sinister Strike (Melee)
		friendly_spells[#friendly_spells+1] = GetSpellInfo(57934) -- Tricks of the Trade
	elseif class == "SHAMAN" then
		-- enemy_spells[#enemy_spells+1] = GetSpellInfo(57994) -- Wind Shear (30)
		enemy_spells[#enemy_spells+1] = GetSpellInfo(188196) -- Lightning Bolt (40)
		friendly_spells[#friendly_spells+1] = GetSpellInfo(8004) -- Healing Surge
		res_spells[#res_spells+1] = GetSpellInfo(2008) -- Ancestral Spirit
	elseif class == "WARLOCK" then
		-- enemy_spells[#enemy_spells+1] = GetSpellInfo(5782) -- Fear (35)
		enemy_spells[#enemy_spells+1] = GetSpellInfo(686) -- Shadow Bolt (40)
		pet_spells[#pet_spells+1] = GetSpellInfo(755) -- Health Funnel
		friendly_spells[#friendly_spells+1] = GetSpellInfo(5697) -- Unending Breath
		res_spells[#res_spells+1] = GetSpellInfo(20707) -- Soulstone
	elseif class == "WARRIOR" then
		enemy_spells[#enemy_spells+1] = GetSpellInfo(100) -- Charge (8-25)
		enemy_spells[#enemy_spells+1] = GetSpellInfo(1464) -- Slam (Melee)
		long_enemy_spells[#long_enemy_spells+1] = GetSpellInfo(355) -- Taunt (30)
		friendly_spells[#friendly_spells+1] = GetSpellInfo(3411) -- Intervene
	end
end

local function friendly_is_in_range(unit)
	if UnitIsDeadOrGhost(unit) then
		for _, name in ipairs(res_spells) do
			if IsSpellInRange(name, unit) == 1 then
				return true
			end
		end

		-- Only check range for resurrection spells if the
		-- unit is dead.
		return false
	end

	for _, name in ipairs(friendly_spells) do
		if IsSpellInRange(name, unit) == 1 then
			return true
		end
	end

	return false
end

local function pet_is_in_range(unit)
	for _, name in ipairs(friendly_spells) do
		if IsSpellInRange(name, unit) == 1 then
			return true
		end
	end
	for _, name in ipairs(pet_spells) do
		if IsSpellInRange(name, unit) == 1 then
			return true
		end
	end

	return false
end

local function enemy_is_in_range(unit)
	for _, name in ipairs(enemy_spells) do
		if IsSpellInRange(name, unit) == 1 then
			return true
		end
	end

	return false
end

local function enemy_is_in_long_range(unit)
	for _, name in ipairs(long_enemy_spells) do
		if IsSpellInRange(name, unit) == 1 then
			return true
		end
	end

	return false
end

function PitBull4_RangeFader:GetOpacity(frame)
	local unit = frame.unit
	local db = self:GetLayoutDB(frame)
	local check_method = db.check_method

	if UnitIsUnit(unit, "player") then
		return 1
	end

	if check_method == "custom_spell" and db.custom_spell then
		if IsSpellInRange(db.custom_spell, unit) == 1 then
			return 1
		else
			return db.out_of_range_opacity
		end
	elseif check_method == "helpful" then
		if UnitInRange(unit) then
			return 1
		else
			return db.out_of_range_opacity
		end
	elseif check_method == "visible" then
		if UnitIsVisible(unit) then
			return 1
		else
			return db.out_of_range_opacity
		end
	else -- class
		if UnitCanAttack("player", unit) then
			if enemy_is_in_range(unit) then
				return 1
			elseif enemy_is_in_long_range(unit) then
				return (db.out_of_range_opacity + frame.layout_db.opacity_max) / 2
			else
				return db.out_of_range_opacity
			end
		elseif UnitIsUnit(unit, "pet") then
			if pet_is_in_range(unit) then
				return 1
			else
				return db.out_of_range_opacity
			end
		else
			if friendly_is_in_range(unit) then
				return 1
			else
				return db.out_of_range_opacity
			end
		end
	end
end

PitBull4_RangeFader:SetLayoutOptionsFunction(function(self)
	local range_pattern = _G.SPELL_RANGE:gsub("%%s", ".-")
	local function get_spell_range(spell_id)
		local data = C_TooltipInfo.GetSpellByID(spell_id, true)
		if not data then return end

		for _, line in next, data.lines do
			TooltipUtil.SurfaceArgs(line)
			if line.type == 0 then
				if line.leftText and line.leftText:find(range_pattern) then
					return line.leftText
				elseif line.rightText and line.rightText:find(range_pattern) then
					return line.rightText
				end
			end
		end
		return _G.SPELL_RANGE:format("??")
	end

	return 'out_of_range', {
		type = 'range',
		name = L["Out-of-range opacity"],
		desc = L["The opacity to display if the player is out of range of the unit."],
		min = 0,
		max = 1,
		isPercent = true,
		get = function(info)
			local db = PitBull4.Options.GetLayoutDB(self)

			return db.out_of_range_opacity
		end,
		set = function(info, value)
			local db = PitBull4.Options.GetLayoutDB(self)

			db.out_of_range_opacity = value

			PitBull4.Options.UpdateFrames()
			PitBull4:RecheckAllOpacities()
		end,
		step = 0.01,
		bigStep = 0.05,
	}, 'check_method', {
		type = 'select',
		name = L["Range check method"],
		desc = L["Choose the method to determine if the unit is in range."],
		values = {
			helpful = L["Helpful spells (~40 yards)"],
			class = L["Class abilities"],
			custom_spell = L["Custom spell"],
			visible = L["Visible (~100 yards)"],
		},
		get = function(info)
			local db = PitBull4.Options.GetLayoutDB(self)

			return db.check_method
		end,
		set = function(info, value)
			local db = PitBull4.Options.GetLayoutDB(self)

			db.check_method = value

			PitBull4.Options.UpdateFrames()
			PitBull4:RecheckAllOpacities()
		end,
		width = 'double',
	}, 'class_spell_info', {
		type = "description",
		name = function(info)
			local desc = ""
			-- spells are the name, so they should only return info if known (hopefully similar to IsSpellInRange >.>)
			for _, spell in ipairs(enemy_spells) do
				local _, _, icon, _, _, _, spell_id = GetSpellInfo(spell)
				if spell_id then
					desc = desc .. ("%s: |T%s:16|t|cff71d5ff[%s]|h|r (%s)\n"):format(L["Hostile"], icon, spell, get_spell_range(spell_id))
					break
				end
			end
			for _, spell in ipairs(long_enemy_spells) do
				local _, _, icon, _, _, _, spell_id = GetSpellInfo(spell)
				if spell_id then
					desc = desc .. ("%s: |T%s:16|t|cff71d5ff[%s]|h|r (%s)\n"):format(L["Hostile, Long-range"], icon, spell, get_spell_range(spell_id))
					break
				end
			end
			for _, spell in ipairs(friendly_spells) do
				local _, _, icon, _, _, _, spell_id = GetSpellInfo(spell)
				if spell_id then
					desc = desc .. ("%s: |T%s:16|t|cff71d5ff[%s]|h|r (%s)\n"):format(L["Friendly"], icon, spell, get_spell_range(spell_id))
					break
				end
			end
			for _, spell in ipairs(pet_spells) do
				local _, _, icon, _, _, _, spell_id = GetSpellInfo(spell)
				if spell_id then
					desc = desc .. ("%s: |T%s:16|t|cff71d5ff[%s]|h|r (%s)\n"):format(L["Pet"], icon, spell, get_spell_range(spell_id))
					break
				end
			end
			return desc
		end,
		width = "full",
		hidden = function(info)
			local db = PitBull4.Options.GetLayoutDB(self)
			return not db.enabled or db.check_method ~= "class"
		end,
	}, 'custom_spell', {
		type = 'input',
		name = L["Custom spell"],
		desc = L["Enter the name of the spell you want use to check the range with."],
		get = function(info)
			local db = PitBull4.Options.GetLayoutDB(self)

			return db.custom_spell
		end,
		set = function(info, value)
			local db = PitBull4.Options.GetLayoutDB(self)

			db.custom_spell = value

			PitBull4.Options.UpdateFrames()
			PitBull4:RecheckAllOpacities()
		end,
		hidden = function(info)
			local db = PitBull4.Options.GetLayoutDB(self)
			return db.check_method ~= "custom_spell"
		end,
	}
end)
