local E, L, C = select(2, ...):unpack()

local gsub = string.gsub

local AceDialog = LibStub("AceConfigDialog-3.0")

E.moduleOptions = {}
E.optionsFrames = {}

E.GetSpellID = function(info, n)
	n = n or 1
	local id = info[#info - n]:gsub("spell", "")
	return tonumber(id)
end

E.ConfirmAction = function()
	return L["All user set values will be lost. Do you want to proceed?"]
end

local function GetOptions()
	if not E.options then
		E.options = {
			name = E.AddOn,
			type = "group",
			childGroups = "tab",
			args = {},
			plugins = {
				profiles = { profiles = E.optionsFrames.profiles },
			},
		}

		for k, v in pairs(E.moduleOptions) do
			E.options.args[k] = (type(v) == "function") and v() or v

			E.options.args[k].args["enable"] = {
				disabled = false,
				name = E.GetModuleEnabled(k) and DISABLE or ENABLE,
				desc = L["Toggle module on and off"],
				order = 0,
				type = "execute",
				func = function()
					local state = E.GetModuleEnabled(k)
					E.SetModuleEnabled(k, not state)
					E.options.args[k].args.enable.name = not state and DISABLE or ENABLE
				end,
			}

			--[[
			E.options.args[k].args["reset"] = {
				name = RESET_TO_DEFAULT,
				order = 0.5,
				type = "execute",
				func = "ResetOptions",
				handler = E[k],
				confirm = E.ConfirmAction,
			}
			]]

			E.options.args[k].args.general.args["test"] = {
				name = L["Test"],
				desc = k == "Party" and L["Toggle raid-style party frame and player spell bar for testing"] or nil,
				order = 0,
				type = "execute",
				func = "Test",
				handler = E[k],
			}

			E.options.args[k].args.general.args["hd1"] = {
				name = "", order = 0.5, type = "header",
			}
		end

		E:AddSpellEditor()
	end

	return E.options
end

function E:SetupOptions()
	LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable(E.AddOn, GetOptions) -- [46]
	self.optionsFrames.OmniCD = AceDialog:AddToBlizOptions(E.AddOn)

	-- [47]

	self.optionsFrames.profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.DB)

	local LDS = LibStub("LibDualSpec-1.0")
	LDS:EnhanceDatabase(self.DB, "OmniCDDB")
	LDS:EnhanceOptions(self.optionsFrames.profiles, self.DB)
end

function E:RegisterModuleOptions(name, optionTbl, displayName, uproot)
	self.moduleOptions[name] = optionTbl
	self.optionsFrames[name] = uproot and AceDialog:AddToBlizOptions(E.AddOn, displayName, E.AddOn, name)
end
