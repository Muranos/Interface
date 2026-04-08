--     Crystal Sockets - A lightweight solution to show sockets and enchantments on your character sheet.
--     Copyright (C) 2026  Nivix
-- 
--     This program is free software: you can redistribute it and/or modify
--     it under the terms of the GNU General Public License as published by
--     the Free Software Foundation, either version 3 of the License, or
--     (at your option) any later version.
-- 
--     This program is distributed in the hope that it will be useful,
--     but WITHOUT ANY WARRANTY; without even the implied warranty of
--     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--     GNU General Public License for more details.
-- 
--     You should have received a copy of the GNU General Public License
--     along with this program.  If not, see <https://www.gnu.org/licenses/>.

local Crystal = CrystalSocketsAddon;
local sockets = Crystal.sockets;

local function numSockets(itemLink)
    local stats = C_Item.GetItemStats(itemLink);
	local num = 0;
    if stats ~= nil then
        for key, val in pairs(stats) do
            if key:find("EMPTY_SOCKET") then
                num = num + val;
            end
        end
    end
    return num;
end

local function showGameTooltip(frame, link)
	if link then
		GameTooltip:SetOwner(frame, "ANCHOR_TOPRIGHT");
		GameTooltip:SetHyperlink(link);
		GameTooltip:Show();
	end
end

local function hideGameTooltip()
    GameTooltip:Hide();
end

local function setTooltip(frame, gemLink)
    frame:SetScript("OnEnter", function() showGameTooltip(frame, gemLink); end);
    frame:SetScript("OnLeave", function() hideGameTooltip(); end);
end

local function setIcon(frame, iconID, gemLink)
    frame.texture:SetTexture(iconID);
    setTooltip(frame, gemLink);
end

local function clear(frame)
	setIcon(frame, nil, nil);
end

local function clearAll(frames)
	for _, frame in ipairs(frames) do
		clear(frame);
	end
end

local function update(frames, itemLink)
	local num = numSockets(itemLink);
	for index, frame in ipairs(frames) do
		if index > num then
			clear(frame);
		else
			local _, gemLink = GetItemGem(itemLink, index);
			if gemLink ~= nil then
				local gem = Item:CreateFromItemLink(gemLink);
				gem:ContinueOnItemLoad(function() setIcon(frame, gem:GetItemIcon(), gemLink); end);
			else 
				setIcon(frame, 458977, nil);
			end
		end
	end
end

function sockets:update(slotID)
	local frames = Crystal.slots.info[slotID].socketFrames;
	local location = ItemLocation:CreateFromEquipmentSlot(slotID);
    if not C_Item.DoesItemExist(location) then
        clearAll(frames);
        return;
    end
	local item = Item:CreateFromItemLocation(location);
    item:ContinueOnItemLoad(function() update(frames, item:GetItemLink()); end);
end

function sockets:init()
    -- NOPE
end


