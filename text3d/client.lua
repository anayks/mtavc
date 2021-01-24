local text3d 			= {}
local text3drange 		= {}

function on3dTextAdd( texttable )
	local id = tonumber(texttable["ID"])
	if(text3drange[id] ~= nil) then
		text3drange[id]["Text"] = texttable["Text"]
	end
	text3d[id] = {}
	text3d[id]["x"] = texttable["x"]
	text3d[id]["y"] = texttable["y"]
	text3d[id]["z"] = texttable["z"]
	text3d[id]["Text"] = texttable["Text"]
end

function labelFunc( )
	for i, n in pairs(text3d) do
		local x, y, z = getElementPosition(getLocalPlayer())
		local lx, ly, lz = text3d[i]["x"], text3d[i]["y"], text3d[i]["z"]
		local pdistance = getDistanceBetweenPoints3D(x, y, z, lx, ly, lz)
		if(text3d[i]["Toggle"] == nil) then
			if pdistance <= 14 then
				text3d[i]["Toggle"] = true
				text3drange[i] = {}
				text3drange[i]["x"] = text3d[i]["x"]
				text3drange[i]["y"] = text3d[i]["y"]
				text3drange[i]["z"] = text3d[i]["z"]
				text3drange[i]["Text"] = text3d[i]["Text"]
			else
				text3d[i]["Toggle"] = true
			end
		elseif(text3d[i]["Toggle"] == false) then
			if pdistance <= 14 then
				text3d[i]["Toggle"] = true
				text3drange[i] = {}
				text3drange[i]["x"] = text3d[i]["x"]
				text3drange[i]["y"] = text3d[i]["y"]
				text3drange[i]["z"] = text3d[i]["z"]
				text3drange[i]["Text"] = text3d[i]["Text"]
			end
		elseif(text3d[i]["Toggle"] == true) then
			if pdistance >= 14 then
				text3d[i]["Toggle"] = false
				text3drange[i] = nil
			end
		end
	end
end


function onClientRender(  )
	local sw, sh = guiGetScreenSize()
	for i, n in pairs(text3drange) do
		if(text3drange[i] ~= nil) then
			if(text3drange[i]["x"] ~= nil) then
				local x, y, z = getElementPosition(getLocalPlayer())
				if isPlayerMapVisible() then return end
				local lx, ly, lz = text3drange[i]["x"], text3drange[i]["y"], text3drange[i]["z"]
				local pdistance = getDistanceBetweenPoints3D(x, y, z, lx, ly, lz)
				if pdistance <= 14 then
					local sx, sy, sz = getScreenFromWorldPosition (lx, ly, lz+1.05, 0.06)
					local CamX,CamY,CamZ = getCameraMatrix()
					local bHit = processLineOfSight(CamX, CamY, CamZ, lx, ly, lz, true, false, false, true, false, false, false, false )
					if not bHit and sx and sy then
						local text = text3drange[i]["Text"]
						local w = dxGetTextWidth(text, 1.4 * sw / 1920, "Arial")
						local a, b = string.find(text, "#")
						local text1, text2 = "a", "b"
						if(a ~= nil) then
							text1 = string.sub(text, 1, a-1)
							text2 =  "#050505" .. string.sub(text, a+7, string.len(text))
							dxDrawText (text1 .. text2, (sx-(w/2)-2), 	sy-25, (sx+(w/2)), sy, tocolor(0, 0, 0, 255), 1.4 * sw / 1920, 1.4, "Arial", "center", "top", false, false, false, true)
							dxDrawText (text1 .. text2, (sx-(w/2)+2), 	sy-25, (sx+(w/2)), sy, tocolor(0, 0, 0, 255), 1.4 * sw / 1920, 1.4, "Arial", "center", "top", false, false, false, true)
							dxDrawText (text1 .. text2, (sx-(w/2)), 	sy-23, (sx+(w/2)), sy, tocolor(0, 0, 0, 255), 1.4 * sw / 1920, 1.4, "Arial", "center", "top", false, false, false, true)
							dxDrawText (text1 .. text2, (sx-(w/2)),		sy-27, (sx+(w/2)), sy, tocolor(0, 0, 0, 255), 1.4 * sw / 1920, 1.4, "Arial", "center", "top", false, false, false, true)
						else
							dxDrawText (text, (sx-(w/2)-2), sy-25, (sx+(w/2)), sy, tocolor(0, 0, 0, 255), 1.4 * sw / 1920, 1.4, "Arial", "center", "top", false, false, false, true)
							dxDrawText (text, (sx-(w/2)+2), sy-25, (sx+(w/2)), sy, tocolor(0, 0, 0, 255), 1.4 * sw / 1920, 1.4, "Arial", "center", "top", false, false, false, true)
							dxDrawText (text, (sx-(w/2)), 	sy-23, (sx+(w/2)), sy, tocolor(0, 0, 0, 255), 1.4 * sw / 1920, 1.4, "Arial", "center", "top", false, false, false, true)
							dxDrawText (text, (sx-(w/2)),	sy-27, (sx+(w/2)), sy, tocolor(0, 0, 0, 255), 1.4 * sw / 1920, 1.4, "Arial", "center", "top", false, false, false, true)
						end
						dxDrawText (text, (sx-(w/2)), 	sy-25, (sx+(w/2)), sy, tocolor(255, 255, 255, 255), 1.4 * sw / 1920, 1.4, "Arial", "center", "top", false, false, false, true)
					end
				end
			end
		end
	end
end

function onClientResourceStart( res )
	if(res == getThisResource()) then
		addEventHandler("onClientRender", root, onClientRender)
	end
end

setTimer(labelFunc, 200, 0)
addEventHandler("onClientResourceStart", root, onClientResourceStart)
addEvent("on3dTextAdd", true)
addEventHandler("on3dTextAdd", root, on3dTextAdd)