local E, L, C = select(2, ...):unpack()

function E:Counters()
	if ( IsAddOnLoaded("OmniCC") or IsAddOnLoaded("tullaCC") ) then
		self.OmniCC = true
	end
end

local unitFrameData = {
	--  [1] = AddOn name
	--  [2] = Party frame name -%d
	--  [3] = Party frame unit key
	--  [4] = Delay

	{   [1] = "Grid2",
		[2] = "Grid2LayoutHeader1UnitButton",
		[3] = "unit",
		[4] = 1,
	},
	{   [1] = "VuhDo",
		[2] = "Vd1H",
		[3] = "raidid",
		[4] = 4, -- idc if it doesn't work. needs an insane amount of delay on some settings
	},
	{   [1] = "Aptechka",
		[2] = "NugRaid1UnitButton",
		[3] = "unit",
		[4] = 1,
	},
	{   [1] = "ElvUI",
		[2] = "ElvUF_PartyGroup1UnitButton",
		[3] = "unit",
		[4] = 1,
	},
	{   [1] = "Tukui",
		[2] = "TukuiPartyUnitButton",
		[3] = "unit",
		[4] = 1,
	},
	{   [1] = "ShadowUF",
		[2] = "SUFHeaderpartyUnitButton",
		[3] = "unit",
		[4] = 1,
	},
	{   [1] = "ZPerl",
		[2] = "XPerl_party",
		[3] = "partyid",
		[4] = 1,
	},
	{   [1] = "PitBull4",
		[2] = "PitBull4_Groups_PartyUnitButton",
		[3] = "unit",
		[4] = 1,
	},
	{   [1] = "InvenRaidFrame3",
		[2] = "InvenRaidFrame3Group0UnitButton",
		[3] = "unit",
		[4] = 1,
	},
	{   [1] = "NDui",
		[2] = "oUF_PartyUnitButton",
		[3] = "unit",
		[4] = 1,
	},
}

function E:SetActiveUnitFrameData()
	if self.customUF.enabled then
		local active = self.db.position.uf == "auto" and self.customUF.prio or self.db.position.uf
		local enabled = self.customUF.enabled[active]
		if enabled then
			self.customUF.frame = enabled.frame
			self.customUF.unit = enabled.unit
			self.customUF.delay = enabled.delay
		end
		self.customUF.active = active
	end
end

function E:UnitFrames()
	self.customUF = {
		["optionTable"] = {
			auto = L["Auto"],
			blizz = "Blizzard",
		}
	}

	for i = 1, #unitFrameData do
		local name = unitFrameData[i][1]
		local frame = _G[name] or IsAddOnLoaded(name)
		if frame then
			self.customUF.enabled = self.customUF.enabled or {}
			self.customUF.enabled[name] = {
				["frame"] = unitFrameData[i][2],
				["unit"] = unitFrameData[i][3],
				["delay"] = unitFrameData[i][4],
			}

			self.customUF.optionTable[name] = name

			if not self.customUF.prio then
				self.customUF.prio = name
			end

			if name == "ElvUI" then
				self:SetNumPixels()
			end
		end
	end

	if self.customUF.enabled then
		local uf = self.db.position.uf
		if uf ~= "blizz" and not self.customUF.enabled[uf] then
			self.db.position.uf = "auto"
		end
		E:SetActiveUnitFrameData()

		if not E.DB.global.disableElvMsg then
			StaticPopup_Show("OMNICD_Elv_MSG")
		end
	end
end

function E:LoadAddOns()
	self:Counters()
	self:UnitFrames()
end

E.unitFrameData = unitFrameData
