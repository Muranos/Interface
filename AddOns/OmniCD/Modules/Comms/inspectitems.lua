local E, L, C = select(2, ...):unpack()

local Comms = E["Comms"]
local InspectTooltip = CreateFrame("GameTooltip", "OmniCDInspectToolTip", nil, "GameTooltipTemplate")
InspectTooltip:SetOwner(UIParent, "ANCHOR_NONE")

local find = string.find
local match = string.match
local IsAzeriteEmpoweredItemByID = C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID
local P = E["Party"]
local ITEM_LEVEL = string.gsub(ITEM_LEVEL,"%%d","(%%d+)")
local NUM_INV_SLOTS = #E.INVSLOT_INDEX

function Comms:InspectItems(guid)
	local info = P.groupInfo[guid]

	if not info then
		return
	end

	local unit = info.unit
	local specID = info.spec

	info.slots = info.slots or {}

	for i = 1, NUM_INV_SLOTS do
		info.slots[i] = 0

		local slotID = E.INVSLOT_INDEX[i]
		InspectTooltip:SetInventoryItem(unit, slotID)
		local _, itemLink = InspectTooltip:GetItem()
		local itemID = itemLink and GetItemInfoInstant(itemLink)

		if itemID then
			if i > 2 then
				local isHeartOfAzeroth = itemID == 158075
				local ilvl
				local isAzeriteEmpowered = IsAzeriteEmpoweredItemByID(itemLink)
				local numLines = InspectTooltip:NumLines()

				for j = 2, numLines do
					local tooltipLine = _G["OmniCDInspectToolTipTextLeft" .. j]
					local text = tooltipLine:GetText()

					if text and text ~= "" then
						if isAzeriteEmpowered then
							if info.slots[i] > 0 then
								break
							end

							if j > 10 and find(text, "^-") == 1 then
								for _, v in pairs(E.cxModifiedByAzerite) do
									if find(text, v.name .. "$") == 3 then
										info.slots[i] = v.azerite

										break
									end
								end
							end
						elseif isHeartOfAzeroth then
							if info.talents[13] > 0 then
								break
							end

							if j > 10 then
								for k = 1, #E.essData do
									if find(text, E.essData[k].name .. "$") == 1 then
										local r, g, b = tooltipLine:GetTextColor()
										local rank = 3
										if r == 0 then
											rank = 2
										elseif r > .9 then
											rank = 4
										elseif b == 0 then
											rank = 1
										end

										local isMajor = _G["OmniCDInspectToolTipTextLeft" .. (j - 1)]:GetText() == " "
										if isMajor then
											local majorID = E.essData[k][rank]

											info.slots[i] = majorID

											if E.essConflict[majorID] then
												local essTalent = E.essConflictPvPTalents[specID]
												if essTalent then
													info.talents[12] = essTalent
												end
											end
										end

										local minorID = E.essData[k][-rank]
										if E.essStrive[minorID] and ilvl then
											local mult = (90.1 - ((ilvl - 399) * 0.15)) / 100
											if P.isInPvPInstance then -- temp fix 90+
												mult = 0.2 + mult * 0.8
											end
											mult = math.max(0.75, math.min(0.9, mult)) -- 8.3 Fix: 20% -> 25%

											info.slots[NUM_INV_SLOTS + 1] = mult
											info.talents[13] = minorID
										end

										break
									end
								end
							elseif j == 2 then
								ilvl = match(text, ITEM_LEVEL)
								if ilvl then
									ilvl = tonumber(ilvl)
								end
							end
						end
					end
				end
			else
				info.slots[i] = itemID
			end
		end
	end

	self:UpdateSlotLT(guid)
end
