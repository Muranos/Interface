local E, L, C = select(2, ...):unpack()

local Comms = E["Comms"]
local OnUpdateHandler = CreateFrame("Frame")

local strjoin = strjoin
local strsplit = strsplit
local concat = table.concat
local CanInspect = CanInspect
local ClearInspectPlayer = ClearInspectPlayer
local GetNumGroupMembers = GetNumGroupMembers
local GetInspectSpecialization = GetInspectSpecialization
local GetSpecialization = GetSpecialization
local GetSpecializationInfo = GetSpecializationInfo
local GetTalentInfo = GetTalentInfo
local GetPvpTalentInfoByID = GetPvpTalentInfoByID
local GetInspectSelectedPvpTalent = C_SpecializationInfo.GetInspectSelectedPvpTalent
local GetPvpTalentSlotInfo = C_SpecializationInfo.GetPvpTalentSlotInfo
local UnitGUID = UnitGUID
local UnitIsDead = UnitIsDead
local UnitIsConnected = UnitIsConnected
local UnitLevel = UnitLevel
local P = E["Party"]
local INS_ONUPDATE_INTERVAL = 1
local INS_DELAY_TIME = 2
local INS_PAUSE_TIME = 10
local INS_TIME_LIMIT = 180
local elapsedTime = 0
local nextInquiryTime = 0
local queried, paused

local queueEntries = {}
local staleEntries = {}

local function CommsOnUpdate(self, elapsed)
	elapsedTime = elapsedTime + elapsed

	if elapsedTime > INS_ONUPDATE_INTERVAL then
		Comms:RequestInspect()

		elapsedTime = 0
	end
end

function Comms:InitInspect()
	if self.init then
		return
	end

	OnUpdateHandler:SetScript("OnUpdate", CommsOnUpdate)
	OnUpdateHandler:Hide()

	self.init = true
end

function Comms:EnableInspect()
	if self.enabledInspect or next(queueEntries) == nil then
		return
	end

	self:RegisterEvent("INSPECT_READY")
	OnUpdateHandler:Show()

	self.enabledInspect = true
end

function Comms:DisableInspect()
	if not self.enabledInspect then
		return
	end

	ClearInspectPlayer()
	self:UnregisterEvent("INSPECT_READY")
	OnUpdateHandler:Hide()

	wipe(P.pendingQueue)
	wipe(queueEntries)
	wipe(staleEntries)

	queried = nil
	paused = nil

	self.enabledInspect = false
end

function Comms:DequeueInspect(guid)
	if queried == guid then
		queried = nil
	end

	queueEntries[guid] = nil
	staleEntries[guid] = nil
end

function Comms:EnqueueInspect(force, guid)
	local added = GetTime()

	if force then
		wipe(P.pendingQueue)
		wipe(queueEntries)
		wipe(staleEntries)

		for i = 1, GetNumGroupMembers() do
			local unit = P:GetUnitByIndex(i)
			local guid = UnitGUID(unit)
			if guid and guid ~= E.MyGUID then
				queueEntries[guid] = added
			end
		end
	elseif guid then
		queueEntries[guid] = added
	else
		if #P.pendingQueue == 0 then return end

		for i = 1, #P.pendingQueue do
			local guid = P.pendingQueue[i]
			queueEntries[guid] = added
			P.pendingQueue[i] = nil
		end
	end

	if paused then
		nextInquiryTime = 0
		paused = nil
	end

	self:EnableInspect()
end

function Comms:RequestInspect()
	local now = GetTime()

	if now < nextInquiryTime then return end
	if ( UnitIsDead("player") ) then return end
	if ( InspectFrame and InspectFrame:IsShown() ) then return end

	local stale = queried
	if stale then -- Cross zone non-subgroup raid members
		staleEntries[stale] = queueEntries[stale]
		queueEntries[stale] = nil
		queried = nil
	end

	if next(queueEntries) == nil then
		if next(staleEntries) then
			local copy = queueEntries
			queueEntries = staleEntries
			staleEntries = copy

			nextInquiryTime = now + INS_PAUSE_TIME
			paused = true
		else
			self:DisableInspect()
		end

		return
	end

	if paused then paused = nil end

	for guid, added in pairs(queueEntries) do
		local info = P.groupInfo[guid]
		if info then
			local unit = info.unit
			local elapsed = now - added
			if ( not UnitIsConnected(unit) or elapsed > INS_TIME_LIMIT ) then
				self:DequeueInspect(guid)
			elseif ( not CanInspect(unit) ) then -- CanInspect returns false for everyone joined before me when entering LFG instance
				staleEntries[guid] = added
				queueEntries[guid] = nil
			else
				nextInquiryTime = now + INS_DELAY_TIME
				queried = guid
				NotifyInspect(unit)

				return
			end
		else
			self:DequeueInspect(guid)
		end
	end
end

function Comms:InspectUnit(guid)
	local info = P.groupInfo[guid]

	if not info then
		return
	end

	local inspect = guid ~= E.MyGUID
	local unit = info.unit
	local specID

	if inspect then
		specID = GetInspectSpecialization(unit)
	else
		local specIndex = GetSpecialization()
		specID = specIndex and GetSpecializationInfo(specIndex)
	end

	if specID and specID > 0 then
		info.spec = specID

		info.talents = info.talents or {}

		for i = 1, 7 do
			local talentID
			for j = 1, 3 do
				local _,_,_, selected, _, spellID = GetTalentInfo(i, j, 1, inspect, unit)
				if selected then
					talentID = spellID
					break
				end
			end

			info.talents[i] = talentID or 0
		end

		for i = 1, 4 do
			local talentID
			if inspect then
				talentID = GetInspectSelectedPvpTalent(unit, i)
			else
				local slotInfo = GetPvpTalentSlotInfo(i)
				talentID = slotInfo and slotInfo.selectedTalentID
			end

			if talentID then
				local _,_,_,_,_, spellID = GetPvpTalentInfoByID(talentID)
				info.talents[i+7] = spellID
			else
				info.talents[i+7] = 0
			end
		end

		info.talents[12] = 0 -- Conflict and Strife Major 'Conflict'
		info.talents[13] = 0 -- Vision of Perfection Minor 'Strive for Perfection'

		self:InspectItems(guid)
		self:UpdateTalentLT(guid)

		if inspect then
			self:DequeueInspect(guid)
			ClearInspectPlayer()
		else
			local talents = concat(info.talents, ",")
			local slots = concat(info.slots, ",")
			info.syncData = strjoin(",", E.MyGUID, info.spec, talents, slots)
		end

		if info.level == 200 then
			local lvl = UnitLevel(unit)
			info.level = lvl > 0 and lvl or 200
		end

		P:UpdateUnitBar(info.index)
	end
end

function Comms:INSPECT_READY(guid)
	if queried == guid then
		self:InspectUnit(guid)
	end
end
