local E, L, C = select(2, ...):unpack()

local addOnCommands = {}

E.SlashHandler = function(msg)
	local AceRegistry = LibStub("AceConfigRegistry-3.0")
	local command, value = msg:match("^(%S*)%s*(.-)$");
	local P = E["Party"]

	if (command == "help" or command == "?") then
		E.Write("v" .. E.Version)
		E.Write("Usage: /oc <command> or /omnicd <command>")
		E.Write("commands:")
		E.Write("reload (rl): reload addon")
		E.Write("reset (rt): reset timers")
		E.Write("test (t): toggle test mode")
	elseif (command == "rl" or command == "reload") then
		E:Refresh()
	elseif (command == "rt" or command == "reset") then
		if (value == "profile") then
			E.DB:ResetProfile()
			E.Write("Profile reset to default")

			AceRegistry:NotifyChange("OmniCD")
		elseif (value == "option") then
			P:ResetOptions()
			E.Write("Options(excluding spells) reset to default")

			AceRegistry:NotifyChange("OmniCD")
		else
			P:ResetAllIcons()
			E.Write("All cooldowns reset")
		end
	elseif (command == "t" or command == "test") then
		if E.GetModuleEnabled("Party") then
			P:Test()
		else
			E.Write("Module disabled")
		end
	elseif (command == "m" or command =="manual") then
		E.db.position.detached = not E.db.position.detached
		local state = E.db.position.detached and ON or OFF
		E.Write(L["Manual Mode"] .. ": " .. state)

		P:Refresh()

		AceRegistry:NotifyChange("OmniCD")
	elseif (command == "s" or command == "spell") then
		if value == "?" then
			local str = ""
			for k in pairs(E.L_PRIORITY) do
				str = strjoin(", ", str, k)
			end

			E.Write(TYPE .. ": " .. str)
			E.Write(SYSTEMOPTIONS_MENU .. ": sall, clear, default")

			return
		elseif value == "clear" then
			E.db.noDefault = true
		elseif value == "default" then
			E.db.noDefault = nil
		end

		for _, v in pairs(E.spellList) do
			for i = 1, #v do
				local spell = v[i]
				if not spell.hide then
					local id = spell.spellID
					if value == "sall" or value == spell.type then
						E.db.spells["spell" .. id] = true
					elseif value == "clear" then
						E.db.spells["spell" .. id] = nil
					elseif value == "default" then
						E.db.spells["spell" .. id] = nil
					end
				end
			end
		end

		E.UpdateEnabledLT(P)

		P:Refresh()

		AceRegistry:NotifyChange("OmniCD")
	elseif (command == "anim") then
		E.db.highlight.anim = not E.db.highlight.anim
		local state = E.db.highlight.anim and VIDEO_OPTIONS_ENABLED or VIDEO_OPTIONS_DISABLED
		E.Write(ANIMATION .. ": " .. state)

		P:Refresh()

		AceRegistry:NotifyChange("OmniCD")
	elseif (command == "sync") then
		P.disableSync = not P.disableSync
		local Comms = E.Comms
		if P.disableSync and Comms.enabled then
			Comms:UnregisterEvent("PLAYER_REGEN_DISABLED")
			Comms:UnregisterEvent("UNIT_POWER_FREQUENT")
			Comms:UnregisterEvent("UNIT_POWER_UPDATE")
		end
		local state = P.disableSync and VIDEO_OPTIONS_DISABLED or VIDEO_OPTIONS_ENABLED
		E.Write("Sync: " .. state)
	elseif addOnCommands[command] then
		addOnCommands[command](value)
	else
		local AceDialog = LibStub("AceConfigDialog-3.0")
		AceDialog:SetDefaultSize("OmniCD", 700, 500)
		AceDialog:Open("OmniCD")
	end
end

SLASH_OmniCD1 = "/oc"
SLASH_OmniCD2 = "/omnicd"
SlashCmdList.OmniCD = E.SlashHandler

E["addOnCommands"] = addOnCommands
