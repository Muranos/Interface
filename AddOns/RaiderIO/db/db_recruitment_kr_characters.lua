--
-- Copyright (c) 2023 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="kr",date="2024-01-16T10:14:57Z",numCharacters=27341,db={}}
local F

F = function() provider.db["아즈샤라"]={0,"노예의주인","노주냥","라큐라드","양원주"} end F()

F = nil
RaiderIO.AddProvider(provider)
