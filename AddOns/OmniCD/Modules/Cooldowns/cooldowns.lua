local E, L, C = select(2, ...):unpack()

local CD = E["Cooldowns"]
local UnitAuraTooltip = CreateFrame("GameTooltip", "OmniCDUnitAuraTooltip", UIParent, "GameTooltipTemplate")
UnitAuraTooltip:SetOwner(UIParent, "ANCHOR_NONE")

local strmatch = string.match
local GetTime = GetTime
local band = bit.band
local Me = COMBATLOG_OBJECT_AFFILIATION_MINE
local Player = COMBATLOG_OBJECT_TYPE_PLAYER
local GuardianTotem = COMBATLOG_OBJECT_TYPE_GUARDIAN
local CombatLogGetCurrentEventInfo = CombatLogGetCurrentEventInfo
local P = E["Party"]
local groupInfo = P.groupInfo
local spellBars = P.spellBars
local enabledLT = P.enabledLT
local RemoveHighlight = P.RemoveHighlight
local highlightLT = E.highlightLT
local modifierLT = E.modifierLT
local dispels = E.dispels
local enabledSpells = E.enabledSpells
local mergedSpells = E.mergedSpells
local commandPet = E.commandPet
local sharedCdWithTrinkets = E.sharedCdWithTrinkets
local cdResettingCast = E.cdResettingCast
local cdReducingCast = E.cdReducingCast
local cdReducingCastByAzerite = E.cdReducingCastByAzerite
local cdReducingPowerSpenders = E.cdReducingPowerSpenders
local cdStartingAuraApplied = E.cdStartingAuraApplied
local cdReducingTotemDamage = E.cdReducingTotemDamage
local cdReducingDamage = E.cdReducingDamage
local cdReducingCritDamage = E.cdReducingCritDamage
local cdReducingEnergize = E.cdReducingEnergize
local cdReducingInterrupts = E.cdReducingInterrupts
local cdDisablingAuraApplied = E.cdDisablingAuraApplied
local cdReducingAzeriteDamage = E.cdReducingAzeriteDamage
local essRank2 = E.essRank2
local BOOKTYPE_SPELLS = E.BOOKTYPE_SPELLS
local MyGUID = E.MyGUID
local EMFH = 59752
local APOTHEOSIS = 200183
local AURA_TRUE_BEARING = 193359
local GUARDIAN_SPIRIT = 47788
local CAP_TOTEM = 192058
local TRICKS_OT_TRADE = 57934
local REAPING_FLAMES = 310690
local INEFFABLE_TRUTH = 316801
local GLIMPSE_OF_CLARITY = 315573
local SHADOWSTEP = 36554

local isPlayerHidden
local isHighlightEnabled

local totemGUIDS = {}

local function GetBuffTooltipText(unit, spellID)
	for i = 1, 40 do
		local _,_,_,_,_,_,_,_,_, id = UnitBuff(unit, i)
		if not id then return end
		if id == spellID then
			UnitAuraTooltip:SetUnitBuff(unit, i)
			return OmniCDUnitAuraTooltipTextLeft2:GetText()
		end
	end
end

local registeredEvents = setmetatable({}, {__index = function(t, k)
	t[k] = {}
	return t[k]
end})

function CD:RefreshCD()
	isPlayerHidden = P.hideMe
	isHighlightEnabled = E.db.highlight.glowBuffs
end

local removeTB = function(srcGUID)
	local info = groupInfo[srcGUID]
	if info then
		info.isTBActive = nil
		info.isTBRemoved = nil
	end
end

local spenderProcs = {
	[223817] = { 12, true }, -- { proc duration, true(all spender) or LUT(specific spenders) }
}

local function UpdateCdBySpender(info, spellID, spender, guid)
	local procID = info.freeSpenderProc
	if procID and spenderProcs[procID] then
		local ignore = spenderProcs[procID][2] == true or spenderProcs[procID][2][spender]
		if ignore then
			return
		end
	end

	local icon = info.spellIcons[spellID]
	if icon and icon.active then
		local reducedTime = P:IsTalent(spender.talent, guid) and P:GetValueByType(spender.duration, guid) or spender.base
		if reducedTime then
			if info.isTBActive then
				reducedTime = reducedTime * 2
			end

			P:UpdateCooldown(icon, reducedTime)
		end
	end
end

local function ProcessSpell(spellID, guid)
	local info = groupInfo[guid]

	if not info then
		return
	end

	local merged = mergedSpells[spellID]
	if merged and type(merged) == "table" then
		for i = 1, #merged do
			local k = merged[i]
			local icon = info.spellIcons[k]
			if icon then
				P:StartCooldown(icon, icon.duration)

				break
			end
		end

		return
	end

	local icon = info.spellIcons[spellID] or info.spellIcons[merged]
	if icon then
		if enabledSpells[spellID] then
			info[spellID] = true
			icon.cooldown:Clear()
			icon.icon:SetVertexColor(0.4, 0.4, 0.4) -- icon texture (icon frame reserved for options)

			return
		end

		local commandx = commandPet[spellID]
		if commandx then
			icon.icon:SetTexture(commandx[2])
			P:StartCooldown(icon, commandx[1])

			return
		end

		P:StartCooldown(icon, icon.duration)
	end

	local shared = sharedCdWithTrinkets[spellID]
	if shared then
		for i = 1, #shared do
			local k = shared[i]
			local icon = info.spellIcons[k]
			if icon then
				local active = icon.active and info.active and info.active[k]
				local sharedCD = (spellID == EMFH or k == EMFH) and 90 or 30
				if not active or (active.startTime + active.duration - GetTime() < sharedCD) then
					P:StartCooldown(icon, sharedCD)
				end

				break
			end
		end

		return
	end

	local reset = cdResettingCast[spellID]
	if reset then
		if type(reset) == "table" then
			for i = 1, #reset do
				local k = reset[i]
				local icon = info.spellIcons[k]
				if icon and icon.active then
					P:ResetCooldown(icon)
				end
			end
		else
			local icon = info.spellIcons[reset]
			if icon and icon.active then
				P:ResetCooldown(icon)
			end
		end

		return
	end

	local azerite = cdReducingCastByAzerite[spellID]
	if azerite then
		if P:IsEquipped(azerite.azerite, guid) then
			for k, reducedTime in pairs(azerite.target) do
				local icon = info.spellIcons[k]
				if icon then
					if icon.active then
						P:UpdateCooldown(icon, reducedTime)
					end

					break
				end
			end
		end

		return
	end

	local reducer = cdReducingCast[spellID]
	if reducer then
		if type(reducer.target) == "table" then
			for k, reducedTime in pairs(reducer.target) do
				local icon = info.spellIcons[k]
				if icon and icon.active and (k == reducer.default or P:IsTalent(reducer.talent, guid)) then
					if info.isApotheosisActive then
						reducedTime = reducedTime * 4
					end

					P:UpdateCooldown(icon, reducedTime)
				end
			end
		else
			local k = reducer.target
			local icon = info.spellIcons[k]
			if icon and icon.active then
				local reducedTime = P:IsTalent(reducer.talent, guid) and reducer.duration or reducer.base
				if reducedTime then
					if info.isApotheosisActive then
						reducedTime = reducedTime * 4
					end

					P:UpdateCooldown(icon, reducedTime)
				end
			end
		end
	end

	local spender = cdReducingPowerSpenders[spellID]
	if spender then
		if P.disableSync or (guid ~= MyGUID and not E.Comms.syncGUIDS[guid]) then
			if type(spender.target) == "table" then
				for k, v in pairs(spender.target) do
					if v == 1 or not P:IsTalent(k, guid) then -- Avatar as base spell
						UpdateCdBySpender(info, k, spender, guid)
					end
				end
			else
				UpdateCdBySpender(info, spender.target, spender, guid)
			end
		end

		if guid == MyGUID and icon and spellID == 199804 then
			local reducedTime = E.Comms.spentPower
			if reducedTime then
				if info.isTBActive then
					reducedTime = reducedTime * 2
				end

				P:UpdateCooldown(icon, reducedTime)
			end
		end

		if info.isTBRemoved then
			E.TimerAfter(.5, removeTB, guid)
		end
	end
end

local function RemoveHighlightByCLEU(info, srcGUID, spellID, destGUID)
	if not isHighlightEnabled or destGUID ~= srcGUID then return end

	local icon = info.glow and info.glow[spellID]
	if icon then
		RemoveHighlight(P, icon)
	end
end

for k in pairs(highlightLT) do
	registeredEvents.SPELL_AURA_REMOVED[k] = RemoveHighlightByCLEU
end

local function StartPreActivatedCD(info, _, spellID)
	local icon = info.spellIcons[spellID]
	if icon then
		P:StartCooldown(icon, icon.duration)
		info[spellID] = nil
		icon.icon:SetVertexColor(1, 1, 1)
	end
end

for k in pairs(E.cdStartingAuraRemoved) do
	registeredEvents.SPELL_AURA_REMOVED[k] = StartPreActivatedCD
end

local function StartAuraCD(_, srcGUID, spellID)
	spellID = cdStartingAuraApplied[spellID]
	if enabledLT[spellID] then
		ProcessSpell(spellID, srcGUID)
	end
end

for k in pairs(cdStartingAuraApplied) do
	registeredEvents.SPELL_AURA_APPLIED[k] = StartAuraCD
end

local removeApotheosis = function(srcGUID)
	local info = groupInfo[srcGUID]
	if info and info.isApotheosisActive then
		local duration = P:GetBuffDuration(info.unit, APOTHEOSIS)
		if not duration then
			info.isApotheosisActive = nil

			RemoveHighlightByCLEU(info, srcGUID, spellID, destGUID)
		end
	end
end

registeredEvents.SPELL_AURA_APPLIED[APOTHEOSIS] = function(info, srcGUID)
	if enabledLT[APOTHEOSIS] then
		info.isApotheosisActive = true

		E.TimerAfter(20.1, removeApotheosis, srcGUID, spellID, destGUID)
	end
end

registeredEvents.SPELL_AURA_REMOVED[APOTHEOSIS] = function(info, srcGUID, spellID, destGUID)
	if enabledLT[APOTHEOSIS] and info.isApotheosisActive then
		info.isApotheosisActive = nil

		RemoveHighlightByCLEU(info, srcGUID, spellID, destGUID)
	end
end

local removeTrueBearing = function(srcGUID)
	local info = groupInfo[srcGUID]
	if info and info.isTBActive then
		local duration = P:GetBuffDuration(info.unit, AURA_TRUE_BEARING)
		if not duration then -- [50]
			info.isTBActive = nil
			info.isTBRemoved = nil
		end
	end
end

local addTrueBearing = function(srcGUID)
	local info = groupInfo[srcGUID]
	if info then
		info.isTBActive = true

		E.TimerAfter(46.1, removeTrueBearing, srcGUID)
	end
end

registeredEvents.SPELL_AURA_APPLIED[AURA_TRUE_BEARING] = function(info, srcGUID)
	info.isTBRemoved = nil -- [49]

	E.TimerAfter(.5, addTrueBearing, srcGUID)
end

registeredEvents.SPELL_AURA_REMOVED[AURA_TRUE_BEARING] = function(info)
	info.isTBRemoved = true
end

registeredEvents.SPELL_AURA_REMOVED[TRICKS_OT_TRADE] = function(info) -- [51]
	local icon = info.spellIcons[TRICKS_OT_TRADE] or info.spellIcons[221622]
	if icon then
		info[TRICKS_OT_TRADE] = nil
		icon.icon:SetVertexColor(1, 1, 1)
	end
end

local function StartTricksCD(info, _, spellID)
	spellID = spellID == 59628 and TRICKS_OT_TRADE or (spellID == 221630 and 221622)

	local icon = info.spellIcons[spellID]
	if icon then
		P:StartCooldown(icon, icon.duration)

		info[TRICKS_OT_TRADE] = nil
		icon.icon:SetVertexColor(1, 1, 1)
	end
end

registeredEvents.SPELL_AURA_APPLIED[59628] = StartTricksCD
registeredEvents.SPELL_AURA_APPLIED[221630] = StartTricksCD

local function ReduceCDbyCLEU(info, srcGUID, spellID, talentID, reducedTime, maxLimit, minLimit)
	local icon = info.spellIcons[spellID]
	if icon and icon.active and P:IsTalent(talentID, srcGUID) then
		local active = info.active and info.active[spellID]
		if active then
			if maxLimit then
				active.numHits = active.numHits + 1
				if active.numHits > maxLimit then return end
			elseif minLimit then
				active.numHits = active.numHits + 1
				if active.numHits ~= minLimit then return end
			end

			P:UpdateCooldown(icon, reducedTime)
		end
	end
end

registeredEvents.SPELL_SUMMON[CAP_TOTEM] = function(info, srcGUID, _, destGUID)
	local icon = info.spellIcons[CAP_TOTEM]
	if icon and P:IsTalent(265046, srcGUID) then
		totemGUIDS[destGUID] = srcGUID
	end
end

local function ReduceCdByDamage(info, srcGUID, spellID)
	local t = cdReducingDamage[spellID]
	spellID = t.target
	if enabledLT[spellID] then
		ReduceCDbyCLEU(info, srcGUID, spellID, t.talent, t.duration, nil, t.min)
	end
end

for k in pairs(cdReducingDamage) do
	registeredEvents.SPELL_DAMAGE[k] = ReduceCdByDamage
end

local function ReduceCdByCriticalHits(info, srcGUID, spellID, _, critical)
	if not critical then return end

	local t = cdReducingCritDamage[spellID]
	spellID = t.target
	if enabledLT[spellID] then
		ReduceCDbyCLEU(info, srcGUID, spellID, t.talent, t.duration)
	end
end

for k in pairs(cdReducingCritDamage) do
	registeredEvents.SPELL_DAMAGE[k] = ReduceCdByCriticalHits
end

local function ReduceCdByEnergize(info, srcGUID, spellID)
	local t = cdReducingEnergize[spellID]
	spellID = t.target
	if enabledLT[spellID] then
		ReduceCDbyCLEU(info, srcGUID, spellID, t.talent, t.duration)
	end
end

for k in pairs(cdReducingEnergize) do
	registeredEvents.SPELL_ENERGIZE[k] = ReduceCdByEnergize
end

local function ReduceCdByInterrupt(info, srcGUID, spellID)
	local t = cdReducingInterrupts[spellID]
	for k in pairs(t.target) do
		local icon = info.spellIcons[k]
		if icon and icon.active and P:IsTalent(t.talent, srcGUID) then
			P:UpdateCooldown(icon, t.duration)
		end
	end
end

for k in pairs(cdReducingInterrupts) do
	registeredEvents.SPELL_INTERRUPT[k] = ReduceCdByInterrupt
end

registeredEvents.SPELL_AURA_REMOVED[GUARDIAN_SPIRIT] = function(info, srcGUID, spellID, destGUID)
	local icon = info.spellIcons[GUARDIAN_SPIRIT]
	if icon and icon.active and P:IsTalent(200209, srcGUID) and not info.saved then
		P:StartCooldown(icon, 60)
	end
	info.saved = nil

	RemoveHighlightByCLEU(info, srcGUID, spellID, destGUID)
end

registeredEvents.SPELL_AURA_APPLIED[GUARDIAN_SPIRIT] = function(info)
	if enabledLT[GUARDIAN_SPIRIT] then
		info.saved = nil
	end
end

registeredEvents.SPELL_HEAL[48153] = function(info) -- [52]
	if enabledLT[GUARDIAN_SPIRIT] then
		info.saved = true
	end
end

local function ReduceEssMajorCdByUnifiedStrength(info)
	local essMajor = info.slotLT and info.slotLT.essMajor
	if essMajor then
		local icon = info.spellIcons[essMajor]
		if icon and icon.active then
			P:UpdateCooldown(icon, 1)
		end
	end
end

registeredEvents.SPELL_AURA_APPLIED[313643] = ReduceEssMajorCdByUnifiedStrength
registeredEvents.SPELL_AURA_REFRESH[313643] = ReduceEssMajorCdByUnifiedStrength

local function GetHealthPercentageByInfoUnit(unit, srcGUID, destGUID) -- [4]
	if not destGUID then return end

	local isPlayer = srcGUID == MyGUID
	local tunit = isPlayer and "target" or unit .. "target"
	local funit = isPlayer and "focus"
	local tguid = UnitGUID(tunit)
	local fguid = funit and UnitGUID(funit)

	local unitID = destGUID == tguid and tunit or (destGUID == fguid and funit)
	if unitID then
		return UnitHealth(unitID) / UnitHealthMax(unitID) * 100
	end
end

registeredEvents.SPELL_CAST_SUCCESS[REAPING_FLAMES] = function(info, srcGUID, _, destGUID) -- [5]
	local icon = info.spellIcons[REAPING_FLAMES]
	if icon and icon.active then
		local healthPercentage = GetHealthPercentageByInfoUnit(info.unit, srcGUID, destGUID)
		if healthPercentage and (healthPercentage < 20 or (healthPercentage > 80 and info.slots and essRank2[ info.slots[3] ])) then
			P:UpdateCooldown(icon, 30)
		end
	end
end

registeredEvents.SPELL_DAMAGE[REAPING_FLAMES] = function(info, srcGUID, _, destGUID) -- [6]
	local icon = info.spellIcons[REAPING_FLAMES]
	if icon and icon.active then
		if info.active and info.active[REAPING_FLAMES] and GetTime() - info.active[REAPING_FLAMES].startTime < 30 then
			local healthPercentage = GetHealthPercentageByInfoUnit(info.unit, srcGUID, destGUID)
			if healthPercentage and healthPercentage < 20  then
				P:UpdateCooldown(icon, 30)
			end
		end
	end
end

registeredEvents.SPELL_AURA_APPLIED[311202] = function(info) -- [7]
	local icon = info.spellIcons[REAPING_FLAMES]
	if icon then
		P:StartCooldown(icon, 5, nil, true)
	end
end

local function RemoveForbearanceCD(_,_, spellID, destGUID)
	if not E.db.icons.showForbearanceCounter then return end

	local info = groupInfo[destGUID]
	if not info then return end

	local t = cdDisablingAuraApplied[spellID]
	for k in pairs(t) do
		local icon = info.spellIcons[k]
		if icon and info[k] then
			info[k] = nil
			icon.icon:SetVertexColor(1, 1, 1)
		end
	end
end

local removeEnabledState = function(destGUID, k)
	local info = groupInfo[destGUID]
	if info then
		local icon = info.spellIcons[k]
		if icon and info[k] then
			info[k] = nil
			icon.icon:SetVertexColor(1, 1, 1)
		end
	end
end

local function StartForbearanceCD(_,_, spellID, destGUID)
	if not E.db.icons.showForbearanceCounter then return end

	local info = groupInfo[destGUID]
	if not info then return end

	local t = cdDisablingAuraApplied[spellID]
	for k in pairs(t) do
		local icon = info.spellIcons[k]
		if icon then
			local active = icon.active and info.active and info.active[k]
			local timeRemaining = active and (active.duration - GetTime() + active.startTime)
			if k == 642 then -- Self-limited without charges
				if not active then
					P:StartCooldown(icon, 30, nil, true)
				else
					if timeRemaining < 30 then
						P:UpdateCooldown(icon, timeRemaining - 30)
					end
				end
			else
				local charges = active and active.charges
				if not active or ( icon.maxcharges and charges and charges > 0 or timeRemaining < 30 ) then
					info[k] = true
					if not icon.overlay then
						icon.icon:SetVertexColor(0.4, 0.4, 0.4)
					end

					E.TimerAfter(30.1, removeEnabledState, destGUID, k)
				end
			end
		end
	end
end

for k in pairs(cdDisablingAuraApplied) do
	registeredEvents.SPELL_AURA_APPLIED[k] = StartForbearanceCD
	registeredEvents.SPELL_AURA_REMOVED[k] = RemoveForbearanceCD
end

local function UpdateCdRecoveryRate(info, modRate)
	local now = GetTime()
	for k, icon in pairs(info.spellIcons) do
		local active = icon.active and info.active and info.active[k]
		if active and (BOOKTYPE_SPELLS[icon.type] or BOOKTYPE_SPELLS[icon.spellID]) then
			local newTime = now * (1 - modRate) + active.startTime * modRate -- [8]
			local cd = active.duration * modRate
			if E.OmniCC then
				icon.cooldown:SetCooldown(0, 0)
			end
			icon.cooldown:SetCooldown(newTime, cd, modRate < 1 and modRate)

			active.startTime = newTime
			active.duration = cd
		end
	end
end

local function RemoveCdRecoveryRateByIneffableTruth(info)
	local modRate = info.ineffableTruth
	if modRate then
		UpdateCdRecoveryRate(info, 1 / modRate)
		info.ineffableTruth = nil
	end
end

local removeIneffableTruth = function(srcGUID, spellID)
	local info = groupInfo[srcGUID]
	if info and info.ineffableTruth then
		local duration = P:GetBuffDuration(info.unit, spellID)
		if not duration then
			RemoveCdRecoveryRateByIneffableTruth(info)
		end
	end
end

local function SetCdRecoveryRateByIneffableTruth(info, srcGUID, spellID)
	local modRate = info.ineffableTruth
	if not modRate then
		local ineffableTT = GetBuffTooltipText(info.unit, spellID)
		modRate = ineffableTT and strmatch(ineffableTT, "%d+")
		modRate = tonumber(modRate)
		if modRate and modRate >= 30 then
			modRate = 100 / (100 + modRate)
		else
			return
		end

		UpdateCdRecoveryRate(info, modRate)
		info.ineffableTruth = modRate
	end

	E.TimerAfter(10.1, removeIneffableTruth, srcGUID, spellID)
end

local UpdateCdRecoveryRateByIneffableTruth = function(info, srcGUID, spellID)
	SetCdRecoveryRateByIneffableTruth(info, srcGUID, spellID)
	E.TimerAfter(0.5, SetCdRecoveryRateByIneffableTruth, info, srcGUID, spellID) -- [30]
end

registeredEvents.SPELL_AURA_APPLIED[INEFFABLE_TRUTH] = UpdateCdRecoveryRateByIneffableTruth
registeredEvents.SPELL_AURA_REFRESH[INEFFABLE_TRUTH] = UpdateCdRecoveryRateByIneffableTruth
registeredEvents.SPELL_AURA_REMOVED[INEFFABLE_TRUTH] = RemoveCdRecoveryRateByIneffableTruth

local removeGlimpseOfClarity = function(srcGUID, spellID)
	local info = groupInfo[srcGUID]
	if info and info.glimpseOfClarity then
		local duration = P:GetBuffDuration(info.unit, spellID)
		if not duration then
			info.glimpseOfClarity = nil
		end
	end
end

local addGlimpseOfClarity = function(info, srcGUID, spellID)
	info.glimpseOfClarity = true
	E.TimerAfter(15.1, removeGlimpseOfClarity, srcGUID, spellID)
end

registeredEvents.SPELL_AURA_APPLIED[GLIMPSE_OF_CLARITY] = addGlimpseOfClarity
registeredEvents.SPELL_AURA_REFRESH[GLIMPSE_OF_CLARITY] = addGlimpseOfClarity
registeredEvents.SPELL_AURA_REMOVED[GLIMPSE_OF_CLARITY] = function(info) info.glimpseOfClarity = nil end

registeredEvents.SPELL_CAST_SUCCESS[SHADOWSTEP] = function(info, srcGUID, _, destGUID, _, destFlags)
	local icon = info.spellIcons[SHADOWSTEP]
	if icon and icon.active then
		local active = info.active and info.active[SHADOWSTEP]
		if active and info.talentLT and info.talentLT[197899] and band(destFlags, COMBATLOG_OBJECT_REACTION_FRIENDLY) > 0 then
			P:UpdateCooldown(icon, active.duration / 2 )
		end
	end
end

local function ReduceCdByAzeriteDamage(info, _, spellID)
	local t = cdReducingAzeriteDamage[spellID]
	local target = t.target
	if type(target) == "table" then
		for _, v in pairs(target) do
			local icon = info.spellIcons[v]
			if icon and icon.active then
				P:UpdateCooldown(icon, t.duration)
			end
		end
	else
		local icon = info.spellIcons[target]
		if icon and icon.active then
			P:UpdateCooldown(icon, t.duration)
		end
	end
end

for k in pairs(cdReducingAzeriteDamage) do
	registeredEvents.SPELL_DAMAGE[k] = ReduceCdByAzeriteDamage
end

-- [9]

local timeoutSpenderProc = function(srcGUID, spellID)
	local info = groupInfo[srcGUID]
	if info and info.freeSpenderProc then
		local duration = P:GetBuffDuration(info.unit, spellID)
		if not duration then
			info.freeSpenderProc = nil
		end
	end
end

for k, v in pairs(spenderProcs) do
	registeredEvents.SPELL_AURA_APPLIED[k] = function(info, srcGUID, spellID)
		info.freeSpenderProc = spellID
		E.TimerAfter(v[1], timeoutSpenderProc, srcGUID, spellID)
	end

	registeredEvents.SPELL_AURA_REMOVED[k] = function(info) info.freeSpenderProc = nil end
end

local function StartDispelCD(info, _, spellID)
	if enabledLT[spellID] then
		local icon = info.spellIcons[spellID]
		if icon then
			P:StartCooldown(icon, icon.duration)
		end
	end
end

for k in pairs(dispels) do
	registeredEvents.SPELL_DISPEL[k] = StartDispelCD
end

setmetatable(registeredEvents, nil)

function CD:RegisterRemoveHighlightByCLEU(spellID)
	E.highlightLT[spellID] = true

	if not registeredEvents.SPELL_AURA_REMOVED[spellID] then
		registeredEvents.SPELL_AURA_REMOVED[spellID] = RemoveHighlightByCLEU
	end
end

function CD:UNIT_SPELLCAST_SUCCEEDED(unit, _, spellID)
	local index = P:FindIndexByUnit(unit, true)
	if not index or (isPlayerHidden and index == groupInfo[MyGUID].index) then return end

	if (enabledLT[spellID] or modifierLT[spellID]) and not dispels[spellID] then
		ProcessSpell(spellID, spellBars[index].guid)
	end
end

function CD:COMBAT_LOG_EVENT_UNFILTERED()
	local _, event, _, srcGUID, _, srcFlags, _, destGUID, _, destFlags, _, spellID, _,_,_,_,_,_,_,_, critical = CombatLogGetCurrentEventInfo()

	if band(srcFlags, Me) > 0 and isPlayerHidden then return end

	if band(srcFlags, Player) > 0 then
		local info = groupInfo[srcGUID]
		if not info then return end

		local func = registeredEvents[event] and registeredEvents[event][spellID]
		if func then
			func(info, srcGUID, spellID, destGUID, critical, destFlags)
		end
	elseif band(srcFlags, GuardianTotem) > 0 then
		if event == "SPELL_AURA_APPLIED" and spellID == 118905 then
			srcGUID = totemGUIDS[srcGUID]
			if srcGUID then
				local t = cdReducingTotemDamage[spellID]
				ReduceCDbyCLEU(groupInfo[srcGUID], srcGUID, t.target, t.talent, t.duration, t.max)
			end
		end
	end
end

CD.totemGUIDS = totemGUIDS
