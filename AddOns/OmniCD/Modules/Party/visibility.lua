local E, L, C = select(2, ...):unpack()

local P = E["Party"]
local wipe = table.wipe
local GetNumGroupMembers = GetNumGroupMembers
local GetRaidRosterInfo = GetRaidRosterInfo
local IsInRaid = IsInRaid
local UnitExists = UnitExists
local C_TimerAfter = C_Timer.After
local C_UIWidgetManager_GetIconAndTextWidgetVisualizationInfo = C_UIWidgetManager.GetIconAndTextWidgetVisualizationInfo
local LE_PARTY_CATEGORY_HOME = LE_PARTY_CATEGORY_HOME

local lastGroup = {}
local tempGroup = {}

do
	local requestSyncFunc = function()
		if not P.enabled or P.disabled then return end
		E.Comms:RequestSync()
	end

	function P:SyncGroup()
		E.Comms:InspectUnit(E.MyGUID)
		C_TimerAfter((E.customUF.delay or 0) + 10, requestSyncFunc)
	end
end

function P:PLAYER_ENTERING_WORLD(isInitialLogin, isReloadingUi)
	local _, instanceType = IsInInstance()
	self.zone = instanceType
	self.isInArena = instanceType == "arena"
	self.isInBG = instanceType == "pvp"
	self.isInPvPInstance = self.isInArena or self.isInBG

	if isReloadingUi then
		self:SyncGroup()
	elseif self.test then
		self:Test()
	end

	self.disabledzone = not self.test and not E.db.visibility[instanceType]

	if not self.disabledzone then
		if instanceType == "none" then
			self.pvp = C_PvP.IsWarModeDesired()

			self:UnregisterEvent("CHALLENGE_MODE_START")
			self:RegisterEvent("PLAYER_FLAGS_CHANGED")
		elseif self.isInArena or self.isInBG then
			self.pvp = true
			self:ResetAllIcons()

			self:UnregisterEvent("PLAYER_FLAGS_CHANGED")
			self:RegisterEvent("PLAYER_REGEN_DISABLED")
			self:RegisterEvent("CHAT_MSG_BG_SYSTEM_NEUTRAL")
			self:RegisterEvent("UPDATE_UI_WIDGET")
		else
			self.pvp = false

			self:UnregisterEvent("PLAYER_FLAGS_CHANGED")
			if instanceType == "party" then
				self:RegisterEvent("CHALLENGE_MODE_START")
			end
		end
	else
		self:UnregisterEvent("PLAYER_FLAGS_CHANGED")
		self:UnregisterEvent("CHALLENGE_MODE_START")
	end

	self:GROUP_ROSTER_UPDATE(true) -- Set zone before GRU in LFR
end

function P:GROUP_JOINED(arg) -- Silent on reloadUI
	if self.test then
		self:Test()
	end

	self:SyncGroup()
end

function P:GROUP_ROSTER_UPDATE(force)
	local oldsize = self.size or 0
	local size = GetNumGroupMembers()

	self.size = size

	local oldDisabled = self.disabled
	self.disabled = not self.test and ( self.disabledzone or size == 0 or
		(GetNumGroupMembers(LE_PARTY_CATEGORY_HOME) == 0 and not E.db.visibility.finder) or
		(size > E.db.visibility.size) or
		(size > 5 and not not E.customUF.enabled) )

	if self.disabled then
		if oldDisabled == false then
			wipe(lastGroup)

			self:ResetModule()
		end

		return
	end

	if oldDisabled ~= false then
		E.Comms:Enable()
		E.Cooldowns:Enable()
	end

	if oldsize > size then -- [42]
		for guid, info in pairs(self.groupInfo) do
			if not UnitExists(info.name) then
				self.groupInfo[guid] = nil
				if self.specialAuras[guid] then
					self:RemoveSpecialAura(guid)
				end

				E.Comms.syncGUIDS[guid] = nil
				E.Comms:DequeueInspect(guid)
			end
		end
	end

	self:UpdateGroup(force)
end

do
	local rosterTimer

	local updateGroupFunc = function()
		if not P.enabled or P.disabled or not rosterTimer then return end
		rosterTimer = nil
		P:UpdateGroup()
	end

	local updateAllFunc = function()
		if not P.enabled or P.disabled then return end
		P:UpdateGroupInfo()
		P:UpdatePosition()
		E.Comms:EnqueueInspect()
	end

	local updateAllFunc2 = function()
		if not P.enabled or P.disabled then return end
		P:UpdateGroupInfo(true)
		P:UpdateBars()
		P:UpdatePosition()
		E.Comms:EnqueueInspect(true)
	end

	function P:UpdateGroup(force)
		local size = self.size

		tempGroup = {}

		for i = 1, size do
			local name = GetRaidRosterInfo(i)
			if not name then -- [43]
				if not rosterTimer then
					rosterTimer = true
					C_TimerAfter(2, updateGroupFunc)
				end

				return
			else
				tempGroup[#tempGroup + 1] = name
			end
		end

		rosterTimer = nil

		local control = self.isInRaid
		self.isInRaid = IsInRaid()

		if not force and control == self.isInRaid and E.IsTableExact(tempGroup, lastGroup) then
			return
		end

		lastGroup = tempGroup

		if not E.db.position.arena.noTheme and not E.db.position.detached then
			local control = size > 5 and "raid" or (size > 3 and "party") or "arena"
			if self.theme ~= control then
				self.theme = control
				self:UpdatePositionValues()
				force = true
			end
		end

		C_TimerAfter(not self.test and E.customUF.delay or 0, force and updateAllFunc2 or updateAllFunc) -- [44]
	end
end

function P:CHAT_MSG_BG_SYSTEM_NEUTRAL(arg1)
	if self.disabled then return end
	if string.find(arg1, "!") then
		E.Comms:EnqueueInspect(true)
	end
end

function P:UPDATE_UI_WIDGET(widgetInfo)
	if widgetInfo.widgetSetID == 1 and widgetInfo.widgetType == 0 then
		local info = C_UIWidgetManager_GetIconAndTextWidgetVisualizationInfo(widgetInfo.widgetID)
		if info and info.state == 1 then
			self:UnregisterEvent("UPDATE_UI_WIDGET")
			E.TimerAfter(1, E.Comms.EnqueueInspect, E.Comms, true)
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

	local oldpvp = self.pvp
	self.pvp = C_PvP.IsWarModeDesired()
	if oldpvp ~= self.pvp then
		self:UpdateBars()
		E.Comms:EnqueueInspect(true)
	end
end

function P:CHALLENGE_MODE_START()
	E.Comms:EnqueueInspect(true)
	self:ResetAllIcons()
	self:UnregisterEvent("CHALLENGE_MODE_START")
end
