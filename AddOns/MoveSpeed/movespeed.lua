-- Cache frequently used functions
local GetGlidingInfo = C_PlayerInfo.GetGlidingInfo
local GetUnitSpeed = GetUnitSpeed
local format, floor, max = format, math.floor, math.max
local CreateFrame = CreateFrame

-- Constants
local BASE_MOVEMENT_SPEED = BASE_MOVEMENT_SPEED
local speedFormat = "%d%%"
local iconPath = "Interface\\Icons\\Inv_Pet_Speedy"

-- Optimized round function
local function round(x)
    return floor(x + 0.5)
end

-- Create data object
local dataobject = LibStub("LibDataBroker-1.1"):NewDataObject("MoveSpeed", {
    type = "data source",
    icon = iconPath,
    label = "MoveSpeed",
    suffix = "%",
    value = 0,
})

-- Tooltip function
dataobject.OnTooltipShow = function(tooltip)
    local isGliding, _, forwardSpeed = GetGlidingInfo()
    local base = max(GetUnitSpeed("player"), forwardSpeed or 0)
    tooltip:AddLine(format(speedFormat, round(base / BASE_MOVEMENT_SPEED * 100)))
end

-- Create and setup frame
local MySpeedFrame = CreateFrame("Frame", "MySpeedFrame", UIParent, "BackdropTemplate")
MySpeedFrame:SetSize(50, 30)
MySpeedFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 500, 0)
MySpeedFrame:SetMovable(true)
MySpeedFrame:EnableMouse(true)
MySpeedFrame:SetScript("OnMouseDown", function(self) self:StartMoving() end)
MySpeedFrame:SetScript("OnMouseUp", function(self) self:StopMovingOrSizing() end)
MySpeedFrame:Show() -- Ensure the frame is visible

-- Ensure the frame has text
if not MySpeedFrame.text then
    MySpeedFrame.text = MySpeedFrame:CreateFontString(nil, "ARTWORK", "GameTooltipText")
    MySpeedFrame.text:SetAllPoints(true)
    MySpeedFrame.text:SetText("0%") -- Set default text
end

-- Optimized update timer
local lastSpeed = -1 -- Ensure the first update happens
C_Timer.NewTicker(0.2, function() -- Update every 0.2 seconds
    local isGliding, _, forwardSpeed = GetGlidingInfo()
    local base = max(GetUnitSpeed("player"), forwardSpeed or 0)
    local movespeed = round(base / BASE_MOVEMENT_SPEED * 100)

    if lastSpeed ~= movespeed then
        lastSpeed = movespeed
        local displayText = format(speedFormat, movespeed)
        MySpeedFrame.text:SetText(displayText)
        dataobject.value = movespeed
        dataobject.text = displayText
    end
end)


-- Command handlers table
local commandHandlers = {
    reset = function()
        MySpeedFrame:ClearAllPoints()
        MySpeedFrame:SetPoint("CENTER", UIParent, 0, 0)
        return "MoveSpeed frame position reset."
    end,
    small = function()
        MySpeedFrame.text:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
        return "Text size set to small."
    end,
    large = function()
        MySpeedFrame.text:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
        return "Text size set to large."
    end,
    bg = function()
        MySpeedFrame:SetBackdrop(backdropInfo)
        return "Background added."
    end,
    bgoff = function()
        MySpeedFrame:SetBackdrop(nil)
        return "Background removed."
    end,
    hide = function()
        MySpeedFrame:SetShown(false)
        return "MoveSpeed frame hidden."
    end,
    show = function()
        MySpeedFrame:SetShown(true)
        return "MoveSpeed frame shown."
    end
}

-- Slash command handler
local function handler(msg)
    msg = string.lower(msg)
    local cmdHandler = commandHandlers[msg]
    if cmdHandler then
        print(cmdHandler())
    else
        print("Available commands:")
        for cmd, _ in pairs(commandHandlers) do
            print(format("/movespeed %s", cmd))
        end
    end
end

SLASH_MOVESPEED1 = '/movespeed'
SlashCmdList["MOVESPEED"] = handler