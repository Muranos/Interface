--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Dawn of the Infinite Trash", 2579)
if not mod then return end
mod.displayName = CL.trash
mod:RegisterEnableMob(
	------ Galakrond's Fall ------
	205384, -- Infinite Chronoweaver
	205408, -- Infinite Timeslicer
	205435, -- Epoch Ripper
	206140, -- Coalesced Time
	206065, -- Interval
	206066, -- Timestream Leech
	199749, -- Timestream Anomaly
	206214, -- Infinite Infiltrator
	205804, -- Risen Dragon

	------ Murozond's Rise ------
	201223, -- Infinite Twilight Magus
	205158, -- Spurlok, Timesworn Sentinel
	205152, -- Lerai, Timesworn Maiden
	201222, -- Valow, Timesworn Keeper
	199748, -- Timeline Marauder
	208438, -- Infinite Saboteur
	206230, -- Infinite Diversionist
	208698, -- Infinite Riftmage
	206070, -- Chronaxie
	203861, -- Horde Destroyer
	208208, -- Alliance Destroyer
	204206, -- Horde Farseer
	-- TODO Alliance equivalent to Horde Farseer
	207969, -- Horde Raider
	-- TODO Alliance equivalent to Horde Raider
	205337 -- Infinite Timebender
)

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:GetLocale()
if L then
	------ Galakrond's Fall ------
	L.infinite_chronoweaver = "Infinite Chronoweaver"
	L.infinite_timeslicer = "Infinite Timeslicer"
	L.epoch_ripper = "Epoch Ripper"
	L.coalesced_time = "Coalesced Time"
	L.interval = "Interval"
	L.timestream_leech = "Timestream Leech"
	L.timestream_anomaly = "Timestream Anomaly"
	L.infinite_infiltrator = "Infinite Infiltrator"
	L.risen_dragon = "Risen Dragon"

	L.iridikron_warmup_trigger = "So the Titans' puppets have come to face me."

	------ Murozond's Rise ------
	L.infinite_twilight_magus = "Infinite Twilight Magus"
	L.spurlok = "Spurlok, Timesworn Sentinel"
	L.lerai = "Lerai, Timesworn Maiden"
	L.valow = "Valow, Timesworn Keeper"
	L.timeline_marauder = "Timeline Marauder"
	L.infinite_saboteur = "Infinite Saboteur"
	L.infinite_riftmage = "Infinite Riftmage"
	L.chronaxie = "Chronaxie"
	L.horde_destroyer = "Horde Destroyer"
	L.alliance_destroyer = "Alliance Destroyer"
	L.horde_farseer = "Horde Farseer" -- TODO alliance version
	L.horde_raider = "Horde Raider" -- TODO alliance version
	L.infinite_timebender = "Infinite Timebender"
end

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		------ Galakrond's Fall ------
		-- Infinite Chronoweaver
		411994, -- Chronomelt
		-- Infinite Timeslicer
		{412012, "DISPEL"}, -- Temposlice
		-- Epoch Ripper
		412063, -- Timerip
		-- Coalesced Time
		{415769, "SAY"}, -- Chronoburst
		415770, -- Infinite Bolt Volley
		-- Interval
		415773, -- Temporal Detonation
		-- Timestream Leech
		415437, -- Enervate
		-- Timestream Anomaly
		413529, -- Untwist
		{413544, "TANK_HEALER", "DISPEL"}, -- Bloom
		-- Infinite Infiltrator
		413621, -- Timeless Curse
		413622, -- Infinite Fury
		-- Risen Dragon
		412806, -- Blight Spew

		------ Murozond's Rise ------
		-- Infinite Twilight Magus
		413607, -- Corroding Volley
		-- Spurlok, Timesworn Sentinel
		412215, -- Shrouding Sandstorm
		412922, -- Binding Grasp
		-- Lerai, Timesworn Maiden
		412129, -- Orb of Contemplation
		-- Valow, Timesworn Keeper
		412136, -- Multiversal Fist
		413024, -- Titanic Bulwark
		-- Timeline Marauder
		417481, -- Displace Chronosequence
		-- Infinite Saboteur
		419351, -- Bronze Exhalation
		-- Infinite Riftmage
		418200, -- Infinite Burn
		-- Chronaxie
		419516, -- Chronal Eruption
		419511, -- Temporal Link
		-- Horde Destroyer
		407535, -- Deploy Goblin Sappers
		407205, -- Volatile Mortar
		-- Alliance Destroyer
		-- TODO Deploy Dwarven Bombers
		-- TODO mortar?
		-- Horde Farseer
		407891, -- Healing Wave
		-- TODO alliance version of Horde Farseer
		-- Horde Raider
		407124, -- Rallying Shout
		407125, -- Sundering Slam
		-- TODO alliance version of Horde Raider
		-- Infinite Timebender
		412378, -- Dizzying Sands
	}, {
		------ Galakrond's Fall ------
		[411994] = L.infinite_chronoweaver,
		[412012] = L.infinite_timeslicer,
		[412063] = L.epoch_ripper,
		[415769] = L.coalesced_time,
		[415773] = L.interval,
		[415437] = L.timestream_leech,
		[413529] = L.timestream_anomaly,
		[413621] = L.infinite_infiltrator,
		[412806] = L.risen_dragon,

		------ Murozond's Rise ------
		[413607] = L.infinite_twilight_magus,
		[412215] = L.spurlok,
		[412129] = L.lerai,
		[412136] = L.valow,
		[417481] = L.timeline_marauder,
		[419351] = L.infinite_saboteur,
		[418200] = L.infinite_riftmage,
		[419516] = L.chronaxie,
		[407535] = L.horde_destroyer,
		-- TODO [?] = L.alliance_destroyer,
		[407891] = L.horde_farseer,
		[407124] = L.horde_raider,
		[412378] = L.infinite_timebender,
	}
end

function mod:OnBossEnable()
	-- Warmups
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")

	------ Galakrond's Fall ------

	-- Infinite Chronoweaver
	self:Log("SPELL_CAST_SUCCESS", "Chronomelt", 411994)

	-- Infinite Timeslicer
	self:Log("SPELL_AURA_APPLIED", "Temposlice", 412012)

	-- Epoch Ripper
	self:Log("SPELL_AURA_APPLIED", "Timerip", 412063)

	-- Coalesced Time
	self:Log("SPELL_AURA_APPLIED", "ChronoburstApplied", 415554)
	self:Log("SPELL_CAST_START", "InfiniteBoltVolley", 415770)

	-- Interval
	self:Log("SPELL_CAST_START", "TemporalDetonation", 415773)

	-- Timestream Leech
	self:Log("SPELL_CAST_START", "Enervate", 415437)

	-- Timestream Anomaly
	self:Log("SPELL_CAST_START", "Untwist", 413529)
	self:Log("SPELL_CAST_START", "Bloom", 413544)
	self:Log("SPELL_AURA_APPLIED", "BloomApplied", 413547)

	-- Infinite Infiltrator
	self:Log("SPELL_CAST_SUCCESS", "TimelessCurse", 413621)
	self:Log("SPELL_CAST_START", "InfiniteFury", 413622)

	-- Risen Dragon
	self:Log("SPELL_CAST_START", "BlightSpew", 412806)

	------ Murozond's Rise ------

	-- Infinite Twilight Magus
	self:Log("SPELL_CAST_START", "CorrodingVolley", 413607)

	-- Spurlok, Timesworn Sentinel
	self:Log("SPELL_CAST_START", "ShroudingSandstorm", 412215)
	self:Log("SPELL_CAST_START", "BindingGrasp", 412922)

	-- Lerai, Timesworn Maiden
	self:Log("SPELL_CAST_START", "OrbOfContemplation", 412129)

	-- Valow, Timesworn Keeper
	self:Log("SPELL_CAST_START", "MultiversalFist", 412136)
	self:Log("SPELL_CAST_START", "TitanicBulwark", 413024)

	-- Tyr
	self:Log("SPELL_AURA_REMOVED", "PonderingTheOathstoneRemoved", 413595)

	-- Timeline Marauder
	self:Log("SPELL_CAST_START", "DisplaceChronosequence", 417481)

	-- Infinite Saboteur
	self:Log("SPELL_CAST_START", "BronzeExhalation", 419351)

	-- Infinite Riftmage
	self:Log("SPELL_CAST_START", "InfiniteBurn", 418200)

	-- Chronaxie
	self:Log("SPELL_CAST_START", "ChronalEruption", 419516)
	self:Log("SPELL_AURA_APPLIED", "ChronalEruptionApplied", 419517)
	self:Log("SPELL_CAST_START", "TemporalLink", 419511)

	-- Horde Destroyer
	self:Log("SPELL_CAST_START", "DeployGoblinSappers", 407535)
	self:Log("SPELL_CAST_START", "VolatileMortar", 407205)

	-- Alliance Destroyer
	-- TODO

	-- Horde Farseer
	self:Log("SPELL_CAST_START", "HealingWave", 407891)

	-- Horde Raider
	self:Log("SPELL_CAST_START", "RallyingShout", 407124)
	self:Log("SPELL_CAST_START", "SunderingSlam", 407125)

	-- Infinite Timebender
	self:Log("SPELL_CAST_START", "DizzyingSands", 412378)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

-- Warmups

function mod:CHAT_MSG_MONSTER_YELL(_, msg)
	if msg:find(L.iridikron_warmup_trigger, nil, true) then
		-- Iridikron warmup
		local iridikronModule = BigWigs:GetBossModule("Iridikron the Stonescaled", true)
		if iridikronModule then
			iridikronModule:Enable()
			iridikronModule:Warmup()
		end
	end
end

------ Galakrond's Fall ------

-- Infinite Chronoweaver

function mod:Chronomelt(args)
	self:Message(args.spellId, "red", CL.casting:format(args.spellName))
	self:PlaySound(args.spellId, "alert")
	--self:NameplateCDBar(args.spellId, 15.8, args.sourceGUID)
end

-- Infinite Timeslicer

function mod:Temposlice(args)
	if not self:Player(args.destFlags) and (self:Tank() or self:Dispeller("magic", true, args.spellId)) then
		self:Message(args.spellId, "yellow", CL.on:format(args.spellName, args.destName))
		self:PlaySound(args.spellId, "alert")
		--self:NameplateCDBar(args.spellId, 31.5, args.sourceGUID)
	end
end

-- Epoch Ripper

function mod:Timerip(args)
	-- TODO get teleport target somehow? there is no SPELL_CAST_SUCCESS
	self:Message(args.spellId, "orange")
	self:PlaySound(args.spellId, "alarm")
	--self:NameplateCDBar(args.spellId, 34.0, args.sourceGUID)
end

-- Coalesced Time

--function mod:Chronoburst(args)
	--self:NameplateCDBar(415769, 15.8, args.sourceGUID)
--end

do
	local playerList = {}
	local prev = 0
	function mod:ChronoburstApplied(args)
		local t = args.time
		if t - prev > .5 then -- throttle alerts to .5s intervals
			prev = t
			playerList = {}
		end
		playerList[#playerList + 1] = args.destName
		-- TODO confirm max 2 targets
		self:TargetsMessage(415769, "yellow", playerList, 2, nil, nil, .5)
		self:PlaySound(415769, "alert", nil, playerList)
		if self:Me(args.destGUID) then
			self:Say(415769)
		end
	end
end

function mod:InfiniteBoltVolley(args)
	self:Message(args.spellId, "red", CL.casting:format(args.spellName))
	self:PlaySound(args.spellId, "alert")
	--self:NameplateCDBar(args.spellId, 7.3, args.sourceGUID)
end

-- Interval

do
	local prev = 0
	function mod:TemporalDetonation(args)
		local t = args.time
		if t - prev > 1 then
			prev = t
			self:Message(args.spellId, "orange")
			self:PlaySound(args.spellId, "alarm")
		end
	end
end

-- Timestream Leech

function mod:Enervate(args)
	self:Message(args.spellId, "red", CL.casting:format(args.spellName))
	self:PlaySound(args.spellId, "alert")
	--self:NameplateCDBar(args.spellId, 15.8, args.sourceGUID)
end

-- Timestream Anomaly

function mod:Untwist(args)
	self:Message(args.spellId, "orange")
	self:PlaySound(args.spellId, "alarm")
	--self:NameplateCDBar(args.spellId, 18.2, args.sourceGUID)
end

function mod:Bloom(args)
	if self:Tank() then
		self:Message(args.spellId, "purple")
		self:PlaySound(args.spellId, "alert")
	end
	--self:NameplateCDBar(args.spellId, 15.8, args.sourceGUID)
end

function mod:BloomApplied(args)
	if self:Dispeller("magic", nil, 413544) then
		self:TargetMessage(413544, "purple", args.destName)
		self:PlaySound(413544, "warning", nil, args.destName)
	end
end

-- Infinite Infiltrator

function mod:TimelessCurse(args)
	self:Message(args.spellId, "orange")
	self:PlaySound(args.spellId, "alarm")
	--self:NameplateCDBar(args.spellId, 20.6, args.sourceGUID)
end

function mod:InfiniteFury(args)
	self:Message(args.spellId, "yellow")
	self:PlaySound(args.spellId, "long")
	--self:NameplateCDBar(args.spellId, 20.6, args.sourceGUID)
end

-- Risen Dragon

function mod:BlightSpew(args)
	self:Message(args.spellId, "orange")
	self:PlaySound(args.spellId, "alarm")
	--self:NameplateCDBar(args.spellId, 13.3, args.sourceGUID)
end

------ Murozond's Rise ------

-- Infinite Twilight Magus

function mod:CorrodingVolley(args)
	self:Message(args.spellId, "red", CL.casting:format(args.spellName))
	self:PlaySound(args.spellId, "alert")
	--self:NameplateCDBar(args.spellId, 7.3, args.sourceGUID)
end

-- Spurlok, Timesworn Sentinel

function mod:ShroudingSandstorm(args)
	self:Message(args.spellId, "orange")
	self:PlaySound(args.spellId, "alert")
	--self:NameplateCDBar(args.spellId, 19.4, args.sourceGUID)
end

function mod:BindingGrasp(args)
	-- TODO get target? can be movement dispelled?
	-- it's interruptible so maybe doesn't matter?
	self:Message(args.spellId, "yellow")
	self:PlaySound(args.spellId, "alert")
	--self:NameplateCDBar(args.spellId, 19.4, args.sourceGUID)
end

-- Spurlok, Timesworn Sentinel

function mod:OrbOfContemplation(args)
	-- TODO get target?
	self:Message(args.spellId, "orange")
	self:PlaySound(args.spellId, "alarm")
	--self:NameplateCDBar(args.spellId, 13.4, args.sourceGUID)
end

-- Valow, Timesworn Keeper

function mod:MultiversalFist(args)
	self:Message(args.spellId, "orange")
	self:PlaySound(args.spellId, "alarm")
	--self:NameplateCDBar(args.spellId, 15.8, args.sourceGUID)
end

function mod:TitanicBulwark(args)
	self:Message(args.spellId, "yellow")
	self:PlaySound(args.spellId, "info")
	--self:NameplateCDBar(args.spellId, 26.7, args.sourceGUID)
end

-- Tyr

function mod:PonderingTheOathstoneRemoved(args)
	-- Tyr warmup
	local tyrModule = BigWigs:GetBossModule("Tyr, the Infinite Keeper", true)
	if tyrModule then
		tyrModule:Enable()
		tyrModule:Warmup()
	end
end

-- Timeline Marauder

function mod:DisplaceChronosequence(args)
	self:Message(args.spellId, "red", CL.casting:format(args.spellName))
	self:PlaySound(args.spellId, "alert")
	--self:NameplateCDBar(args.spellId, 15.8, args.sourceGUID)
end

-- Infinite Saboteur

function mod:BronzeExhalation(args)
	self:Message(args.spellId, "orange")
	self:PlaySound(args.spellId, "alarm")
	--self:NameplateCDBar(args.spellId, 18.2, args.sourceGUID)
end

-- Infinite Riftmage

function mod:InfiniteBurn(args)
	self:Message(args.spellId, "red", CL.casting:format(args.spellName))
	self:PlaySound(args.spellId, "alert")
	--self:NameplateCDBar(args.spellId, 9.7, args.sourceGUID)
end

-- Chronaxie

function mod:ChronalEruption(args)
	self:Message(args.spellId, "orange")
	self:PlaySound(args.spellId, "alarm")
	--self:NameplateCDBar(args.spellId, 9.7, args.sourceGUID)
end

function mod:ChronalEruptionApplied(args)
	if self:Me(args.destGUID) or self:Dispeller("magic") then
		self:TargetMessage(419516, "yellow", args.destName)
		self:PlaySound(419516, "alert", nil, args.destName)
	end
end

function mod:TemporalLink(args)
	-- TODO interruptible? get target?
	self:Message(args.spellId, "red")
	self:PlaySound(args.spellId, "alert")
	-- TODO unknown CD
end

-- Horde Destroyer

function mod:DeployGoblinSappers(args)
	self:Message(args.spellId, "cyan")
	self:PlaySound(args.spellId, "info")
	--self:NameplateCDBar(args.spellId, 26.7, args.sourceGUID)
end

function mod:VolatileMortar(args)
	self:Message(args.spellId, "orange")
	self:PlaySound(args.spellId, "alarm")
	--self:NameplateCDBar(args.spellId, 17.0, args.sourceGUID)
end

-- Horde Farseer

function mod:HealingWave(args)
	self:Message(args.spellId, "yellow", CL.casting:format(args.spellName))
	self:PlaySound(args.spellId, "alert")
	-- TODO unknown CD
end

-- Horde Raider

function mod:RallyingShout(args)
	self:Message(args.spellId, "red", CL.casting:format(args.spellName))
	self:PlaySound(args.spellId, "alert")
	--self:NameplateCDBar(args.spellId, 10.9, args.sourceGUID)
end

function mod:SunderingSlam(args)
	-- TODO purple?
	self:Message(args.spellId, "orange")
	self:PlaySound(args.spellId, "alarm")
	--self:NameplateCDBar(args.spellId, 14.5, args.sourceGUID)
end

-- Infinite Timebender

function mod:DizzyingSands(args)
	self:Message(args.spellId, "red", CL.casting:format(args.spellName))
	self:PlaySound(args.spellId, "alert")
	--self:NameplateCDBar(args.spellId, 29.1, args.sourceGUID)
end
