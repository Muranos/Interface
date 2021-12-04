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
local events = Crystal.events;

function events:handler(event, ...)
	events[event](self, ...);
end

function events:PLAYER_EQUIPMENT_CHANGED(equipmentSlot, ...)
    if equipmentSlot ~= nil then
        Crystal.slots:update(equipmentSlot);
    end
end

function events:UNIT_INVENTORY_CHANGED(target, ...)
   if target ~= "player" then
       return
   end
   Crystal.slots:updateAll();
end

function events:onShow()
    Crystal.slots:updateAll();
    events.frame:RegisterEvent("PLAYER_EQUIPMENT_CHANGED");
    events.frame:RegisterEvent("UNIT_INVENTORY_CHANGED");
end

function events:onHide()
    events.frame:UnregisterEvent("PLAYER_EQUIPMENT_CHANGED");
    events.frame:UnregisterEvent("UNIT_INVENTORY_CHANGED");
end

function events:init()
    events.frame = CreateFrame("Frame");
    events.frame:SetScript("OnEvent", events.handler);
    PaperDollFrame:HookScript("OnShow", function(self) events:onShow(); end);
    PaperDollFrame:HookScript("OnHide", function(self) events:onHide(); end);
end
