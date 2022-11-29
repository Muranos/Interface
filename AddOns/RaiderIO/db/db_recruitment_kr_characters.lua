--
-- Copyright (c) 2022 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="kr",date="2022-11-18T21:04:14Z",numCharacters=15648,db={}}
local F

F = function() provider.db["아즈샤라"]={0,"마음이땡긴다"} end F()

F = nil
RaiderIO.AddProvider(provider)
