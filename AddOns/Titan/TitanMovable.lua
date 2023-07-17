--[[ File
NAME: TitanMovable.lua
DESC: DragonFlight introduced an Edit Mode for the user to move various frames where they want them.
Titan no longer needs to do this work for most frames.

There are a small number of frames that WoW does not have in Edit mode. These will be added to the table over time as users request.
The scheme has changed to be more like 'move any/thing' which hooks the SetPoint of the frame.
Titan still only allows vertical adjust - not move anywhere.
:DESC

--]]
-- Globals

-- Locals
local _G = getfenv(0);
local InCombatLockdown = _G.InCombatLockdown;


--[[ API
NAME: TitanMovable_GetPanelYOffset
DESC: Get the Y axis offset Titan needs (1 or 2 bars) at the given position - top or bottom.
VAR: framePosition - TITAN_PANEL_PLACE_TOP or TITAN_PANEL_PLACE_BOTTOM
OUT: Y axis offset, in pixels
NOTE:
- As of DragonFlight this may not be as useful. Leaving to not break any addons.

- The preferred method to determine the Y offset needed to use TitanUtils_GetBarAnchors()
which provides anchors (frames) for an addon to use.
:NOTE
--]]
function TitanMovable_GetPanelYOffset(framePosition) -- used by other addons
	-- Both top & bottom are figured out but only the
	-- requested position is returned
	local barnum_top = 0
	local barnum_bot = 0
	-- If user has the top set then determine the top offset
	if TitanBarDataVars[TITAN_PANEL_DISPLAY_PREFIX.."Bar"].show then
--	if TitanPanelGetVar("Bar_Show") then
		barnum_top = 1
	end
	if TitanBarDataVars[TITAN_PANEL_DISPLAY_PREFIX.."Bar2"].show then
--	if TitanPanelGetVar("Bar2_Show") then
		barnum_top = 2
	end
	-- If user has the bottom set then determine the bottom offset
	if TitanBarDataVars[TITAN_PANEL_DISPLAY_PREFIX.."AuxBar"].show then
--	if TitanPanelGetVar("AuxBar_Show") then
		barnum_bot = 1
	end
	
	if TitanBarDataVars[TITAN_PANEL_DISPLAY_PREFIX.."AuxBar2"].show then
--	if TitanPanelGetVar("AuxBar2_Show") then
		barnum_bot = 2
	end

	local scale = TitanPanelGetVar("Scale")
	-- return the requested offset
	-- 0 will be returned if the user has no bars showing
	-- or the scale is not valid
	if scale and framePosition then
		if framePosition == TITAN_PANEL_PLACE_TOP and barnum_top > 0 then
			return (-TITAN_PANEL_BAR_HEIGHT * scale)*(barnum_top);
		elseif framePosition == TITAN_PANEL_PLACE_BOTTOM and barnum_bot > 0 then
			return (TITAN_PANEL_BAR_HEIGHT * scale)*(barnum_bot)
				-1 -- no idea why -1 is needed... seems anchoring to bottom is off a pixel
		end
	end
	return 0
end

--[[ Titan
NAME: TitanPanel_AdjustFrameInit
DESC: Do all the setup needed when a user logs in / reload UI / enter or leave an instance or when user updates adjust flag.
VAR:  frame_str : string of the frame name
OUT:  None
NOTE:
- This is called once the profile (and settings) are known.
- Keeping this simple for now until omplexity needs to be added.
- hooksecurefunc from https://urbad.net/blue/us/34224257-Guide_to_Secure_Execution_and_Tainting
Hooking and the hooksecurefunc function

The taint model is the reason that 'hooking' as it is commonly done today can easily break lots of UI functionality, trying to hook a function that is used by secure code causes a tainted function to be called in the middle of an otherwise secure execution path, this then taints the execution path so that nothing following the hook can use secure functions - don't be too dismayed however, we've been given a tool to get around this.

The new hooksecurefunc API function allows AddOn code to 'post hook' a secure global function, that is run another function after the original one has been run. So for example you could track calls to CastSpellByName using hooksecurefunc("CastSpellByName", mySpellCastTracker). The API replaces the original global function with its own secure hook function that calls the original function, saves its return values away, and then calls your hook function with the same arguments as the original function (any return values from your hook function are thrown away) and then it returns the return values from the original.

The 'special' feature of this secure hook is that when your hook function is executed, it executes with the taint that was present at the time the hook was created, and when your hook function is done that taint is discarded and the original secure (or possibly tainted - you cannot use hooksecurefunc to REMOVE taint, just avoid it) execution mode is restored.

- hooksecurefunc from https://wowpedia.fandom.com/wiki/API_hooksecurefunc. 
- The hook will stay until a reload or logout. This means the TitanAdj MUST remain or the normal SetPoint will be broken.
- Setting the hook is cumalitive so add ony once; controlled by titan_adj_hook on the frame.
:NOTE
--]]
function TitanPanel_AdjustFrameInit(frame_str) -- 
	local op = ""
	local frame = _G[frame_str]
	if frame then -- sanity check
		function frame:TitanAdj()
			if frame.titan_adj  -- only if Titan user has requested
			and not InCombatLockdown() then
				local point, relativeTo, relativePoint, xOfs, yOfs = frame:GetPoint()
				if point and relativeTo and relativePoint and xOfs then
					frame:ClearAllPoints()
					frame:SetPoint(point, relativeTo:GetName(), relativePoint, xOfs, TitanAdjustSettings[frame_str].offset)
					frame.titan_offset = TitanAdjustSettings[frame_str].offset
--[[
print("TitanAdj ~~"
.." x"..tostring(xOfs)..""
.." y"..tostring(yOfs)..""
.." => "..tostring(TitanAdjustSettings[frame_str].offset)..""
)
--]]
				end
			end
		end
		
		if frame.titan_adj_hook == true then
			-- already hooked, do not want to add more...
		else
			-- Add the hook for when WoW code updates this frame
			hooksecurefunc(frame, "SetPoint", function(frame, ...)
				if frame.titan_adjusting then
					-- prevent a stack overflow
				else
					frame.titan_adjusting = true
					frame:SetMovable(true)
					frame:SetUserPlaced(true)
					frame:TitanAdj() -- routine attached to the frame
					frame.titan_adjusting = false
				end
			end)
			
			frame.titan_adj_hook = true
			op = "set secure hook"
		end
			
		TitanPanel_AdjustFrame(frame_str, "Init adjust")
	else
		op = "skip - frame invalid"
		-- do not proceed
	end
end

--[[ Titan
NAME: TitanPanel_AdjustFrame
DESC: Adjust frame as requested.
VAR:  frame_str : string of the frame name
VAR:  reason : string for debug
OUT:  None
NOTE:
- This is called when usesrs has changed the adjust flag and on Titan init.
:NOTE
--]]
function TitanPanel_AdjustFrame(frame_str, reason) -- 
	local trace = false
	local op = "no action"
	local frame = _G[frame_str]

	if trace then
		print("_AdjustFrame"
			.." "..tostring(frame_str)..""
			.." '"..tostring(reason).."'"
			.." "..tostring(TitanAdjustSettings[frame_str].adjust)..""
			.." "..tostring(TitanAdjustSettings[frame_str].offset)..""
		)
	end

	if frame then
		-- Check if user has requested... 
		if TitanAdjustSettings[frame_str].adjust then
			if frame.titan_adj == true then
				-- Already set
			else
				-- Flipping from false, trigger a move
				frame.titan_adj = true
				frame:TitanAdj()
				op = "adjust - titan_adj to true"
			end
			
			if frame.titan_offset == TitanAdjustSettings[frame_str].offset then
				-- No need to update
			else
				frame:TitanAdj()
				op = "adjust - titan_offset changed"
			end
		else
			-- User has requested Titan to NOT adjust this frame.
			frame.titan_adj = false
			if frame.titan_adj_hook == true then
				-- hooked this session so adjust
				frame:TitanAdj()
				op = "adjust - titan_adj to false"
			else
				-- not hooked this session so ignore
			end
		end
	else
		op = "skip - : frame invalid"
		-- do not proceed
	end

	if trace then
		print("_AdjustFrame"
			.." "..tostring(frame_str)..""
			.." '"..tostring(op).."'"
		)
	end
end

--[[
	TitanDebug ("MoveFrame :"
		.." "..tostring(frame:GetName())
		.." point:"..tostring(point)
		.." relativeTo:"..tostring(relativeTo:GetName())
		.." relativePoint:"..tostring(relativePoint)
		.." xOfs:"..tostring(xOfs)
		.." y:"..tostring(y)
		.." adj:"..tostring(DoAdjust(top_bottom, force))
		.." tb:"..tostring(top_bottom)
		.." f:"..tostring(force)
		)
	end
--]]