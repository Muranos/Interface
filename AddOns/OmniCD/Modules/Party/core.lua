local E, L, C = select(2, ...):unpack()

local P = CreateFrame("Frame")
local IsInRaid = IsInRaid
local UnitBuff = UnitBuff
local UnitDebuff = UnitDebuff

function P:Enable()
	if self.enabled then
		return
	end

	self:RegisterEvent("UI_SCALE_CHANGED")
	self:RegisterEvent("CVAR_UPDATE")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("GROUP_ROSTER_UPDATE")
	self:RegisterEvent("GROUP_JOINED")
	self:SetScript("OnEvent", function(self, event, ...)
		self[event](self, ...)
	end)

	self.enabled = true

	self:SetHooks()
	self:CreateBars()
	self:Refresh(true)
end

function P:Disable()
	if not self.enabled then
		return
	end

	if self.test then
		self:Test()
	end
	self:UnregisterAllEvents()
	self:ResetModule()

	self.disabled = true
	self.disabledzone = true
	self.enabled = false
end

function P:ResetModule()
	E.Comms:Disable()
	E.Cooldowns:Disable()

	self:ResetGroupInfo()
	self:HideAllBars()
end

function P:Refresh(full)
	if not self.enabled then
		return
	end

	self.hideMe = not self.test and not E.db.general.player
	self:UpdatePositionValues()

	E.Cooldowns:RefreshCD()

	if full then
		if not E.db.icons.autoScale then
			local oldScale = self.iconScale
			self.iconScale = E.db.icons.scale

			if oldScale ~= self.iconScale then
				self:UpdateBackdrop()
			end
		end
		--> autoScale in UpdatePosition

		E.UpdateEnabledLT(self)

		self:PLAYER_ENTERING_WORLD(nil, true)
	else
		self:UpdateBars()
		self:UpdatePosition()
	end
end

function P:UpdatePositionValues()
	local k

	if E.db.position.detached then
		k = "manual"
	elseif E.db.position.arena.noTheme then
		k = "arena"
	else
		if not self.theme then
			local size = self.size or GetNumGroupMembers()
			self.theme = size > 5 and "raid" or (size > 3 and "party") or "arena"
		end

		k = self.theme
	end

	self.point = E.db.position[k].anchor
	self.relativePoint = E.db.position[k].attach
	self.columns = E.db.position[k].columns
	self.doubleRow = E.db.position[k].layout == "doubleRow"
	self.breakPoint = E.db.position[k].breakPoint
	self.displayInactive = E.db.position[k].displayInactive

	local growUpward = E.db.position[k].growUpward
	local growLeft = string.find(self.point, "RIGHT")
	local growX = growLeft and -1 or 1
	local growY = growUpward and 1 or -1

	self.anchorPoint = growLeft and "BOTTOMLEFT" or "BOTTOMRIGHT"
	self.containerOfsX = E.db.position[k].offsetX * growX
	self.containerOfsY = -E.db.position[k].offsetY

	if E.db.position[k].layout == "vertical" then
		self.point2 = growUpward and "BOTTOMRIGHT" or "TOPRIGHT"
		self.relativePoint2 = growUpward and "TOPRIGHT" or "BOTTOMRIGHT"
		self.ofsX = growX * (E.BASE_ICON_SIZE + E.db.icons.paddingX)
		self.ofsY = 0
		self.ofsX2 = 0
		self.ofsY2 = growY * E.db.icons.paddingY
	else
		self.point2 = growLeft and "TOPRIGHT" or "TOPLEFT"
		self.relativePoint2 = growLeft and "TOPLEFT" or "TOPRIGHT"
		self.ofsX = 0
		self.ofsY = growY * (E.BASE_ICON_SIZE + E.db.icons.paddingY)
		self.ofsX2 = growX * E.db.icons.paddingX
		self.ofsY2 = 0
	end
end

-- Event fires multiple times with different unitIDs
function P:FindIndexByUnit(unit, includePets)
	local t
	if self.isInRaid then
		t = includePets and E.RAID_PET_INDEX or E.RAID_INDEX
	else
		t = includePets and E.PARTY_PET_INDEX or E.PARTY_INDEX
	end

	return t[unit]
end

function P:GetBuffDuration(unit, spellID)
	for i = 1, 40 do
		local _,_,_,_, duration, expTime,_,_,_, id = UnitBuff(unit, i)
		if not id then return end
		if id == spellID then
			return duration > 0 and expTime - GetTime()
		end
	end
end

function P:GetDebuffDuration(unit, spellID)
	for i = 1, 40 do
		local _,_,_,_, duration, expTime,_,_,_, id = UnitDebuff(unit, i)
		if not id then return end
		if id == spellID then
			return duration > 0 and expTime - GetTime()
		end
	end
end

function P:GetGroupSize()
	return self.size == 0 and self.test and 1 or self.size or 0
end

function P:GetUnitByIndex(index)
	local raid = self.isInRaid or IsInRaid()
	return raid and E.RAID_UNIT[index] or E.PARTY_UNIT[index]
end

function P:GetValueByType(v, guid)
	if not v then return end

	if type(v) == "table" then
		return v[self.groupInfo[guid].spec] or v.default
	else
		return v
	end
end

function P:HideAllBars()
	for i = 1, self.numBars do
		local bar = self.spellBars[i]
		bar:Hide()
	end
end

function P:IsTalent(talentID, guid)
	if not talentID then return true end

	local talentLT = self.groupInfo[guid].talentLT
	if talentLT and talentLT[talentID] and (talentLT[talentID] == 0 or self.pvp) then
		return true
	end
end

function P:IsEquipped(itemID, guid)
	local slotLT = self.groupInfo[guid].slotLT
	if itemID and slotLT and slotLT[itemID] then
		return true
	end
end

function P.IsSpellEnabled(v)
	local spellID = v.spellID
	local key = "spell" .. spellID
	if type(E.db.spells[key]) == "boolean" then
		if E.db.spells[key] then
			return true
		end
	elseif not E.db.noDefault and v.default then
		return true
	end
end

function P:ConfirmReload(text, data, data2)
	local dialog = StaticPopup_Show("OMNICD_RELOADUI", text)
	dialog.data = data
	dialog.data2 = data2
	dialog:SetFrameStrata("TOOLTIP")
end

function P:UI_SCALE_CHANGED() -- windowed mode Elv
	E:SetNumPixels()
	self:ConfigSize()
end

E["Party"] = P
