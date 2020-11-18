local E, L, C = select(2, ...):unpack()

local DB_VERSION = 2

function E:OnInitialize()
	if not OmniCDDB then
		OmniCDDB = { version = DB_VERSION }
	else
		if not OmniCDDB.version then
			if OmniCDDB.profiles then
				for k, v in pairs(OmniCDDB.profiles) do
					if v.visibility then
						OmniCDDB.profiles[k].visibility.premade = nil
					end

					v.Party = self.DeepCopy(v)
					v.Party.spells = {}

					for s, p in pairs(v) do
						if s ~= "Party" then
							OmniCDDB.profiles[k][s] = nil
						else
							for key, value in pairs(p) do
								if strmatch(key, "^spell") and type(value) == "boolean" then
									v.Party.spells[key] = value
									OmniCDDB.profiles[k].Party[key] = nil
								end
							end
						end
					end
				end
			end
		end

		if OmniCDDB.version ~= DB_VERSION then
			local opt = { "general", "position", "icons", "highlight"}
			if OmniCDDB.profiles then
				for k, v in pairs(OmniCDDB.profiles) do
					if v.Party then
						for s, p in pairs(v.Party) do
							for i = 1, 4 do
								local t = opt[i]
								if C.Party[t][s] or C.Party[t][s] == false then
									v.Party[t] = v.Party[t] or {}
									v.Party[t][s] = self.DeepCopy(p)

									OmniCDDB.profiles[k].Party[s] = nil
								end
							end
						end
					end
				end
			end

			OmniCDDB.version = DB_VERSION
		end
	end

	OmniCDDB.cooldowns = OmniCDDB.cooldowns or {}

	self.DB = LibStub("AceDB-3.0"):New("OmniCDDB", self.defaults, true)
	self.DB.RegisterCallback(self, "OnProfileChanged", "Refresh")
	self.DB.RegisterCallback(self, "OnProfileCopied", "Refresh")
	self.DB.RegisterCallback(self, "OnProfileReset", "Refresh")

	self.db = self.DB.profile.Party

	self:CreateModifierLT()
	self:AddCustomSpells(true)
	self:SetupOptions()
end

function E:OnEnable()
	C_ChatInfo.RegisterAddonMessagePrefix("OmniCD")
	self:LoadAddOns()
	self:Refresh()

	if self.db.general.loginMsg then
		print(E.LoginMessage)
	end

	self.enabled = true
end

function E:Refresh(arg)
	self.db = self.DB.profile.Party

	for k in pairs(self.moduleOptions) do
		local module = self[k]
		local enabled = self.GetModuleEnabled(k)

		if enabled then
			if module.enabled then
				module:Refresh(true)
			else
				module:Enable()
			end
		else
			module:Disable()
		end

		local func = module.UpdateExecuteNames
		if func then
			func()
		end
	end

	self.TooltipID:SetHooks()

	if arg == "OnProfileReset" then
		self.DB.global.disableElvMsg = nil
	end
end
