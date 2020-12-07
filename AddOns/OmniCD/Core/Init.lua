local AddOnName, NS = ...

local AddOn = LibStub("AceAddon-3.0"):NewAddon(AddOnName)
AddOn.L = LibStub("AceLocale-3.0"):GetLocale(AddOnName)
AddOn.defaults = { global = {}, profile = { modules = {["*"] = true} } }

NS[1] = AddOn
NS[2] = AddOn.L
NS[3] = AddOn.defaults.profile
NS[4] = AddOn.defaults.global

function NS:unpack()
	return self[1], self[2], self[3], self[4]
end

function AddOn:SetNumPixels()
	local _, screenheight = GetPhysicalScreenSize()
	local uiUnitFactor = 768 / screenheight
	local uiScale = ElvUI and not ElvUI[1].global.general.AutoScale and ElvUI[1].global.general.UIScale or UIParent:GetScale()
	self.NumPixels = uiUnitFactor / uiScale
end

NS[1]:SetNumPixels()
NS[1].userGUID = UnitGUID("player")
NS[1].userName = UnitName("player")
NS[1].userRealm = GetRealmName()
NS[1].userNameWithRealm = NS[1].userName .. "-" .. NS[1].userRealm
NS[1].userClass = select(2, UnitClass("player"))
NS[1].userRaceID = select(3, UnitRace("player"))
NS[1].userLevel = UnitLevel("player")
NS[1].userClassHexColor = "|c" .. select(4, GetClassColor(NS[1].userClass))
NS[1].AddOn = AddOnName
NS[1].Version = GetAddOnMetadata(AddOnName, "Version")
NS[1].Author = GetAddOnMetadata(AddOnName, "Author")
NS[1].Notes = GetAddOnMetadata(AddOnName, "Notes")
NS[1].License = GetAddOnMetadata(AddOnName, "X-License")
NS[1].WoWPatch, NS[1].WoWBuild, NS[1].WoWPatchReleaseDate, NS[1].TocVersion = GetBuildInfo()
NS[1].LoginMessage = NS[1].userClassHexColor .. AddOnName .. " v" .. NS[1].Version .. "|r - /oc"

OmniCD = NS
