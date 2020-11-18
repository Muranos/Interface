local E, L, C = select(2, ...):unpack()

local P = E["Party"]
local sort = table.sort

function P:SetIconLayout(f)
	sort(f.icons, function(a, b)
		if E.db.priority[a.type] == E.db.priority[b.type] then
			return a.spellID < b.spellID
		end

		return E.db.priority[a.type] > E.db.priority[b.type]
	end)

	local count, rows, numActive, lastActiveIndex = 0, 1, 1

	for i = 1, f.numIcons do
		local icon = f.icons[i]

		icon:Hide()

		if self.displayInactive or icon.active then
			icon:ClearAllPoints()

			if numActive > 1 then
				count = count + 1

				if not self.doubleRow and count == self.columns or (self.doubleRow and rows == 1 and E.db.priority[icon.type] <= self.breakPoint) then
					icon:SetPoint(self.point, f.container, self.ofsX * rows, self.ofsY * rows)

					count = 0
					rows = rows + 1
				else
					icon:SetPoint(self.point2, f.icons[lastActiveIndex], self.relativePoint2, self.ofsX2, self.ofsY2)
				end
			else
				if self.doubleRow and E.db.priority[icon.type] <= self.breakPoint then
					icon:SetPoint(self.point, f.container, self.ofsX * rows, self.ofsY * rows)
					rows = rows + 1
				else
					icon:SetPoint(self.point, f.container)
				end
			end

			numActive = numActive + 1
			lastActiveIndex = i

			icon:Show()
		end
	end
end

function P:SetAnchor(f)
	if E.db.general.showAnchor or (E.db.position.detached and not E.db.position.locked) then
		f.anchor:Show()
	else
		f.anchor:Hide()
	end

	if not E.db.position.detached or E.db.position.locked then
		f.anchor:EnableMouse(false)
		f.anchor.background:SetColorTexture(1, 0.1, 0.1, 0.6)
	else
		f.anchor:EnableMouse(true)
		f.anchor.background:SetColorTexture(0.1, 0.9, 0.1, 0.7)
	end
end

function P:SetIconScale(f)
	if E.db.position.detached or not E.db.icons.autoScale then
		local scale = E.db.icons.scale
		f.anchor:SetScale(math.min(scale, 1))
		f.container:SetScale(scale)
	end
end

function P:SetBorder(icon)
	if E.db.icons.displayBorder then
		if E.db.icons.pixelPerfect then
			icon:SetBackdropBorderColor(E.db.icons.borderColor.r, E.db.icons.borderColor.g, E.db.icons.borderColor.b, 1)
			icon.IconBorder:Hide()
		else
			icon:SetBackdropBorderColor(0, 0, 0, 0)
			icon.IconBorder:SetVertexColor(E.db.icons.borderColor.r, E.db.icons.borderColor.g, E.db.icons.borderColor.b)
			icon.IconBorder:Show()
		end

		icon.icon:SetTexCoord(unpack(E.cropBorder))
	else
		icon.icon:SetTexCoord(0, 1, 0, 1)
		icon:SetBackdropBorderColor(0, 0, 0, 0)
		icon.IconBorder:Hide()
	end
end

function P:SetMarker(icon)
	if E.db.highlight.markEnhanced and E.bigSpells[icon.spellID] then
		icon.IconMarker:Show()
	else
		icon.IconMarker:Hide()
	end
end

function P:SetAlpha(icon)
	local charges = tonumber(icon.Count:GetText())
	icon:SetAlpha(icon.active and E.db.icons.activeAlpha or E.db.icons.inactiveAlpha)
	icon.icon:SetDesaturated(E.db.icons.desaturateActive and icon.active and not icon.overlay and (not charges or charges == 0));
end

function P:SetSwipe(icon)
	icon.cooldown:SetReverse(E.db.icons.reverse)
	icon.cooldown:SetSwipeColor(0, 0, 0, E.db.icons.swipeAlpha)
end

function P:SetCounter(icon)
	local charges = tonumber(icon.Count:GetText())
	local noCount = charges and charges > 0 or (icon.overlay and true) or not E.db.icons.showCounter
	icon.cooldown:SetHideCountdownNumbers(noCount) -- [11]
	icon.counter:SetScale(E.db.icons.counterScale)
end

function P:SetChargeScale(icon)
	icon.Count:SetScale(E.db.icons.chargeScale)
end

function P:SetTooltip(icon)
	icon:EnableMouse(E.db.general.tooltip)
end

function P:ApplySettings(f)
	self:SetAnchor(f)
	self:SetIconScale(f)

	for i = 1, f.numIcons do
		local icon = f.icons[i]
		self:SetBorder(icon)
		self:SetMarker(icon)
		self:SetAlpha(icon)
		self:SetSwipe(icon)
		self:SetCounter(icon)
		self:SetChargeScale(icon)
		self:SetTooltip(icon)
	end
end
