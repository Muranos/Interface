-- GlobalFont - Simple Global Font Changer
-- Version: 1.0.0

local AddonName, Addon = ...

-- Initialize saved variables
GlobalFontDB = GlobalFontDB or {}

-- Default fonts available in WoW
local DEFAULT_FONTS = {
    ["Friz Quadrata TT"] = "Fonts\\FRIZQT__.TTF",
    ["Arial Narrow"] = "Fonts\\ARIALN.TTF",
    ["Skurri"] = "Fonts\\skurri.ttf",
    ["Morpheus"] = "Fonts\\MORPHEUS.TTF",
}

-- Font objects that WoW uses for UI elements
local FONT_OBJECTS = {
    "SystemFont_Outline_Small",
    "SystemFont_Outline",
    "SystemFont_InverseShadow_Small",
    "SystemFont_Med1",
    "SystemFont_Med2",
    "SystemFont_Med3",
    "SystemFont_Large",
    "SystemFont_Huge1",
    "SystemFont_OutlineThick_Huge2",
    "SystemFont_OutlineThick_Huge4",
    "SystemFont_OutlineThick_WTF",
    "NumberFont_OutlineThick_Mono_Small",
    "NumberFont_Outline_Huge",
    "NumberFont_Outline_Large",
    "NumberFont_Outline_Med",
    "NumberFont_Shadow_Med",
    "NumberFont_Shadow_Small",
    "QuestFont_Large",
    "QuestFont_Huge",
    "QuestFont_Shadow_Huge",
    "QuestFont_Super_Huge",
    "QuestFont_Outline_Huge",
    "GameFont_Gigantic",
    "ChatFontNormal",
    "ChatFontSmall",
    "GameFontNormal",
    "GameFontNormalSmall",
    "GameFontNormalMed3",
    "GameFontNormalLarge",
    "GameFontNormalHuge",
    "GameFontHighlight",
    "GameFontHighlightSmall",
    "GameFontHighlightLarge",
    "GameFontDisable",
    "GameFontDisableSmall",
    "GameFontGreen",
    "GameFontGreenSmall",
    "GameFontRed",
    "GameFontRedSmall",
    "GameFontWhite",
    "GameFontDarkGraySmall",
}

-- Get all available fonts
local function GetAvailableFonts()
    local fonts = {}
    
    -- Add default fonts
    for name, path in pairs(DEFAULT_FONTS) do
        fonts[name] = path
    end
    
    -- Check if LibSharedMedia is available
    local LSM = LibStub and LibStub("LibSharedMedia-3.0", true)
    if LSM then
        local mediaFonts = LSM:List("font")
        for _, fontName in ipairs(mediaFonts) do
            local fontPath = LSM:Fetch("font", fontName)
            if fontPath then
                fonts[fontName] = fontPath
            end
        end
    end
    
    return fonts
end

-- Apply the selected font to all game font objects
local function ApplyGlobalFont(fontPath)
    if not fontPath then return end
    
    for _, fontName in ipairs(FONT_OBJECTS) do
        local fontObject = _G[fontName]
        if fontObject then
            local _, size, flags = fontObject:GetFont()
            if size then
                fontObject:SetFont(fontPath, size, flags)
            end
        end
    end
    
    -- Save the setting
    GlobalFontDB.selectedFont = fontPath
    print("|cff00ff00GlobalFont:|r Font applied successfully! Reload UI (/reload) for complete effect.")
end

-- Create the options frame
local function CreateOptionsFrame()
    local frame = CreateFrame("Frame", "GlobalFontFrame", UIParent, "BasicFrameTemplateWithInset")
    frame:SetSize(600, 500)
    frame:SetPoint("CENTER")
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    frame:Hide()
    
    -- Set title
    frame.title = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    frame.title:SetPoint("TOP", 0, -5)
    frame.title:SetText("GlobalFont - Font Selector")
    
    -- Create scroll frame for font list
    local scrollFrame = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 10, -30)
    scrollFrame:SetPoint("BOTTOMRIGHT", -30, 50)
    
    local scrollChild = CreateFrame("Frame", nil, scrollFrame)
    scrollFrame:SetScrollChild(scrollChild)
    scrollChild:SetSize(550, 1)
    
    -- Store for font buttons
    frame.fontButtons = {}
    frame.selectedFont = nil
    
    -- Populate font list
    local fonts = GetAvailableFonts()
    local sortedFonts = {}
    for name in pairs(fonts) do
        table.insert(sortedFonts, name)
    end
    table.sort(sortedFonts)
    
    local yOffset = -5
    for _, fontName in ipairs(sortedFonts) do
        local fontPath = fonts[fontName]
        
        -- Create button for each font
        local btn = CreateFrame("Button", nil, scrollChild)
        btn:SetSize(530, 30)
        btn:SetPoint("TOP", 0, yOffset)
        
        -- Button background
        btn.bg = btn:CreateTexture(nil, "BACKGROUND")
        btn.bg:SetAllPoints()
        btn.bg:SetColorTexture(0.1, 0.1, 0.1, 0.5)
        
        -- Highlight texture
        btn.highlight = btn:CreateTexture(nil, "HIGHLIGHT")
        btn.highlight:SetAllPoints()
        btn.highlight:SetColorTexture(0.3, 0.3, 0.3, 0.5)
        
        -- Font name text in its own font
        btn.text = btn:CreateFontString(nil, "OVERLAY")
        btn.text:SetPoint("LEFT", 10, 0)
        btn.text:SetFont(fontPath, 14, "")
        btn.text:SetText(fontName)
        btn.text:SetJustifyH("LEFT")
        
        btn.fontName = fontName
        btn.fontPath = fontPath
        
        btn:SetScript("OnClick", function(self)
            -- Deselect previous
            if frame.selectedFont then
                frame.selectedFont.bg:SetColorTexture(0.1, 0.1, 0.1, 0.5)
            end
            
            -- Select this one
            self.bg:SetColorTexture(0.2, 0.5, 0.2, 0.7)
            frame.selectedFont = self
        end)
        
        table.insert(frame.fontButtons, btn)
        yOffset = yOffset - 35
    end
    
    scrollChild:SetHeight(math.abs(yOffset))
    
    -- Apply button
    local applyBtn = CreateFrame("Button", nil, frame, "GameMenuButtonTemplate")
    applyBtn:SetSize(150, 30)
    applyBtn:SetPoint("BOTTOM", 0, 15)
    applyBtn:SetText("Apply Font")
    applyBtn:SetNormalFontObject("GameFontNormalLarge")
    applyBtn:SetHighlightFontObject("GameFontHighlightLarge")
    
    applyBtn:SetScript("OnClick", function()
        if frame.selectedFont then
            ApplyGlobalFont(frame.selectedFont.fontPath)
        else
            print("|cffff0000GlobalFont:|r Please select a font first!")
        end
    end)
    
    return frame
end

-- Slash command handler
local optionsFrame
local function SlashCommandHandler(msg)
    if not optionsFrame then
        optionsFrame = CreateOptionsFrame()
    end
    
    if optionsFrame:IsShown() then
        optionsFrame:Hide()
    else
        optionsFrame:Show()
    end
end

-- Register slash commands
SLASH_GLOBALFONT1 = "/globalfont"
SLASH_GLOBALFONT2 = "/gf"
SlashCmdList["GLOBALFONT"] = SlashCommandHandler

-- Event handler
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_LOGIN")

eventFrame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == AddonName then
        -- Initialize database
        GlobalFontDB = GlobalFontDB or {}
        
        print("|cff00ff00GlobalFont|r loaded! Use |cff00ffff/gf|r or |cff00ffff/globalfont|r to open the font selector.")
    elseif event == "PLAYER_LOGIN" then
        -- Apply saved font on login
        if GlobalFontDB.selectedFont then
            C_Timer.After(1, function()
                ApplyGlobalFont(GlobalFontDB.selectedFont)
            end)
        end
    end
end)
