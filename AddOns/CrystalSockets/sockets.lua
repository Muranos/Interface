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
local sockets = Crystal.sockets;

function sockets:isEmpty(itemLink)
    local stats = GetItemStats(itemLink);
    if stats ~= nil then
        for key, val in pairs(stats) do
            if (string.find(key, "EMPTY_SOCKET_")) then
                return true;
            end
        end
    end
    return false;
end

function sockets.showGameTooltip(self, motion)
    if self.link then
        GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT");
        GameTooltip:SetHyperlink(self.link);
        GameTooltip:Show();
    end
end

function sockets.hideGameTooltip(self, motion)
    GameTooltip:Hide();
end

function sockets.setTooltip(slotID, gemLink)
    Crystal.slots.info[slotID].socketFrame.link = gemLink;
    Crystal.slots.info[slotID].socketFrame:SetScript("OnEnter", sockets.showGameTooltip);
    Crystal.slots.info[slotID].socketFrame:SetScript("OnLeave", sockets.hideGameTooltip);
end


function sockets:setIcon(slotID, iconID, gemLink)
    Crystal.slots.info[slotID].socketFrame.texture:SetTexture(iconID);
    sockets.setTooltip(slotID, gemLink);
end

function sockets:updateSocket(itemLink, slotID)
    local _, gemLink = GetItemGem(itemLink, 1);
    if gemLink ~= nil then
        local gem = Item:CreateFromItemLink(gemLink);
        gem:ContinueOnItemLoad(function() sockets:setIcon(slotID, gem:GetItemIcon(), gemLink); end);
        return;
    end
    if sockets:isEmpty(itemLink) then
        sockets:setIcon(slotID, 458977, nil);
        return;
    end
    sockets:setIcon(slotID, nil, nil);
end

function sockets:init()
    -- NOPE
end
