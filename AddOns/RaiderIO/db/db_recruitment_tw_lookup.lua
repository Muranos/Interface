--
-- Copyright (c) 2023 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="tw",date="2023-09-03T08:13:22Z",numCharacters=25174,lookup={},recordSizeInBytes=2,encodingOrder={0,1,3}}
local F

-- chunk size: 6
F = function() provider.lookup[1] = "?\13?\13?\13" end F()

F = nil
RaiderIO.AddProvider(provider)
