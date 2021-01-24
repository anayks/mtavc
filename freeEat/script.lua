local pizzaHelp = createPickup(285.787109375, -298.3935546875, 11.91587638855, 3, 1239, 0)

local freeEatTable = 
{
	[1] = {["x"]=-681.1923828125, 	["y"]=-1481.322265625,	["z"]=12.565450668335,	["rz"]=156				},
	[2] = {["x"]=-309.013671875,	["y"]=1346.7109375, 	["z"]=11.606904029846,	["rz"]=177.34680175781	},
	[3] = {["x"]=-693.1025390625,	["y"]=-1310.966796875,	["z"]=11.022104263306,	["rz"]=205				},
	[4] = {["x"]=-1051.7275390625,	["y"]=1308.322265625,	["z"]=8.699686050415,	["rz"]=267				},
	[5] = {["x"]=-140.3896484375,	["y"]=-965.8330078125,	["z"]=10.423469543457,	["rz"]=280				},
	[6] = {["x"]=285.4638671875,	["y"]=-304.076171875,	["z"]=11.91587638855,	["rz"]=265				},
	[7] = {["x"]=-17.4560546875,	["y"]=-973.52734375,	["z"]=10.413144111633,	["rz"]=185				},
	[8] = {["x"]=-789.751953125,	["y"]=553.3330078125,	["z"]=11.060119628906,	["rz"]=0				},
	[9] = {["x"]=-193.1982421875,	["y"]=-1470.4443359375,	["z"]=8.0708332061768,	["rz"]=12				},
	[10]= {["x"]=-879.03125,		["y"]=65.052734375, 	["z"]=9.3326263427734,	["rz"]=162				},
	[11]= {["x"]=-985.6220703125,	["y"]=-1181.2685546875,	["z"]=15.062187194824,	["rz"]=268				},
}

function addBox( text, player, r, g, b )
	exports.moyserver:addBox(text, player, r, g, b)
end

function create3dtextlabel( x, y, z, text )
	exports.moyserver:create3dtextlabel(x, y, z, text, getThisResource())
end

function UpdateFood( thePlayer )
	triggerClientEvent(thePlayer, "Food", thePlayer, getElementData(thePlayer, "Food"))
end

function showPlayerDialog( thePlayer, id, type, name, text, ok, nota )
	exports.moyserver:showPlayerDialog(thePlayer, id, type, name, text, ok, nota)
end

function createFreeEat(  )
	for i,n in pairs(freeEatTable) do
		local obj = createObject(11342, freeEatTable[i]["x"], freeEatTable[i]["y"], freeEatTable[i]["z"], 0, 0, freeEatTable[i]["rz"] + 90)
		setElementFrozen(obj, true)
		local x, y, z = freeEatTable[i]["x"], freeEatTable[i]["y"], freeEatTable[i]["z"]
		local gradx, grady, grad = 0, 0, freeEatTable[i]["rz"]
		grad = math.rad(360 - grad)
		local sink = math.sin(grad)
		local cosink = math.cos(grad)
		x1 = x - 1.5 * sink
		y1 = y - 1.5 * cosink
		local ped = createPed(220, x1, y1, z, freeEatTable[i]["rz"])
		setElementFrozen(ped, true)
		x = x + 1.5 * sink
		y = y + 1.5 * cosink
		local pck = createPickup(x, y, z, 3, 7510, 0)
		freeEatTable[i]["px"] = x
		freeEatTable[i]["py"] = y
		freeEatTable[i]["pz"] = z
		create3dtextlabel(x, y, z, "Ларек с уличной едой")
		create3dtextlabel(x, y, z - 0.15, "#ff6600Еда для новых жителей бесплатно")
		create3dtextlabel(x, y, z - 0.3, "Пицца: #00ff66250$")
		create3dtextlabel(x, y, z - 0.45, "Бургер: #00ff66350$")
		setElementData(pck, "FreeEatCustom", i, false)
	end
end

function getRandomFreeEatCheckpoint( )
	local tablo = {}
	local iter = 0
	for i,n in pairs(freeEatTable) do
		iter = iter + 1
	end
	local rand = math.random(1, iter)
	tablo[1] = freeEatTable[rand]["px"]
	tablo[2] = freeEatTable[rand]["py"]
	tablo[3] = freeEatTable[rand]["pz"]
	return tablo
end

removeWorldModel(11342, 5, -691.3916015625, -1313.0556640625, 11.022104263306)
removeWorldModel(11342, 5, -1105.7060546875, 1346.875, 20.029010772705)
createFreeEat()

function pickupPickUp( pickupid )
	if(getElementData(pickupid, "FreeEatCustom") ~= false) then
		if(getElementData(source, "Login") == true) then
			if(getPedOccupiedVehicle(source) == false) then
				if(getElementData(source, "Lvl") > 1) then
					triggerClientEvent(source, "startChooseBrowser", source, "eat", "1")
				else
					triggerClientEvent(source, "startChooseBrowser", source, "eat", "2")
				end
			end
		end
	end
end

function onPickupHit( player )
	if(source == pizzaHelp) then
		showPlayerDialog(player, 64000, 1, "Помощь по работе развозчиком пиццы.", "Добро пожаловать на работу развозчиком пиццы!\nСмысл данной работы заключается в доставке продукции со склада,\nНа котором Вы находитесь, по точкам быстрого питания.\n \nПоследовательность действий:\n#0033dd Устраиваетесь на работу.\n#0033dd Бесплатно арендуете один из мопедов.\n#0033dd Забираете пиццу со склада.\n#0033dd Направляетесь к точке, слезаете с мопеда и передаете пиццу.\n \n#0033ddЧтобы закончить работу, Вы можете нажать цифру 2 и нажать \"Да\"\n#0033ddЛибо вернуться в раздевалку, находяющуся рядом.\n#00dd33Оплата за доставку фиксированная (40$).\n#ff0000* Точки, на которые нужно двигаться, помечены красным маркером и маячком в GPS.", "Окей", "Отмена")
	end
end


create3dtextlabel(294.8740234375, -297.2841796875, 11.81587638855, "Трудоустройство")
create3dtextlabel(294.8740234375, -297.2841796875, 11.61587638855, "Работа: развозчик пиццы")
create3dtextlabel(285.6865234375, -298.49609375, 11.61587638855, "Помощь по работе")
addEventHandler("onPickupHit", root, onPickupHit)
addEventHandler("onPlayerPickupHit", root, pickupPickUp)