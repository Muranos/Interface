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
local enchants = Crystal.enchants;

local locale = nil;

local statAbbreviations = 
	{
		["enUS"] = { [".tamina"] = "Stam", [".gility"] = "Agi", [".trength"] = "Str", [".ntellect"] = "Int", [".aste"] = "Haste", [".ritical .trike"] = "Crit", [".astery"] = "Mast", [".ersatility"] = "Vers", [".eech"] = "Leech", [".voidance"] = "Avoid", [".peed"] = "Speed", [" and "] = " ", [" & "] = " "},
		["deDE"] = { [".usdauer"] = "Ausd", [".eweglichkeit"] = "Bew", [".tärke"] = "Stä", [".ntelligenz"] = "Int", [".empo"] = "Tempo", [".ritischer .refferwert"] = "Krit", [".eisterschaft"] = "Meis", [".ielseitigkeit"] = "Viel", [".ebensraub"] = "LR", [".ermeidung"] = "Verm", [".eschwindigkeit"] = "Gesch", [" und "] = " " },
		["frFR"] = { [".ndurance"] = "End", [".gilité"] = "Agi", [".orce"] = "For", [".ntelligence"] = "Int", [".âte"] = "Hâte", [".oup .ritique"] = "Crit", [".aîtrise"] = "Maît", [".olyvalence"] = "Poly", [".onction"] = "Ponc", ["..vitement"] = "Évit", [".itesse"] = "Vit", [" et "] = " ", 
						[" l\226\128\153"] = " ", [" aux? "] = " ", [" score "] = " ", [" d[eu] "] = " ", [" à "] = " ", [" l[ea]s? "] = " "},
		["esES"] = { [".guante"] = "Agu", [".gilidad"] = "Agi", [".uerza"] = "Fue", [".ntelecto"] = "Int", [".eleridad"] = "Cele", [".olpe .rítico"] = "Crit", [".aestría"] = "Maes", [".ersatilidad"] = "Vers", [".arasitar"] = "Pars", [".vasión"] = "Evas", [".elocidad"] = "Velo", [" y "] = " ",
						[" p%. de "] = " "},
		["esMX"] = { [".guante"] = "Agu", [".gilidad"] = "Agi", [".uerza"] = "Fue", [".ntelecto"] = "Int", [".eleridad"] = "Cele", [".olpe .rítico"] = "Crit", [".aestría"] = "Maes", [".ersatilidad"] = "Vers", [".obo d?e? ?.ida"] = "RdV", [".vasión"] = "Evas", [".elocidad"] = "Velo", [" y "] = " ",
						[" p%. "] = " ", [" de "] = " "},
		["ptBR"] = { [".igor"] = "Vig", [".gilidade"] = "Agi", [".orça"] = "For", [".ntelecto"] = "Int", [".celeração"] = "Acel", [".certo .rítico"] = "Crit", [".aestria"] = "Maest", [".ersatilidade"] = "Vers", [".orver"] = "Sorv", [".vasão"] = "Evas", [".elocidade"] = "Velo", [" e "] = " ",
						[" de "] = " "},
		["itIT"] = { [".empra"] = "Tmp", [".gilità"] = "Agi", [".orza"] = "For", [".ntelletto"] = "Int", [".elerità"] = "Cele", [".ritico"] = "Crit", [".aestria"] = "Maes", [".ersatilità"] = "Vers", [".itorno .itale"] = "RV", [".lusione"] = "Elus", [".elocità"] = "Velo", [" e "] = " ",
						[" .ndice di "] = " "},
		["ruRU"] = { ["..ыносливости"] = "вын", ["..овкости"] = "лов", ["..иле"] = "сил", ["..нтеллекту"] = "инт", ["..корости"] = "ско", ["..ритическому ..дару"] = "крит", ["..скусности"] = "иск", ["..ниверсальности"] = "унив", ["..амоисцелению"] = "сами", ["..збеганию"] = "избег", ["..ередвижения"] = "перед", [" и "] = " ", [" к "] = " " },
		["koKR"] = {},
		["zhCN"] = {},
		["zhTW"] = {},
	};
	
local function isLetter(char)
    local b = char.byte;
    local isAsciiLetter = b < 0x80 and ((b >= 0x41 and b <= 0x5A) or (b >= 0x61 and b <= 0x7A));
    local isTwoByteLetter = char.byteLen == 2 and b >= 0xC3 and b <= 0xDF;
    return isAsciiLetter or isTwoByteLetter;
end

local function utf8Chars(str)
    local chars = {};
    local idx = 1;
    while idx <= #str do
        local b = str:byte(idx);
        local char_len = b < 0x80 and 1 or b < 0xE0 and 2 or b < 0xF0 and 3 or 4;
        chars[#chars + 1] = {
            char = str:sub(idx, idx + char_len - 1),
            byteLen = char_len,
            byte = b,
        };
        idx = idx + char_len;
    end
    return chars;
end

local function shortComplexEnchantUTF8(text)
    local chars = utf8Chars(text);
    local result = {};
    local prevWasWord = false;
    for _, char in ipairs(chars) do
        if isLetter(char) then
            if not prevWasWord then
				result[#result + 1] = char.char;
            end
            prevWasWord = true;
        else
		    if char.char >= "0" and char.char <= "9"  or char.char == "+" then
				result[#result + 1] = char.char;
            end
            prevWasWord = false;
        end
    end
	text = table.concat(result);
    return text;
end

local function shortComplexEnchant(text)
	if strlen(text) ~= strlenutf8(text) then
		return shortComplexEnchantUTF8(text);
	end
	text = text:gsub("[^%w%+]", " ");
	text = text:gsub("(%a)%a+", "%1");
	text = text:gsub(" ", "");
	return text;
end

local function shortSimpleEnchant(text)
	
	for long, short in pairs(statAbbreviations[locale]) do
		text = text:gsub(long, short);
	end
	
	return text;
end

local function isSimpleEnchant(text)
	return text:match("^+%d+");
end

local function shortText(text)
	if text == "" or locale == "koKR" or locale == "zhCN" or locale == "zhTW" then
		return ""
	end
	
	text = text:gsub("|.*$", "");
	text = strtrim(text);
	
	if isSimpleEnchant(text) then
		return shortSimpleEnchant(text);
	end
	
	if not text:match("%s") or strlenutf8(text) < 13 then
		return text;
	end
	
	return shortComplexEnchant(text);
end

local function enchantText(slotID)
    local ttData = C_TooltipInfo.GetInventoryItem("player", slotID);
    if not ttData then
        return "";
    end
    for _, line in ipairs(ttData.lines) do
		local enchant = line.leftText and strmatch(line.leftText, enchants.tooltipFilter);        
		if enchant then
            return enchant;
        end
    end
    return "";
end

local function showGameTooltip(frame, line)
	GameTooltip:SetOwner(frame, "ANCHOR_TOPRIGHT");
	GameTooltip:ClearLines();
	GameTooltip:AddLine(line);
	GameTooltip:Show();
end

local function hideGameTooltip()
	GameTooltip:Hide();
end

local function setTooltip(frame, line)
    frame:SetScript("OnEnter", function() showGameTooltip(frame, line); end);
    frame:SetScript("OnLeave", function() hideGameTooltip(); end);
end

function enchants:update(slotID)
	local textFull = enchantText(slotID);
    local textShort = shortText(textFull);
	local frame = Crystal.slots.info[slotID].enchantFrame;
    frame.fontString:SetText(textShort);
	setTooltip(frame, textFull);
end

function enchants:init()
    enchants.tooltipFilter = ENCHANTED_TOOLTIP_LINE:gsub('%%s', '(.+)');
	locale = GetLocale();
end
