local E, L, C = select(2, ...):unpack()

local Comms = CreateFrame("Frame")
local P = E["Party"]

function Comms:Enable()
	if self.enabled then
		return
	end

	self:RegisterEventUnitPower()
	self:RegisterEvent("CHAT_MSG_ADDON")
	self:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
	self:RegisterEvent("UNIT_PET")
	self:RegisterEvent("COVENANT_CHOSEN")
	self:RegisterEvent("SOULBIND_ACTIVATED")
	self:RegisterEvent("SOULBIND_NODE_LEARNED")
	self:RegisterEvent("SOULBIND_NODE_UNLEARNED")
	self:RegisterEvent("SOULBIND_NODE_UPDATED")
	self:RegisterEvent("SOULBIND_CONDUIT_INSTALLED")
	self:RegisterEvent("SOULBIND_PATH_CHANGED")
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

function Comms:RegisterEventUnitPower()
	local specIndex = GetSpecialization()
	local specID = GetSpecializationInfo(specIndex)
	local powerSpec = E.POWER_TYPE_SPEC[specID]

	self.oocThreshold = powerSpec == 1 and 3 or 1

	if E.DB.profile.Party.sync and powerSpec then
		if InCombatLockdown() then
			self:PLAYER_REGEN_DISABLED()
		else
			self:RegisterEvent("PLAYER_REGEN_DISABLED")
		end
		self:RegisterUnitEvent("UNIT_POWER_UPDATE", "player")
	else
		self:UnregisterEvent("UNIT_POWER_UPDATE")
	end
end

do
	local isOnDelay
	local resetDelay = function() isOnDelay = nil end

	function Comms:PLAYER_EQUIPMENT_CHANGED(slotID)
		if isOnDelay or slotID == 4 or slotID > 15 then
			return
		end

		self:InspectPlayer()
		self:SendSync()
		isOnDelay = true
		C_Timer.After(0.05, resetDelay)
	end
end

function Comms:UNIT_PET(unit) -- [73]
	local pet = E.unitToPetId[unit]
	if not pet then
		return
	end

	local guid = UnitGUID(unit)
	local info = P.groupInfo[guid]
	if info and info.spec == 253 then
		local petGUID = UnitGUID(pet)
		if petGUID then
			info.petGUID = petGUID
			E.Cooldowns.petGUIDS[petGUID] = guid
		end
	end
end

local updateCovenantSoulbind = function()
	Comms:InspectPlayer()
	Comms:SendSync()
end

Comms.COVENANT_CHOSEN = updateCovenantSoulbind
Comms.SOULBIND_ACTIVATED = updateCovenantSoulbind
Comms.SOULBIND_NODE_LEARNED = updateCovenantSoulbind
Comms.SOULBIND_NODE_UNLEARNED = updateCovenantSoulbind
Comms.SOULBIND_NODE_UPDATED = updateCovenantSoulbind
Comms.SOULBIND_CONDUIT_INSTALLED = updateCovenantSoulbind
Comms.SOULBIND_PATH_CHANGED = updateCovenantSoulbind

E["Comms"] = Comms
