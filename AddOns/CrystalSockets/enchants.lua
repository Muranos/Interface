--     Crystal Sockets - A convenient way to display all your gem sockets.
--     Copyright (C) 2020  Nivix
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
local enchants = Crystal.enchants;

local prefixToSkip = 
{
    ["of"] = true,
    ["the"] = true,
    ["Lesser"] = true,
    ["Minor"] = true,
    ["Greater"] = true,
    ["Superior"] = true,
    ["Legion"] = true,
    ["Zandalari"] = true,
    ["Kul"] = true,
    ["Tiran"] = true,
    ["Shadowlands"] = true,
    ["Rune"] = true,
    ["Eternal"] = true,
};

function enchants:initTooltipScanner()
    CreateFrame("GameTooltip", "CSTooltipScanner");
    CSTooltipScanner:SetOwner(WorldFrame, "ANCHOR_NONE");
    CSTooltipScanner:AddFontStrings(
        CSTooltipScanner:CreateFontString("$parentTextLeft1", nil, "GameTooltipText"),
        CSTooltipScanner:CreateFontString("$parentTextRight1", nil, "GameTooltipText") );
end

local function formatLine(line)
    local subStr = { strsplit(" ", line) };
    local enchantStr = ""
    if subStr[1]:sub(1, 1) == "+" then
        enchantStr = strconcat(subStr[1], " ", subStr[2]);
    else
        for key, str in pairs(subStr) do
            if not prefixToSkip[str] then
                enchantStr = str;
                break;
            end
        end
    end
    return enchantStr;
end

function enchants:getEnchantLine(slotID)
    CSTooltipScanner:ClearLines();
    CSTooltipScanner:SetInventoryItem("player", slotID);
    local enchantStr = "";
    for idx = 1, CSTooltipScanner:NumLines() do
        local text = _G[strconcat("CSTooltipScannerTextLeft",idx)]:GetText();
        local line = strmatch(text, enchants.tooltipFilter);
        if line then
            return line;
        end
    end
    return "";
end

function enchants:updateEnchant(slotID)
    local enchantStr = formatLine(enchants:getEnchantLine(slotID));
    Crystal.slots.info[slotID].enchantFrame.fontString:SetText(enchantStr);
end

function enchants:init()
    enchants.tooltipFilter = ENCHANTED_TOOLTIP_LINE:gsub('%%s', '(.+)');
    enchants.initTooltipScanner();
end
