--
-- Copyright (c) 2023 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="tw",date="2023-07-17T09:06:51Z",numCharacters=29710,db={}}
local F

F = function() provider.db["世界之樹"]={0,"Paoda","菜菜子","阿提米斯"} end F()
F = function() provider.db["亞雷戈斯"]={6,"暮光路路","穢邪路路"} end F()
F = function() provider.db["冰霜之刺"]={10,"七轟","千樹彥","毀滅的花兒"} end F()
F = function() provider.db["克羅之刃"]={16,"Readmeinname","一根大龙北","亚煞极","尤格萨隆","微醺灬思慕术","貓叔的小鈴鐺"} end F()
F = function() provider.db["冰風崗哨"]={28,"Novem","Novemmonk"} end F()
F = function() provider.db["暗影之月"]={32,"Nazhock","Worchief","巨獸斬","狼魅妹"} end F()
F = function() provider.db["水晶之刺"]={40,"潘鳳"} end F()

F = nil
RaiderIO.AddProvider(provider)
