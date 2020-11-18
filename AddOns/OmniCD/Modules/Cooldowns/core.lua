local E, L, C = select(2, ...):unpack()

local CD = CreateFrame("Frame")

function CD:Enable()
	if self.enabled then
		return
	end

	self:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
	self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	self:SetScript("OnEvent", function(self, event, ...)
		self[event](self, ...)
	end)

	self.enabled = true
end

function CD:Disable()
	if not self.enabled then
		return
	end

	self:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
	self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

	wipe(self.totemGUIDS)

	self.enabled = false
end

E["Cooldowns"] = CD
