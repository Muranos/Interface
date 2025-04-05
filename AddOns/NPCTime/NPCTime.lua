local addonName = ...
local NPCTime = CreateFrame('frame')
local Settings = {}
local timeFormat = "%H:%M, %d.%m"
local band = bit.band
local dontShowPhaseOnInit = true

local timeFormatter = CreateFromMixins(SecondsFormatterMixin);
timeFormatter:Init(1, SecondsFormatter.Abbreviation.Truncate);
local function AddMessage(...) _G.DEFAULT_CHAT_FRAME:AddMessage(strjoin(" ", tostringall(...))) end

-- Compat
local function AddColoredDoubleLine(tooltip, leftT, rightT, leftC, rightC, wrap)
  leftC = leftC or NORMAL_FONT_COLOR
  rightC = rightC or HIGHLIGHT_FONT_COLOR
  wrap = wrap or true
  tooltip:AddDoubleLine(leftT, rightT, leftC.r, leftC.g, leftC.b, rightC.r, rightC.g, rightC.b, wrap);
end

function NPCTime:PhaseAlert(e)
  local text = string.format("|cff9BFFA8 # %s New Connection|r", date("%H:%M"))
  AddMessage(text)
end

function NPCTime:OnEvent(e,...)
  if e == "ADDON_LOADED" and ... == addonName then
    NPCTimeDB = NPCTimeDB or {}
    Settings = NPCTimeDB
  elseif e == "CONSOLE_MESSAGE" then
    if not Settings.ShowPhasing then return end
    local message = ...
    if string.find(message, "new connection") then
      if not dontShowPhaseOnInit then
        self:PhaseAlert(e)
      end
    end
  end
end

function NPCTime:ShowTime(self)
  if Settings.UsingMod and not IsModifierKeyDown() then return end
  local _, unit = self:GetUnit()
  local guid = UnitGUID(unit or "none")
  if not guid then return end

  local unitType, _, serverID, _, layerUID, unitID, uuid = strsplit("-", guid)
  local id = tonumber(strsub(guid, -6), 16)
  if id and (unitType == "Creature" or unitType == "Vehicle") then
    local serverTime = GetServerTime()
    local spawnTime  = ( serverTime - (serverTime % 2^23) ) + band(id, 0x7fffff)
    local spawnIndex = bit.rshift(bit.band(tonumber(string.sub(uuid, 1, 5), 16), 0xffff8), 3)

    if Settings.ShowCurrentTime then
      AddColoredDoubleLine(self, "Current Time", date(timeFormat, serverTime))
    end

    if spawnTime > serverTime then
      spawnTime = spawnTime - ((2^23) - 1)
    end

    AddColoredDoubleLine(self, "Alive", timeFormatter:Format((serverTime-spawnTime), false, false).." ("..date(timeFormat, spawnTime)..")")

    if Settings.ShowLayer then
      AddColoredDoubleLine(self, "Layer", serverID.."-"..layerUID)
    end

    if Settings.ShowNPCID then
      AddColoredDoubleLine(self, "ID", unitID)
      if spawnIndex > 0 then
        AddColoredDoubleLine(self, "Index", spawnIndex)
      end
    end

    self:Show()
  end
end

function NPCTime:OnLoad()
  self:RegisterEvent("ADDON_LOADED")
  self:RegisterEvent("CONSOLE_MESSAGE")
  C_Timer.After(1, function() dontShowPhaseOnInit = false end)
  if C_TooltipInfo and TooltipDataProcessor then
    TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Unit, function(tooltip, tooltipData)
      if tooltip ~= GameTooltip then return end
      self:ShowTime(tooltip)
    end)
  else
    GameTooltip:HookScript("OnTooltipSetUnit", function(...) self:ShowTime(...) end)
  end
  self:SetScript("OnEvent", self.OnEvent)

  SLASH_NPCTIME1  = "/npctime"
  function SlashCmdList.NPCTIME(...)
    self:Help(...)
  end
end

NPCTime:OnLoad()

function NPCTime:Help(msg)
  local fName = "|cffEEE4AENPC Time:|r"
  local _, _, cmd, args = string.find(msg, "%s?(%w+)%s?(.*)")
  if not cmd or cmd == "" or cmd == "help" then
    AddMessage(fName.."   |cff58C6FA/npctime|r")
    AddMessage("  |cff58C6FA/npctime current -|r  |cffEEE4AEToggles current time|r")
    AddMessage("  |cff58C6FA/npctime layer -|r  |cffEEE4AEToggles layer id|r")
    AddMessage("  |cff58C6FA/npctime id -|r  |cffEEE4AEToggles npc id|r")
    AddMessage("  |cff58C6FA/npctime mod  -|r  |cffEEE4AEToggle only show with CTRL/ALT/SHIFT|r")
    AddMessage("  |cff58C6FA/npctime phase  -|r  |cffEEE4AEToggle phasing message|r")
  elseif cmd == "current" then
    if Settings.ShowCurrentTime then
      AddMessage(fName, "Don't show current time")
    else
      AddMessage(fName, "Show current time")
    end
    Settings.ShowCurrentTime = not Settings.ShowCurrentTime
  elseif cmd == "mod" then
    if Settings.UsingMod then
      AddMessage(fName, "Always show alive time")
    else
      AddMessage(fName, "Only show when using CTRL/ALT/SHIFT")
    end
    Settings.UsingMod = not Settings.UsingMod
  elseif cmd == "layer" then
    if Settings.ShowLayer then
      AddMessage(fName, "Hide Layer ID")
    else
      AddMessage(fName, "Show Layer ID")
    end
    Settings.ShowLayer = not Settings.ShowLayer
  elseif cmd == "id" then
    if Settings.ShowNPCID then
      AddMessage(fName, "Hide NPC ID")
    else
      AddMessage(fName, "Show NPC ID")
    end
    Settings.ShowNPCID = not Settings.ShowNPCID
  elseif cmd == "phase" then
    if Settings.ShowPhasing then
      AddMessage(fName, "Disable phasing message")
    else
      AddMessage(fName, "Enable phasing message")
    end
    Settings.ShowPhasing = not Settings.ShowPhasing
  end
end

