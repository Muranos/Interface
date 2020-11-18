local E, L, C = select(2, ...):unpack()

local P = E["Party"]

function OmniCD_CooldownOnHide(self)
	if self:GetCooldownTimes() > 0 then return end

	local icon = self:GetParent()
	local info = P.groupInfo[icon.guid]

	if not info then return end

	local id = icon.spellID
	if info.active and info.active[id] then
		local charges = info.active[id].charges
		local maxcharges = icon.maxcharges
		if maxcharges and charges then -- [10]
			if charges + 1 < maxcharges then
				P:StartCooldown(icon, icon.duration, true)

				return
			else
				icon.Count:SetText(maxcharges)
			end
		end

		info.active[id] = nil
		icon.active = nil

		icon:SetAlpha(E.db.icons.inactiveAlpha) -- [16]
		icon.icon:SetDesaturated(false)

		if not P.displayInactive then -- [100]
			local bar = icon:GetParent():GetParent()
			P:SetIconLayout(bar)
		end
	end
end

function P:ResetCooldown(icon)
	local id = icon.spellID
	local info = self.groupInfo[icon.guid]
	local active = info and info.active and info.active[id]

	if not active then
		return
	end

	-- Hypothermia
	if id == 45438 and E.db.icons.showForbearanceCounter then
		local timeLeft = self:GetDebuffDuration(info.unit, 41425)
		if timeLeft then
			self:StartCooldown(icon, timeLeft, nil, true)

			return
		end
	end

	local maxcharges = icon.maxcharges
	local charges = active.charges

	if maxcharges and charges and charges + 1 < maxcharges then
		charges = charges + 1
		icon.Count:SetText(charges)
		icon.cooldown:SetDrawSwipe(false)
		icon.cooldown:SetHideCountdownNumbers(true) -- [11]
		active.charges = charges
	else
		icon.cooldown:Clear()
	end
end

function P:ResetAllIcons()
	for i = 1, self.numBars do
		local bar = self.spellBars[i]
		local info = self.groupInfo[bar.guid]

		if info and info.active then
			wipe(info.active)
		end

		for j = 1, #bar.icons do
			local icon = bar.icons[j]
			local id = icon.spellID

			if icon.active then
				local maxcharges = icon.maxcharges
				if maxcharges then
					icon.Count:SetText(maxcharges)
				end

				icon.active = nil
				icon.cooldown:Clear()
				self:RemoveHighlight(icon)
			end

			if info[id] then
				info[id] = nil
				icon.icon:SetVertexColor(1, 1, 1)
			end
		end
	end
end

function P:SetCooldownElements(icon, charges, highlight)
	local noCount = charges and charges > 0 or highlight or not E.db.icons.showCounter
	icon.cooldown:SetDrawEdge(charges and charges > -1 or false)
	icon.cooldown:SetDrawSwipe( not highlight and (not charges or charges < 1) )
	icon.cooldown:SetHideCountdownNumbers(noCount)
	if E.OmniCC then
		icon.cooldown.noCooldownCount = noCount
	end
end

local function SetActiveIcon(icon, startTime, duration, charges, modRate)
	if E.OmniCC then -- [13]
		if not P:HighlightIcon(icon) then
			P:SetCooldownElements(icon, charges)
		end
	end

	icon.cooldown:SetCooldown(startTime, duration, modRate)
end

function P:UpdateCooldown(icon, reducedTime, charges)
	local info = self.groupInfo[icon.guid]
	local active = info and info.active and info.active[icon.spellID]

	if not active then
		return
	end

	if charges then --< AddIcons only
		if not self:HighlightIcon(icon, true) then
			self:SetCooldownElements(icon, charges)
		end

		icon:SetAlpha(E.db.icons.activeAlpha)
		icon.cooldown:SetCooldown(active.startTime, active.duration, info.ineffableTruth)
		icon.active = true
	else
		active.startTime = active.startTime - reducedTime
		icon.cooldown:SetCooldown(active.startTime, active.duration, info.ineffableTruth)
	end
end

local updateStrivePvpCD = function(id)
	local _, cd = GetSpellCooldown(id)
	if cd >= 2 then -- GCD
		E.Comms:UpdateStrivePvpCD(cd)
	end
end

function P:StartCooldown(icon, cd, recharge, noGlow)
	local guid = icon.guid
	local info = self.groupInfo[guid]

	if not info then -- [1]
		return
	end

	local id = icon.spellID

	info.active[id] = info.active[id] or {}

	local active = info.active[id]
	local charges = active.charges or icon.maxcharges
	local now = GetTime()

	local modRate
	if E.BOOKTYPE_SPELLS[icon.type] or E.BOOKTYPE_SPELLS[id] then
		-- [53] TODO: need to test this
		if info.glimpseOfClarity and not recharge then
			cd = cd - 3
		end

		modRate = info.ineffableTruth
		if modRate then
			cd = cd * modRate
		end
	end

	if charges then
		if recharge then
			charges = charges + 1
			SetActiveIcon(icon, now, cd, charges, modRate)
		elseif charges == icon.maxcharges then
			charges = charges - 1
			SetActiveIcon(icon, now, cd, charges, modRate)
		elseif charges == 0 then
			SetActiveIcon(icon, now, cd, charges, modRate)
		else
			charges = charges - 1
			now = active.startTime
			if E.OmniCC and charges == 0 then
				SetActiveIcon(icon, now, cd, charges, modRate)
			end
		end

		icon.Count:SetText(charges)
		active.charges = charges
	else
		SetActiveIcon(icon, now, cd, charges, modRate)
	end

	active.startTime = now
	active.duration = cd
	if id == 46968 or id == 192058 then -- Shockwave, Cap totem
		active.numHits = 0
	end

	icon.active = true
	icon:SetAlpha(E.db.icons.activeAlpha)

	if not self.displayInactive then
		local bar = icon:GetParent():GetParent()
		self:SetIconLayout(bar)
	end

	if E.OmniCC and not icon.overlay or (not E.OmniCC and not self:HighlightIcon(icon)) then
		if not recharge and not noGlow then
			self:SetGlow(icon)
		end

		if not E.OmniCC then
			self:SetCooldownElements(icon, charges)
		end

		icon.icon:SetDesaturated(E.db.icons.desaturateActive and (not charges or charges == 0))
	end

	if guid == E.MyGUID and self.isInPvPInstance and info.slotLT and info.slotLT.multID == id then
		E.TimerAfter(2, updateStrivePvpCD, id) -- GCD
	end
end
