local _, ns = ...

-- Red/Gold theme
ns.colour = {}
ns.colour.prefix	= "\124cFFC11B17" -- Chilli Pepper
ns.colour.highlight = "\124cFFE9AB17" -- Bee Yellow
ns.colour.achieveH	= "\124cFFF70D1A" -- Ferrari Red
ns.colour.achieveI	= "\124cFFF6BE00" -- Deep Yellow
ns.colour.achieveD	= "\124cFFC3FDB8" -- Light Jade
ns.colour.seasonal	= "\124cFF5EFB6E" -- Jade Green
ns.colour.daily		= "\124cFF00BFFF" -- Deep Sky Blue
ns.colour.Guide		= "\124cFF12AD2B" -- Parrot Green
ns.colour.plaintext = "\124cFF00A36C" -- Jade
ns.colour.completeR	= "\124cFFFF0000" -- Red
ns.colour.completeG	= "\124cFF00FF00" -- Green

ns.questTypes = { "Seasonal", "Daily", "One Time", }
-- One Time quests are so uncommon in seasonal events that it's silly to waste a good colour that will rarely be used
ns.questColours = { ns.colour.seasonal, ns.colour.daily, ns.colour.seasonal, }
