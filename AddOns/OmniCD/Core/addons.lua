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
		[4] = 8,
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
}

function E:SetActiveUnitFrameData()
	local active = self.db.position.uf == "auto" and self.customUF.prio or self.db.position.uf
	local enabled = self.customUF.enabled[active]
	self.customUF.active = active
	self.customUF.frame = enabled and enabled.frame
	self.customUF.unit = enabled and enabled.unit
	self.customUF.delay = enabled and enabled.delay or 0
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
	if self.enabled then
		return
	end

	self:Counters()
	self:UnitFrames()
end

E.unitFrameData = unitFrameData
