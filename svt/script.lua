setTrafficLightState("green", "red")

local ignoreIds = {
	548,
	425,
	417,
	487, 
	488, 
	497, 
	563,
	447, 
	469,
	592, 
	577,
	511,
	512,
	593,
	520,
	553,
	476,
	519,
	460,
	513,
	416, 
	427, 
	433, 
	490,
	528,
	407,
	544,
	523,
	470,
	596, 
	597,
	598,
	599,
	601,
}


local svetState = 0

function RedWithYellowToGreen( )
	setTrafficLightState("green", "red")
	setTimer(greenToYellow, 40 * 1000, 1)
	svetState = 0
end

function RedToRedWithYellow(  )
	setTrafficLightState("yellow", "yellow")
	setTimer(RedWithYellowToGreen, 5 * 1000, 1)
	svetState = 2
end

function YellowToRed(  )
	setTrafficLightState("red", "green")
	setTimer(RedToRedWithYellow, 10 * 1000, 1)
	svetState = 1
end

function greenToYellow(  )
	setTrafficLightState("yellow", "yellow")
	setTimer(YellowToRed, 5 * 1000, 1)
	svetState = 2
end

setTimer(greenToYellow, 40 * 1000, 1)

function addBox( t, p, r, g, b )
	exports.myserver:addBox(t, p, r, g, b)
end

function checkSvetofor( arg1, arg2 )
	if(arg1 == client) then
		if(svetState ~= arg2) then
			if(getElementData(arg1, "Shtraf") ~= false) then
				if(getElementData(arg1, "Shtraf") == 1) then
					if(getElementData(arg1, "Admin") == 0) then
						if(getElementData(arg1, "Faction") ~= 8 and getElementData(arg1, "Faction") ~= 7) then
							local money = tonumber(getElementData(arg1, "Money"))
							if(money >= 500) then
								exports.myserver:setElementMoney(arg1, -500, "Штраф")
								addBox("Вы были оштрафованы на 500$,\nЗа то, что проехали на красный свет.", arg1, 255, 0, 0)
							else
								exports.myserver:setLicFu(arg1)
								addBox("Вы были лишены возможности\nУправлять автомобилем за\nМногократные нарушения.", arg1, 255, 0, 0)
							end
							setElementData(arg1, "Shtraf", 2)
						end
					end
				elseif(getElementData(arg1, "Shtraf") == 2) then
					if(getElementData(arg1, "Admin") == 0) then
						if(getElementData(arg1, "Faction") ~= 8 and getElementData(arg1, "Faction") ~= 7) then
							local money = tonumber(getElementData(arg1, "Money"))
							if(money >= 1000) then
								exports.myserver:setElementMoney(arg1, -1000, "Штраф")
								addBox("Вы были оштрафованы на 1000$,\nЗа то, что проехали на красный свет.", arg1, 255, 0, 0)
							else
								exports.myserver:setLicFu(arg1)
								addBox("Вы были лишены возможности\nУправлять автомобилем за\nМногократные нарушения.", arg1, 255, 0, 0)
							end
						end
					end
				end
			else
				if(getElementData(arg1, "Admin") == 0) then
					if(getElementData(arg1, "Faction") ~= 8 and getElementData(arg1, "Faction") ~= 7) then
						setElementData(arg1, "Shtraf", 1)
						local money = tonumber(getElementData(arg1, "Money"))
						if(money >= 250) then
							exports.myserver:setElementMoney(arg1, -250, "Штраф")
							addBox("Вы были оштрафованы на 250$,\nЗа то, что проехали на красный свет.", arg1, 255, 0, 0)
						else
							exports.myserver:setLicFu(arg1)
							addBox("Вы были лишены возможности\nУправлять автомобилем за\nМногократные нарушения.", arg1, 255, 0, 0)
						end
					end
				end
			end
		end
	end
end

removeWorldModel(7396, 15, -921.744140625, 162.1044921875, 9.168563842773)
removeWorldModel(7397, 15, -921.744140625, 162.1044921875, 9.168563842773)
removeWorldModel(7394, 15, -921.744140625, 162.1044921875, 9.168563842773)
removeWorldModel(7428, 15, -921.744140625, 162.1044921875, 9.168563842773)
removeWorldModel(7394, 15, -1026.4287109375, 176.60546875, 11.21845436096)
removeWorldModel(7428, 15, -1026.4287109375, 176.60546875, 11.21845436096)
removeWorldModel(7396, 15, -1026.4287109375, 176.60546875, 11.21845436096)
removeWorldModel(7397, 15, -1026.4287109375, 176.60546875, 11.21845436096)
removeWorldModel(7394, 15, 108.029296875, -908.0263671875, 10.238740921021)
removeWorldModel(7428, 15, 108.029296875, -908.0263671875, 10.238740921021)
removeWorldModel(7396, 15, 108.029296875, -908.0263671875, 10.238740921021)
removeWorldModel(7397, 15, 108.029296875, -908.0263671875, 10.238740921021)

addEvent("checkSvetofor", true)
addEventHandler("checkSvetofor", root, checkSvetofor)