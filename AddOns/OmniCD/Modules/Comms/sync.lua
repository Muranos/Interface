local E, L, C = select(2, ...):unpack()

local Comms = E["Comms"]
local strjoin = strjoin
local strfind = string.find
local strmatch = string.match
local GetNumGroupMembers = GetNumGroupMembers
local UnitPower = UnitPower
local SendAddonMessage = C_ChatInfo.SendAddonMessage
local LE_PARTY_CATEGORY_HOME = LE_PARTY_CATEGORY_HOME
local P = E["Party"]
local MyGUID = E.MyGUID
local cdReducedByPowerSpent = E.cdReducedByPowerSpent
local MSG_INFO = "INF"
local MSG_INFO_REQUEST = "REQ"
local MSG_INFO_UPDATE = "UPD"
local MSG_POWER = "PWR"
local MSG_DESYNC = "DESYNC"
local MSG_STRIVE_PVP = "STRIVE"
local lastPower = 0
local isInCombat

Comms.syncGUIDS = {}

local function SyncRemainingCD(guid, spentPower)
	local info = P.groupInfo[guid]
	if info then
		for k, t in pairs(cdReducedByPowerSpent) do
			local icon = info.spellIcons and info.spellIcons[k] -- [1]
			if icon and icon.active then
				local reducedTime = P:IsTalent(t.talent, guid) and P:GetValueByType(t.duration, guid) or t.base
				if reducedTime then
					reducedTime = reducedTime * spentPower
					if info.isTBActive then
						reducedTime = reducedTime * 2
					end

					P:UpdateCooldown(icon, reducedTime)
				end
			end
		end
	end
end

local function SyncStrivePvpCD(guid, cd)
	local info = P.groupInfo[guid]
	if info then
		local k = info.slotLT and info.slotLT.multID
		local icon = info.spellIcons[k]
		if icon and icon.active then
			local active = info.active and info.active[k]
			if active then
				icon.cooldown:SetCooldown(active.startTime, cd, info.ineffableTruth)
				icon.duration = cd
				active.duration = cd
				info.isPvpMultApplied = true
			end
		end
	end
end

local function SendComm(...)
	if GetNumGroupMembers(LE_PARTY_CATEGORY_HOME) < 2 then return end

	SendAddonMessage("OmniCD", strjoin(",", ...), "PARTY")
end

function Comms:RequestSync()
	wipe(self.syncGUIDS)

	SendComm(MSG_INFO_REQUEST, P.groupInfo[MyGUID].syncData)
end

function Comms:SendSync(update)
	SendComm(update and MSG_INFO_UPDATE or MSG_INFO, P.groupInfo[MyGUID].syncData)
end

function Comms:Desync()
	wipe(self.syncGUIDS)

	SendComm(MSG_DESYNC, MyGUID, 1)
end

function Comms:CHAT_MSG_ADDON(prefix, message, dist, sender) -- [29]
	if prefix ~= "OmniCD" or dist ~= "PARTY" or sender == E.MyNameWithRealm then
		return
	end

	local header, guid, body = strmatch(message, "(.-),(.-),(.+)")
	local info = P.groupInfo[guid]
	if info then
		local syncedUnit = self.syncGUIDS[guid]

		if header == MSG_POWER then
			if syncedUnit then
				SyncRemainingCD(guid, body)
			end
		elseif header == MSG_STRIVE_PVP then
			if syncedUnit and not info.isPvpMultApplied then
				SyncStrivePvpCD(guid, body)
			end
		else
			if header == MSG_INFO_REQUEST then
				self:SendSync()

				if syncedUnit then return end
			elseif header == MSG_INFO then
				if syncedUnit then return end
			elseif header == MSG_DESYNC then
				self.syncGUIDS[guid] = nil

				return
			end

			local s, e, v = 1
			local i = 0

			while true do
				s, e, v = strfind(body, "([^,]+)", s)

				if s == nil then break end

				s = e + 1
				i = i + 1

				if i > 14 then
					info.slots = info.slots or {}
					info.slots[i-14] = tonumber(v)
				elseif i > 1 then
					info.talents = info.talents or {}
					info.talents[i-1] = tonumber(v)
				elseif i == 1 then
					info.spec = tonumber(v)
				end
			end

			self.syncGUIDS[guid] = true

			self:DequeueInspect(guid)
			self:UpdateTalentLT(guid)
			self:UpdateSlotLT(guid)

			P:UpdateUnitBar(info.index)
		end
	end
end

local function UpdatePowerSpent(self, unit, powerType)
	if unit ~= "player" then return end

	local powerID = E.POWER_TYPE_IDS[powerType]
	if powerID then
		local power = UnitPower(unit, powerID)
		if power < lastPower then
			local spent = lastPower - power
			if isInCombat or spent > 1 then -- [12]
				if not P.hideMe then
					self.spentPower = spent

					SyncRemainingCD(MyGUID, spent)
				end

				if next(self.syncGUIDS) then
					SendComm(MSG_POWER, MyGUID, spent)
				end
			end
		end

		lastPower = power
	end
end

Comms.UNIT_POWER_UPDATE = UpdatePowerSpent
Comms.UNIT_POWER_FREQUENT = UpdatePowerSpent

function Comms:PLAYER_REGEN_ENABLED()
	isInCombat = nil
	self:UnregisterEvent("PLAYER_REGEN_ENABLED")
end

function Comms:PLAYER_REGEN_DISABLED()
	isInCombat = true
	self:RegisterEvent("PLAYER_REGEN_ENABLED")
end

function Comms:UpdateStrivePvpCD(cd)
	SyncStrivePvpCD(MyGUID, cd)
	SendComm(MSG_STRIVE_PVP, MyGUID, cd)
end
