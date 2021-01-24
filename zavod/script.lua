function create3dtextlabel( x, y, z, text)
	return exports.moyserver:create3dtextlabel(x, y, z, text, getThisResource())
end

local pckEnter = createPickup(-731.22265625, 1262.74609375, 11.730819702148, 3, 1318, 0)
local pckExit = createPickup(2576.9853515625, -1289.865234375, 1044.1262207031, 3, 1318, 0)
create3dtextlabel(-731.22265625, 1262.74609375, 11.730819702148, "#0033ffВход на завод")
create3dtextlabel(2576.9853515625, -1289.865234375, 1044.1262207031, "#0033ffВыход с завода")
createBlip(-743.7119140625, 1250.990234375, 12.137254714966, 27, 0, 0, 0, 0, 0, 0, 250)
local skl3d = create3dtextlabel(2564.197265625, -1292.83203125, 1043.1262207031, "Готово: #00ff66 0 продуктов")
setElementInterior(pckExit, 2)

local ZavodSkl = 0

function edit3dtext( id, text )
	exports.moyserver:edit3dtext(id, text)
end

function showPlayerDialog( thePlayer, id, type, t1, t2, t3, t4 )
	exports.moyserver:showPlayerDialog(thePlayer, id, type, t1, t2, t3, t4)
end

function addBox( text, thePlayer, r, g, b )
	exports.moyserver:addBox(text, thePlayer, r, g, b)
end

function setElementMoney( thePlayer, money, reason )
	exports.moyserver:setElementMoney(thePlayer, money, reason)
end

local secStols = 
{
	[1]  = {	["x"]=	2558.869140625,	["y"]=-1290.52734375,	["z"]=1044.1262207031,	["State"] = 0	},
	[2]  = {	["x"]=	2556.08203125,	["y"]=-1290.6923828125,	["z"]=1044.1262207031,	["State"] = 0	},
	[3]  = {	["x"]=	2553.76953125,	["y"]=-1290.4482421875,	["z"]=1044.1262207031,	["State"] = 0	},
	[4]  = {	["x"]=	2544.751953125,	["y"]=-1290.712890625,	["z"]=1044.1262207031,	["State"] = 0	},
	[5]  = {	["x"]=	2542.427734375,	["y"]=-1290.6728515625,	["z"]=1044.1262207031,	["State"] = 0	},
	[6]  = {	["x"]=	2542.2080078125,["y"]=-1296.1923828125,	["z"]=1044.1262207031,	["State"] = 0	},
	[7]  = {	["x"]=	2544.75390625,	["y"]=-1296.21484375,	["z"]=1044.1262207031,	["State"] = 0	},
	[8]  = {	["x"]=	2553.373046875,	["y"]=-1296.19921875,	["z"]=1044.1262207031,	["State"] = 0	},
	[9]  = {	["x"]=	2555.982421875,	["y"]=-1296.2216796875,	["z"]=1044.1262207031,	["State"] = 0	},
	[10] = {	["x"]=	2558.615234375,	["y"]=-1296.244140625,	["z"]=1044.1262207031,	["State"] = 0	}
}

local mysql = exports.moyserver:getDataBase()

function getDBProxy(func) 
  if(mysql ~= false) then
    return func
  end 
  return outputBug;
end

dbPoll = getDBProxy(dbPoll)
dbQuery = getDBProxy(dbQuery)
dbFree = getDBProxy(dbFree)
dbExec = getDBProxy(dbExec)

local query = dbQuery(mysql, "SELECT * FROM `Server` WHERE `Name` = 'ZavodSkl'")
local result = dbPoll(query, -1)

if(result ~= nil) then
	if(result[1] ~= nil) then
		if(result[1]["Integ"] ~= nil) then
			ZavodSkl = result[1]["Integ"]
			edit3dtext(skl3d, "Готово продукции: #00ff66 " .. ZavodSkl .. " шт.")
		else
			ZavodSkl = 0
			dbExec(mysql, "INSERT INTO `Server` (`Name`, `Integ`) VALUES ('ZavodSkl', '0')")
		end
	else
		ZavodSkl = 0
		dbExec(mysql, "INSERT INTO `Server` (`Name`, `Integ`) VALUES ('ZavodSkl', '0')")
	end
else
	ZavodSkl = 0
	dbExec(mysql, "INSERT INTO `Server` (`Name`, `Integ`) VALUES ('ZavodSkl', '0')")
end

function updateSklad(  )
	dbExec(mysql, "UPDATE `Server` SET `Integ` = ? WHERE `Name` = 'ZavodSkl'", ZavodSkl)
end

setTimer(updateSklad, 1000 * 60 * 10, 0)

local objects = 
{
	[1]  = {["id"]=11429, 	["Name"]="телевизор"		, ["x"]=0.3, 	["y"]=0.2, 		["z"]=0, 	["rx"]=90, 		["ry"]=0, 		["rz"]=150},
	[2]  = {["id"]=18096, 	["Name"]="ноутбук"			, ["x"]=0.15, 	["y"]=0, 		["z"]=0, 	["rx"]=100, 	["ry"]=0, 		["rz"]=160},
	[3]  = {["id"]=18097, 	["Name"]="нерабочий ноутбук", ["x"]=0.2, 	["y"]=0.02, 	["z"]=0, 	["rx"]=90, 		["ry"]=-20, 	["rz"]=0},
	[4]  = {["id"]=18317, 	["Name"]="проводной телефон", ["x"]=0.15, 	["y"]=0, 		["z"]=0, 	["rx"]=90, 		["ry"]=180, 	["rz"]=-30},
	[5]  = {["id"]=18340, 	["Name"]="домофон"			, ["x"]=0.2, 	["y"]=0, 		["z"]=0, 	["rx"]=180, 	["ry"]=90, 		["rz"]=-30},
	[6]  = {["id"]=5077, 	["Name"]="микроволновка"	, ["x"]=0.24, 	["y"]=0.1, 		["z"]=0, 	["rx"]=0, 		["ry"]=180, 	["rz"]=-20},
	[7]  = {["id"]=18355,	["Name"]="кофеварка"		, ["x"]=0.17, 	["y"]=-0.03, 	["z"]=0, 	["rx"]=90, 		["ry"]=0, 		["rz"]=170}
}

local objStols = 
{
	[1] 	= {	["x"]=	2558.83984375,		["y"]=-1291.4984375,	["z"]=1045.0755615234	},
	[2] 	= {	["x"]=	2556.271484375,		["y"]=-1291.4462890625,	["z"]=1045.0755615234	},
	[3] 	= {	["x"]=	2554.1484375,		["y"]=-1291.486328125,	["z"]=1045.0755615234	},
	[4] 	= {	["x"]=	2544.48828125, 		["y"]=-1291.4521484375,	["z"]=1045.0755615234	},
	[5] 	= {	["x"]=	2542.0927734375, 	["y"]=-1291.4638671875,	["z"]=1045.0755615234	},
	[6] 	= {	["x"]=	2541.9716796875,	["y"]=-1295.584375,		["z"]=1045.0755615234	},
	[7] 	= {	["x"]=	2544.3955078125,	["y"]=-1295.512109375,	["z"]=1045.0755615234	},
	[8] 	= {	["x"]=	2553.8056640625,	["y"]=-1295.5955078125,	["z"]=1045.0755615234	},
	[9] 	= {	["x"]=	2556.0185546875,	["y"]=-1295.5349609375,	["z"]=1045.0755615234	},
	[10] 	= {	["x"]=	2558.4794921875, 	["y"]=-1295.567578125,	["z"]=1045.0755615234	},
}

function mrkWorkHit( hit, dim )
	if(getElementData(hit, "zState") == 1) then
		local stol = getElementData(source, "zNumberStol")
		if(secStols[stol]["State"] == 0) then
			setPedAnimation(hit, "int_shop", "shop_cashier", 1200, true)
			local obj = getElementData(hit, "ZavodObject")
			if(isElement(obj)) then
				destroyElement(obj)
			end
			removeElementData(hit, "ZavodObject")
			obj = createObject(14771, 0, 0, 0)
			setElementInterior(obj, 2)
			secStols[stol]["State"] = true
			exports.bone:attachElementToBone(obj, hit, 12, 0, 0.03, 0.14, 0, 90, 0)
			setElementData(hit, "ZavodObject", obj)
			local secObj = createObject(13014, objStols[stol]["x"], objStols[stol]["y"], objStols[stol]["z"] - 0.7)
			setElementRotation(secObj, 0, 180, 0)
			setElementInterior(secObj, 2)
			if(stol <= 5) then
				setElementRotation(hit, 0, 0, 180)
			else
				setElementRotation(hit, 0, 0, 0)
			end
			toggleAllControls(hit, false, true, false)
			setTimer(function ( her, boj, sobj, st )
				if(isElement(her)) then
					removeElementData(her, "ZavodObject")
					setPedAnimation(her, "carry", "crry_prtial", 1, true, true, false, true)
					local rand = math.random(1, 7)
					local obj = createObject(objects[rand]["id"], -1405.490234375, -870.1171875, 20.831172943115)
					setElementInterior(obj, 2)
					exports.bone:attachElementToBone(obj, her, 12, objects[rand]["x"], objects[rand]["y"], objects[rand]["z"], objects[rand]["rx"], objects[rand]["ry"], objects[rand]["rz"])
					setElementData(her, "ZavodObject", obj)
					addBox("Предмет создан: " .. objects[rand]["Name"], her, 0, 60, 255)
					destroyElement(boj)
					destroyElement(sobj)
					setElementData(her, "zState", 2)
					toggleAllControls(her, true, true, false)
					toggleControl(her, "jump", false)
					toggleControl(her, "sprint", false)
					toggleControl(her, "crouch", false)
					toggleControl(her, "aim_weapon", false)
					toggleControl(her, "fire", false)
					toggleControl(her, "next_weapon", false)
					toggleControl(her, "previous_weapon", false)
				end
				secStols[st]["State"] = 0
			end, 10600, 1, hit, obj, secObj, stol)
		else
			addBox("Данный стол уже занят.", hit, 255, 0, 0)
		end
	end
end

local objer = createObject(14771, 0, 0, 0)
setElementInterior(objer, 2)

function attachblya( thePlayer, command, x, y, z, rx, ry, rz)
	exports.bone:attachElementToBone(objer, thePlayer, 12, x, y, z, rx, ry, rz)
end

addCommandHandler("rfd", attachblya)

local stolsTable = 
{
	[1]  = {	["x"]=	2558.1630859375,	["y"]=-1282.78515625,	["z"]=1044.1262207031	},
	[2]  = {	["x"]=	2558.05859375,		["y"]=-1284.708984375,	["z"]=1044.1262207031	},
	[3]  = {	["x"]=	2550.0556640625,	["y"]=-1284.68359375,	["z"]=1044.1262207031	},
	[4]  = {	["x"]=	2550.1845703125,	["y"]=-1282.96484375,	["z"]=1044.1262207031	},
	[5]  = {	["x"]=	2541.8720703125,	["y"]=-1282.58203125,	["z"]=1044.1262207031	},
	[6]  = {	["x"]=	2542.1435546875,	["y"]=-1284.904296875,	["z"]=1044.1262207031	},
	[7]  = {	["x"]=	2542.18359375,		["y"]=-1302.607421875,	["z"]=1044.1262207031	},
	[8]  = {	["x"]=	2542.1494140625,	["y"]=-1304.3046875,	["z"]=1044.1262207031	},
	[9]  = {	["x"]=	2550.1845703125,	["y"]=-1302.5673828125,	["z"]=1044.1262207031	},
	[10] = {	["x"]=	2550.1845703125,	["y"]=-1304.3681640625,	["z"]=1044.1262207031	},
	[11] = {	["x"]=	2558.1640625,		["y"]=-1304.5869140625,	["z"]=1044.1262207031	},
	[12] = {	["x"]=	2558.1640625,		["y"]=-1302.4130859375,	["z"]=1044.1262207031	}
}

for i,n in pairs(secStols) do
	local mrk = createMarker(n["x"], n["y"], n["z"] - 1, "cylinder", 1.2, 220, 0, 0, 30, getRootElement())
	setElementData(mrk, "zNumberStol", i)
	setElementInterior(mrk, 2)
	create3dtextlabel(n["x"], n["y"], n["z"] - 0.5, "#00ff33Стол для работы")
	addEventHandler("onMarkerHit", mrk, mrkWorkHit)
end

local mrkSecSklad = createMarker(2564.197265625, -1292.83203125, 1043.1262207031, "cylinder", 1.4, 220, 0, 0, 220, getRootElement())
local pckUstr = createPickup(2566.625, -1281.08984375, 1044.1262207031, 3, 1275, 0)
local pckInfo = createPickup(2568.990234375, -1281.34375, 1044.1262207031, 3, 1239, 0)
setElementInterior(mrkSecSklad, 2)
setElementInterior(pckUstr, 2)
setElementInterior(pckInfo, 2)

create3dtextlabel(2566.625, -1281.08984375, 1044.1262207031, "Трудоустройство")
create3dtextlabel(2566.625, -1281.08984375, 1043.9262207031, "Работа: Инженер-электрик")
create3dtextlabel(2568.990234375, -1281.34375, 1044.1262207031, "Помощь по работе")
create3dtextlabel(2564.197265625, -1292.83203125, 1043.2262207031, "#ff3300Склад готовой продукции")

function onPickupHit( pck )
	if(pck == pckInfo) then
		showPlayerDialog(source, 64000, 1, "Помощь по работе", "Добро пожаловать на завод Vice City.\nДанное предприятие занимается разработкой и поставкой всей техники по всему штату.\n#0033ddТребования для устройства на работу: 1 уровень.\n \nСуть работы заключается в том, что необходимо брать товар и перерабатывать.\n \n#0033ddПоследовательность действий\n#0033ddСначала необходимо подойти к столу и взять материал. #ff3300(Детали)\n#0033ddПосле чего необходимо подойти с материалом к столу для работы. #00dd33(Стол для работы)\n#0033ddПосле работы необходимо сдать товар на склад #ff3300(Склад готовой продукции)\n \n#00CC44Данная работа не требует вложений и аренды.", "Ок", "Отмена")
	elseif(pck == pckUstr) then
		showPlayerDialog(source, 147, 3, "Трудоустройство на завод", "Название работы\tНеобходимо иметь\nИнженер-электрик\t1 уровень\nУволиться\t-", "Выбор", "Отмена")
	end
end

function onPlayerWasted( ammo, killer, weapon, body, steal )
	if(getElementData(source, "NWork") == 9) then
		setElementData(source, "NWork", 0)
	end
end

function onFirstMarkerSklad( hit, dim )
	if(hit ~= false) then
		if(getElementType(hit) == "player") then
			if(getElementData(hit, "NWork") == 9) then
				if(getElementData(hit, "zState") == false) then
					local obj = createObject(13014, -1405.490234375, -870.1171875, 20.831172943115)
					setElementInterior(obj, 2)
					exports.bone:attachElementToBone(obj, hit, 12, 0.23, 0.24, 0.12, 80, 270, 70)
					setPedAnimation(hit, "carry", "crry_prtial", 1, true, true, false, true)
					setElementData(hit, "ZavodObject", obj)
					toggleControl(hit, "jump", false)
					toggleControl(hit, "sprint", false)
					toggleControl(hit, "crouch", false)
					toggleControl(hit, "aim_weapon", false)
					toggleControl(hit, "fire", false)
					toggleControl(hit, "next_weapon", false)
					toggleControl(hit, "previous_weapon", false)
					setElementData(hit, "zState", 1)
				end
			end
		end
	end
end

function onSecondMarkerSklad( hit, dim )
	if(hit ~= false) then
		if(getElementType(hit) == "player") then
			if(getElementData(hit, "NWork") == 9) then
				if(getElementData(hit, "zState") == 2) then
					local summ = math.random(10, 25)
					ZavodSkl = ZavodSkl + 1
					edit3dtext(skl3d, "Готово продукции: #00ff66 " .. ZavodSkl .. " шт.")
					dbExec(mysql, "UPDATE `Server` SET `Integ` = ? WHERE `Name` = 'ZavodSkl'", ZavodSkl)
					addBox("Вы сдали товар на склад\nИ получили " .. summ .. "$.", hit, 0, 255, 60)
					setElementMoney(hit, summ, "Завод")
					local obj = getElementData(hit, "ZavodObject")
					if(isElement(obj)) then
						destroyElement(obj)
					end
					removeElementData(hit, "ZavodObject")
					setPedAnimation(hit, "BSKTBALL", "BBALL_idle_O", 1, false)
					removeElementData(hit, "zState")
				end
			end
		end
	end
end

for i,n in pairs(stolsTable) do
	local mrk = createMarker(n["x"]-1, n["y"], n["z"]-1, "cylinder", 1.2, 220, 0, 0, 30)
	setElementInterior(mrk, 2)
	addEventHandler("onMarkerHit", mrk, onFirstMarkerSklad)
	create3dtextlabel(n["x"]-1, n["y"], n["z"] - 0.5, "#ff3300Детали")
end

function zavod( thePlayer, command )
	if(getElementData(thePlayer, "Login") == true) then
		if(getElementData(thePlayer, "Admin") > 0) then
			setElementPosition(thePlayer, 2574.837890625, -1301.08203125, 1044.126220703)
			setElementInterior(thePlayer, 2)
			setElementDimension(thePlayer, 0)
		end
	end
end

function onZavodEnter( thePlayer )
	if(source == pckEnter) then
		setElementPosition(thePlayer, 2574.8955078125, -1294.6396484375, 1044.1262207031)
		setElementRotation(thePlayer, 0, 0, 180.09296875)
		setElementInterior(thePlayer, 2)
	elseif(source == pckExit) then
		setElementPosition(thePlayer, -727.2998046875, 1262.744140625, 11.730819702148)
		setElementInterior(thePlayer, 0)
		if(getElementData(thePlayer, "NWork") == 9) then
			if(getElementData(thePlayer, "Faction") >= 1 and getElementData(thePlayer, "Faction") <= 4) then
				setElementModel(thePlayer, getElementData(thePlayer, "WorkSkin"))
			else
				setElementModel(thePlayer, getElementData(thePlayer, "Skin"))
			end
			local object = getElementData(thePlayer, "ZavodObject")
			if(isElement(object)) then
				destroyElement(object)
			end
			removeElementData(thePlayer, "ZavodObject")
			removeElementData(thePlayer, "zState")
			setElementData(thePlayer, "NWork", 0)
			toggleAllControls(thePlayer, true, true, false)
			addBox("Вы успешно уволились с работы\nИнженером-электриком с завода.", thePlayer, 0, 255, 60)
			setPedAnimation(thePlayer, "BSKTBALL", "BBALL_idle_O", 1, false)
		end
	end
end

addEventHandler("onPickupHit", root, onZavodEnter)
addEventHandler("onMarkerHit", mrkSecSklad, onSecondMarkerSklad)
addEventHandler("onPlayerWasted", root, onPlayerWasted)
addEventHandler("onPlayerPickupHit", root, onPickupHit)
addCommandHandler("zavod",  zavod)