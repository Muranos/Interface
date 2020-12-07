local E, L, C = select(2, ...):unpack()

local tinsert = table.insert
local tremove = table.remove
local P = E["Party"]

P.extraBars = {}

local function OmniCD_ExBarOnHide(self)
	P:RemoveUnusedIcons(self, 1)
	self.numIcons = 0
end

function P:HideExBars()
	for _, f in pairs(self.extraBars) do
		f:Hide()
	end
end

local function CreateBar(key)
	local f = CreateFrame("Frame", "OmniCD" .. key, UIParent, "OmniCDTemplate")
	f.key = key
	f.icons = {}
	f.numIcons = 0
	f:SetScript("OnShow", nil)
	f:SetScript("OnHide", OmniCD_ExBarOnHide)

	local anchor = f.anchor
	anchor:SetPoint("BOTTOMLEFT", f, "TOPRIGHT")
	anchor.background:SetColorTexture(0, 0, 0, 0.7)
	local name = key == "interruptBar" and L["Interrupts"] or L["Raid CD"]
	anchor.text:SetText(name)
	anchor:EnableMouse(true)
	E.SetWidth(f.anchor)

	return f
end

function P:CreateExBars()
	if next(self.extraBars) == nil then
		for i = 1, 2 do
			local key = i == 1 and "interruptBar" or "raidCDBar"
			self.extraBars[key] = CreateBar(key)
		end
	end
end

function P:UpdateExBars(bar)
	for i = 1, 2 do
		local key = i == 1 and "interruptBar" or "raidCDBar"
		local f = self.extraBars[key]
		local f_icons = f.icons
		local f_container = f.container
		local db = E.db.extraBars[key]
		if db.enabled then
			local n = 0
			for j = bar.numIcons, 1, -1 do
				local icons = bar.icons
				local icon = icons[j]
				local spellID = icon.spellID
				local sId = tostring(spellID)
				if (i == 1 and icon.type == "interrupt") or (i == 2 and E.db.raidCDS[sId]) then
					tremove(icons, j)
					tinsert(f_icons, icon)
					icon:SetParent(f_container)

					local statusBar = icon.statusBar
					if db.layout == "vertical" and db.progressBar then
						statusBar = statusBar or self.GetStatusBar(icon, key)
					elseif statusBar then
						P.RemoveStatusBar(statusBar)
						icon.statusBar = nil
					end
					n = n + 1
				end
			end
			bar.numIcons = bar.numIcons - n
			f.numIcons = f.numIcons + n

			self:SetExIconLayout(key, nil, true)
		end
	end
end

function P:UpdateExPositionValues()
	for key, f in pairs(self.extraBars) do
		local db = E.db.extraBars[key]
		local px = E.NumPixels / db.scale
		local isProgressBarShown = db.enabled and db.progressBar
		if db.layout == "horizontal" then
			f.point = "TOPLEFT"
			f.relat = "TOPRIGHT"
			f.ofsX1 = 0
			f.ofsY1 = -E.BASE_ICON_SIZE - (db.paddingY * px)
			f.ofsX2 = db.paddingX * px
			f.ofsY2 = 0
			if key == "interruptBar" then
				self.rearrangeInterrupts = nil
			end
		else
			f.point = "TOPLEFT"
			f.relat = "BOTTOMLEFT"
			f.ofsX1 = E.BASE_ICON_SIZE + (db.paddingX  * px) + (isProgressBarShown and db.statusBarWidth or 0)
			f.ofsY1 = 0
			f.ofsX2 = 0
			f.ofsY2 = -db.paddingY * px
			if key == "interruptBar" then
				self.rearrangeInterrupts = isProgressBarShown and db.sortBy == 2
			end
		end
	end
end

do
	local timers = {}

	local sorters = {
		function(a, b)
			local acd, bcd = a.duration, b.duration
			if acd == bcd then
				if a.class == b.class then
					return P.groupInfo[a.guid].name < P.groupInfo[b.guid].name
				end
				return a.class < b.class
			end
			return acd < bcd
		end,
		function(a, b)
			local aactive = P.groupInfo[a.guid].active[a.spellID]
			local bactive = P.groupInfo[b.guid].active[b.spellID]
			if aactive and bactive then
				return a.duration + aactive.startTime < b.duration + bactive.startTime
			elseif not aactive and not bactive then
				local acd, bcd = a.duration, b.duration
				if acd == bcd then
					local aclass, bclass = a.class, b.class
					if aclass == bclass then
						return P.groupInfo[a.guid].name < P.groupInfo[b.guid].name
					end
					return aclass < bclass
				end
				return acd < bcd
			elseif aactive then return false
			elseif bactive then return true end
		end,
		function(a, b)
			local aprio, bprio = E.db.priority[a.type], E.db.priority[b.type]
			if aprio == bprio then
				local aclass, bclass = a.class, b.class
				if aclass == bclass then
					return a.spellID < b.spellID
				end
				return aclass < bclass
			end
			return aprio > bprio
		end,
		function(a, b)
			local aclass, bclass = a.class, b.class
			if aclass == bclass then
				local aprio, bprio = E.db.priority[a.type], E.db.priority[b.type]
				if aprio == bprio then
					return a.spellID < b.spellID
				end
				return aprio > bprio
			end
			return aclass < bclass
		end,
	}

	local updateLayout = function(key, sortOrder)
		local f = P.extraBars[key]
		local db = E.db.extraBars[key]

		local n = 0
		for i = f.numIcons, 1, -1 do
			local icons = f.icons
			local icon = icons[i]
			local info = P.groupInfo[icon.guid]
			local spellIcon = info and info.spellIcons[icon.spellID]
			if icon ~= spellIcon then
				P:RemoveIcon(icon)
				tremove(icons, i)
				n = n + 1
			else
				icon:Hide()
				icon:ClearAllPoints()
			end
		end
		f.numIcons = f.numIcons - n

		if sortOrder then
			sort(f.icons, sorters[db.sortBy])
		end

		local count, rows = 0, 1
		local columns = db.columns
		for i = 1, f.numIcons do
			local icon = f.icons[i]
			if i > 1 then
				count = count + 1
				if count == columns then
					icon:SetPoint("TOPLEFT", f.container, f.ofsX1 * rows, f.ofsY1 * rows)
					count = 0
					rows = rows + 1
				else
					icon:SetPoint(f.point, f.icons[i-1], f.relat, f.ofsX2, f.ofsY2)
				end
			else
				icon:SetPoint("TOPLEFT", f.container)
			end

			icon:Show()
		end

		P:ApplyExSettings(key)

		timers[key] = nil
	end

	function P:SetExIconLayout(key, noDelay, sortOrder)
		if noDelay then
			updateLayout(key, sortOrder)
		else
			if not timers[key] then -- [33]
				timers[key] = E.TimerAfter(0.5, updateLayout, key, sortOrder)
			end
		end
	end
end

function P:SetExAnchor(key)
	local f = self.extraBars[key]
	if E.db.extraBars[key].locked then
		f.anchor:Hide()
	else
		f.anchor:Show()
	end
end

function P:SetExBorder(icon, key)
	local db = E.db.extraBars[key]
	local db_icon = E.db.icons
	local edgeSize = db_icon.borderPixels * E.NumPixels / db.scale
	local r, g, b = db_icon.borderColor.r, db_icon.borderColor.g, db_icon.borderColor.b
	local isProgressBarShown = db.layout == "vertical" and db.progressBar

	if isProgressBarShown or db_icon.displayBorder then
		icon.borderTop:ClearAllPoints()
		icon.borderBottom:ClearAllPoints()
		icon.borderLeft:ClearAllPoints()
		icon.borderRight:ClearAllPoints()

		icon.borderTop:SetPoint("TOPLEFT", icon, "TOPLEFT")
		icon.borderTop:SetPoint("BOTTOMRIGHT", icon, "TOPRIGHT", 0, -edgeSize)
		icon.borderBottom:SetPoint("BOTTOMLEFT", icon, "BOTTOMLEFT")
		icon.borderBottom:SetPoint("TOPRIGHT", icon, "BOTTOMRIGHT", 0, edgeSize)
		icon.borderLeft:SetPoint("TOPLEFT", icon, "TOPLEFT")
		icon.borderLeft:SetPoint("BOTTOMRIGHT", icon, "BOTTOMLEFT", edgeSize, 0)
		icon.borderRight:SetPoint("TOPRIGHT", icon, "TOPRIGHT")
		icon.borderRight:SetPoint("BOTTOMLEFT", icon, "BOTTOMRIGHT", -edgeSize, 0)

		icon.borderTop:SetColorTexture(r, g, b)
		icon.borderBottom:SetColorTexture(r, g, b)
		icon.borderLeft:SetColorTexture(r, g, b)
		icon.borderRight:SetColorTexture(r, g, b)

		icon.borderTop:Show()
		icon.borderBottom:Show()
		icon.borderLeft:Show()
		icon.borderRight:Show()

		icon.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
	else
		icon.borderTop:Hide()
		icon.borderBottom:Hide()
		icon.borderRight:Hide()
		icon.borderLeft:Hide()

		icon.icon:SetTexCoord(0, 1, 0, 1)
	end

	if isProgressBarShown then
		local statusBar = icon.statusBar
		statusBar.borderTop:ClearAllPoints()
		statusBar.borderBottom:ClearAllPoints()
		statusBar.borderRight:ClearAllPoints()

		statusBar.borderTop:SetPoint("TOPLEFT", statusBar, "TOPLEFT")
		statusBar.borderTop:SetPoint("BOTTOMRIGHT", statusBar, "TOPRIGHT", 0, -edgeSize)
		statusBar.borderBottom:SetPoint("BOTTOMLEFT", statusBar, "BOTTOMLEFT")
		statusBar.borderBottom:SetPoint("TOPRIGHT", statusBar, "BOTTOMRIGHT", 0, edgeSize)
		statusBar.borderRight:SetPoint("TOPRIGHT", statusBar.borderTop, "BOTTOMRIGHT")
		statusBar.borderRight:SetPoint("BOTTOMLEFT", statusBar.borderBottom, "TOPRIGHT", -edgeSize, 0)

		statusBar.borderTop:SetColorTexture(r, g, b)
		statusBar.borderBottom:SetColorTexture(r, g, b)
		statusBar.borderRight:SetColorTexture(r, g, b)
	end
end

function P:UpdateExBarBackdrop(f, key)
	local icons = f.icons
	for i = 1, f.numIcons do
		local icon = icons[i]
		self:SetExBorder(icon, key)
	end
end

function P:SetExScale(key)
	local f = self.extraBars[key]
	local db = E.db.extraBars[key]
	f.container:SetScale(db.scale)
	if db.layout == "vertical" and db.progressBar or E.db.icons.displayBorder then
		self:UpdateExBarBackdrop(f, key)
	end
end

function P:SetExStatusBarWidth(f, key)
	local width = E.db.extraBars[key].statusBarWidth
	f:SetWidth(width)
end

function P:SetExIconName(icon, key)
	local db = E.db.extraBars[key]
	if db.layout == "vertical" and db.progressBar or not db.showName then
		icon.Name:Hide()
	else
		icon.Name:SetText(P.groupInfo[icon.guid].name)
		icon.Name:Show()
	end
end

function P:SetExStatusBarColor(icon, key)
	local db = E.db.extraBars[key]
	local c, r, g, b, a = RAID_CLASS_COLORS[icon.class]
	local statusBar = icon.statusBar

	local db_bar = db.barColors.inactiveColor
	local alpha = db.useIconAlpha and 1 or db_bar.a
	if db.barColors.classColor then
		r, g, b, a = c.r, c.g, c.b, alpha
	else
		r, g, b, a =  db_bar.r, db_bar.g, db_bar.b, alpha
	end
	statusBar.BG:SetVertexColor(r, g, b, a)

	local db_text = db.textColors.inactiveColor
	if db.textColors.classColor then
		r, g, b = c.r, c.g, c.b
	else
		r, g, b = db_text.r, db_text.g, db_text.b
	end
	statusBar.Text:SetTextColor(r, g, b)
end

function P:ApplyExSettings(key)
	P:SetExAnchor(key)
	P:SetExScale(key)

	local f = self.extraBars[key]
	for i = 1, f.numIcons do
		local icon = f.icons[i]
		self:SetExBorder(icon, key)
		self:SetExIconName(icon, key)
		local statusBar = icon.statusBar
		if statusBar then
			self:SetExStatusBarWidth(statusBar, key)
			self:SetExStatusBarColor(icon, key)
		end
		self:SetMarker(icon)
		self:SetAlpha(icon)
		self:SetSwipe(icon)
		self:SetCounter(icon)
		self:SetChargeScale(icon)
		self:SetTooltip(icon)
	end
end

function P:UpdateExPosition()
	if self.disabled then
		return
	end

	for key, f in pairs(self.extraBars) do
		if E.db.extraBars[key].enabled then
			E.LoadPosition(f)
			f:Show()
		else
			f:Hide()
		end
	end
end
