-- 1. Constants & Locals
local addonName = ...
local C_PlayerInfo, GetUnitSpeed = C_PlayerInfo, GetUnitSpeed
local format = format
local CreateFrame, UIParent = CreateFrame, UIParent
local floor, max = math.floor, math.max
local BASE_MOVEMENT_SPEED = BASE_MOVEMENT_SPEED or 7
local GetGlidingInfo = C_PlayerInfo and C_PlayerInfo.GetGlidingInfo
local speedFormat = "%d%%"
local iconPath = "Interface\\Icons\\Inv_Pet_Speedy"
local categoryID

-- Default Settings
local defaults = {
    showFrame = true,
    background = false,
    fontSize = 16,
    position = { "CENTER", "UIParent", "CENTER", 0, 0 },
    fontFlag = "OUTLINE",
    fontFamily = "FRIZQT__.TTF",
    textColor = { r = 1, g = 1, b = 1, a = 1 },
    updateRate = 0.1,
}

-- 2. Helper Functions

local function round(x) return floor(x + 0.5) end

local function GetSpeed()
    local currentSpeed = GetUnitSpeed("player")
    local forwardSpeed = 0

    -- Only call if API exists, avoids table lookup every tick
    if GetGlidingInfo then
        local isGliding, _, fSpeed = GetGlidingInfo()
        if isGliding and fSpeed then
            forwardSpeed = fSpeed
        end
    end

    return round(max(currentSpeed, forwardSpeed) / BASE_MOVEMENT_SPEED * 100)
end

-- 3. UI Setup
local backdropInfo = {
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileEdge = true,
    tileSize = 8,
    edgeSize = 8,
    insets = { left = 1, right = 1, top = 1, bottom = 1 },
}

local f = CreateFrame("Frame", "MySpeedFrame", UIParent, "BackdropTemplate")
f:SetSize(50, 30)
f:SetMovable(true)
f:EnableMouse(true)
f:RegisterForDrag("LeftButton")
f:SetScript("OnDragStart", f.StartMoving)
f:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
    MoveSpeedDB.position = { self:GetPoint() }
end)

f.text = f:CreateFontString(nil, "ARTWORK", "GameTooltipText")
f.text:SetAllPoints(true)

local function UpdateVisuals()
    if not MoveSpeedDB.showFrame then
        f:Hide()
        return -- Stop processing visuals if hidden
    end

    f:Show()

    if MoveSpeedDB.background then
        f:SetBackdrop(backdropInfo)
    else
        f:SetBackdrop(nil)
    end

    -- Apply font
    local family = MoveSpeedDB.fontFamily or defaults.fontFamily
    local fontPath = "Fonts\\" .. family
    local fontFlag = MoveSpeedDB.fontFlag == "" and nil or MoveSpeedDB.fontFlag
    f.text:SetFont(fontPath, MoveSpeedDB.fontSize, fontFlag)

    -- Apply text color
    local c = MoveSpeedDB.textColor
    f.text:SetTextColor(c.r, c.g, c.b, c.a)

    -- Dynamic Height
    f:SetHeight(MoveSpeedDB.fontSize + 6)

    f:ClearAllPoints()
    local pos = MoveSpeedDB.position or defaults.position
    f:SetPoint(unpack(pos))
end

local ticker
local lastSpeed = -1

function StartTicker()
    if ticker then
        ticker:Cancel()
        ticker = nil
    end

    ticker = C_Timer.NewTicker(MoveSpeedDB.updateRate or defaults.updateRate, function()
        if not (MoveSpeedDB.showFrame or f.dataobject) then return end

        local movespeed = GetSpeed()
        if lastSpeed ~= movespeed then
            lastSpeed = movespeed
            local str = format("%d%%", movespeed)

            if MoveSpeedDB.showFrame then
                f.text:SetText(str)
                f:SetWidth(max(50, f.text:GetStringWidth()))
            end

            if f.dataobject then
                f.dataobject.value = movespeed
                f.dataobject.text = str
            end
        end
    end)
end

-- 4. Settings Panel (Retail Only)
local function SetupOptions()
    -- Classic check: Settings API doesn't exist in Vanilla/Wrath/Cata exactly the same way
    -- or simply isn't needed if we rely on slash commands.
    if not Settings or not Settings.RegisterVerticalLayoutCategory then return end

    local category, layout = Settings.RegisterVerticalLayoutCategory("MoveSpeed")

    -- Show Frame Checkbox
    local showSetting = Settings.RegisterAddOnSetting(category, "MoveSpeed_ShowFrame", "showFrame", MoveSpeedDB,
        Settings.VarType.Boolean, "Show MoveSpeed Frame", true)
    showSetting:SetValueChangedCallback(function() UpdateVisuals() end)
    Settings.CreateCheckbox(category, showSetting, "Toggle the MoveSpeed frame.")

    -- Update Rate Dropdown
    local function GetUpdateRateOptions()
        local container = Settings.CreateControlTextContainer()
        container:Add(0.1, "Fast (0.10s)")
        container:Add(0.20, "Normal (0.20s)")
        container:Add(0.5, "Slow (0.50s)")
        return container:GetData()
    end

    local updateRateSetting = Settings.RegisterAddOnSetting(
        category,
        "MoveSpeed_UpdateRate",
        "updateRate",
        MoveSpeedDB,
        Settings.VarType.Number,
        "Update Rate",
        0.10
    )
    updateRateSetting:SetValueChangedCallback(function()
        StartTicker()
        UpdateVisuals()
    end)

    Settings.CreateDropdown(
        category,
        updateRateSetting,
        GetUpdateRateOptions,
        "Choose how often movement speed updates."
    )
    -- Background Checkbox
    local bgSetting = Settings.RegisterAddOnSetting(category, "MoveSpeed_Background", "background", MoveSpeedDB,
        Settings.VarType.Boolean, "Enable Background", true)
    bgSetting:SetValueChangedCallback(function() UpdateVisuals() end)
    Settings.CreateCheckbox(category, bgSetting, "Toggle the frame background.")

    -- Font Size Slider
    local fontSetting = Settings.RegisterAddOnSetting(category, "MoveSpeed_FontSize", "fontSize", MoveSpeedDB,
        Settings.VarType.Number, "Font Size", 16)
    fontSetting:SetValueChangedCallback(function() UpdateVisuals() end)
    local sliderOpts = Settings.CreateSliderOptions(8, 24, 1)
    sliderOpts:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right)
    Settings.CreateSlider(category, fontSetting, sliderOpts, "Change font size.")

    -- Font Family Dropdown
    local function GetFontFamilyOptions()
        local container = Settings.CreateControlTextContainer()
        container:Add("ARIALN.TTF", "Arial Narrow")
        container:Add("FRIZQT__.TTF", "Friz Quadrata (Default)")
        container:Add("MORPHEUS.TTF", "Morpheus")
        container:Add("skurri.ttf", "Skurri")
        return container:GetData()
    end

    local fontFamilySetting = Settings.RegisterAddOnSetting(category, "MoveSpeed_FontFamily", "fontFamily", MoveSpeedDB,
        Settings.VarType.String, "Font Family", "FRIZQT__.TTF")
    fontFamilySetting:SetValueChangedCallback(function() UpdateVisuals() end)
    Settings.CreateDropdown(category, fontFamilySetting, GetFontFamilyOptions, "Choose the font family.")

    -- Font Flags Dropdown
    local function GetFontFlagOptions()
        local container = Settings.CreateControlTextContainer()
        container:Add("", "None")
        container:Add("MONOCHROME", "Monochrome")
        container:Add("OUTLINE", "Outline (Default)")
        container:Add("THICKOUTLINE", "Thick Outline")
        return container:GetData()
    end

    local fontFlagSetting = Settings.RegisterAddOnSetting(category, "MoveSpeed_FontFlag", "fontFlag", MoveSpeedDB,
        Settings.VarType.String, "Font Flags", "OUTLINE")
    fontFlagSetting:SetValueChangedCallback(function() UpdateVisuals() end)
    Settings.CreateDropdown(category, fontFlagSetting, GetFontFlagOptions, "Choose the font rendering style.")

    -- Text Color Picker
    local function ShowColorPicker()
        local info = {}
        -- Default to 1 (100%) if .a is missing
        local c = MoveSpeedDB.textColor or { r = 1, g = 1, b = 1, a = 1 }
        info.r = c.r or 1
        info.g = c.g or 1
        info.b = c.b or 1
        info.opacity = c.a or 1

        info.hasOpacity = true

        info.swatchFunc = function()
            local r, g, b = ColorPickerFrame:GetColorRGB()
            local a = ColorPickerFrame:GetColorAlpha()
            MoveSpeedDB.textColor = { r = r, g = g, b = b, a = a }
            UpdateVisuals()
        end

        info.opacityFunc = info.swatchFunc

        info.cancelFunc = function(restore)
            MoveSpeedDB.textColor = { r = restore.r, g = restore.g, b = restore.b, a = restore.opacity }
            UpdateVisuals()
        end

        ColorPickerFrame:SetupColorPickerAndShow(info)
    end

    layout:AddInitializer(CreateSettingsButtonInitializer("Text Color", "Text Color", ShowColorPicker,
        "Choose the text color.", true))

    -- Reset Button
    layout:AddInitializer(CreateSettingsButtonInitializer("Reset Position", "Reset Position", function()
        MoveSpeedDB.position = defaults.position
        UpdateVisuals()
    end, "Reset frame position.", true))

    Settings.RegisterAddOnCategory(category)
    return category
end

-- 5. Command Handler (Updated for Universal Support)
local function HandleSlashCommands(msg)
    local cmd = msg:lower():trim()

    if cmd == "reset" then
        MoveSpeedDB.position = defaults.position
        UpdateVisuals()
        print("|cFF00FF00MoveSpeed:|r Frame position reset.")
    elseif cmd == "bg" then
        MoveSpeedDB.background = true
        UpdateVisuals()
        print("|cFF00FF00MoveSpeed:|r Background enabled.")
    elseif cmd == "bgoff" then
        MoveSpeedDB.background = false
        UpdateVisuals()
        print("|cFF00FF00MoveSpeed:|r Background disabled.")
    elseif cmd == "small" then
        MoveSpeedDB.fontSize = 12
        UpdateVisuals()
        print("|cFF00FF00MoveSpeed:|r Font size set to small (12).")
    elseif cmd == "medium" then
        MoveSpeedDB.fontSize = 16
        UpdateVisuals()
        print("|cFF00FF00MoveSpeed:|r Font size set to medium (16).")
    elseif cmd == "large" then
        MoveSpeedDB.fontSize = 20
        UpdateVisuals()
        print("|cFF00FF00MoveSpeed:|r Font size set to large (20).")
    elseif cmd == "hide" then
        MoveSpeedDB.showFrame = false
        UpdateVisuals()
        print("|cFF00FF00MoveSpeed:|r Frame hidden. Use /movespeed show to restore.")
    elseif cmd == "show" then
        MoveSpeedDB.showFrame = true
        UpdateVisuals()
        print("|cFF00FF00MoveSpeed:|r Frame shown.")
    elseif cmd:match("^rate%s+[%d%.]+") then
        local num = tonumber(cmd:match("[%d%.]+"))
        if num and num >= 0.05 and num <= 1.0 then
            MoveSpeedDB.updateRate = num
            StartTicker()
            print("|cFF00FF00MoveSpeed:|r Update rate set to " .. num .. " seconds.")
        else
            print("|cFFFF0000MoveSpeed:|r Invalid rate. Use 0.05 to 1.0")
        end
    else
        -- If Retail, open settings. If Classic, show help.
        if Settings and Settings.OpenToCategory and categoryID then
            Settings.OpenToCategory(categoryID)
        else
            print("|cFF00FF00MoveSpeed Commands:|r")
            print("  /movespeed reset  - Reset position")
            print("  /movespeed bg     - Show background")
            print("  /movespeed bgoff  - Hide background")
            print("  /movespeed small  - Small font")
            print("  /movespeed medium  - Medium font")
            print("  /movespeed large  - Large font")
            print("  /movespeed hide   - Hide frame")
            print("  /movespeed show   - Show frame")
            print("  /movespeed rate <seconds>  - Set update rate (0.05–1.0)")
        end
    end
end

-- 6. DataBroker (LDB)
local ldb = LibStub and LibStub("LibDataBroker-1.1", true)
if ldb then
    local dataobject = ldb:NewDataObject("MoveSpeed", {
        type = "data source", icon = iconPath, label = "MoveSpeed", text = "0%", value = 0,
    })
    dataobject.OnTooltipShow = function(tooltip)
        tooltip:AddLine(format(speedFormat, GetSpeed()))
    end
    -- Link LDB object to updater
    f.dataobject = dataobject
end

-- 7. Initialization & Ticker
local loader = CreateFrame("Frame")
loader:RegisterEvent("PLAYER_LOGIN")
loader:SetScript("OnEvent", function(self)
    -- Initialize DB
    if not MoveSpeedDB then MoveSpeedDB = {} end
    for k, v in pairs(defaults) do
        if MoveSpeedDB[k] == nil then MoveSpeedDB[k] = v end
    end

    UpdateVisuals()

    -- Setup Options (Retail Only) & Capture ID for slash command
    local category = SetupOptions()
    if category then categoryID = category:GetID() end

    -- Register Slash Commands
    SLASH_MOVESPEED1 = "/movespeed"
    SlashCmdList["MOVESPEED"] = HandleSlashCommands
    StartTicker()
end)
