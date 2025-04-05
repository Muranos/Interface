--[[
                                ----o----(||)----oo----(||)----o----

                                            Hallow's End

                                       v4.01 - 31st March 2025
                                Copyright (C) Taraezor / Chris Birch
                                         All Rights Reserved

                                ----o----(||)----oo----(||)----o----
]]

local addonName, ns = ...
ns.db = {}

ns.defaults = { profile = { iconScale = 2.5, iconAlpha = 1, showCoords = true,
								remove = { true, true, true }, -- Seasonal, Daily, One Time
								removeAchieveChar = false, removeAchieveAcct = false,
								iconTricksTreat = 11, iconDailies = 10, iconFires = 13, iconSpecial = 15 } }
local pluginHandler = {}

-- Localised
local GameTooltip = _G.GameTooltip
local GetAchievementCriteriaInfo = GetAchievementCriteriaInfo
local GetAchievementInfo = GetAchievementInfo
local GetAchievementNumCriteria = GetAchievementNumCriteria
local GetMapChildrenInfo = C_Map.GetMapChildrenInfo
local GetTime = GetTime
local IsQuestFlaggedCompleted = C_QuestLog.IsQuestFlaggedCompleted
local LibStub = _G.LibStub
local QuestUtils_GetQuestName = QuestUtils_GetQuestName
local UIParent = _G.UIParent
local UnitAura = C_UnitAuras.GetAuraDataByIndex
local format = _G.format
local gsub = string.gsub
local ipairs = _G.ipairs
local next = _G.next

local HandyNotes = _G.HandyNotes

-- ---------------------------------------------------------------------------------------------------------------------------------

local function PassAllChecks( pin )
	-- Class
	if ( pin.class == nil) or ( pin.class == ns.class ) then
	else
		return false
	end
	-- Faction
	if ( pin.faction == nil ) or ( ( pin.faction == "Horde" ) and ( ns.faction == "Horde" ) ) or
								( ( pin.faction == "Alliance" ) and ( ns.faction == "Alliance" ) ) then
	else
		return false
	end
	-- Game Version
	if pin.version and pin.versionUnder then
		if ( ns.version >= pin.version ) and ( ns.version < pin.versionUnder ) then
			return true
		end
	elseif pin.version then
		if ( ns.version >= pin.version ) then
			return true
		end
	elseif pin.versionUnder then
		if ( ns.version < pin.versionUnder ) then
			return true
		end
	else	
 		return true
	end
	return false
end

local function CharacterCompleted( character )
	-- Pass it parm #14 from GetAchievementInfo(). Returns if the character has really completed the achievement.
	-- This fuction disregards sharing and Warbands and effectively relies upon a data return quirk to work.
	-- _, _, _, completedA, _, _, _, _, _, _, _, _, _, charName = GetAchievementInfo( v.id )
	-- _, _, completedC, _,  _, charName, _, _, _, _, eligible = GetAchievementCriteriaInfo( v.id, v.index )
	-- Testing late March 2025, retail 11.1.0:
	-- Eligible is always true - at least outside of the event. CompletedA is an account wide completion boolean
	-- CompletedC is always false except if the character has actually (for real) completed all of the criteria
	-- CharName is always nil except if the character has actually (for real) completed the achievement
	-- The above testing outcomes indicate that the Wow Wiki GG website's API data is incorrect / not up to date as of March 2025
	-- Going with CharName rather than CompletedC purely on a hunch that it'll need less maintenance over time lol
	if ( character == nil ) or ( character ~= ns.name ) then
		return false
	else
		return true
	end
end

-- ---------------------------------------------------------------------------------------------------------------------------------

local function CorrectMapPhase( mapID, old )

	if ( ns.version < 60000 ) then return true end -- Safe to drop through the code but more efficient to just exit

	if ( mapID == 17 ) or -- Blasted Lands
			( mapID == 18 ) or ( mapID == 2070 ) or -- Tirisfal Glades
			( mapID == 57 ) or ( mapID == 62 ) or ( mapID == 70 ) or ( mapID == 81 ) or
				-- Teldrassil, Silithus, Darkshore, Theramore, Darnassus
			( mapID == 249 ) or ( mapID == 1527 ) then -- Uldum
		for i = 1, 40 do -- 40 is rather arbitrary these days I think
			local auraData = UnitAura( "player", i, "HELPFUL" )
			if auraData == nil then break end
			if auraData.spellId then
				if ( auraData.spellId == 372329 ) or ( auraData.spellId == 276827 ) or ( auraData.spellId == 255152 ) or
					-- Time Travelling buff for Blasted Lands, Tirisfal Glades, Silithus
						( auraData.spellId == 290246 ) or ( auraData.spellId == 123979 ) or ( auraData.spellId == 317785 )  then
					-- Time Travelling buff for Darkshore/Teldrassil/Darnassus, Theramore, Uldum
					return old
				end
			end
		end
		return not old
	else
		return true
	end
end

local function CompletionShow( completed, whatever, colour, name, completionS ) -- Last two parms are optional
	GameTooltip:AddDoubleLine( ( whatever and ( colour ..whatever) or " " ), 
		( ( completed == true ) and ( ns.colour.completeG ..ns.L[ "Completed" ] ) or ( ns.colour.completeR
		..ns.L[ "Not Completed" ] ) ) .." (" ..( ( completionS == nil ) and "" or ( ( completionS == true ) and
		ns.colour.completeG or ns.colour.completeR ) ) ..( name or "Account" )
		..( ( completed == true ) and ns.colour.completeG or ns.colour.completeR ) ..")" )
end

local function Tip( tip )
	if tip then
		GameTooltip:AddLine( ns.spaceLine ..ns.colour.plaintext ..ns.L[ tip ], nil, nil, nil, true )
		ns.spaceLine = ""
	end
end

local function GuideTip( pin )
	-- Guides preceed Tips. Guides and Tips are not shown for completed Quests/Achievements
	-- A Guide will be extensive, way beyond the scope of a Google Translate, for example.
	-- A tip should be quite short, perhaps finessing a generic guide. A tip often should be translated
	if pin.guide then
		GameTooltip:AddLine( ns.spaceLine ..ns.colour.Guide ..pin.guide, nil, nil, nil, true )
		ns.spaceLine = ""
	end
	if pin.tip then
		Tip( pin.tip )
	end
	return ( pin.tip or pin.guide ) and true or false
end

local function ShowQuestStatus( quest, colour, backupName )
	if ns.firstOne == true then
		GameTooltip:AddLine( ns.colour.highlight .."\n" ..ns.L[ quest.qType ] )
		ns.firstOne = false
	end
	local level = quest.level and ( ns.colour.plaintext .." (" ..ns.L[ "Level" ] .." " ..quest.level ..")" ) or ""
	local questName = QuestUtils_GetQuestName( quest.id )
	-- Reminder: C_QuestLog.GetTitleForQuestID() works too for Retail but not for Classic Cata
	-- These calls return localised text. Doesn't need to be in the Quest Log. Server won't immediately respond. 
	questName = ( questName and ( questName ..level ) ) or ( quest.name and ( quest.name ..level ) ) or
				( backupName and ( backupName ..level ) ) or ns.L[ "Try again" ]
	local completed = IsQuestFlaggedCompleted( quest.id )
	CompletionShow( completed, questName, ns.colour.seasonal, ns.name )
	if completed == false then GuideTip( quest ) end
end

-- Plugin handler for HandyNotes
function pluginHandler:OnEnter( mapFile, coord )
	if self:GetCenter() > UIParent:GetCenter() then
		GameTooltip:SetOwner( self, "ANCHOR_LEFT" )
	else
		GameTooltip:SetOwner( self, "ANCHOR_RIGHT" )
	end

	local pin = ns.points[ mapFile ] and ns.points[ mapFile ][ coord ]
	if pin == nil then return end
	
	local aName, completedA, completedC, completedQ, description, charName, cType, assetID;

	GameTooltip:SetText( ns.colour.prefix ..( ns.L[ "Hallows End" ] ) )

	if pin.achievements and ( ns.version > 30002 ) and PassAllChecks( pin.achievements ) then
		for _, v in ipairs( pin.achievements ) do
			if PassAllChecks( v ) then
				_, aName, _, completedA, _, _, _, description, _, _, _, _, _, charName = GetAchievementInfo( v.id )
				-- 13th "Earned By Me" paramter is no longer useful. Always true if any other character has the achievement
				GameTooltip:AddLine( "\n" )
				GameTooltip:AddLine( ns.colour.highlight ..ns.L[ "Achievement" ] )
				CompletionShow( completedA, aName, ns.colour.achieveH )
				completedC = CharacterCompleted( charName )
				CompletionShow( completedC, nil, nil, ns.name )
				if v.showAllCriteria then -- Most likely a meta pin
					GameTooltip:AddLine( ns.colour.achieveD ..description, nil, nil, nil, true )
					numCriteria = GetAchievementNumCriteria( v.id )					
					for i = 1, numCriteria do
						aName, cType, _, _, _, _, _, assetID = GetAchievementCriteriaInfo( v.id, i )
						-- Due to shared achievements and now Warbands there is no indiviudual achievement data available
						if ( cType == 27 ) then
							-- Quests, eg zones. During the event we can track indiviudual progress towards the achievement
							if i == 1 then GameTooltip:AddLine( ns.colour.achieveH ..ns.L[ "Seasonal" ] ) end
							completedQ = IsQuestFlaggedCompleted( assetID )
							CompletionShow( completedQ, aName, ns.colour.achieveI, ns.name, completedC )
						elseif ( cType == 8 ) then
							-- Achievement type. Meta. cType will show each line as an achievement
							-- Must do it this way as "completed" for the criteria is account wide and for the overall meta
							_, aName, _, _, _, _, _, description, _, _, _, _, _, charName = GetAchievementInfo( assetID )
							completedC = CharacterCompleted( charName )
							CompletionShow( completedC, aName, ns.colour.achieveH, ns.name )
							if completedC == false and description then
								GameTooltip:AddLine( ns.colour.achieveD ..description, nil, nil, nil, true )
							end
						elseif ( cType == 0 ) or ( cType == 29 ) then
							-- Monster ID or Craft spell ID. Whatever lol
							CompletionShow( CharacterCompleted( charName ), aName, ns.colour.achieveH, ns.name )
						end
					end
				else
					GameTooltip:AddLine( ns.colour.achieveD ..description, nil, nil, nil, true )
					if v.index and ( completedC == false ) then
						aName = GetAchievementCriteriaInfo( v.id, v.index )
						CompletionShow( completedC, aName, ns.colour.achieveI, ns.name )
					end
				end
				GuideTip( v )
			end
		end
	elseif pin.name then
		GameTooltip:AddLine( "\n" )
		GameTooltip:AddLine( ns.colour.highlight ..ns.L[ pin.name ] )
	end

	ns.spaceLine = ""
	
	if pin.quests and PassAllChecks( pin.quests ) then
		for i, v in ipairs( ns.questTypes ) do
			ns.firstOne = true
			for _, q in ipairs( pin.quests ) do
				if PassAllChecks( q ) and ( q.qType == v ) then
					ShowQuestStatus( q, ns.questColours[ i ], ( pin.candy and ns.L[ "Candy Bucket" ] or nil ) )
					GuideTip( q )
				end
			end
		end
		ns.spaceLine = "\n"
	end

	GuideTip( pin )

	if ( pin.noZidormi == nil ) and ( CorrectMapPhase( mapFile, true ) == false ) then -- True = old
		ns.spaceLine = "\n"
		Tip( ns.L[ "ZidormiWrongPhase" ] )
	end

	if ( ns.db.showCoords == true ) and not pin.noCoords then
		local mX, mY = HandyNotes:getXY(coord)
		mX, mY = mX*100, mY*100
		GameTooltip:AddLine( "\n" ..ns.colour.highlight .."(" ..format( "%.02f", mX ) .."," ..format( "%.02f", mY ) ..")" )
	end

	GameTooltip:Show()
end

function pluginHandler:OnLeave()
	GameTooltip:Hide()
end

-- ---------------------------------------------------------------------------------------------------------------------------------

local function ShowAchievements( pin )
	if not pin.achievements then return false end
	if ns.version < 30002 then return false end -- Achievements began with WotLK patch 3.0.2
	if PassAllChecks( pin.achievements ) == false then return false end
	if ( ns.db.removeAchieveChar == false ) and ( ns.db.removeAchieveAcct == false ) then return true end

	local completed, charName;
	
	local acctCompleted, charCompleted = true, true
	for _,v in ipairs( pin.achievements ) do
		if PassAllChecks( v ) then
			_, _, _, completed, _, _, _, _, _, _, _, _, _, charName = GetAchievementInfo( v.id )
			if completed == false then acctCompleted = false end
			if ( charName == nil ) or ( charName ~= ns.name ) then charCompleted = false end
			-- Using this hack for character specific status as due to sharing/Warbands data is otherwise unavailable
		end
	end
	if ( ns.db.removeAchieveAcct == true ) and ( acctCompleted == true ) then
		return false
	end
	if ( ns.db.removeAchieveChar == true ) and ( charCompleted == true ) then
		return false
	end
	
	return true
end

local function ShowQuests( pin )
	if not pin.quests then return false end
	for i, v in ipairs( ns.questTypes ) do
		for _, q in ipairs( pin.quests ) do
			if PassAllChecks( q ) and ( q.qType == v ) then
				if ns.db.remove[ i ] == false then return true end
				if IsQuestFlaggedCompleted( q.id ) == false then return true end
			end
		end
	end
	return false
end

local function ShowAnyway( pin)
	if pin.achievements or pin.quests then return false end
	return true
end

do	
	local function iterator( t, prev )
		if not t then return end
		local coord, pin = next( t, prev )
		while coord do
			if pin and PassAllChecks( pin ) and 
					( pin.alwaysShow or ShowAchievements( pin ) or ShowQuests( pin ) or ShowAnyway( pin) ) then
				if pin.candy then
					if pin.large then
						return coord, nil, ns.textures[ ns.db.iconTricksTreat ],
							ns.db.iconScale * 1.7 * ns.scaling[ ns.db.iconTricksTreat ], ns.db.iconAlpha
					else
						return coord, nil, ns.textures[ ns.db.iconTricksTreat ],
							ns.db.iconScale * ns.scaling[ ns.db.iconTricksTreat ], ns.db.iconAlpha
					end
				elseif pin.fires then
					return coord, nil, ns.textures[ ns.db.iconFires ],
						ns.db.iconScale * ns.scaling[ ns.db.iconFires ], ns.db.iconAlpha
				elseif pin.rotten then
					return coord, nil, ns.textures[ ns.db.iconDailies ],
						ns.db.iconScale * ns.scaling[ ns.db.iconDailies ], ns.db.iconAlpha
				else
					return coord, nil, ns.textures[ ns.db.iconSpecial ],
						ns.db.iconScale * ns.scaling[ ns.db.iconSpecial ], ns.db.iconAlpha
				end				
			end
			coord, pin = next( t, coord )
		end
	end
	function pluginHandler:GetNodes2( mapID )
		return iterator, ns.points[ mapID ]
	end
end

-- ---------------------------------------------------------------------------------------------------------------------------------

local function AddColouredText( inputText )
	local hash = gsub( ns.L[ inputText ], "%%e", ns.colour.highlight )
	return gsub( hash, "%%s", ns.colour.prefix )
end

local function SubstitutePlayerOrElseAcct( theType, character )
	return gsub( ns.L[ theType ], "%%p", ( character and ns.name or ns.L[ "Account" ] ) )
end

ns.iconStandard = "1 = " ..ns.L[ "White" ] .."\n2 = " ..ns.L[ "Purple" ] .."\n3 = " ..ns.L[ "Red" ] .."\n4 = " ..ns.L[ "Yellow" ]
				.."\n5 = " ..ns.L[ "Green" ] .."\n6 = " ..ns.L[ "Grey" ] .."\n7 = " ..ns.L[ "Mana Orb" ]
				.."\n8 = " ..ns.L[ "Phasing" ] .."\n9 = " ..ns.L[ "Raptor egg" ] .."\n10 = " ..ns.L[ "Stars" ]
				.."\n11 = " ..ns.L[ "Candy Swirl" ] .."\n12 = " ..ns.L[ "Pumpkin" ] .."\n13 = " ..ns.L[ "Evil Pumpkin" ]
				.."\n14 = " ..ns.L[ "Bat" ] .."\n15 = " ..ns.L[ "Cat" ] .."\n16 = " ..ns.L[ "Ghost" ] .."\n17 = " ..ns.L[ "Witch" ]

-- Interface -> Addons -> Handy Notes -> Plugins -> Hallow's End options
ns.options = {
	type = "group",
	name = ns.L[ "Hallow's End" ],
	desc = AddColouredText( "AddOn Description" ),
	get = function( info ) return ns.db[ info[ #info ] ] end,
	set = function( info, v )
		ns.db[ info[ #info ] ] = v
		pluginHandler:Refresh()
	end,
	args = {
		options = {
			type = "group",
			-- Add a " " to force this to be before the first group. HN arranges alphabetically on local language
			name = " " ..ns.L[ "Options" ],
			inline = true,
			args = {
				iconScale = {
					type = "range",
					name = ns.L[ "Map Pin Size" ],
					desc = ns.L[ "The Map Pin Size" ],
					min = 1, max = 4, step = 0.1,
					arg = "iconScale",
					order = 1,
				},
				iconAlpha = {
					type = "range",
					name = ns.L[ "Map Pin Alpha" ],
					desc = ns.L[ "The alpha transparency of the map pins" ],
					min = 0, max = 1, step = 0.01,
					arg = "iconAlpha",
					order = 2,
				},
				showCoords = {
					name = ns.L[ "Show Coordinates" ],
					desc = ns.L[ "Show Coordinates Description" ] ..ns.colour.highlight .."\n(xx.xx,yy.yy)",
					type = "toggle",
					width = "full",
					arg = "showCoords",
					order = 3,
				},
				removeDailies = {
					name = SubstitutePlayerOrElseAcct( "RWCQuestDailies", true ),
					desc = SubstitutePlayerOrElseAcct( "RWCQuestDailiesDesc", true ),
					type = "toggle",
					width = "full",
					arg = "removeDailies",
					order = 4,
				},
				removeSeasonal = {
					name = SubstitutePlayerOrElseAcct( "RWCQuestSeasonal", true ),
					desc = SubstitutePlayerOrElseAcct( "RWCQuestSeasonalDesc", true ),
					type = "toggle",
					width = "full",
					arg = "removeSeasonal",
					order = 5,
				},
				removeAchieveChar = {
					name = SubstitutePlayerOrElseAcct( "RWCAchievements", true ),
					desc = SubstitutePlayerOrElseAcct( "RWCAchievementsDesc", true ),
					type = "toggle",
					width = "full",
					arg = "removeAchieveChar",
					order = 6,
				},
				removeAchieveAcct = {
					name = SubstitutePlayerOrElseAcct( "RWCAchievements" ),
					desc = SubstitutePlayerOrElseAcct( "RWCAchievementsDescAcct" ),
					type = "toggle",
					width = "full",
					arg = "removeAchieveAcct",
					order = 7,
				},
			},
		},
		icon = {
			type = "group",
			name = ns.L[ "Map Pin Selections" ],
			inline = true,
			args = {
				iconTricksTreat = {
					type = "range",
					name = ns.L[ "Tricks and Treats" ],
					desc = ns.iconStandard, 
					min = 1, max = 17, step = 1,
					arg = "iconTricksTreat",
					order = 10,
				},
				iconDailies = {
					type = "range",
					name = ns.L[ "Rotten Hallow Dailies" ],
					desc = ns.iconStandard, 
					min = 1, max = 17, step = 1,
					arg = "iconDailies",
					order = 11,
				},
				iconFires = {
					type = "range",
					name = ns.L[ "Fires" ],
					desc = ns.iconStandard, 
					min = 1, max = 17, step = 1,
					arg = "iconFires",
					order = 12,
				},
				iconSpecial = {
					type = "range",
					name = ns.L[ "Special" ] .."++",
					desc = ns.iconStandard, 
					min = 1, max = 17, step = 1,
					arg = "iconSpecial",
					order = 13,
				},
			},
		},
		notes = {
			type = "group",
			name = ns.L[ "Notes" ],
			inline = true,
			args = {
				noteMenu = { type = "description", name = ns.L[ "MinimapMenu" ], order = 30, },
				separator1 = { type = "header", name = "", order = 31, },
				noteChat = { type = "description", name = ns.L[ "ChatCommands" ]
					..NORMAL_FONT_COLOR_CODE .."/he" ..HIGHLIGHT_FONT_COLOR_CODE ..", "
					..NORMAL_FONT_COLOR_CODE .."/hend" ..HIGHLIGHT_FONT_COLOR_CODE ..", "
					..NORMAL_FONT_COLOR_CODE .."/hallows" ..HIGHLIGHT_FONT_COLOR_CODE ..ns.L[ "ShowPanel" ],
					order = 32, },
			},
		},
	},
}

-- ---------------------------------------------------------------------------------------------------------------------------------

function HandyNotes_HallowsEnd_OnAddonCompartmentClick( addonName, buttonName )
	Settings.OpenToCategory( "HandyNotes" )
	LibStub( "AceConfigDialog-3.0" ):SelectGroup( "HandyNotes", "plugins", "HallowsEnd" )
 end

function HandyNotes_HallowsEnd_OnAddonCompartmentEnter( ... )
	GameTooltip:SetOwner( MinimapCluster or AddonCompartmentFrame, "ANCHOR_LEFT" )	
	GameTooltip:AddLine( ns.colour.prefix ..ns.L[ "Hallow's End" ] )
	GameTooltip:AddLine( ns.colour.highlight .." " )
	GameTooltip:AddDoubleLine( ns.colour.highlight ..ns.L[ "Left" ] .."/" ..ns.L[ "Right" ], ns.colour.plaintext
		..ns.L[ "Options" ] )
	GameTooltip:Show()
end

function HandyNotes_HallowsEnd_OnAddonCompartmentLeave( ... )
	GameTooltip:Hide()
end

-- ---------------------------------------------------------------------------------------------------------------------------------

function pluginHandler:OnEnable()
	local HereBeDragons = LibStub( "HereBeDragons-2.0", true )
	if not HereBeDragons then return end
	
	for continentMapID in next, ns.continents do
		local children = GetMapChildrenInfo( continentMapID, nil, true )
		for _, map in next, children do
			if ns.points[ map.mapID ] then
				-- Maps here will not propagate upwards. Especially avoids cities propagating upwards
				if ( map.mapID == 2112 ) or -- Valdrakken
					-- I want to do a summary pin on Azeroth but I still want the Dragon Isles zones
					-- to propagate upwards to the Dragon Isles zone. Pandaria too
					( ( map.mapID == 422 ) and ( continentMapID == 947 ) ) or -- Dread Wastes
					( ( map.mapID == 418 ) and ( continentMapID == 947 ) ) or -- Krasarang Wilds
					( ( map.mapID == 379 ) and ( continentMapID == 947 ) ) or -- Kun-Lai Summit
					( ( map.mapID == 393 ) and ( continentMapID == 947 ) ) or -- Shrine of the Seven Stars
					( ( map.mapID == 392 ) and ( continentMapID == 947 ) ) or -- The Imperial Mercantile
					( ( map.mapID == 371 ) and ( continentMapID == 947 ) ) or -- The Jade Forest
					( ( map.mapID == 433 ) and ( continentMapID == 947 ) ) or -- The Veiled Stair
					( ( map.mapID == 388 ) and ( continentMapID == 947 ) ) or -- Townlong Steppes
					( ( map.mapID == 390 ) and ( continentMapID == 947 ) ) or -- Vale of Eternal Blossoms
					( ( map.mapID == 376 ) and ( continentMapID == 947 ) ) or -- Valley of the Four Winds
					( ( map.mapID == 2022 ) and ( continentMapID == 947 ) ) or -- The Waking Shores
					( ( map.mapID == 2023 ) and ( continentMapID == 947 ) ) or -- Ohn'ahran Plains
					( ( map.mapID == 2024 ) and ( continentMapID == 947 ) ) or -- The Azure Span
					( ( map.mapID == 2025 ) and ( continentMapID == 947 ) ) or -- Thaldraszus
					( ( map.mapID == 2151 ) and ( continentMapID == 947 ) ) or -- The Forbidden Reach
					( map.mapID == 1978 ) or -- Dragon Isles
					-- HandyNotes pins are incorrectly scaled for Khaz Algar and therefore Azeroth too
					-- So I had to do them manually
					( map.mapID == 2255 ) or -- Azj-Kahet
					( map.mapID == 2216 ) or -- City of Threads / Azj-Kahet - Lower
					( map.mapID == 2213 ) or -- City of Threads / Azj-Kahet
					( map.mapID == 2215 ) or -- Hallowfall
					( map.mapID == 2248 ) or -- Isle of Dorn
					( map.mapID == 2339 ) or -- City of Dornogal
					( map.mapID == 2214 ) or -- The Ringing Deeps
					( map.mapID == 2274 ) then -- Khaz Algar
				else
					for coord, v in next, ns.points[ map.mapID ] do
						if v.noContinent == nil then
							local mx, my = HandyNotes:getXY( coord )
							local cx, cy = HereBeDragons:TranslateZoneCoordinates( mx, my, map.mapID, continentMapID )
							if cx and cy then
								ns.points[ continentMapID ] = ns.points[ continentMapID ] or {}
								ns.points[ continentMapID ][ HandyNotes:getCoord( cx, cy ) ] = v
							end
						end
					end
				end
			end
		end
	end
	HandyNotes:RegisterPluginDB( "HallowsEnd", pluginHandler, ns.options )
	ns.db = LibStub( "AceDB-3.0" ):New( "HandyNotes_HallowsEndDB", ns.defaults, "Default" ).profile
	pluginHandler:Refresh()
end

function pluginHandler:Refresh()
	if GetTime() > ( ns.delay or 0 ) then
		ns.delay = nil
		self:SendMessage( "HandyNotes_NotifyUpdate", "HallowsEnd" )
	end
end

LibStub( "AceAddon-3.0" ):NewAddon( pluginHandler, "HandyNotes_HallowsEndDB", "AceEvent-3.0" )

-- ---------------------------------------------------------------------------------------------------------------------------------

ns.eventFrame = CreateFrame( "Frame" )

local function OnUpdate()
	if GetTime() > ( ns.saveTime or 0 ) then
		ns.saveTime = GetTime() + 5
		pluginHandler:Refresh()
	end
end

ns.eventFrame:SetScript( "OnUpdate", OnUpdate )

local function OnEventHandler( self, event, ... )
	if ( event == "PLAYER_ENTERING_WORLD" ) or ( event == "PLAYER_LEAVING_WORLD" ) then
		ns.delay = GetTime() + 60 -- Some arbitrary large amount
	elseif ( event == "SPELLS_CHANGED" ) then
		ns.delay = GetTime() + 5 -- Allow a 5 second safety buffer before we resume refreshes
	end
end

ns.eventFrame:RegisterEvent( "PLAYER_ENTERING_WORLD" )
ns.eventFrame:RegisterEvent( "PLAYER_LEAVING_WORLD" )
ns.eventFrame:RegisterEvent( "SPELLS_CHANGED" )
ns.eventFrame:SetScript( "OnEvent", OnEventHandler )

-- ---------------------------------------------------------------------------------------------------------------------------------

SLASH_HallowsEnd1, SLASH_HallowsEnd2, SLASH_HallowsEnd3 = "/he", "/hend", "/hallows"

local function Slash( options )
	Settings.OpenToCategory( "HandyNotes" )
	LibStub( "AceConfigDialog-3.0" ):SelectGroup( "HandyNotes", "plugins", "HallowsEnd" )
	if ( ns.version >= 100000 ) then
		print( ns.colour.prefix ..ns.L[ "Hallows End" ] ..": " ..ns.colour.highlight ..ns.L[ "TryMinimapMenu" ] )
	end
end

SlashCmdList[ "HallowsEnd" ] = function( options ) Slash( options ) end