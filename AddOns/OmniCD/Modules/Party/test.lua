local E, L, C = select(2, ...):unpack()

local TestMod = CreateFrame("Frame")
local P = E["Party"]
local indicator
local config = {}

local addOnTestMode = {}

addOnTestMode.Grid2 = function(enabledTest)
	if enabledTest then
		if ( not IsAddOnLoaded("Grid2Options") ) then
			LoadAddOn("Grid2Options")
		end

		config.Grid2 = Grid2Options.editedTheme.layout.layouts["solo"]
		if config.Grid2 == "None" then
			Grid2Options.editedTheme.layout.layouts["solo"] = "By Group"
		end
	else
		Grid2Options.editedTheme.layout.layouts["solo"] = config.Grid2
	end

	Grid2Layout:ReloadLayout()
end

addOnTestMode.VuhDo = function(enabledTest)
	if enabledTest then
		config.VuhDo = VUHDO_CONFIG["HIDE_PANELS_SOLO"]
		VUHDO_CONFIG["HIDE_PANELS_SOLO"] = false
	else
		VUHDO_CONFIG["HIDE_PANELS_SOLO"] = config.VuhDo
	end

	VUHDO_getAutoProfile()
end

addOnTestMode.ElvUI = function(enabledTest)
	ElvUI[1]:GetModule("UnitFrames"):HeaderConfig(ElvUF_Party, enabledTest)
end

addOnTestMode.Aptechka = function(enabledTest)
	if enabledTest then
		config.Aptechka = Aptechka.db.profile.showSolo
		Aptechka.db.profile.showSolo = true
	else
		Aptechka.db.profile.showSolo = config.Aptechka
	end

	Aptechka:ReconfigureProtected()
end

addOnTestMode.HealBot = function(enabledTest) -- player frame always shown ?
	--HealBot_TestBars(enabledTest and 5) -- doesnt work. has test-names for unit key
end

local callback = function()
	local f = P.groupInfo[E.userGUID].bar

	indicator.anchor:ClearAllPoints()
	indicator.anchor:SetPoint("BOTTOMLEFT", f.anchor, "BOTTOMRIGHT")
	indicator.anchor:SetPoint("TOPLEFT", f.anchor, "TOPRIGHT")
	indicator:Show()

	for i = 1, f.numIcons do
		local icon = f.icons[i]
		local flash = icon.flashAnim
		local newItemAnim = icon.newitemglowAnim
		if ( flash:IsPlaying() or newItemAnim:IsPlaying() ) then
			flash:Stop();
			newItemAnim:Stop();
		end
		if icon:IsVisible() then
		--[[ xml
		if icon:IsVisible() and not icon.isCropped then
		--]]
			flash:Play();
			newItemAnim:Play();
		end
	end
end

function TestMod:Test(key)
	local active = E.customUF.active or "blizz"
	local groupSize = GetNumGroupMembers()

	P.test = not P.test

	if P.test then
		if groupSize < 2 and not addOnTestMode[active] and active ~= "blizz" then
			E.Write(string.format(E.STR.UNSUPPORTED_ADDON, active))
		end

		if InCombatLockdown() then
			P.test = false
			return E.Write(ERR_NOT_IN_COMBAT)
		end

		if active == "blizz" then
			if IsAddOnLoaded("Blizzard_CompactRaidFrames") and IsAddOnLoaded("Blizzard_CUFProfiles") then -- Grid2
				CompactRaidFrameManager:Show()
				CompactRaidFrameContainer:Show()
			elseif not E.db.position.detached then
				P:ConfirmReload(E.STR.ENABLE_BLIZZARD_CRF, true)

				P.test = false
				return
			end
		elseif addOnTestMode[active] then
			addOnTestMode[active](P.test)
		end

		if not indicator then
			indicator = CreateFrame("Frame", nil, UIParent, "OmniCDTemplate")
			indicator.anchor.background:SetColorTexture(0, 0, 0, 1)
			indicator.anchor.background:SetGradientAlpha("Horizontal", 1, 1, 1, 1, 1, 1, 1, 0)
			indicator.anchor:SetHeight(15)
			indicator.anchor:EnableMouse(false)
			indicator:SetScript("OnHide", nil)
			indicator:SetScript("OnShow", nil)

			self:SetScript("OnEvent", function(self, event, ...)
				self[event](self, ...)
			end)
		end
		indicator.anchor.text:SetText(L["Test"] .. "-" .. E.L_ZONE[key])
		E.SetWidth(indicator.anchor)

		self:RegisterEvent("PLAYER_LEAVING_WORLD")

		P:Refresh(true)
		callback()
	else
		if active == "blizz" then
			if InCombatLockdown() then
				E.Write(L["Test frames will be hidden once player is out of combat"])

				self:RegisterEvent("PLAYER_REGEN_ENABLED")
			elseif IsAddOnLoaded("Blizzard_CompactRaidFrames") and IsAddOnLoaded("Blizzard_CUFProfiles") and (groupSize == 0 or not P:IsCRFActive()) then
				CompactRaidFrameManager:Hide()
				CompactRaidFrameContainer:Hide()
			end
		elseif addOnTestMode[active] then
			addOnTestMode[active](P.test)
		end

		table.wipe(config)
		indicator:Hide()
		self:UnregisterEvent("PLAYER_LEAVING_WORLD")

		P:Refresh(true)
	end
end

function TestMod:PLAYER_REGEN_ENABLED()
	if IsAddOnLoaded("Blizzard_CompactRaidFrames") and IsAddOnLoaded("Blizzard_CUFProfiles") and (P:GetEffectiveNumGroupMembers() == 0 or not P:IsCRFActive()) then
		CompactRaidFrameManager:Hide()
		CompactRaidFrameContainer:Hide()
	end

	self:UnregisterEvent("PLAYER_REGEN_ENABLED")
end

function TestMod:PLAYER_LEAVING_WORLD() -- [68]
	if P.test then
		self:Test()
	end
end

function P:Test(key)
	key = type(key) == "table" and key[2] or key
	self.testZone = key
	E.db = E.DB.profile.Party[key or self.zone]
	E:SetActiveUnitFrameData()

	TestMod:Test(key)
end

E["addOnTestMode"] = addOnTestMode
