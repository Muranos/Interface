local TooltipInfo, TooltipProcessor, TooltipUtil = C_TooltipInfo, TooltipDataProcessor, TooltipUtil

local function CheckForbidden(tooltip)
    return tooltip:IsForbidden()
end

local function AddLine(tooltip, id, type)
    if not tooltip and id then return end

    tooltip:AddLine(" ")
    tooltip:AddLine(type.."ID: ".."|cffFFFFCF"..id.."|r", 1, 1, 1)
end

local function ItemID(tooltip, data)
    if CheckForbidden(tooltip) then return end

    -- Get id
    local itemID = data.id
    -- Add line
    AddLine(tooltip, itemID, "Item")
end

local function SpellID(tooltip, data, newHook)
    if CheckForbidden(tooltip) then return end

    -- Get id
    local spellID = data.id
    -- Add line
    AddLine(tooltip, spellID, "Spell")
end

local function AuraID(tooltip, data)
    if CheckForbidden(tooltip) then return end

    -- Get id
    local auraID = data.id
    -- Add line
    AddLine(tooltip, auraID, "Aura")
end

local function UnitID(tooltip, data)
    if CheckForbidden(tooltip) then return end

    -- Assign values otherwise data will be nil
    TooltipUtil.SurfaceArgs(data)
    -- Get guid
    local unitUID = data.guid
    -- Extract id from guid
    local unitID = select(6, strsplit("-", unitUID))
    -- Check if id exists, this will be false on players
    if not unitID then return end
    -- Add line
    AddLine(tooltip, unitID, "Unit")
end

-- Register callbacks
if TooltipDataProcessor then
    TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, ItemID)
    TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Spell, SpellID)
    TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.UnitAura, AuraID)
    TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Unit, UnitID)
end