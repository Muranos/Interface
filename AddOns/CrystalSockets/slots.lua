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
local slots = Crystal.slots;

slots.info = 
{
    [1] = { ["name"] = "Head", ["side"] = "LEFT" },
    [2] = { ["name"] = "Neck", ["side"] = "LEFT" },
    [3] = { ["name"] = "Shoulder", ["side"] = "LEFT" },
    [4] = { ["name"] = "Shirt", ["side"] = "LEFT" },
    [5] = { ["name"] = "Chest", ["side"] = "LEFT" },
    [6] = { ["name"] = "Waist", ["side"] = "RIGHT" },
    [7] = { ["name"] = "Legs", ["side"] = "RIGHT" },
    [8] = { ["name"] = "Feet", ["side"] = "RIGHT" },
    [9] = { ["name"] = "Wrist", ["side"] = "LEFT" },
    [10] = { ["name"] = "Hands", ["side"] = "RIGHT" },
    [11] = { ["name"] = "Finger0", ["side"] = "RIGHT" },
    [12] = { ["name"] = "Finger1", ["side"] = "RIGHT" },
    [13] = { ["name"] = "Trinket0", ["side"] = "RIGHT" },
    [14] = { ["name"] = "Trinket1", ["side"] = "RIGHT" },
    [15] = { ["name"] = "Back", ["side"] = "LEFT" },
    [16] = { ["name"] = "MainHand", ["side"] = "RIGHT" },
    [17] = { ["name"] = "SecondaryHand", ["side"] = "LEFT" },
    [19] = { ["name"] = "Tabard", ["side"] = "LEFT" }
};

local function direction(side)
   local relativeMap = { ["LEFT"] = "RIGHT", ["RIGHT"] = "LEFT" };
   return relativeMap[side];
end

local function sign(side)
    local signMap = { ["LEFT"] = 1, ["RIGHT"] = -1 };
    return signMap[side];
end

local function createSocketFrame(slotID, index, name, parent, side)
    local frame = CreateFrame("Frame", name .. index .. "Frame", parent);
    frame:SetWidth(parent:GetWidth()*0.5);
    frame:SetHeight(parent:GetHeight()*0.5);
	if slotID == 16 or slotID == 17 then
		frame:SetPoint("BOTTOM" .. side, parent, "TOP" .. side, sign(side) * (2 + 0.5 * parent:GetWidth() * (index - 1)), 0);
	else
		frame:SetPoint("TOP" .. side, parent, "TOP" .. direction(side), sign(side) * (8 + 0.5 * parent:GetWidth() * (index - 1)), 0);
	end
    frame.texture = frame:CreateTexture(name .. "Texture");
    frame.texture:SetAllPoints();
    return frame;
end

local function createEnchantFrame(slotID, name, parent, side)
    local frame = CreateFrame("Frame", name .. "Frame", parent);
    frame:SetWidth(parent:GetWidth()*2);
    frame:SetHeight(parent:GetHeight()*0.4);
    frame:SetPoint("BOTTOM" .. side, parent, "BOTTOM" .. direction(side), 10 * sign(side), parent:GetHeight() * 0.05);
    frame.fontString = frame:CreateFontString(name .. "String");
    frame.fontString:SetFontObject("GameFontNormal");
    frame.fontString:SetJustifyV("MIDDLE");
    frame.fontString:SetJustifyH(side);
    frame.fontString:SetAllPoints();
    local font, height, flags = frame.fontString:GetFont();
    frame.fontString:SetFont(font, parent:GetHeight()*0.3, flags);
    return frame;
end


function slots:update(slotID)
    if not slots.info[slotID] then
        return;
    end
	Crystal.sockets:update(slotID);
    Crystal.enchants:update(slotID);
end

function slots:updateAll()
    for slotID, _ in ipairs(slots.info) do
		slots:update(slotID);
    end
end

function slots:init()
    for slotID, slotInfo in pairs(slots.info) do
		local prefix = "Character" .. slotInfo.name;
		slotInfo.frame = _G[prefix .. "Slot"];
		slotInfo.socketFrames = {};
		for index = 1, 4 do
			slotInfo.socketFrames[index] = createSocketFrame(slotID, index, prefix .. "Socket", slotInfo.frame, slotInfo.side);
		end
		slotInfo.enchantFrame = createEnchantFrame(slotID, prefix .. "Enchant", slotInfo.frame, slotInfo.side);
    end
end

