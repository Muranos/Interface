local E, L, C = select(2, ...):unpack()

if E.isClassic then E.changelog = [=[
v1.14.3.2747
	NULL
]=]
elseif E.isBCC then E.changelog = [=[
v2.5.4.2722
	Fixed sync for cross realm group members
]=]
elseif E.isWOTLKC then E.changelog = [=[
v3.4.1.2747
	Pummel and Shield Bash will correctly have a shared CD
]=]
else E.changelog = [=[
v10.0.7.2747
	Added option to limit the number of visible icons per unit
	Added option to move the icon name vertically
	Added option to scale status bar name
	Fixed Divine Protection for Rets
	Fixed Divine Purpose procs for Rets
	Fixed Fire Breath CD reduction for Preservation
	Visibility by Group Size can be configured for each zone separately

	MARCH 28, 2023 Hotfix
		Symbol of Hope will now only reduce the cooldown of Divine Protection for Retribution Paladins.

	10.1 PTR fixes
]=]
end

E.changelog = E.changelog .. "\n\n|cff808080Full list of changes can be found in the CHANGELOG file"
