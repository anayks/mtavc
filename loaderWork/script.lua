local pckUstr = createPickup(-681.8408203125, -1326.35546875, 11.029188156128, 3, 1275, 0)
local pckInfo = createPickup(-685.0693359375, -1320.501953125, 11.029188156128, 3, 1239, 0)

local coordLoaderCar = {
	[1] = {["x"]=-737.8291015625,	["y"]=-1415.822265625,	["z"]=11.229167938232,	["rz"]=249.98397827148	},
	[2] = {["x"]=-735.9580078125,	["y"]=-1411.5927734375,	["z"]=11.228174209595,	["rz"]=249.98397827148	},
	[3] = {["x"]=-733.9296875,		["y"]=-1406.708984375,	["z"]=11.227603912354,	["rz"]=245.5509185791	},
	[4] = {["x"]=-729.91015625,		["y"]=-1418.9501953125,	["z"]=11.176097869873,	["rz"]=244.34240722656	},
	[5] = {["x"]=-728.2138671875,	["y"]=-1414.3771484375,	["z"]=11.18817615509,	["rz"]=249.82467651367	},
	[6] = {["x"]=-726.163125,		["y"]=-1410.171875,		["z"]=11.189920425415,	["rz"]=243.85900878906	},
}

for i,n in pairs(coordLoaderCar) do
	local veh = exports.moyserver:createVeh(530, n["x"], n["y"], n["z"], 0, 0, n["rz"])
	setElementData(veh, "loaderCar", true)
end

function showPlayerDialog( thePlayer, id, type, t1, t2, t3, t4 )
	exports.moyserver:showPlayerDialog(thePlayer, id, type, t1, t2, t3, t4)
end

function create3dtextlabel( x, y, z, text )
	exports.moyserver:create3dtextlabel(x, y, z, text)
end

function addBox( text, thePlayer, r, g, b )
	exports.moyserver:addBox(text, thePlayer, r, g, b)
end

function onPickupHit( pck )
	if(pck == pckUstr) then
		showPlayerDialog(source, 11, 3, "Устройство на работу в порту.", "Название работы\tНеобходимо иметь\nГрузчик\t1 уровень\nВодитель погрузчика\t2 уровень, права\nУволиться\t-", "Устроиться", "Отмена")
	elseif(pck == pckInfo) then
		showPlayerDialog(source, 146, 3, "Помощь по работе", "Название работы\nГрузчик\nВодитель погрузчика (грузового кара)", "Выбор", "Отмена")
	end
end

function onSecondLoaderCar( hit, dim )
	if(getElementType(hit) == "player") then
		if(getElementData(source, "Player") == hit) then
			local veh = getPedOccupiedVehicle(hit)
			if(veh ~= false) then
				if(veh == getElementData(hit, "loaderCar")) then
					local mrk = getElementData(hit, "mrkSecLoaderCar")
					local blp = getElementData(hit, "blpSecLoaderCar")
					local obj = getElementData(hit, "objSecLoaderCar")
					destroyElement(mrk)
					destroyElement(blp)
					destroyElement(obj)
					removeElementData(hit, "mrkSecLoaderCar")
					removeElementData(hit, "blpSecLoaderCar")
					removeElementData(hit, "objSecLoaderCar")
					local sum = getElementData(hit, "sumSecLoaderCar")
					sum = tonumber(sum) * exports.moyserver:getCoefMoney()
					removeElementData(hit, "sumSecLoaderCar")
					exports.moyserver:setElementMoney(hit, sum, "Кар доставка")
					addBox("Вы успешно доставили груз\nИ заработали " .. sum .. "$.", hit, 0, 255, 60)
					local mrk = createMarker(-679.5224609375, -1357.49609375, 11.029188156128, "checkpoint", 3.2, 220, 0, 0, 220, hit)
					local blp = createBlip(-679.5224609375, -1357.49609375, 11.029188156128, 0, 2.4, 220, 0, 0, 220, 5, 64000, hit)
					setElementData(mrk, "Player", hit)
					setElementData(hit, "mrkFirstLoaderCar", mrk)
					setElementData(hit, "blpFirstLoaderCar", blp)
					addEventHandler("onMarkerHit", mrk, onFirstLoaderCar)
				end
			end
		end
	end
end

function customSpawnVehicle( veh )
	exports.moyserver:customSpawnVehicle(veh)
end

function clearLoaderCar( thePlayer )
	toggleAllControls(thePlayer, true)
	local veh = getElementData(thePlayer, "loaderCar")
	if(veh ~= false) then
		removeElementData(veh, "loaderPlayer")
		setTimer(customSpawnVehicle, 3000, 1, veh)
		removeElementData(thePlayer, "loaderCar")
	end
	local obj = getElementData(thePlayer, "objSecLoaderCar")
	if(obj ~= false) then
		destroyElement(obj)
		removeElementData(thePlayer, "objSecLoaderCar")
	end
	local mrk = getElementData(thePlayer, "mrkSecLoaderCar")
	if(mrk ~= false) then
		destroyElement(mrk)
		removeElementData(thePlayer, "mrkSecLoaderCar")
	end
	local blp = getElementData(thePlayer, "blpSecLoaderCar")
	if(blp ~= false) then
		destroyElement(blp)
		removeElementData(thePlayer, "blpSecLoaderCar")
	end
	local mrk = getElementData(thePlayer, "mrkFirstLoaderCar")
	if(mrk ~= false) then
		destroyElement(mrk)
		removeElementData(thePlayer, "mrkFirstLoaderCar")
	end
	local blp = getElementData(thePlayer, "blpFirstLoaderCar")
	if(blp ~= false) then
		destroyElement(blp)
		removeElementData(thePlayer, "blpFirstLoaderCar")
	end
	local summ = getElementData(thePlayer, "sumSecLoaderCar")
	if(sum ~= false) then
		removeElementData(thePlayer, "sumSecLoaderCar")
	end
end

function onFirstLoaderCar( hit, dim )
	if(getElementType(hit) == "player") then
		if(getElementData(source, "Player") == hit) then
			local veh = getPedOccupiedVehicle(hit)
			if(veh ~= false) then
				if(veh == getElementData(hit, "loaderCar")) then
					local tablo = exports.moyserver:getGruzState()
					if(tablo >= 10) then
						exports.moyserver:setGruzState(tablo - 10)
						local mrk = getElementData(hit, "mrkFirstLoaderCar")
						local blp = getElementData(hit, "blpFirstLoaderCar")
						destroyElement(mrk)
						destroyElement(blp)
						removeElementData(hit, "mrkFirstLoaderCar")
						removeElementData(hit, "blpFirstLoaderCar")
						local randPos = math.random(1, 6)
						if(randPos == 1) then
							local randSum = math.random(100, 120)
							local randObj = math.random(1, 3)
							if(randObj == 1) then
								randObj = 13014
							elseif(randObj == 2) then
								randObj = 12912
							elseif(randObj == 3) then
								randObj = 13052
							end
							local obj = createObject(randObj, 0, 0, 0)
							if(randObj == 12912) then
								attachElements(obj, veh, 0, 0.4, 0.0)
							else
								attachElements(obj, veh, 0, 0.4, 0.15)
							end
							local mrk = createMarker(-1010.8203125, -1384.9775390625, 11.537727355957, "checkpoint", 3.2, 220, 0, 0, 220, hit)
							local blp = createBlip(-1010.8203125, -1384.9775390625, 11.537727355957, 0, 2.4, 220, 0, 0, 220, 5, 64000, hit)
							setElementData(mrk, "Player", hit)
							setElementData(hit, "mrkSecLoaderCar", mrk)
							setElementData(hit, "blpSecLoaderCar", blp)
							setElementData(hit, "objSecLoaderCar", obj)
							setElementData(hit, "sumSecLoaderCar", randSum)
							addEventHandler("onMarkerHit", mrk, onSecondLoaderCar)
						elseif(randPos == 2) then
							local randSum = math.random(50, 75)
							local randObj = math.random(1, 3)
							if(randObj == 1) then
								randObj = 13014
							elseif(randObj == 2) then
								randObj = 12912
							elseif(randObj == 3) then
								randObj = 13052
							end
							local obj = createObject(randObj, 0, 0, 0)
							if(randObj == 12912) then
								attachElements(obj, veh, 0, 0.4, 0.0)
							else
								attachElements(obj, veh, 0, 0.4, 0.15)
							end
							local mrk = createMarker(-744.005859375, -1432.8203125, 11.225625991821, "checkpoint", 3.2, 220, 0, 0, 220, hit)
							local blp = createBlip(-744.005859375, -1432.8203125, 11.225625991821, 0, 2.4, 220, 0, 0, 220, 5, 64000, hit)
							setElementData(mrk, "Player", hit)
							setElementData(hit, "mrkSecLoaderCar", mrk)
							setElementData(hit, "blpSecLoaderCar", blp)
							setElementData(hit, "objSecLoaderCar", obj)
							setElementData(hit, "sumSecLoaderCar", randSum)
							addEventHandler("onMarkerHit", mrk, onSecondLoaderCar)
						elseif(randPos == 3) then
							local randSum = math.random(25, 50)
							local randObj = math.random(1, 3)
							if(randObj == 1) then
								randObj = 13014
							elseif(randObj == 2) then
								randObj = 12912
							elseif(randObj == 3) then
								randObj = 13052
							end
							local obj = createObject(randObj, 0, 0, 0)
							if(randObj == 12912) then
								attachElements(obj, veh, 0, 0.4, 0.0)
							else
								attachElements(obj, veh, 0, 0.4, 0.15)
							end
							local mrk = createMarker(-668.9013671875, -1410.171875, 11.124494552612, "checkpoint", 3.2, 220, 0, 0, 220, hit)
							local blp = createBlip(-668.9013671875, -1410.171875, 11.124494552612, 0, 2.4, 220, 0, 0, 220, 5, 64000, hit)
							setElementData(mrk, "Player", hit)
							setElementData(hit, "mrkSecLoaderCar", mrk)
							setElementData(hit, "blpSecLoaderCar", blp)
							setElementData(hit, "objSecLoaderCar", obj)
							setElementData(hit, "sumSecLoaderCar", randSum)
							addEventHandler("onMarkerHit", mrk, onSecondLoaderCar)
						elseif(randPos == 4) then
							local randSum = math.random(50, 80)
							local randObj = math.random(1, 3)
							if(randObj == 1) then
								randObj = 13014
							elseif(randObj == 2) then
								randObj = 12912
							elseif(randObj == 3) then
								randObj = 13052
							end
							local obj = createObject(randObj, 0, 0, 0)
							if(randObj == 12912) then
								attachElements(obj, veh, 0, 0.4, 0.0)
							else
								attachElements(obj, veh, 0, 0.4, 0.15)
							end
							local mrk = createMarker(-800.8935546875, -1339.9755859375, 11.137034416199, "checkpoint", 3.2, 220, 0, 0, 220, hit)
							local blp = createBlip(-800.8935546875, -1339.9755859375, 11.137034416199, 0, 2.4, 220, 0, 0, 220, 5, 64000, hit)
							setElementData(mrk, "Player", hit)
							setElementData(hit, "mrkSecLoaderCar", mrk)
							setElementData(hit, "blpSecLoaderCar", blp)
							setElementData(hit, "objSecLoaderCar", obj)
							setElementData(hit, "sumSecLoaderCar", randSum)
							addEventHandler("onMarkerHit", mrk, onSecondLoaderCar)
						elseif(randPos == 5) then
							local randSum = math.random(50, 80)
							local randObj = math.random(1, 3)
							if(randObj == 1) then
								randObj = 13014
							elseif(randObj == 2) then
								randObj = 12912
							elseif(randObj == 3) then
								randObj = 13052
							end
							local obj = createObject(randObj, 0, 0, 0)
							if(randObj == 12912) then
								attachElements(obj, veh, 0, 0.4, 0.0)
							else
								attachElements(obj, veh, 0, 0.4, 0.15)
							end
							local mrk = createMarker(-824.109375, -1363.6787109375, 10.803652763367, "checkpoint", 3.2, 220, 0, 0, 220, hit)
							local blp = createBlip(-824.109375, -1363.6787109375, 10.803652763367, 0, 2.4, 220, 0, 0, 220, 5, 64000, hit)
							setElementData(mrk, "Player", hit)
							setElementData(hit, "mrkSecLoaderCar", mrk)
							setElementData(hit, "blpSecLoaderCar", blp)
							setElementData(hit, "objSecLoaderCar", obj)
							setElementData(hit, "sumSecLoaderCar", randSum)
							addEventHandler("onMarkerHit", mrk, onSecondLoaderCar)
						elseif(randPos == 6) then
							local randSum = math.random(100, 125)
							local randObj = math.random(1, 3)
							if(randObj == 1) then
								randObj = 13014
							elseif(randObj == 2) then
								randObj = 12912
							elseif(randObj == 3) then
								randObj = 13052
							end
							local obj = createObject(randObj, 0, 0, 0)
							if(randObj == 12912) then
								attachElements(obj, veh, 0, 0.4, 0.0)
							else
								attachElements(obj, veh, 0, 0.4, 0.15)
							end
							local mrk = createMarker(-968.796875, -1306.607421875, 11.453498840332, "checkpoint", 3.2, 220, 0, 0, 220, hit)
							local blp = createBlip(-968.796875, -1306.607421875, 11.453498840332, 0, 2.4, 220, 0, 0, 220, 5, 64000, hit)
							setElementData(mrk, "Player", hit)
							setElementData(hit, "mrkSecLoaderCar", mrk)
							setElementData(hit, "blpSecLoaderCar", blp)
							setElementData(hit, "objSecLoaderCar", obj)
							setElementData(hit, "sumSecLoaderCar", randSum)
							addEventHandler("onMarkerHit", mrk, onSecondLoaderCar)
						end
					else
						addBox("На складе недостаточно продуктов :(", hit, 255, 0, 0)
					end
				end
			end
		end
	end
end

function startWorkingCarLoader( thePlayer )
	local mrk = createMarker(-679.5224609375, -1357.49609375, 11.029188156128, "checkpoint", 3.2, 220, 0, 0, 220, thePlayer)
	local blp = createBlip(-679.5224609375, -1357.49609375, 11.029188156128, 0, 2.4, 220, 0, 0, 220, 5, 64000, thePlayer)
	setElementData(thePlayer, "mrkFirstLoaderCar", mrk)
	setElementData(thePlayer, "blpFirstLoaderCar", blp)
	addEventHandler("onMarkerHit", mrk, onFirstLoaderCar)
	setElementData(mrk, "Player", thePlayer)
end

create3dtextlabel(-685.0693359375, -1320.501953125, 11.029188156128, "Помощь по работе")
create3dtextlabel(-681.67578125, -1326.2509765625, 11.029188156128, "Трудоустройство")
create3dtextlabel(-681.67578125, -1326.2509765625, 10.829188156128, "Работа: грузчик")
addEventHandler("onPlayerPickupHit", root, onPickupHit)