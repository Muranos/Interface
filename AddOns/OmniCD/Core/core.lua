local E, L, C = select(2, ...):unpack()

local tinsert = table.insert
local tremove = table.remove

E.Write = function(...)
	print(E.userClassHexColor .. "OmniCD|r: ", ...)
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

E.UpdateEnabledSpells = function(module)
	wipe(module.spell_enabled)

	for _, v in pairs(E.spell_db) do
		local n = #v
		for i = 1, n do
			local t = v[i]
			local id = t.spellID
			if module.IsEnabledSpell(id) then
				module.spell_enabled[id] = true
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

	local db = f.settings or E.db
	db = db.manualPos[f.key]
	db.x = x
	db.y = y
end

E.LoadPosition = function(f, key)
	key = key or f.key
	local db = f.settings or E.db -- [57]
	db.manualPos[key] = db.manualPos[key] or {}
	db = db.manualPos[key]
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
	if not f.settings then return end

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
	local width = anchor.text:GetWidth() + 20
	anchor:SetWidth(width)
end

do
	local Timers = CreateFrame("Frame")
	local unusedTimers = {}

	local TimerFinished = function(self)
		self.func(unpack(self.args))
		tinsert(unusedTimers, self)
	end

	local function CreateTimer()
		local TimerAnim = Timers:CreateAnimationGroup()
		local Timer = TimerAnim:CreateAnimation("Alpha")
		Timer:SetScript("OnFinished", TimerFinished)
		Timer.TimerAnim = TimerAnim

		return Timer
	end

	E.TimerAfter = function(delay, func, ...)
		local Timer = tremove(unusedTimers)
		if not Timer then
			Timer = CreateTimer()
		end
		Timer.args = {...}
		Timer.func = func
		Timer:SetDuration(delay)
		Timer.TimerAnim:Play()

		return Timer
	end
end

E.IsPercentChance = function(percent)
	return percent >= math.random(1, 100)
end

E.FormatConcat = function(tbl, template, template2)
	local t = {}
	for k, v in ipairs(tbl) do
		if template2 then
			if (k % 2 == 0) then
				t[k] = v and template2:format(v) or ""
			else
				t[k] = v and template:format(v) or ""
			end
		else
			t[k] = v and template:format(v) or ""
		end
	end
	return table.concat(t)
end

E.pairs = function(t, ...)
	local i, a, k, v = 1, {...}
	return function()
		repeat
			k, v = next(t, k)
			if k == nil then
				i, t = i + 1, a[i]
			end
		until k ~= nil or not t
		return k, v
	end
end
