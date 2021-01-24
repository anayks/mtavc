function addBox( t, p, r, g, b )
	exports.myserver:addBox(t, p, r, g, b)
end

function ruchnik( thePlayer )
	if(getElementData(thePlayer, "ToggleVeh") == true) then
		local veh = getPedOccupiedVehicle(thePlayer)
		if(veh ~= false) then
			if(getPedOccupiedVehicleSeat(thePlayer) == 0) then
				local x, y, z = getElementVelocity(veh)
				local vel = math.floor(math.sqrt(x * x + y * y + z * z) * 200)
				if(vel < 2) then
					if(getElementModel(veh) ~= 481 and getElementModel(veh) ~= 453) then
						if(getElementData(veh, "FactionCar") == false) then
							if(isElementFrozen(veh) == true) then
								setElementFrozen(veh, false)
								addBox("Вы сняли автомобиль с ручника.", thePlayer, 255, 255, 0)
							else
								setElementFrozen(veh, true)
								addBox("Вы поставили автомобиль на ручник.", thePlayer, 255, 255, 0)
							end
						end
					end
				end
			end
		end
	end
end

function bindSpace( thePlayer )
	bindKey(thePlayer, "space", "down", ruchnik)
end