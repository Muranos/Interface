local E, L, C = select(2, ...):unpack()

local P = E["Party"]

P.options = {
	disabled = function(info) return info[2] and not E.GetModuleEnabled("Party") end,
	name = PARTY,
	order = 10,
	type = "group",
	args = {},
}

function P:ConfigIcons(arg)
	local n = self:GetGroupSize()
	for i = 1, n do
		local index = not self.isInRaid and i == n and 5 or i
		local f = self.spellBars[index]
		for j = 1, f.numIcons do
			local icon = f.icons[j]
			if arg == "tooltip" then
				self:SetTooltip(icon)
			elseif arg == "chargeScale" then
				self:SetChargeScale(icon)
			elseif arg == "showCounter" or arg == "counterScale" then
				self:SetCounter(icon)
			elseif arg == "reverse" or arg == "swipeAlpha" then
				self:SetSwipe(icon)
			elseif arg == "activeAlpha" or arg == "inactiveAlpha" or arg == "desaturateActive" then
				self:SetAlpha(icon)
			elseif arg == "displayBorder" or arg == "pixelPerfect" or arg == "borderColor" then
				self:SetBorder(icon)
			elseif arg == "markEnhanced" then
				self:SetMarker(icon)
			end
		end
	end
end

function P:ConfigBars(arg)
	if arg ~= "showAnchorOrlocked" and arg ~= "priority" then
		self:UpdatePositionValues()
	end

	local n = self:GetGroupSize()
	for i = 1, n do
		local index = not self.isInRaid and i == n and 5 or i
		local f = self.spellBars[index]
		if arg == "preset" or arg == "anchor" or arg == "attach" or arg == "noTheme" then
			if not E.db.position.detached then
				local _, relativeTo = f:GetPoint()
				if relativeTo ~= "UIParent" then
					f:ClearAllPoints()
					f:SetPoint(self.point, relativeTo, self.relativePoint)
				end
			end

			self:SetAnchorPosition(f)
			self:SetOffset(f)
			self:SetIconLayout(f)
		elseif arg == "offsetX" or arg == "offsetY" then
			self:SetOffset(f)
		elseif arg == "detached" then
			self:SetAnchor(f)
			self:SetIconLayout(f)
		elseif arg == "showAnchorOrlocked" then
			self:SetAnchor(f)
		elseif arg == "reset" then
			E.LoadPosition(f)
		else -- [20]
			self:SetIconLayout(f)
		end
	end
end

function P:ResetOptions(btn)
	local option = btn.arg
	if option then
		E.DB.profile.Party[option] = E.DeepCopy(C.Party[option])
	else
		E.DB.profile.Party = E.DeepCopy(C.Party)
		E.db = E.DB.profile.Party
	end

	if self.test then
		self:Test()
		self:Test()
	end
end

P.UpdateExecuteNames = function()
	if not E.options then -- [2]
		return
	end

	E.options.args.Party.args.enable.name = E.GetModuleEnabled("Party") and DISABLE or ENABLE
	E.options.args.Party.args.position.args.manual.args.locked.name = E.db.position.locked and UNLOCK_FRAME or LOCK_FRAME
end
