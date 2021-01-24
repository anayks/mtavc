local micTexture = dxCreateTexture("icon_voice_chat.png", "argb", true)
local toggleVoice = false
local avt = false

function onClientRender(  )
	if(avt == true) then
		local sw, sh = guiGetScreenSize()
		if(toggleVoice == true) then
			dxDrawImage(1780 * sw / 1920, 200 * sh / 1080, 40 * sw / 1920, 40 * sh / 1080, micTexture, 	0, 0, 0, tocolor(255, 255, 255, 255), true)
			--dxDrawText ("W", 1750 * sw / 1920, 196 * sh / 1080, 40 * sw / 1920, 40 * sh / 1080, tocolor (255, 255, 255,255), 1.6, 1.6, "pricedown")
		else
			dxDrawImage(1780 * sw / 1920, 200 * sh / 1080, 40 * sw / 1920, 40 * sh / 1080, micTexture, 	0, 0, 0, tocolor(255, 255, 255, 125), true)
			--dxDrawText ("W", 1750 * sw / 1920, 196 * sh / 1080, 40 * sw / 1920, 40 * sh / 1080, tocolor (255, 255, 255, 125), 1.6, 1.6, "pricedown")
		end
	end
end

function onClientResourceStart( res )
	if(res == getThisResource()) then
		addEventHandler("onClientRender", root, onClientRender)
	end
end

function startVoice (  )
	toggleVoice = true
end

function endVoice(  )
	toggleVoice = false
end

function voiceLogin(  )
	avt = true
end

function checkPos( ... )
	local x1, y1, z1 = getCameraMatrix()
	for i,n in pairs(getElementsByType("player")) do
		local x, y, z = getElementPosition(n)
		local dist = getDistanceBetweenPoints3D(x, y, z, x1, y1, z1)
		if(dist <= 15) then
			local int1 = getElementInterior(n)
			local int2 = getElementInterior(getLocalPlayer())
			if(int1 == int2) then
				local dim1 = getElementDimension(getLocalPlayer())
				local dim2 = getElementDimension(n)
				if(dim1 == dim2) then
					local coefdist = 15
					local mifdist = 15 / coefdist
					local stup = 15 / (dist / mifdist)
					setSoundVolume(n, 15/coefdist*stup)
				else
					setSoundVolume(n, 0)
				end
			else
				setSoundVolume(n, 0)
			end
		else
			setSoundVolume(n, 0)
		end
	end
end

setTimer(checkPos, 350, 0)

addEvent("voiceLogin", true)
addEventHandler("voiceLogin", root, voiceLogin)
addEvent("startVoice", true)
addEventHandler("startVoice", root, startVoice)
addEvent("endVoice", true)
addEventHandler("endVoice", root, endVoice)
addEventHandler("onClientResourceStart", root, onClientResourceStart)