--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="us",date="2024-10-09T06:16:45Z",numCharacters=52,db={}}
local F

F = function() provider.db["Arugal"]={0,"Careface","Chubs","Harrock"} end F()

F = nil
RaiderIO.AddProvider(provider)
