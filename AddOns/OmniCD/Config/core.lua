local E, L, C = select(2, ...):unpack()

local AceDialog = LibStub("AceConfigDialog-3.0")

E.moduleOptions = {}
E.optionsFrames = {}

E.ConfirmAction = function()
	return L["All user set values will be lost. Do you want to proceed?"]
end

local function GetLocalization()
	local localization = GetAddOnMetadata(E.AddOn, "X-Localizations")
	localization = localization:gsub("enUS", ENUS):gsub("deDE", DEDE)
	localization = localization:gsub("esES", ESES):gsub("esMX", ESMX)
	localization = localization:gsub("frFR", FRFR):gsub("koKR", KOKR)
	localization = localization:gsub("ruRU", RURU):gsub("zhCN", ZHCN)
	localization = localization:gsub("zhTW", ZHTW)
	localization = localization:gsub("itIT", LFG_LIST_LANGUAGE_ITIT)
	localization = localization:gsub("ptBR", LFG_LIST_LANGUAGE_PTBR)

	return localization
end

L["Localizations"] = LANGUAGES_LABEL

local fields = {
	"Version",
	"Author",
	"Supported UI",
	"Localizations",
}

local values = {
	["Localizations"] = GetLocalization(),
}

do
	local t = {}

	for i = 1, #E.unitFrameData do
		local uf = E.unitFrameData[i][1]
		t[i] = uf
	end

	values["Supported UI"] = E.FormatConcat(t, "%s, ")
end

local isFound
local changelog = C.changelog:gsub("^[ \t\n]*", E.HEX_C.PERFORMANCE_BLUE):gsub("v(%d[^\n%s]+)",function(ver)
	if not isFound and ver ~= E.Version then
		isFound = true
		return "|cff9d9d9dv"..ver
	end
end)

local function GetOptions()
	if not E.options then
		E.options = {
			name = E.AddOn,
			type = "group",
			args = {
				home = {
					icon = "Interface\\AddOns\\OmniCD\\Media\\logo64",
					iconCoords = {0, 1, 0.1, 1.1},
					name = E.AddOn,
					order = 0,
					type = "group",
					childGroups = "tab",
					get = function(info) local option = info[#info] return E.DB.profile[option] end,
					set = function(info, value) local option = info[#info] E.DB.profile[option] = value end,
					args = {
						title = {
							image = "Interface\\AddOns\\OmniCD\\Media\\logo64", imageWidth = 64, imageHeight = 64, imageCoords = { 0, 1, 0, 1 },
							name = E.AddOn,
							order = 0,
							type = "description",
							fontSize = "large",
						},
						pd1 = {
							name = "\n\n\n\n", order = 0.5, type = "description",
						},
						pd2 = {
							name = "\n\n\n", order = 10, type = "description",
						},
						loginMsg = {
							name = L["Login Message"],
							order = 11,
							type = "toggle",
						},
						notifyNew = {
							name = L["Notify Updates"],
							desc = L["Send a chat message when a newer version is found."],
							order = 12,
							type = "toggle",
						},
						pd3 = {
							name = "\n", order = 13, type = "description",
						},
						whatsNew = {
							name = SPLASH_BASE_HEADER,
							order = 20,
							type = "group",
							args = {
								notice = {
									name = L["|cffff2020Important!|r Covenant and Soulbind Conduit data can only be acquired from group members with OmniCD installed."],
									order = 0,
									type = "description",
								},
								lb1 = {
									name = "\n", order = 2, type = "description",
								},
								whatsNew = {
									name = changelog,
									order = 3,
									type = "description",
								},
							}
						},
						slashCommands = {
							name = L["Slash Commands"],
							order = 30,
							type = "group",
							args = {
								H1 = {name = L["Usage:"], order = 1, type = "description"},
								d1 = {name = "/oc <command> <value:optional>", order = 2, type = "description"},
								lb = {name = "\n\n", order = 3, type = "description"},
								H2 = {name = L["Commands:"], order = 4, type = "description"},
								f1 = {name = E.HEX_C.PERFORMANCE_BLUE .. "/oc t:", order = 5, type = "description", width = 0.6},
								v1 = {name = L["Toggle test frames for current zone."], order = 6, type = "description", width = 3.5},
								f2 = {name = E.HEX_C.PERFORMANCE_BLUE .. "/oc rl:", order = 7, type = "description", width = 0.6},
								v2 = {name = L["Reload addon."], order = 8, type = "description", width = 3.5},
								f3 = {name = E.HEX_C.PERFORMANCE_BLUE .. "/oc rt:", order = 9, type = "description", width = 0.6},
								v3 = {name = L["Reset all cooldown timers."], order = 10, type = "description", width = 3.5},
								f4 = {name = E.HEX_C.PERFORMANCE_BLUE .. "/oc rt db:", order = 11, type = "description", width = 0.6},
								v4 = {name = L["Clean wipe the savedvariable file. |cffff2020Warning|r: This can not be undone!"], order = 12, type = "description", width = 3.5},
							}
						},
						feedback = {
							name = L["Feedback"],
							order = 40,
							type = "group",
							args = {
								f1 = {
									name = SUGGESTFRAME_TITLE,
									order = 1,
									type = "description",
									width = 0.6,
								},
								v1 = {
									name = "",
									order = 2,
									type = "input",
									width = 3.5,
									get = function() return "https://www.curseforge.com/wow/addons/omnicd/issues" end,
									set = function() return end,
								},
								f2 = {
									name = L["Help Translate"],
									order = 3,
									type = "description",
									width = 0.6,
								},
								v2 = {
									name = "",
									order = 4,
									type = "input",
									width = 3.5,
									get = function() return "https://www.curseforge.com/wow/addons/omnicd/localization" end,
									set = function() return end,
								},
							}
						},
					}
				},
			},
			plugins = {
				profiles = {
					profiles = E.optionsFrames.profiles
				},
			},
		}

		for i = 1, #fields do
			local field = fields[i]
			local value = E[field] or values[field] or ""
			E.options.args.home.args[field] = {
				name = "|cffffd200" .. (L[field] or field),
				order = i,
				type = "description",
				width = 0.6,
			}
			E.options.args.home.args[field .. "value"] = {
				name = i == 1 and function() return value .. " " .. (E.DB.global.oodMsg or "") end or value,
				order = i + 0.1,
				type = "description",
				width = 3.5,
			}
			E.options.args.home.args["lb" .. i] = {
				name = "", order = i + 0.2, type = "description"
			}
		end

		for k, v in pairs(E.moduleOptions) do
			E.options.args[k] = (type(v) == "function") and v() or v

			E.options.args[k].args["title"] = {
				name = k == "Party" and "|cffffd200" .. E.options.args[k].name or E.options.args[k].name,
				order = 0,
				type = "description",
				fontSize = "large",
			}

			E.options.args[k].args["enable"] = {
				disabled = false,
				name = E.GetModuleEnabled(k) and DISABLE or ENABLE,
				desc = L["Toggle module on and off"],
				order = 1,
				type = "execute",
				func = function()
					local state = E.GetModuleEnabled(k)
					E.SetModuleEnabled(k, not state)
					E.options.args[k].args.enable.name = not state and DISABLE or ENABLE
				end,
			}
			E.options.args[k].args.hd1 = {
				name = "",
				order = 2,
				type = "header",
			}
		end

		E:AddSpellEditor()
	end

	return E.options
end

function E:SetupOptions()
	LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable(E.AddOn, GetOptions, true) -- [46]
	self.optionsFrames.OmniCD = AceDialog:AddToBlizOptions(E.AddOn)

	self.optionsFrames.profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.DB)
	self.optionsFrames.profiles.order = -1
	self.optionsFrames.profiles.args.title = {
		name = "|cffffd200" .. self.optionsFrames.profiles.name,
		order = 0,
		type = "description",
		fontSize = "large",
	}

	local LDS = LibStub("LibDualSpec-1.0")
	LDS:EnhanceDatabase(self.DB, "OmniCDDB")
	LDS:EnhanceOptions(self.optionsFrames.profiles, self.DB)
end

function E:RegisterModuleOptions(name, optionTbl, displayName, uproot)
	self.moduleOptions[name] = optionTbl
	self.optionsFrames[name] = uproot and AceDialog:AddToBlizOptions(E.AddOn, displayName, E.AddOn, name)
end
