function checkskin( player )
	setElementModel(player, 0)
end

createObject(16084, 0, 0, 25)

addCommandHandler("checkskin", checkskin)