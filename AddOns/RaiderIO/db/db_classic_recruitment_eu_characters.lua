--
-- Copyright (c) 2025 by RaiderIO, Inc.
-- All rights reserved.
--
local provider={name=...,data=3,region="eu",date="2026-03-29T06:06:21Z",numCharacters=2,db={}}
local F

F = function() provider.db["Everlook"]={0,"Chugganaut","Imperatvs"} end F()

F = nil
RaiderIO.AddProvider(provider)
