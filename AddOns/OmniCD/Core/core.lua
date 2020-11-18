local E, L, C = select(2, ...):unpack()

local tinsert = table.insert
local tremove = table.remove

E.Write = function(...)
	print(E.MyClassHexColor .. "OmniCD|r: ", ...)
end

E.IsTableExact = function(a, b)
	if #a ~= #b then return false end
	for i = 1, #a do
		if (a[i] ~= b[i]) then return false end
	end
	return true
end

E.DeepCopy = function(source)
	local copy = {}
	if type(source) == "table" then
		for k, v in pairs(source) do
			copy[k] = E.DeepCopy(v)
		end
	else
		copy = source
	end

	return copy
end

E.GetModuleEnabled = function(k)
	return E.DB.profile.modules[k]
end

E.SetModuleEnabled = function(k, v)
	E.DB.profile.modules[k] = v

	local module = E[k]
	if v then
		module:Enable()
	else
		module:Disable()
	end
end

E.UpdateEnabledLT = function(module)
	wipe(module.enabledLT)

	for _, v in pairs(E.spellList) do
		local n = #v
		for i = 1, n do
			local t = v[i]
			if module.IsSpellEnabled(t) then
				module.enabledLT[t.spellID] = true
			end
		end
	end
end

local function SavePosition(f)
	local x = f:GetLeft()
	local y = f:GetTop()
	local s = f:GetEffectiveScale()
	x = x * s
	y = y * s

	local db = f.settings or E.DB.profile[f.modname]
	db = db.manualPos[f.key]
	db.x = x
	db.y = y
end

E.LoadPosition = function(f)
	local db = f.settings or E.DB.profile[f.modname] -- external plug-in namespace or internal

	db.manualPos[f.key] = db.manualPos[f.key] or {}

	db = db.manualPos[f.key]
	local x = db.x
	local y = db.y

	f:ClearAllPoints()

	if not x then
		f:SetPoint("CENTER", UIParent)
		SavePosition(f)
	else
		local s = f:GetEffectiveScale()
		x = x / s
		y = y / s

		f:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x, y)
	end
end

E.UpdatePosition = function(f)
	if not f.settings then
		return
	end

	E.LoadPosition(f)

	local parentWidth = UIParent:GetWidth()
	local clamp = f.settings.center and (1 - parentWidth)/2 or 0
	f:SetClampRectInsets(clamp, -clamp, 0, 0)
	clamp = f.settings.center and (f.anchor:GetWidth() - parentWidth)/2 or 0
	f.anchor:SetClampRectInsets(clamp, -clamp, 0, 0)
end

function OmniCD_AnchorOnMouseDown(self)
	local bar = self:GetParent()
	bar:StartMoving()
end

function OmniCD_AnchorOnMouseUp(self)
	local bar = self:GetParent()
	bar:StopMovingOrSizing()
	SavePosition(bar)
	LibStub("AceConfigRegistry-3.0"):NotifyChange("OmniCD")
end

E.SetWidth = function(anchor)
	local width = anchor.text:GetWidth() + 28
	anchor:SetWidth(width)
end

E.ButtonOnLeave = function(self)
	self:SetBackdropBorderColor(0, 0, 0, 1)
end

E.ButtonOnEnter = function(self)
	local r, g, b = GetClassColor(E.MyClass)
	self:SetBackdropBorderColor(r, g, b, 1)
end

E.OnMouseDown = function(self, button)
	if button == "LeftButton" and not self.isMoving then
		self:StartMoving()
		self.isMoving = true
	end
end

E.OnMouseUp = function(self, button)
	if button == "LeftButton" and self.isMoving then
		self:StopMovingOrSizing()
		self.isMoving = false
	end
end

E.GetClassHexColor = function(class)
	local hex = select(4, GetClassColor(class))
	return "|c" .. hex
end

E.cropBorder = {0.07, 0.93, 0.07, 0.93}

local Timers = CreateFrame("Frame")
local unusedTimers = {}

local TimerFinished = function(self)
	self.func(unpack(self.args))
	tinsert(unusedTimers, self)
end

local function GetTimer()
	local TimerAnim = Timers:CreateAnimationGroup()
	local Timer = TimerAnim:CreateAnimation("Alpha")
	Timer:SetScript("OnFinished", TimerFinished)
	Timer.TimerAnim = TimerAnim

	return Timer
end

E.TimerAfter = function(delay, func, ...)
	local Timer = tremove(unusedTimers)

	if not Timer then
		Timer = GetTimer()
	end

	Timer.args = {...}
	Timer.func = func
	Timer:SetDuration(delay)
	Timer.TimerAnim:Play()
end
