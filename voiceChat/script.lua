local timer = {}

for i,n in pairs(getElementsByType("player")) do
	if(getElementData(n, "Login") == true) then
		setPlayerVoiceBroadcastTo(n, getElementsByType("player"))
	end
end

function attach3dtexttoplayer( text, player, x, y, z )
	exports.myserver:attach3dtexttoplayer(text, player, x, y, z)
end

function addBox( text, p, r, g, b )
	exports["myserver"]:addBox(text, p, r, g, b)
end

function onPlayerVoiceStart(  )
	if(getElementData(source, "Login") == true) then
		if(getElementData(source, "CDVoice") == false) then
			if(getElementData(source, "Mute") == false) then
				cancelEvent()
			else
				if(getElementData(source, "Mute") > 0) then
					cancelEvent()
				else
					triggerClientEvent(source, "startVoice", source)
					local id = getElementData(source, "ID")
					timer[id] = setTimer(function ( lep )
						attach3dtexttoplayer("Разговаривает", lep, 0, 0, 0.125)
						triggerClientEvent(lep, "startVoice", lep)
					end, 500, 0, source)
					attach3dtexttoplayer("Разговаривает", source, 0, 0, 0.125)
					setTimer(function ( player )
						removeElementData(player, "CDVoice")
					end, 1000, 1, source)
				end
			end
		end
	end
end

function onPlayerVoiceStop(  )
	triggerClientEvent(source, "endVoice", source)
	local id = getElementData(source, "ID")
	if(isTimer(timer[id])) then
		killTimer(timer[id])
	end
	timer[id] = nil
	attach3dtexttoplayer("", source, 0, 0, 0)
end

function onPlayerQuit(  )
	local id = getElementData(source, "ID")
	if(isTimer(timer[id])) then
		killTimer(timer[id])
	end
	timer[id] = nil
	attach3dtexttoplayer("", source, 0, 0, 0)
end

addEventHandler("onPlayerQuit", root, onPlayerQuit)
addEventHandler("onPlayerVoiceStart", root, onPlayerVoiceStart)
addEventHandler("onPlayerVoiceStop", root, onPlayerVoiceStop)