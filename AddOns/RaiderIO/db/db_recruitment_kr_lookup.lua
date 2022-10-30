--
-- Copyright (c) 2022 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="kr",date="2022-10-30T07:59:36Z",numCharacters=15244,lookup={},recordSizeInBytes=2,encodingOrder={0,1,3}}
local F

-- chunk size: 2
F = function() provider.lookup[1] = ";\4" end F()

F = nil
RaiderIO.AddProvider(provider)
