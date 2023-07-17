--
-- Copyright (c) 2023 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="kr",date="2023-05-14T08:23:03Z",numCharacters=34438,db={}}
local F

F = function() provider.db["아즈샤라"]={0,"Maxava","Maxxava"} end F()

F = nil
RaiderIO.AddProvider(provider)
