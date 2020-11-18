local E, L, C = select(2, ...):unpack()

local P = E["Party"]

local visibility = {
	name = L["Visibility"],
	order = 50,
	type = "group",
	get = function(info) local option = info[#info] return E.db.visibility[option] end,
	set = function(info, value) local option = info[#info] E.db.visibility[option] = value P:Refresh(true) end,
	args = {
		zone = {
			name = ZONE,
			order = 10,
			type = "multiselect",
			values = E.L_ZONE,
			get = function(_, key) return E.db.visibility[key] end,
			set = function(_, key, value) E.db.visibility[key] = value P:Refresh(true) end,
		},
		groupType = {
			name = DUNGEONS_BUTTON,
			order = 20,
			type = "group",
			inline = true,
			args = {
				finder = {
					name = ENABLE,
					desc = L["Enable in automated instance groups"] .. " (" .. LOOKING_FOR_DUNGEON_PVEFRAME .. ", " .. SKIRMISH .. "...) ",
					type = "toggle",
				},
			}
		},
		groupSize = {
			name = L["Group Size"],
			order = 30,
			type = "group",
			inline = true,
			args = {
				size = {
					name = L["Max number of group members"],
					width = "double",
					type = "range",
					min = 2, max = 40, step = 1,
				},
			}
		}
	}
}

P.options.args["visibility"] = visibility
