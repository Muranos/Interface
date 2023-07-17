--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Blight of Galakrond", 2579, 2535)
if not mod then return end
mod:RegisterEnableMob(
	198997, -- Blight of Galakrond
	201792, -- Ahnzon
	201790, -- Loszkeleth
	201788  -- Dazhak
)
mod:SetEncounterID(2668)
mod:SetRespawnTime(30)
mod:SetStage(1)

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		-- General
		"stages",
		-- Blight of Galakrond
		406886, -- Corrosive Infusion
		{407406, "SAY", "SAY_COUNTDOWN"}, -- Corrosion
		418346, -- Corrupted Mind
		407159, -- Blight Reclamation
		407147, -- Blight Seep
		-- Ahnzon
		407978, -- Necrotic Winds
		-- Loszkeleth
		{408029, "SAY", "DISPEL"}, -- Necrofrost
		-- Dazhak
		{408141, "SAY"}, -- Incinerating Blightbreath
	}, {
		["stages"] = CL.general,
		[406886] = -26547, -- Blight of Galakrond
		[407978] = -26556, -- Ahnzon
		[408029] = -26557, -- Loszkeleth
		[408141] = -26558, -- Dazhak
	}
end

function mod:OnBossEnable()
	-- Stages
	self:Log("SPELL_AURA_APPLIED", "MalignantTransferal", 415097, 415114) -- Stage 2, Stage 3

	-- Blight of Galakrond
	self:Log("SPELL_CAST_START", "CorrosiveInfusion", 406886)
	self:Log("SPELL_AURA_APPLIED", "CorrosionApplied", 407406)
	self:Log("SPELL_AURA_REMOVED", "CorrosionRemoved", 407406)
	self:Log("SPELL_AURA_APPLIED", "CorruptedMindApplied", 418346)
	self:Log("SPELL_CAST_START", "BlightReclamation", 407159)
	self:Log("SPELL_AURA_APPLIED", "BlightSeepDamage", 407147)

	-- Ahnzon
	self:Log("SPELL_CAST_SUCCESS", "NecroticWinds", 407978)

	-- Loszkeleth
	self:Log("SPELL_CAST_START", "Necrofrost", 408029)
	self:Log("SPELL_AURA_APPLIED", "NecrofrostApplied", 408084)

	-- Dazhak
	self:Log("SPELL_CAST_START", "IncineratingBlightbreath", 408141)
end

function mod:OnEngage()
	self:SetStage(1)
	self:CDBar(406886, 4.9) -- Corrosive Infusion
	self:CDBar(407159, 14.6) -- Blight Reclamation
end

--------------------------------------------------------------------------------
-- Event Handlers
--

-- Stages

function mod:MalignantTransferal(args)
	if args.spellId == 415097 then -- Stage 2
		self:SetStage(2)
		self:Message("stages", "cyan", CL.percent:format(80, CL.stage:format(2)), args.spellId)
		self:PlaySound("stages", "long")
		-- TODO boss moves to a specific location before transforming, is it better to
		-- use StopBar here and trigger these timers off something else?
		self:CDBar(407159, 9.7) -- Blight Reclamation
		self:CDBar(406886, 18.1) -- Corrosive Infusion
		self:CDBar(407978, 27.8) -- Necrotic Winds
	else -- 415114, Stage 3
		self:SetStage(3)
		self:Message("stages", "cyan", CL.percent:format(50, CL.stage:format(3)), args.spellId)
		self:PlaySound("stages", "long")
		self:StopBar(407978) -- Necrotic Winds
		self:CDBar(407159, 12.4) -- Blight Reclamation
		self:CDBar(408141, 17.2) -- Incinerating Blightbreath
		self:CDBar(406886, 24.2) -- Corrosive Infusion
		self:CDBar(408029, 41.2) -- Necrofrost
	end
end

-- Blight of Galakrond

function mod:CorrosiveInfusion(args)
	self:Message(args.spellId, "orange")
	self:PlaySound(args.spellId, "alert")
	if self:GetStage() == 1 then
		self:CDBar(args.spellId, 15.7)
	elseif self:GetStage() == 2 then
		self:CDBar(args.spellId, 31.6)
	else -- Stage 3
		self:CDBar(args.spellId, 32.8)
	end
end

function mod:CorrosionApplied(args)
	-- TODO icon on corrosion player?
	self:TargetMessage(args.spellId, "red", args.destName)
	self:PlaySound(args.spellId, "info", nil, args.destName)
	if self:Mythic() then
		self:TargetBar(args.spellId, 12, args.destName)
	end
	if self:Me(args.destGUID) then
		self:Say(args.spellId)
		if self:Mythic() then
			self:SayCountdown(args.spellId, 12)
		end
	end
end

function mod:CorrosionRemoved(args)
	if self:Mythic() then
		self:StopBar(args.spellId, args.destName)
		if self:Me(args.destGUID) then
			self:CancelSayCountdown(args.spellId)
		end
	end
end

function mod:CorruptedMindApplied(args)
	-- 20 second mind control, no way to break it
	self:TargetMessage(args.spellId, "yellow", args.destName)
	self:PlaySound(args.spellId, "warning", nil, args.destName)
end

function mod:BlightReclamation(args)
	self:Message(args.spellId, "purple")
	self:PlaySound(args.spellId, "alarm")
	-- TODO these need to be revisited
	if self:GetStage() == 1 then
		self:CDBar(args.spellId, 15.7)
	elseif self:GetStage() == 2 then
		self:CDBar(args.spellId, 31.6)
	else -- Stage 3
		self:CDBar(args.spellId, 32.7)
	end
end

function mod:BlightSeepDamage(args)
	if self:Me(args.destGUID) then
		self:PersonalMessage(args.spellId, "underyou")
		self:PlaySound(args.spellId, "underyou")
	end
end

-- Ahnzon

function mod:NecroticWinds(args)
	self:Message(args.spellId, "yellow")
	self:PlaySound(args.spellId, "long")
	self:CDBar(args.spellId, 31.6)
end

-- Loszkeleth

do
	local function printTarget(self, name, guid)
		self:TargetMessage(408029, "yellow", name, CL.casting:format(self:SpellName(408029)))
		self:PlaySound(408029, "alert", nil, name)
	end

	function mod:Necrofrost(args)
		self:GetBossTarget(printTarget, 0.3, args.sourceGUID)
		-- pull:133.9, 19.4, 42.5
		self:CDBar(args.spellId, 19.4)
	end
end

function mod:NecrofrostApplied(args)
	if self:Dispeller("movement", nil, 408029) then
		-- can be dispelled by movement dispellers, so alert on application
		self:TargetMessage(408029, "cyan", args.destName)
		self:PlaySound(408029, "info", nil, args.destName)
	end
	if self:Me(args.destGUID) then
		self:Say(408029)
	end
end

-- Dazhak

function mod:IncineratingBlightbreath(args)
	-- can't use GetBossTarget, Dazhak targets a player ~1s before the cast and detargets them as the cast starts
	local name = self:UnitName("boss2target")
	local guid = self:UnitGUID("boss2target")
	if name then
		self:TargetMessage(args.spellId, "orange", name)
		self:PlaySound(args.spellId, "alarm", nil, name)
	else
		-- just in case?
		self:Message(args.spellId, "orange")
		self:PlaySound(args.spellId, "alarm")
	end
	if self:Me(guid) then
		self:Say(args.spellId)
	end
	-- TODO pattern? pull:227.2, 18.2, 14.7, 16.9, 15.5, 18.5, 14.4
	-- pull:126.0, 17.6, 18.3, 26.3
	self:CDBar(args.spellId, 14.4)
end
