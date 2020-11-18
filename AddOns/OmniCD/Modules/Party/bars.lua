local E, L, C = select(2, ...):unpack()

local P = E["Party"]
local tinsert = table.insert
local tremove = table.remove
local wipe = table.wipe
local GetSpellLevelLearned = GetSpellLevelLearned
local UnitGUID = UnitGUID
local spellList = E.spellList
local cdModifiedByTalent = E.cdModifiedByTalent
local chModifiedByTalent = E.chModifiedByTalent
local cdModifiedByTalentMult = E.cdModifiedByTalentMult
local cxModifiedByAzerite = E.cxModifiedByAzerite
local cdModifiedByEssence = E.cdModifiedByEssence
local essRank2 = E.essRank2
local essRank2CdFix = E.essRank2CdFix
local essRank3ChFix = E.essRank3ChFix
local essStrive = E.essStrive
local LUMINOUS_BARRIER = 271466

P.spellBars = {}
P.enabledLT = {}
P.numBars = 0

local unusedIcons = {}
local numIcons = 0

-- 9.0 backward compatible
local OmniCDButtonTemplate = E.Shadowlands and "OmniCDButtonTemplate, BackdropTemplate" or "OmniCDButtonTemplate"

function P:CreateBar(i)
	local bar = CreateFrame("Frame", "OmniCD" .. i, UIParent, "OmniCDTemplate")
	bar.modname = "Party"
	bar.key = i
	bar.icons = {}
	bar.numIcons = 0
	bar.anchor:Hide()
	bar.anchor.text:SetText(i)

	self.numBars = self.numBars + 1

	self.spellBars[i] = bar
end

function P:CreateBars()
	if self.numBars > 0 then return end

	for i = 1, 40 do -- [18]
		self:CreateBar(i)
	end
end

local function SetIconBackdrop(icon)
	local scale = P.iconScale or E.db.icons.scale
	local numPixels = E.db.icons.twoPixelBorder and (2 * E.NumPixels) or E.NumPixels
	icon:SetBackdrop({
		edgeFile = E.TEXTURES.White8x8,
		edgeSize = numPixels / scale,
	})
	icon:SetBackdropBorderColor(E.db.icons.borderColor.r, E.db.icons.borderColor.g, E.db.icons.borderColor.b, 1)
end

function P:UpdateBarBackdrop(bar)
	local icons = bar.icons
	for i = 1, bar.numIcons do
		local icon = icons[i]
		SetIconBackdrop(icon)
	end
end

function P:UpdateBackdrop()
	if not E.db.icons.displayBorder or not E.db.icons.pixelPerfect then
		return
	end

	for i = 1, self.numBars do
		local bar = self.spellBars[i]
		self:UpdateBarBackdrop(bar)
	end

	for i = 1, #unusedIcons do
		local icon = unusedIcons[i]
		SetIconBackdrop(icon)
	end
end

local function GetIcon(bar)
	local icon = tremove(unusedIcons)
	if not icon then
		numIcons = numIcons + 1
		icon = CreateFrame("Button", "OmniCDIcon" .. numIcons, UIParent, OmniCDButtonTemplate)
		icon.counter = icon.cooldown:GetRegions()
		SetIconBackdrop(icon)
	end
	icon:SetParent(bar.container)

	bar.icons[bar.numIcons] = icon

	return icon
end

local function RemoveIcons(bar, numIcons)
	for i = #bar.icons, numIcons, -1 do
		local icon = bar.icons[i]
		P:HideOverlayGlow(icon)
		icon:Hide()
		tinsert(unusedIcons, icon)
		bar.icons[i] = nil
	end
end

function OmniCD_BarOnHide(self)
	if P.groupInfo[self.guid] and P.groupInfo[self.guid].index == self.key then -- Bypass UpdatePosition Hide
		return
	end

	RemoveIcons(self, 1)
	self.numIcons = 0
end

local function IsSpellSpecTalent(v, guid)
	local spec = v.spec
	if not spec then return true end

	local specID = P.groupInfo[guid].spec
	if specID then
		if type(spec) == "table" then
			for _, id in pairs(spec) do
				if id == specID then return true end
				if id == true then -- Avatar and Ursol's Vertex
					return P:IsTalent(v.spellID, guid)
				end
			end
		else
			local talentID = type(spec) == "number" and spec or v.spellID
			return P:IsTalent(talentID, guid)
		end
	end
end

local function AddIcon(bar, v, guid, i)
	local info = P.groupInfo[guid]

	if not info then
		return
	end

	bar.numIcons = bar.numIcons + 1

	local spellID, type, buff, texture = v.spellID, v.type, v.buff, v.icon
	local cd = P:GetValueByType(v.duration, guid)
	local ch = P:GetValueByType(v.charges, guid) or 1

	if info.talentLT and info.slotLT then
		if i == 5 then
			local essCdFix = essRank2CdFix[spellID]
			if essCdFix then
				if essRank2[ info.slots[3] ] then
					cd = cd - essCdFix
				end
			end

			local essChFix = essRank3ChFix[spellID]
			if essChFix then
				if essChFix[1] == info.slots[3] then
					ch = ch + essChFix[2]
				end
			end
		elseif i == 4 then
			local modData = cdModifiedByTalent[spellID]
			if modData and P:IsTalent(modData.talent, guid) then
				cd = cd - modData.duration
			end

			local modData = chModifiedByTalent[spellID]
			if modData and P:IsTalent(modData.talent, guid) then
				ch = ch + modData.charges
			end

			local modData = cdModifiedByTalentMult[spellID]
			if modData and P:IsTalent(modData.talent, guid) then
				cd = cd * modData.multiplier
			end

			local modData = cxModifiedByAzerite[spellID]
			if modData and P:IsEquipped(modData.azerite, guid) then
				if modData.duration then
					cd = cd - modData.duration
				elseif modData.charges then
					ch = ch + modData.charges
				end
			end

			if essStrive[ info.talents[13] ] then
				local modData = cdModifiedByEssence[spellID]
				if modData == true or modData == info.spec then
					cd = cd * info.slotLT.mult

					info.slotLT["multID"] = spellID
				elseif spellID == 107574 and info.spec == 71 then -- Blizzard bug
					cd = cd - 5
				end
			end

			if spellID == 197590 then -- Luminous Barrier with Dome of Light temp fix
				if P:IsTalent(LUMINOUS_BARRIER, guid) then
					buff = LUMINOUS_BARRIER
					texture = select(2, GetSpellTexture(LUMINOUS_BARRIER))
				end
			end
		end
	end

	local icon = bar.icons[bar.numIcons] or GetIcon(bar)
	icon.guid = guid
	icon.spellID = spellID
	icon.type = type
	icon.buff = buff or spellID
	icon.duration = cd
	icon.maxcharges = ch > 1 and ch
	icon.Count:SetText(icon.maxcharges or "")
	icon.icon:SetTexture(texture)
	icon.active = nil

	P:HideOverlayGlow(icon)

	local active = info.active[spellID]
	if active then
		local charges
		if icon.maxcharges then
			if not active.charges then
				charges = icon.maxcharges - 1
				active.charges = charges
			else
				charges = active.charges
			end
			icon.Count:SetText(charges)
		else
			active.charges = nil -- rmk#10 Fix
			charges = -1
		end

		P:UpdateCooldown(icon, 0, charges)
	else
		icon.cooldown:Clear()
	end

	if info[spellID] and not icon.overlay then -- Enabled spell type
		icon.icon:SetVertexColor(0.4, 0.4, 0.4)
	else
		icon.icon:SetVertexColor(1, 1, 1)
	end

	info.spellIcons[spellID] = icon
end

local ignored = {}

function P:UpdateUnitBar(index)
	local unit = self:GetUnitByIndex(index)
	local guid = UnitGUID(unit)
	local info = self.groupInfo[guid]

	if not info then
		return
	end

	info.active = info.active or {}
	if info.spellIcons then
		wipe(info.spellIcons)
	else
		info.spellIcons = {}
	end
	info.isPvpMultApplied = nil

	local class, raceID = info.class, info.raceID
	local classSpells = spellList[class]
	local numClassSpells = #classSpells
	local numCategories = self.isInBG and E.db.general.bgTrinket and 1 or 5

	local bar = self.spellBars[index]
	bar.guid = guid
	bar.class = class
	bar.raceID = raceID
	bar.numIcons = 0

	wipe(ignored)

	for i = 1, numClassSpells do
		local v = classSpells[i]
		local spellID = v.spellID

		if IsSpellSpecTalent(v, guid) then
			local parent = v.parent
			if parent then
				local id = v.parent2 or (v.hide and spellID)
				if id then
					ignored[id] = true
				end

				ignored[parent] = true
			end

			if v.pve and self.pvp then
				ignored[spellID] = true
			end
		else
			ignored[spellID] = true
		end
	end

	for i = 1, numCategories do
		local catagory = (i == 1 and self.pvp and "TRINKET") or (i == 2 and "RACIAL") or (i == 3 and "ALL") or (i == 4 and class) or (i == 5 and "ESSENCES")
		local n = catagory and #spellList[catagory] or 0

		for j = 1, n do
			local v = spellList[catagory][j]
			local spellID = v.spellID
			if self.enabledLT[spellID] then
				if i == 4 then
					if not ignored[spellID] and info.level >= GetSpellLevelLearned(spellID) then
						AddIcon(bar, v, guid, i)
					end
				elseif i == 1 then
					if IsSpellSpecTalent(v, guid) then -- #iss48
						AddIcon(bar, v, guid)

						break
					end
				elseif i == 2 then
					if v.race == raceID then
						AddIcon(bar, v, guid)

						break
					end
				elseif not v.item or self:IsEquipped(v.item, guid) or self:IsEquipped(v.item2, guid) then
					AddIcon(bar, v, guid, i)
				end
			end
		end
	end

	RemoveIcons(bar, bar.numIcons + 1)

	self:SetIconLayout(bar)
	self:ApplySettings(bar)
end

function P:UpdateBars()
	local n = self:GetGroupSize()
	for i = 1, n do
		local index = not self.isInRaid and i == n and 5 or i
		if index == self.groupInfo[E.MyGUID].index then
			if not self.hideMe then
				E.Comms:InspectUnit(E.MyGUID)
			end
		else
			self:UpdateUnitBar(index)
		end
	end
end
