--
-- Copyright (c) 2023 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="kr",date="2024-01-16T10:14:57Z",numCharacters=27341,lookup={},recordSizeInBytes=2,encodingOrder={0,1,3}}
local F

-- chunk size: 8
F = function() provider.lookup[1] = "\13\16\13\4\13\16\13\4" end F()

F = nil
RaiderIO.AddProvider(provider)
