local E, L, C = select(2, ...):unpack()

local P = E["Party"]

do
	local timer

	local timerFunc = function()
		timer = nil
		P:UpdateBackdrop()
	end

	function P:ConfigSize(slider)
		local scale
		local n = self:GetGroupSize()

		if not E.db.position.detached and E.db.icons.autoScale then
			for i = 1, n do
				local index = not self.isInRaid and i == n and 5 or i
				local f = self.spellBars[index]
				if ( f:IsVisible() ) then
					local _, relativeTo = f:GetPoint()
					if relativeTo and relativeTo ~= "UIParent" then
						scale = self:GetRelativeScale(relativeTo)

						break
					end
				end
			end
		end

		scale = scale or E.db.icons.scale

		for i = 1, n do
			local index = not self.isInRaid and i == n and 5 or i
			local f = self.spellBars[index]
			f.anchor:SetScale(math.min(scale, 1))
			f.container:SetScale(scale)
		end

		self.iconScale = scale

		if E.db.icons.displayBorder and E.db.icons.pixelPerfect then
			if slider then
				if not timer then
					timer = true
					E.TimerAfter(0.5, timerFunc)
				end
			else
				self:UpdateBackdrop()
			end
		end
	end
end

local icons = {
	name = "|TInterface\\OptionsFrame\\UI-OptionsFrame-NewFeatureIcon:0:0:0:-1|t" .. L["Icons"],
	order = 30,
	type = "group",
	childGroups = "tab",
	get = function(info) local option = info[#info] return E.db.icons[option] end,
	set = function(info, value) local option = info[#info] E.db.icons[option] = value P:ConfigIcons(option) end,
	args = {
		general = {
			name = GENERAL,
			order = 10,
			type = "group",
			args = {
				autoScale = {
					name = L["Use Relative Size"],
					desc = L["Icon size auto adjusts as a percentage of the anchored frame height"],
					order = 1,
					type = "toggle",
					set = function(_, state)
						E.db.icons.autoScale = state

						P:ConfigSize()
					end,
				},
				showCounter = {
					name = COUNTDOWN_FOR_COOLDOWNS_TEXT,
					desc = L["Toggle the cooldown numbers. Spells with charges only show cooldown numbers at 0 charge"],
					order = 2,
					type = "toggle",
				},
				reverse = {
					name = L["Reverse Swipe"],
					desc = L["Reverse the cooldown swipe animation"],
					order = 3,
					type = "toggle",
				},
				desaturateActive = {
					name = L["Desaturate Colors"],
					desc = L["Desaturate colors on active icons"],
					order = 4,
					type = "toggle",
				},
				lb1 = {
					name = "\n", order = 5, type = "description",
				},
				scale = {
					name = L["Icon Size"],
					desc = L["Set the size of icons"],
					order = 6,
					type = "range",
					min = 0.2, max = 2.0, step = 0.01, isPercent = true,
					set = function(_, value)
						E.db.icons.scale = value

						P:ConfigSize(true)
					end,
				},
				chargeScale = {
					name = L["Charge Size"],
					desc = L["Set the size of charge numbers"],
					order = 7,
					type = "range",
					min = 0.5, max = 1.5, step = 0.1, isPercent = true,
				},
				paddingX = {
					name = L["Padding X"],
					desc = L["Set the padding space between icon columns"],
					order = 8,
					type = "range",
					min = 0, max = 20, softMax = 10, step = 1,
					set = function(_, value) E.db.icons.paddingX = value P:ConfigBars() end,
				},
				paddingY = {
					name = L["Padding Y"],
					desc = L["Set the padding space between icon rows"],
					order = 9,
					type = "range",
					min = 0, max = 20, softMax = 10, step = 1,
					set = function(_, value) E.db.icons.paddingY = value P:ConfigBars() end,
				},
				counterScale = {
					disabled = function() return not E.db.icons.showCounter end,
					name = L["Counter Size"],
					desc = L["Set the size of cooldown numbers"],
					order = 10,
					type = "range",
					isPercent = true,
					min = 0.1, max = 1, step = 0.05,
				},
				swipeAlpha = {
					name = L["Swipe Opacity"],
					desc = L["Set the opacity of swipe animations"],
					order = 11,
					type = "range",
					min = 0, max = 1, step = 0.1,
				},
				inactiveAlpha = {
					name = L["Inactive Icon Opacity"],
					desc = L["Set the opacity of icons not on cooldown"],
					order = 12,
					type = "range",
					min = 0, max = 1, step = 0.1,
				},
				activeAlpha = {
					name = L["Active Icon Opacity"],
					desc = L["Set the opacity of icons on cooldown"],
					order = 13,
					type = "range",
					min = 0, max = 1, step = 0.1,
				},
			}
		},
		border = {
			disabled = function(info) return info[4] and not E.db.icons.displayBorder end,
			name = "|TInterface\\OptionsFrame\\UI-OptionsFrame-NewFeatureIcon:0:0:0:-1|t" .. L["Border"],
			order = 20,
			type = "group",
			args = {
				displayBorder = {
					disabled = false,
					name = ENABLE,
					desc = L["Display custom border around icons"],
					order = 0,
					type = "toggle",
					set = function(_, state)
						E.db.icons.displayBorder = state

						P:ConfigIcons("displayBorder")
						P:UpdateBackdrop()
					end,
				},
				hd1 = {
					name = "", order = 1, type = "header",
				},
				pixelPerfect = {
					name = L["Pixel Perfect"],
					desc = L["Borders retain 1px width regardless of the UI scale"],
					order = 2,
					type = "toggle",
					set = function(_, state)
						E.db.icons.pixelPerfect = state

						P:ConfigIcons("pixelPerfect")
						P:UpdateBackdrop()
					end,
				},
				twoPixelBorder = {
					disabled = function() return not E.db.icons.displayBorder or not E.db.icons.pixelPerfect end,
					name = "|TInterface\\OptionsFrame\\UI-OptionsFrame-NewFeatureIcon:0:0:0:-1|t" .. L["2px Border"],
					order = 3,
					type = "toggle",
					set = function(_, state)
						E.db.icons.twoPixelBorder = state

						P:UpdateBackdrop()
					end,
				},
				borderColor = {
					name = COLOR,
					order = 4,
					type = "color",
					get = function()
						return E.db.icons.borderColor.r, E.db.icons.borderColor.g, E.db.icons.borderColor.b
					end,
					set = function(_, r, g, b)
						E.db.icons.borderColor.r = r
						E.db.icons.borderColor.g = g
						E.db.icons.borderColor.b = b

						P:ConfigIcons("borderColor")
					end,
				},
				--[[
				disableReloadPopup = {
					name = L["Disable Popup"],
					desc = L["Disable Reload UI confirmation when using Pixel Perfect borders"],
					order = 5,
					type = "toggle",
				},
				--]]
			}
		},
		misc = {
			name = MISCELLANEOUS,
			order = 30,
			type = "group",
			args = {
				showForbearanceCounter = {
					name = L["Show Forbearance CD"],
					desc = L["Show timer on spells while under the effect of Forbearance or Hypothermia. Spells castable to others will darken instead"],
					order = 1,
					type = "toggle",
				},
			}
		}
	}
}

P.options.args["icons"] = icons
