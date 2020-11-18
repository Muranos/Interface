local E, L, C = select(2, ...):unpack()

local P = E["Party"]
local _G = _G
local UnitGUID = UnitGUID

local function IsCRFActive() -- [21]
	return P.isInRaid and not P.isInArena or P.useCRF
end

local function FindAnchorFrame(index)
	local unit = P:GetUnitByIndex(index)
	local guid = UnitGUID(unit)

	if E.customUF.enabled then
		if P.size > 5 then return end

		if E.db.position.uf ~= "blizz" then
			for i = 1, 5 do
				local f = _G[E.customUF.frame .. i]
				if f then
					local unit = f[E.customUF.unit]
					if unit and UnitGUID(unit) == guid then
						return f
					end
				end
			end
		end
	end

	if ( IsCRFActive() or P.test ) then
		if P.isShownCRFM then
			local crf = not P.useKGT and E.CRF_RAID or (P.isInRaid and E.CRF_KGT or E.CRF_PARTY)
			local n = #crf
			for i = 1, n do
				local name = crf[i]
				local f = _G[name]
				if f and f.unit and UnitGUID(f.unit) == guid then return f end
			end
		end
	elseif index ~= 5 then
		return _G["PartyMemberFrame" .. index]
	end
end

function P:GetRelativeScale(f)
	local effectiveScale
	if E.customUF.enabled then -- VuhDo, Grid2, ZPerl
		effectiveScale = f:GetEffectiveScale() / UIParent:GetEffectiveScale()
	else
		effectiveScale = 1
	end

	return f:GetHeight() * effectiveScale / E.BASE_ICON_SIZE * E.db.icons.scale
end

function P:SetAnchorPosition(f)
	f.anchor:ClearAllPoints()
	f.anchor:SetPoint(self.anchorPoint, f, self.point)
end

function P:SetOffset(f)
	f.container:ClearAllPoints()
	f.container:SetPoint("CENTER", f, self.containerOfsX, self.containerOfsY)
end

function P:UpdatePosition()
	if self.disabled then
		return
	end

	self:HideAllBars()

	local scale, updateBackdrop
	local n = self:GetGroupSize() -- iss#30

	for i = 1, n do
		local index = not self.isInRaid and i == n and 5 or i
		if not self.hideMe or index ~= self.groupInfo[E.MyGUID].index then
			local bar = self.spellBars[index]
			if E.db.position.detached then
				E.LoadPosition(bar)
				bar:Show()
			else
				local frame = FindAnchorFrame(index)
				if frame then
					if E.db.icons.autoScale then
						if not scale then
							scale = self:GetRelativeScale(frame)
							if scale ~= self.iconScale then
								updateBackdrop = true
							end
							self.iconScale = scale
						end

						bar.anchor:SetScale(math.min(scale, 1))
						bar.container:SetScale(scale)

						if E.db.icons.displayBorder and E.db.icons.pixelPerfect and updateBackdrop then
							self:UpdateBarBackdrop(bar)
						end
					end

					bar:ClearAllPoints()
					bar:SetPoint(self.point, frame, self.relativePoint)
					bar:Show()
				end
			end

			self:SetAnchorPosition(bar)
			self:SetOffset(bar)
		end
	end
end

function P:CVAR_UPDATE(cvar, value)
	if cvar == "USE_RAID_STYLE_PARTY_FRAMES" then
		self.useCRF = value == "1"

		if not E.db.position.detached then
			self:UpdatePosition()
		end
	end
end

local hookFunc = function()
	if P.enabled and not E.db.position.detached and IsCRFActive() then
		P:UpdatePosition()
	end
end

function P:SetHooks()
	if self.hooked then
		return
	end

	-- Grid2
	if ( not IsAddOnLoaded("Blizzard_CompactRaidFrames") or not IsAddOnLoaded("Blizzard_CUFProfiles") ) then return end

	self.useCRF = C_CVar.GetCVarBool("useCompactPartyFrames")
	self.useKGT = CompactRaidFrameManager_GetSetting("KeepGroupsTogether")
	self.isShownCRFM = CompactRaidFrameManager_GetSetting("IsShown")
	self.activeRaidProfile = GetActiveRaidProfile()

	hooksecurefunc("CompactRaidFrameManager_SetSetting", function(arg)
		if arg == "IsShown" then
			local isShown = CompactRaidFrameManager_GetSetting("IsShown")
			if P.isShownCRFM ~= isShown then
				P.isShownCRFM = isShown
				hookFunc()
			end
		elseif arg == "KeepGroupsTogether" then
			P.useKGT = CompactRaidFrameManager_GetSetting("KeepGroupsTogether")
		end
	end)

	hooksecurefunc("CompactUnitFrameProfiles_ApplyProfile", function()
		hookFunc()
	end)

	self.hooked = true
end
