--
-- Copyright (c) 2025 by RaiderIO, Inc.
-- All rights reserved.
--
local provider={name=...,data=3,region="us",date="2026-04-15T06:05:50Z",numCharacters=9,db={}}
local F

F = function() provider.db["Pagle"]={0,"Airbrake","Dragonsage","Firebrake","Holybrake","Kelthara","Scarletwind","Teramedic","Treebrake","Wulfwÿnn"} end F()

F = nil
RaiderIO.AddProvider(provider)
