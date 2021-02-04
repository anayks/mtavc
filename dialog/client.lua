local shr = 0
local razr = false
local sshr = 0
local shrift = dxCreateFont("MenuUI/Fonts/AvertaCyrillicRegular.otf", 10, true, "cleartype")
local bigShrift = dxCreateFont("MenuUI/Fonts/AvertaCyrillicRegular.otf", 12, true, "cleartype")
local picturee = dxCreateTexture("png/button_active.png", "argb", true)
local minwinx = 320
local winsize = 320
local winysize = 140
local GUITableText = {}
local GUI = false

function onClientRender(  )
	if(razr == true) then
		if(GUI == true) then
			if(GUITableText[13] == 1) then
				local cx, cy, cwx, cwy, cwz = getCursorPosition()
				local wx, wh = guiGetScreenSize()
				local x, y = guiGetScreenSize()
				local wiy = GUITableText[6]
				local otm = wh/2 - wiy/2
				dxDrawRectangle(0, 0, 	wx, 	wh, tocolor(30, 30, 30, 45), 		true, false)
				dxDrawRectangle(wx/2 - (winsize + 4)/2, otm - 2, 	winsize + 4, 	wiy + 4, tocolor(31, 31, 31, 255), 		true, false)
				dxDrawRectangle(wx/2 - winsize/2, 		otm, 		winsize, 		wiy, tocolor(255, 255, 255, 255), 	true, false)
				dxDrawText(GUITableText[1], 0, 			otm + 10, 	wx, 			400, tocolor(30, 30, 30, 255), 		0.8, 0.8, shr, "center", "top", false, false, true, false, false)
				dxDrawRectangle(wx/2 - winsize/2, otm + 48, winsize, 1, tocolor(225, 225, 225, 255), true, false)
				local dwx = dxGetTextWidth(GUITableText[1], 0.8, shr)
				dxDrawRectangle(wx/2 - dwx/2 - 2, otm + 46, dwx + 4, 5, tocolor(255, 125, 255, 255), true, false)
				for i=1,GUITableText[5] do
					dxDrawText(GUITableText[2][i], wx/2 - winsize/2 + 35, otm + 63 + 20 * (i - 1), 1160, 400, tocolor(30, 30, 30, 255), 	1, 1, shrift, "left", "top", false, false, true, true, false)
				end
				local x = wx/2 - 140
				local y = otm + wiy - 55
				local sry = y / wh
				local styy = (y + 52) / wh
				if(cx > GUITableText[7] and cx <= GUITableText[8] and cy > GUITableText[10] and cy <= GUITableText[11]) then
					dxDrawImage(x, y, 140, 52, picturee, 0, 0, 0, tocolor(255, 255, 255, 255), true)
				else
					dxDrawImage(x, y, 140, 52, picturee, 0, 0, 0, tocolor(125, 125, 125, 255), true)
				end
				dxDrawText(GUITableText[3], x, y + 10, x + 140, 400, tocolor(0, 0, 0, 255), 	1, 1, bigShrift, "center", "top", false, false, true, true, false)
				local x = wx/2
				if(cx > GUITableText[8] and cx <= GUITableText[9] and cy > GUITableText[10] and cy <= GUITableText[11]) then
					dxDrawImage(x, y, 140, 52, picturee, 0, 0, 0, tocolor(255, 255, 255, 255), true)
				else
					dxDrawImage(x, y, 140, 52, picturee, 0, 0, 0, tocolor(125, 125, 125, 255), true)
				end
				dxDrawText(GUITableText[4], x, y+10, x + 140, 400, tocolor(0, 0, 0, 255), 	1, 1, bigShrift, "center", "top", false, false, true, true, false)
			elseif(GUITableText[13] == 3) then
				local wx, wh = guiGetScreenSize()
				local wsize = winysize
				local why = wh / 2 - wsize/2
				dxDrawRectangle(0, 0, 	wx,  wh, tocolor(30, 30, 30, 45), 		true, false)
				dxDrawRectangle(wx/2 - winsize / 2 - 2, 	why - 2, 	winsize + 4, wsize + 4, tocolor(31, 31, 31, 255), 		true, false)
				dxDrawRectangle(wx/2 - winsize / 2, 		why, 			winsize, wsize, tocolor(255, 255, 255, 255), 	true, false)
				local dwx = dxGetTextWidth(GUITableText[1], 0.8, shr)
				
				dxDrawText(GUITableText[1], 0, 			why + 15, 	wx, 			400, tocolor(30, 30, 30, 255), 		0.8, 0.8, shr, "center", "top", false, false, true, false, false)
				dxDrawRectangle(wx / 2 - winsize / 2, why + 58, winsize, 1, tocolor(225, 225, 225, 255), true, false)
				dxDrawRectangle(wx / 2 - ((dwx) / 2) - 2 , why + 56, dwx + 4, 5, tocolor(255, 125, 255, 255), true, false)
				local pend = why + wsize - 78 - (why + 95) + 3
				dxDrawRectangle(wx / 2 - winsize / 2 + 10, 	why + 95, 	winsize - 20, 	3, 		tocolor(30, 30, 30, 255), 		true, false)
				dxDrawRectangle(wx / 2 - winsize / 2 + 10, 	why + 95, 	3, 		pend, 	tocolor(30, 30, 30, 255), 		true, false)
				dxDrawRectangle(wx / 2 + winsize / 2 - 10,	why + 95, 	3, 		pend,	tocolor(30, 30, 30, 255), 		true, false)
				dxDrawRectangle(wx / 2 - winsize / 2 + 10,	why + wsize - 78, 	winsize - 20, 	3, 		tocolor(30, 30, 30, 255), 		true, false)
				local ssize = pend - 12
				local checksize = 0
				if(GUITableText[20] <= 10) then
					checksize = 1
				else
					checksize = 10 / GUITableText[20] 
				end
				local fsize = ssize * checksize
				local maysize = ssize - fsize
				local mchecksize = GUITableText[20] - 10
				local mpos = mchecksize - (GUITableText[20] - 10 - GUITableText[23])
				local smpos = why + 101 + (mpos - 1) * (maysize / (mchecksize - 1))
				dxDrawRectangle(wx / 2 + winsize / 2 - 22,	smpos, 	8, 		fsize, 	tocolor(255, 125, 255, 255), 	true, false)
				for i,n in pairs(GUITableText[2][1]) do
					dxDrawText(GUITableText[2][1][i], wx / 2 - winsize / 2 + 180 * (i - 1) + 20, 		why + 70, 		wx / 2 - winsize / 2 + 150 * (i) + 20, 400, tocolor(120, 120, 120, 255), 	1, 1, shrift, "left", "top", false, false, true, true, false)
				end
				if(why + 100 + (GUITableText[22] - 1) * 15 < why + wsize - 93 and why + 100 + (GUITableText[22] - 1) * 15 > why + 95) then
					dxDrawRectangle(wx / 2 - winsize / 2 + 20,	why + 100 + (GUITableText[22] - 1) * 15, 	winsize - 45, 		15, 	tocolor(195, 195, 195, 175), 	true, false)
				end
				local fda = GUITableText[23]
				local iter = 0
				for i=fda,fda+10 do
					if(i > 1) then
						if(i > GUITableText[23] and i <= GUITableText[23] + 10 and i <= GUITableText[20]) then
							iter = iter + 1
							for k,r in pairs(GUITableText[2][i]) do
								dxDrawText(GUITableText[2][i][k], wx / 2 - winsize / 2 + 20 + (k - 1) * 180, why + 100 + (iter-1) * 15, 0, 400, tocolor(0, 0, 0, 255), 	1, 1, shrift, "left", "top", false, false, true, true, false)
							end
						end
					end
				end

				local cx, cy = getCursorPosition()
				cx = cx * wx
				if(cy >= GUITableText[10] and cy <= GUITableText[11] and cx >= wx / 2 - 140 and cx <= wx / 2) then
					dxDrawImage(wx / 2 - 140, why + wsize - 65, 140, 52, picturee, 0, 0, 0, tocolor(255, 255, 255, 255), true)
				else
					dxDrawImage(wx / 2 - 140, why + wsize - 65, 140, 52, picturee, 0, 0, 0, tocolor(185, 185, 185, 185), true)
				end
				if(cy >= GUITableText[10] and cy <= GUITableText[11] and cx > wx / 2 and cx <= wx / 2 + 140) then
					dxDrawImage(wx / 2, why + wsize - 65, 140, 52, picturee, 0, 0, 0, tocolor(255, 255, 255, 255), true)
				else
					dxDrawImage(wx / 2, why + wsize - 65, 140, 52, picturee, 0, 0, 0, tocolor(185, 185, 185, 185), true)
				end
				dxDrawText(GUITableText[4], wx / 2 - 140, why + wsize - 55, wx / 2, 400, tocolor(0, 0, 0, 255), 	1, 1, bigShrift, "center", "top", false, false, true, true, false)
				dxDrawText(GUITableText[3], wx / 2, why + wsize - 55, wx / 2 + 140, 400, tocolor(0, 0, 0, 255), 	1, 1, bigShrift, "center", "top", false, false, true, true, false)
			end
		end
	end
end

function showPlayerDialog( arg )
	if(arg[3] == 1) then
		triggerEvent("tryFalseResponse", getLocalPlayer())
		local name = arg[4]
		local text = arg[5]
		local b1 = arg[6]
		local b2 = arg[7]
		if(name ~= nil and text ~= nil and b1 ~= nil and b2 ~= nil) then
			showCursor(true)
			local strx = dxGetTextWidth(name, 1, shr)
			local wx, wh = guiGetScreenSize()
			if(strx > 320) then
				winsize = strx + 40
			end
			GUITableText[1] = name
			GUITableText[2] = {}
			local iter = 1
			for s in string.gmatch(text, "[^\n]+") do
				GUITableText[2][iter] = s
				iter = iter + 1
			end
			for i,n in pairs(GUITableText[2]) do
				local width = dxGetTextWidth(n, 1, shrift, true)
				if(width > winsize - 70 and width > minwinx) then
					winsize = width + 70
				end
			end
			GUITableText[3] = b1
			GUITableText[4] = b2
			GUITableText[5] = iter - 1
			GUITableText[6] = 140 + (iter - 1) * 20
			local wx, wh = guiGetScreenSize()
			local perc = (wx/2 - 140) / wx
			GUITableText[7] = perc
			local perc = (wx/2) / wx
			GUITableText[8] = perc
			local perc = (wx/2 + 140) / wx 
			GUITableText[9] = perc
			GUITableText[10] = (wh/2 - GUITableText[6]/2 + GUITableText[6] - 55) / wh
			GUITableText[11] = (wh/2 - GUITableText[6]/2 + GUITableText[6] - 55 + 52) / wh
			GUITableText[12] = arg[2]
			GUITableText[13] = 1
			GUI = true
		end
	elseif(arg[3] == 3) then
		triggerEvent("tryFalseResponse", getLocalPlayer())
		local name = arg[4]
		local text = arg[5]
		local b1 = arg[6]
		local b2 = arg[7]
		if(name ~= nil and text ~= nil and b1 ~= nil and b2 ~= nil) then
			GUITableText[1] = name
			showCursor(true)
			GUITableText[13] = 3
			GUITableText[12] = arg[2]
			local strx = dxGetTextWidth(name, 1, shr)
			local wx, wh = guiGetScreenSize()
			local cx, cy, cwx, cwy, cwz = getCursorPosition()
			local x, y = guiGetScreenSize()
			local wiy = GUITableText[6]

			GUITableText[2] = {}
			local iter = 1
			for s in string.gmatch(text, "[^\n]+") do
				GUITableText[2][iter] = s
				iter = iter + 1
			end
			local tmptable = GUITableText[2]
			GUITableText[2] = {}
			GUITableText[14] = {}
			for i=1,iter-1 do
				GUITableText[2][i] = {}
				local iterr = 1
				for s in string.gmatch(tmptable[i], "[^\t]+") do
					GUITableText[2][i][iterr] = s
					iterr = iterr + 1
				end
			end
			local iteror = 0
			for i,n in pairs(GUITableText[2][1]) do
				iteror = iteror + 1
			end
			winsize = iteror * 180 + 75
			if(winsize < strx) then
				winsize = strx + 30
			end
			iteror = 0
			for i,n in pairs(GUITableText[2]) do
				iteror = iteror + 1
			end
			winysize = 180 + (iteror - 1) * 15
			if(iteror > 10) then
				winysize = 180 + (10) * 15
			end
			if(winsize < 350) then
				winsize = 350
			end
			GUITableText[20] = iteror
			GUITableText[21] = {}
			local iterr = 0
			local wx, wh = guiGetScreenSize()
			local wsize = winysize
			local why = wh / 2 - wsize/2
			for i=1,GUITableText[20]-1 do
				if(iterr < 10) then
					iterr = iterr + 1
					GUITableText[21][iterr] = wx / 2 - winsize
					GUITableText[21][i] = {}
					GUITableText[21][i]["Pos"] = why + 100 + (iterr-1) * 15
				end
			end
			GUITableText[22] = 1
			GUITableText[23] = 1
			GUI = true
			GUITableText[10] = (wh / 2 + winysize / 2 - 69) / wh
			GUITableText[11] = (wh / 2 + winysize / 2 - 15) / wh
			GUITableText[3] = b2
			GUITableText[4] = b1
		end
	end
end

function onClientResourceStart( res )
	if("main" == getResourceName(res)) then
		shr = exports["main"]:sendBebas()
		razr = true
		addEventHandler("onClientRender", root, onClientRender)
	end
end

function onDialogFalse( )
	if(GUITableText[12] ~= nil) then
		if(GUITableText[13] == 1) then
			GUI = false
			triggerServerEvent("onDialogResponse", resourceRoot, GUITableText[12], true, nil)
			GUITableText = {}
			winsize = minwinx
		else
			GUI = false
			triggerServerEvent("onDialogResponse", resourceRoot, GUITableText[12], true, nil, GUITableText[22] - 1 + GUITableText[23] - 1)
			GUITableText = {}
			winsize = minwinx
		end
		GUITableText = {}
		showCursor(false)
	end
end

function onDialogTrue( )
	if(GUITableText[13] == 1) then
		GUI = false
		triggerServerEvent("onDialogResponse", resourceRoot, GUITableText[12], false, nil)
		GUITableText = {}
		winsize = minwinx
	else
		GUI = false
		triggerServerEvent("onDialogResponse", resourceRoot, GUITableText[12], false, nil, GUITableText[22] - 1 + GUITableText[23] - 1)
		GUITableText = {}
		winsize = minwinx
	end
	GUITableText = {}
	showCursor(false)
end

addEvent("onDialogFalse", true)
addEventHandler("onDialogFalse", root, onDialogFalse)

function onClientClick( b, state, x, y, wx, wy, wz, cw )
	if(razr == true) then
		if(state == "down") then
			if(GUI == true) then
				if(GUITableText[13] == 1) then
					local sw, sh = guiGetScreenSize()
					x = x / sw
					y = y / sh
					if(x > GUITableText[7] and x <= GUITableText[8] and y > GUITableText[10] and y <= GUITableText[11]) then
						onDialogFalse()
						showCursor(false)
					elseif(x > GUITableText[8] and x <= GUITableText[9] and y > GUITableText[10] and y <= GUITableText[11]) then
						onDialogTrue()
						showCursor(false)
					end
				elseif(GUITableText[13] == 3) then
					local clicked = false
					for i,n in pairs(GUITableText[21]) do
						local sw, sh = guiGetScreenSize()
						if(y > n["Pos"] and y < n["Pos"] + 15 and x >= sw / 2 - winsize / 2 + 10 and x <= sw / 2 + winsize / 2 - 20) then
							GUITableText[22] = i
							clicked = true
							break
						end
					end
					local sw, sh = guiGetScreenSize()
					local wsize = winysize
					if(clicked == false) then
						if(x >= sw / 2 - 140 and x <= sw / 2 and y >= sh / 2 + wsize / 2 - 69 and y <= sh / 2 + wsize / 2 - 15) then
							onDialogFalse()
						elseif(x >= sw / 2 and x <= sw / 2 + 140 and y >= sh / 2 + wsize / 2 - 69 and y <= sh / 2 + wsize / 2 - 15) then
							onDialogTrue()
						end
					end
				end
			end
		end
	end
end

function onClientKey( button, press )
	if(GUI == true) then
		if(GUITableText[13] == 3 or GUITableText[13] == 1) then
			if(press == true) then
				if(button == "mouse_wheel_up") then
					if(GUITableText[23] > 1) then
						GUITableText[23] = GUITableText[23] - 1
						GUITableText[22] = GUITableText[22] + 1
					end
					cancelEvent()
				elseif(button == "mouse_wheel_down") then
					if(GUITableText[23] < GUITableText[20] - 10) then
						GUITableText[23] = GUITableText[23] + 1
						GUITableText[22] = GUITableText[22] - 1
					end
					cancelEvent()
				elseif(button == "arrow_u") then
					if(GUITableText[22] > 1) then
						GUITableText[22] = GUITableText[22] - 1
					end
					cancelEvent()
				elseif(button == "arrow_d") then
					if(GUITableText[22] < GUITableText[20] and GUITableText[22] < 10) then
						GUITableText[22] = GUITableText[22] + 1
					elseif(GUITableText[22] < GUITableText[20] and GUITableText[22] == 10 and GUITableText[23] < GUITableText[20] - 10) then
						GUITableText[23] = GUITableText[23] + 1
					end
					cancelEvent()
				elseif(button == "enter") then
					onDialogFalse()
					cancelEvent()
				elseif(button == "escape") then
					onDialogTrue()
					cancelEvent()
				end
			end
		end
	end
end

addEvent("showDialog", true)
addEventHandler("showDialog", root, showPlayerDialog)
addEventHandler("onClientClick", root, onClientClick)
addEventHandler("onClientResourceStart", root, onClientResourceStart)
addEventHandler("onClientKey", root, onClientKey)