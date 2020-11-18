local E, L, C = select(2, ...):unpack()

local Comms = CreateFrame("Frame")
local P = E["Party"]

function Comms:Enable()
	if self.enabled then
		return
	end

	self:RegisterEventUnitPower()
	self:RegisterEvent("CHAT_MSG_ADDON")
	self:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
	self:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
	self:RegisterEvent("AZERITE_ESSENCE_UPDATE")
	self:SetScript("OnEvent", function(self, event, ...)
		self[event](self, ...)
	end)

	self:InitInspect()

	self.enabled = true
end

function Comms:Disable()
	if not self.enabled then
		return
	end

	self:UnregisterAllEvents()
	self:DisableInspect()
	self:Desync()

	self.enabled = false
end

function Comms:UpdateTalentLT(guid)
	local info = P.groupInfo[guid]

	if not info.talentLT then
		info.talentLT = {}
	else
		wipe(info.talentLT)
	end

	local n = #info.talents
	for i = 1, n do
		local id = info.talents[i]
		info.talentLT[id] = (i > 7 and i < 12) and 1 or 0
	end
end

function Comms:UpdateSlotLT(guid)
	local info = P.groupInfo[guid]

	if not info.slotLT then
		info.slotLT = {}
	else
		wipe(info.slotLT)
	end

	local n = #info.slots
	for i = 1, n do
		local id = info.slots[i]
		if id > 0 then
			if i == n then -- 'Strive for Perfection' multiplier
				info.slotLT["mult"] = id
			else
				if i == 3 then -- Major Essence
					local Rank1 = E.essRank2[id] or id
					if Rank1 then
						info.slotLT[Rank1] = true
						info.slotLT["essMajor"] = Rank1
					end
				end

				info.slotLT[id] = true
			end
		end
	end
end

function Comms:RegisterEventUnitPower()
	if P.disableSync then
		return
	end

	local powerSpec = E.POWER_TYPE_SPEC[P.groupInfo[E.MyGUID].spec]
	if powerSpec then
		if ( InCombatLockdown() ) then
			self:PLAYER_REGEN_DISABLED()
		else
			self:RegisterEvent("PLAYER_REGEN_DISABLED")
		end

		if powerSpec == 1 then
			self:RegisterEvent("UNIT_POWER_FREQUENT")
		else
			self:RegisterEvent("UNIT_POWER_UPDATE")
		end
	end
end

function Comms:AZERITE_ESSENCE_UPDATE()
	self:InspectUnit(E.MyGUID)
	self:SendSync(true)
end

function Comms:PLAYER_SPECIALIZATION_CHANGED(unit)
	local index = P:FindIndexByUnit(unit)

	if not index then
		return
	end

	local guid = P.spellBars[index].guid
	local info = P.groupInfo[guid]
	if info then
		if guid == E.MyGUID then
			self:InspectUnit(E.MyGUID)
			self:SendSync(true)
		elseif ( UnitIsConnected(unit) ) then
			self:EnqueueInspect(nil, guid)
		end
	end

	self:RegisterEventUnitPower()
end

local lastEventTime = 0

function Comms:PLAYER_EQUIPMENT_CHANGED(slotID)
	if not E.INVSLOTS[slotID] then return end

	local now = GetTime()
	if now - lastEventTime > 0.05 then
		self:InspectUnit(E.MyGUID)
		self:SendSync(true)
		lastEventTime = now
	end
end

E["Comms"] = Comms
