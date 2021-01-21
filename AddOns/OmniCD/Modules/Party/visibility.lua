local E, L, C = select(2, ...):unpack()

local GetNumGroupMembers = GetNumGroupMembers
local UnitExists = UnitExists
local UnitGUID = UnitGUID
local P = E["Party"]

P.groupInfo = {}
P.pendingQueue = {}

P.userData = {
	class = E.userClass,
	raceID = E.userRaceID,
	name = E.userName,
	level = E.userLevel,
	active = {},
	auras = {},
	spellIcons = {},
	preActiveIcons = {},
	glowIcons = {},
	talentData = {},
	invSlotData = {},
	shadowlandsData = {}
}

do
	local timer

	local function SendRequestSync() -- [58]
		local success = E.Comms:InspectPlayer()
		if success then
			E.Comms:RequestSync()
			P.groupJoined = false
		else
			C_Timer.After(5, SendRequestSync)
		end
	end

	local function updateRosterInfo(force)
		if not force then
			timer = nil
		end

		local size = P:GetEffectiveNumGroupMembers()
		local oldDisabled = P.disabled
		P.disabled = not P.test and (P.disabledzone or size == 0 or
			(size == 1 and P.isUserDisabled) or -- [82]
			(GetNumGroupMembers(LE_PARTY_CATEGORY_HOME) == 0 and not E.DB.profile.Party.visibility.finder) or
			(size > E.DB.profile.Party.visibility.size) or
			(size > 5 and E.customUF.enabled and not E.db.extraBars.raidCDBar.enabled))
		if P.disabled then
			if oldDisabled == false then
				P:ResetModule()
			end
			P.groupJoined = false
			return
		elseif oldDisabled ~= false then
			E.Comms:Enable()
			E.Cooldowns:Enable()
			force = true
		end

		for guid, info in pairs(P.groupInfo) do -- [42]
			if not UnitExists(info.name) or (guid == E.userGUID and P.isUserDisabled) then -- [82]
				P.groupInfo[guid] = nil
				info.bar:Hide()

				local cap = info.auras.capTotemGUID
				if cap then
					E.Cooldowns.totemGUIDS[cap] = nil
				end
				local petGUID = info.petGUID
				if petGUID then
					E.Cooldowns.petGUIDS[petGUID] = nil
				end
				E.Comms.syncGUIDS[guid] = nil
				E.Comms:DequeueInspect(guid)
			end
		end

		local isInRaid = IsInRaid() -- [89]
		for i = 1, size do
			local index = not isInRaid and i == size and 5 or i
			local unit = isInRaid and E.RAID_UNIT[index] or E.PARTY_UNIT[index]
			local guid = UnitGUID(unit)
			local info = P.groupInfo[guid]
			local _, class = UnitClass(unit)

			local pet = class == "HUNTER" and E.unitToPetId[unit]
			if pet then
				local petGUID = UnitGUID(pet)
				if petGUID then
					pet = petGUID
					E.Cooldowns.petGUIDS[petGUID] = guid
				end
			end

			if info then
				if info.unit ~= unit then
					info.index = index
					info.unit = unit
					info.bar.key = index
					info.bar.unit = unit
					info.bar.anchor.text:SetText(index)
					info.bar:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED", unit, unit == "player" and "pet" or unit .. "pet") -- [41]*
					info.bar:RegisterUnitEvent("PLAYER_SPECIALIZATION_CHANGED", unit)
				end
				if force then -- [37]*
					P.pendingQueue[#P.pendingQueue + 1] = guid
					P:UpdateUnitBar(guid)
				end
			elseif guid == E.userGUID then
				if not P.isUserDisabled then -- [82]
					P.groupInfo[guid] = P.userData
					P.groupInfo[guid].index = index
					P.groupInfo[guid].unit = unit
					P.groupInfo[guid].petGUID = pet

					P:UpdateUnitBar(guid) -- [49]
				end
			elseif class then -- [32]
				local _,_, race = UnitRace(unit)
				local name = GetUnitName(unit, true)
				local level = UnitLevel(unit)
				if level == 0 then
					level = 200
				end
				P.groupInfo[guid] = {
					class = class,
					raceID = race,
					name = name,
					level = level,
					index = index,
					unit = unit,
					petGUID = pet,
					active = {},
					auras = {},
					spellIcons = {},
					preActiveIcons = {},
					glowIcons = {},
					talentData = {},
					invSlotData = {},
					shadowlandsData = {},
				}

				P.pendingQueue[#P.pendingQueue + 1] = guid
				P:UpdateUnitBar(guid)
			else
				C_Timer.After(3, P.GROUP_ROSTER_UPDATE)
			end
		end

		P:UpdatePosition()
		P:UpdateExPosition()
		E.Comms:EnqueueInspect()
		if P.groupJoined or force then
			SendRequestSync()
		end
	end

	function P:GROUP_ROSTER_UPDATE(force) -- [50]
		local n = GetNumGroupMembers()
		if force or n == 0 then
			updateRosterInfo(true)
		elseif not timer then
			timer = E.TimerAfter(2, updateRosterInfo) -- TODO: custom UI delays
		end
	end
end

function P:GROUP_JOINED(arg)
	if self.test then
		self:Test()
	end
	self.groupJoined = true
end

function P:PLAYER_ENTERING_WORLD(isInitialLogin, isReloadingUi, refresh)
	local _, instanceType = IsInInstance()
	self.zone = instanceType
	self.isInArena = instanceType == "arena"
	self.isInBG = instanceType == "pvp"
	self.isInPvPInstance = self.isInArena or self.isInBG

	if not refresh and self.test then
		self:Test()
	end

	self.disabledzone = not self.test and not E.DB.profile.Party.visibility[instanceType]
	if self.disabledzone then
		self:UnregisterEvent("PLAYER_FLAGS_CHANGED")
		self:UnregisterEvent("CHALLENGE_MODE_START")
		self:UnregisterEvent("ENCOUNTER_END")

		self:ResetModule()
		self.disabled = true
		return
	end

	local key = self.test and self.testZone or instanceType
	E.db = E.DB.profile.Party[key]
	self.isUserHidden = not self.test and not E.db.general.showPlayer
	self.isUserDisabled = self.isUserHidden and (not E.db.general.showPlayerEx or (not E.db.extraBars.interruptBar.enabled and not E.db.extraBars.raidCDBar.enabled))
	E.Cooldowns:UpdateCombatLogVar()

	E:SetActiveUnitFrameData()
	P:UpdatePositionValues()
	P:UpdateExPositionValues()
	E.UpdateEnabledSpells(self)

	if instanceType == "none" then
		self:UnregisterEvent("CHALLENGE_MODE_START")
		self:UnregisterEvent("ENCOUNTER_END")

		self:RegisterEvent("PLAYER_FLAGS_CHANGED")
		self.isPvP = C_PvP.IsWarModeDesired()
	elseif self.isInArena or self.isInBG then
		self:UnregisterEvent("PLAYER_FLAGS_CHANGED")
		self:UnregisterEvent("CHALLENGE_MODE_START")
		self:UnregisterEvent("ENCOUNTER_END")

		self:RegisterEvent("PLAYER_REGEN_DISABLED")
		self:RegisterEvent("CHAT_MSG_BG_SYSTEM_NEUTRAL")
		self:RegisterEvent("UPDATE_UI_WIDGET")
		self:ResetAllIcons()
		self.isPvP = true
	elseif instanceType == "party" then
		self:UnregisterEvent("PLAYER_FLAGS_CHANGED")
		self:UnregisterEvent("ENCOUNTER_END")

		self:RegisterEvent("CHALLENGE_MODE_START")
		self.isPvP = false
	elseif instanceType == "raid" then
		self:UnregisterEvent("PLAYER_FLAGS_CHANGED")
		self:UnregisterEvent("CHALLENGE_MODE_START")

		self:RegisterEvent("ENCOUNTER_END")
		self.isPvP = false
	else
		self:UnregisterEvent("PLAYER_FLAGS_CHANGED")
		self:UnregisterEvent("CHALLENGE_MODE_START")
		self:UnregisterEvent("ENCOUNTER_END")

		self.isPvP = false
	end

	if IsInGroup() or refresh then -- [37]
		self.groupJoined = true
		self:GROUP_ROSTER_UPDATE(true)
	end
end

function P:CHAT_MSG_BG_SYSTEM_NEUTRAL(arg1)
	if self.disabled then return end
	if string.find(arg1, "!") then
		E.Comms:EnqueueInspect(true)
	end
end

do
	local inspectAll = function()
		E.Comms.EnqueueInspect(true)
	end

	function P:UPDATE_UI_WIDGET(widgetInfo)
		if self.disabled then return end
		if widgetInfo.widgetSetID == 1 and widgetInfo.widgetType == 0 then
			local info = C_UIWidgetManager.GetIconAndTextWidgetVisualizationInfo(widgetInfo.widgetID)
			if info and info.state == 1 then
				self:UnregisterEvent("UPDATE_UI_WIDGET")
				C_Timer.After(1, inspectAll)
			end
		end
	end
end

function P:PLAYER_REGEN_DISABLED()
	self:UnregisterEvent("CHAT_MSG_BG_SYSTEM_NEUTRAL")
	self:UnregisterEvent("PLAYER_REGEN_DISABLED")
	self:UnregisterEvent("UPDATE_UI_WIDGET")
end

function P:PLAYER_FLAGS_CHANGED()
	if ( InCombatLockdown() ) then return end

	local oldpvp = self.isPvP
	self.isPvP = C_PvP.IsWarModeDesired()
	if oldpvp ~= self.isPvP then
		self:UpdateBars()
		E.Comms:EnqueueInspect(true)
	end
end

function P:CHALLENGE_MODE_START()
	E.Comms:EnqueueInspect(true)
	self:ResetAllIcons()
	self:UnregisterEvent("CHALLENGE_MODE_START")
end

function P:ENCOUNTER_END(encounterID, encounterName, difficultyID, groupSize, success)
	if groupSize > 5 then
		self:ResetAllIcons(true)
	end
end
