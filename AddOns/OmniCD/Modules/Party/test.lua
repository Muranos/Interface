local E, L, C = select(2, ...):unpack()

local TestMod = CreateFrame("Frame")
local P = E["Party"]
local indicator
local config

local addOnTestMode = {}

local function CreateIndicator()
	indicator = CreateFrame("Frame", nil, UIParent, "OmniCDTemplate")
	indicator:SetScript("OnHide", nil)

	indicator.anchor.text:SetText(L["Test"])
	indicator.anchor.background:SetColorTexture(0, 0, 0, 0.6)
	indicator.anchor:EnableMouse(false)
	indicator.anchor:SetHeight(15)
	E.SetWidth(indicator.anchor)
end

addOnTestMode.Grid2 = function(enabledTest)
	if enabledTest then
		if ( not IsAddOnLoaded("Grid2Options") ) then
			LoadAddOn("Grid2Options")
		end

		config = Grid2Options.editedTheme.layout.layouts["solo"]
		if config == "None" then
			Grid2Options.editedTheme.layout.layouts["solo"] = "By Group"
		end
	else
		Grid2Options.editedTheme.layout.layouts["solo"] = config
	end

	Grid2Layout:ReloadLayout()
end

addOnTestMode.VuhDo = function(enabledTest)
	if enabledTest then
		config = VUHDO_CONFIG["HIDE_PANELS_SOLO"]
		VUHDO_CONFIG["HIDE_PANELS_SOLO"] = false
	else
		VUHDO_CONFIG["HIDE_PANELS_SOLO"] = config
	end

	VUHDO_getAutoProfile()
end

addOnTestMode.ElvUI = function(enabledTest)
	ElvUI[1]:GetModule("UnitFrames"):HeaderConfig(ElvUF_Party, enabledTest)
end

addOnTestMode.Aptechka = function(enabledTest)
	if enabledTest then
		config = Aptechka.db.profile.showSolo
		Aptechka.db.profile.showSolo = true
	else
		Aptechka.db.profile.showSolo = config
	end

	Aptechka:ReconfigureProtected()
end

local callback = function()
	if P.test then
		indicator.anchor:ClearAllPoints()
		indicator.anchor:SetPoint("BOTTOMLEFT", P.spellBars[P.groupInfo[E.MyGUID].index], "TOPLEFT")
		indicator:Show()
	end

	local f = P.spellBars[P.groupInfo[E.MyGUID].index]
	for i = 1, f.numIcons do
		local icon = f.icons[i]
		local flash = icon.flashAnim
		local newItemAnim = icon.newitemglowAnim

		if ( flash:IsPlaying() or newItemAnim:IsPlaying() ) then
			flash:Stop();
			newItemAnim:Stop();
		end

		if P.test and icon:IsVisible() then
			flash:Play();
			newItemAnim:Play();
		end
	end
end

function TestMod:Test()
	if not indicator then
		CreateIndicator()

		self:SetScript("OnEvent", function(self, event, ...)
			self[event](self, ...)
		end)
	end

	local active = E.customUF.active or "blizz"

	if not addOnTestMode[active] and active ~= "blizz" then
		return E.Write(string.format(E.STR.UNSUPPORTED_ADDON, active))
	end

	if not P.test then
		--if ( P.size > 0 ) then
			--return E.Write(ERR_CANT_DO_THAT_IN_A_GROUP) -- TODO:
		if ( InCombatLockdown() ) then
			return E.Write(ERR_NOT_IN_COMBAT)
		end

		self:RegisterEvent("PLAYER_LEAVING_WORLD")
	end

	P.test = not P.test

	if active == "blizz" then
		if not P.test then
			if ( InCombatLockdown() ) then
				self:RegisterEvent("PLAYER_REGEN_ENABLED")
				E.Write(L["Test frames will be hidden once player is out of combat"])
			elseif ( P.size == 0 and IsAddOnLoaded("Blizzard_CompactRaidFrames") and IsAddOnLoaded("Blizzard_CUFProfiles") ) then
				CompactRaidFrameManager:Hide()
				CompactRaidFrameContainer:Hide()
			end
		else
			if ( IsAddOnLoaded("Blizzard_CompactRaidFrames") and IsAddOnLoaded("Blizzard_CUFProfiles") ) then
				CompactRaidFrameManager:Show()
				CompactRaidFrameContainer:Show()
			elseif not E.db.position.detached then
				P:ConfirmReload(E.STR.BLIZZARD_CRF_DISABLED, true)
				P.test = false

				return
			end
		end
	elseif addOnTestMode[active] then
		addOnTestMode[active](P.test)
	end

	if not P.test then
		config = nil
		indicator:Hide()
		self:UnregisterEvent("PLAYER_LEAVING_WORLD")
	end

	P:Refresh(true)

	C_Timer.After(0, callback)
end

function TestMod:PLAYER_REGEN_ENABLED()
	if not P.test and P.size == 0 then
		CompactRaidFrameManager:Hide()
		CompactRaidFrameContainer:Hide()
	end

	self:UnregisterEvent("PLAYER_REGEN_ENABLED")
end

function TestMod:PLAYER_LEAVING_WORLD() -- Revert db
	if P.test then
		self:Test()
	end
end

function P:Test()
	TestMod:Test()
end

E["addOnTestMode"] = addOnTestMode
