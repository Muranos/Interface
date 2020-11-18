local E, L, C = select(2, ...):unpack()

local P = E["Party"]

P.groupInfo = {}
P.pendingQueue = {}

P.groupInfo[E.MyGUID] = {
	["class"] = E.MyClass,
	["raceID"] = E.MyRaceID,
	["name"] = E.MyName,
	["level"] = E.MyLevel,
	["unit"] = "player",
	["index"] = 5,
}

function P:ResetGroupInfo()
	for guid in pairs(self.groupInfo) do
		if guid == E.MyGUID then
			local myInfo = self.groupInfo[E.MyGUID]
			myInfo.index = 5
			myInfo.unit = "player"
		else
			self.groupInfo[guid] = nil
		end

		if self.specialAuras[guid] then
			self:RemoveSpecialAura(guid)
		end
	end
end

function P:UpdateGroupInfo(force)
	local size = self.size

	for i = 1, size do
		local index = not self.isInRaid and i == size and 5 or i
		local unit = self:GetUnitByIndex(index)
		local guid = UnitGUID(unit)
		local info = self.groupInfo[guid]

		if not info then
			local _, class = UnitClass(unit)
			if class then -- [32]
				local _,_, race = UnitRace(unit)
				local name = GetUnitName(unit, true)
				local level = UnitLevel(unit)
				if level == 0 then
					level = 200
				end

				self.groupInfo[guid] = {
					index = index,
					unit = unit,
					class = class,
					raceID = race,
					name = name,
					level = level,
				}

				self.pendingQueue[#self.pendingQueue + 1] = guid

				if not force then
					self:UpdateUnitBar(index)
				end
			end
		elseif info.unit ~= unit then
			info.index = index
			info.unit = unit

			if not force then
				self:UpdateUnitBar(index)
			end
		end
	end
end
