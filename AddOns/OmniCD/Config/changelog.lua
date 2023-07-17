local E, L, C = select(2, ...):unpack()

if E.isClassic then E.changelog = [=[
v1.14.3.2755
	Readiness will reset Deterrence, Feign Death and Trap abilities, instead of all Hunter abilities
]=]
elseif E.isBCC then E.changelog = [=[
v2.5.4.2722
	Fixed sync for cross realm group members
]=]
elseif E.isWOTLKC then E.changelog = [=[
v3.4.1.2755
	Fixed an issue that prevented CD bars from attaching to the party frames
	Readiness will no longer reset Roar of Sacrifice
	Added arena season 7, 8 equip bonus items
]=]
else E.changelog = [=[
v10.1.5.2761
	Healbot fix

v10.1.5.2760
	Patch 10.1.5 updates

]=]
end

E.changelog = E.changelog .. "\n\n|cff808080Full list of changes can be found in the CHANGELOG file"
