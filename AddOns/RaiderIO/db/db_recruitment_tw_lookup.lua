--
-- Copyright (c) 2023 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="tw",date="2023-04-29T07:27:31Z",numCharacters=32067,lookup={},recordSizeInBytes=2,encodingOrder={0,1,3}}
local F

-- chunk size: 54
F = function() provider.lookup[1] = "?\29?\29\8\16?\29;\4;\8\4\4?\29?\29?\29?\13?\13?\13?\13?\13?\13s\29\4\4s\29\4\4s\29?\13?\13?\13?\13;\16;\4" end F()

F = nil
RaiderIO.AddProvider(provider)
