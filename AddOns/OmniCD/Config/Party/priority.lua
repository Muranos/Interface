local E, L, C = select(2, ...):unpack()

local P = E["Party"]

local priority = {
	name = L["Priority"],
	order = 60,
	type = "group",
	get = function(info) local option = info[#info] return E.db.priority[option] end,
	set = function(info, value) local option = info[#info] E.db.priority[option] = value P:ConfigBars("priority") end,
	args = {},
}

for k, v in pairs(E.L_PRIORITY) do
	priority.args[k] = {
		name = v,
		order = 11 - C.Party.priority[k],
		width = "double",
		type = "range",
		min = 0, max = 10, step = 1,
	}
end

P.options.args["priority"] = priority
