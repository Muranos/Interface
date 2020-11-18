local AddonName = ...
local Silence = CreateFrame('Frame')

local select = select

function Silence:OnEvent(e, ...)
    if e == "PLAYER_LOGIN" then
        _G.UIParent:UnregisterEvent('TALKINGHEAD_REQUESTED')
    elseif e == 'ADDON_LOADED' then
        if ... == AddonName then
            SilenceDB = SilenceDB or { options = {} , played = {} }
            SilenceDB.options.silenceEnabled = SilenceDB.options.silenceEnabled or true
        elseif ... == 'Blizzard_TalkingHeadUI' then
            if SilenceDB.options.silenceEnabled or SilenceDB.options.silenceForever then
                _G.TalkingHeadFrame:UnregisterEvent('TALKINGHEAD_REQUESTED')
            end
        end
    elseif e == 'TALKINGHEAD_REQUESTED' then
        if SilenceDB.options.silenceEnabled and not SilenceDB.options.silenceForever then
            if not IsAddOnLoaded("Blizzard_TalkingHeadUI") then
                UIParentLoadAddOn("Blizzard_TalkingHeadUI");
            end

            local vo = select(3, _G.C_TalkingHead.GetCurrentLineInfo())
            if not SilenceDB.played[vo] then
                TalkingHeadFrame_PlayCurrent()
                SilenceDB.played[vo] = true
            end
        end
    end
end

SLASH_SILENCE1 = '/silence'
function SlashCmdList.SILENCE(msg)
	local _, _, cmd, args = string.find(msg, '%s?(%w+)%s?(.*)')
	if not cmd or cmd == '' or cmd == 'help' then
        print('|cffEEE4AESilence:|r |cffEF6D6D/silence|r')
        print('  |cffEF6D6D/silence toggle  -|r  |cffFAD1D1Toggle showing of previously seen Talking Heads.|r')
        print('  |cffEF6D6D/silence forever -|r  |cffFAD1D1Toggle to NEVER show Talking Heads.|r')
        print('  |cffEF6D6D/silence clear -|r  |cffFAD1D1Clear previously seen Talking Heads database|r')
	elseif cmd == 'on' or cmd =='enable' then
        SilenceDB.options.silenceEnabled = true
        print('|cffEEE4AESilence:|r |cff37DB33Silence enabled.')
        if _G.TalkingHeadFrame then
            _G.TalkingHeadFrame:UnregisterEvent('TALKINGHEAD_REQUESTED')
        end
	elseif cmd == 'off' or cmd =='disable' then
        SilenceDB.options.silenceEnabled = false
        print('|cffEEE4AESilence:|r |cffB6B6B6Silence disabled.')
        if _G.TalkingHeadFrame then
            _G.TalkingHeadFrame:RegisterEvent('TALKINGHEAD_REQUESTED')
        end
    elseif cmd == 'toggle' then
        if SilenceDB.options.silenceEnabled then
            SilenceDB.options.silenceEnabled = false
            print('|cffEEE4AESilence:|r |cffB6B6B6Silence disabled.')
        else
            SilenceDB.options.silenceEnabled = true
            print('|cffEEE4AESilence:|r |cff37DB33Silence enabled.')
        end
    elseif cmd == 'forever' then
        if SilenceDB.options.silenceForever then
            SilenceDB.options.silenceForever = false
            if _G.TalkingHeadFrame then
                _G.TalkingHeadFrame:RegisterEvent('TALKINGHEAD_REQUESTED')
            end
            print('|cffEEE4AESilence:|r |cff37DB33Only silence previously seen.')
        else
            SilenceDB.options.silenceForever = true
            if _G.TalkingHeadFrame then
                _G.TalkingHeadFrame:UnregisterEvent('TALKINGHEAD_REQUESTED')
            end
            print('|cffEEE4AESilence:|r |cff37DB33True silence.')
        end
    elseif cmd == 'clear' then
        SilenceDB.played = {}
    end
end

function Silence:OnLoad()
	self:SetScript('OnEvent', self.OnEvent)

    self:RegisterEvent('PLAYER_LOGIN')
    self:RegisterEvent('ADDON_LOADED')
    self:RegisterEvent('TALKINGHEAD_REQUESTED')
end
Silence:OnLoad()