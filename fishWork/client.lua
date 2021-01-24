local shrift = 0
local sw, sh = guiGetScreenSize()
local allState = 0

local firstState = 0
local secondState = 0
local thirdState = 0

local firstTimer = 0
local secTimer = 0
local thirdTimer = 0

function onClientRender(  )
	local x, y, z = getElementPosition(getLocalPlayer())
	local x1, y1, z1 = -636.2724609375, -1480.90234375, 13.76089668273
	local dist = getDistanceBetweenPoints3D(x, y, z, x1, y1, z1)
	if(dist < 1.2) then
		if(allState == 0) then
			dxDrawText("Нажмите E, чтобы поговорить с Леонардом", 		(482) * sw / 1920, 840 * sh / 1080, 1442 * sw / 1920, 633 * sh / 1080, tocolor(30, 30, 30, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
			dxDrawText("Нажмите E, чтобы поговорить с Леонардом", 		(478) * sw / 1920, 840 * sh / 1080, 1438 * sw / 1920, 633 * sh / 1080, tocolor(30, 30, 30, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
			dxDrawText("Нажмите E, чтобы поговорить с Леонардом", 		(480) * sw / 1920, 842 * sh / 1080, 1440 * sw / 1920, 633 * sh / 1080, tocolor(30, 30, 30, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
			dxDrawText("Нажмите E, чтобы поговорить с Леонардом", 		(480) * sw / 1920, 838 * sh / 1080, 1440 * sw / 1920, 633 * sh / 1080, tocolor(30, 30, 30, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
			dxDrawText("Нажмите E, чтобы поговорить с Леонардом", 		(480) * sw / 1920, 840 * sh / 1080, 1440 * sw / 1920, 633 * sh / 1080, tocolor(255, 255, 255, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
		elseif(allState == 1) then
			if(firstState == 0) then
				dxDrawText("Здорова, брат. Работу ищешь? Ну, могу помочь с этим", 		(482) * sw / 1920, 840 * sh / 1080, 1442 * sw / 1920, 633 * sh / 1080, tocolor(30, 30, 30, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
				dxDrawText("Здорова, брат. Работу ищешь? Ну, могу помочь с этим", 		(478) * sw / 1920, 840 * sh / 1080, 1438 * sw / 1920, 633 * sh / 1080, tocolor(30, 30, 30, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
				dxDrawText("Здорова, брат. Работу ищешь? Ну, могу помочь с этим", 		(480) * sw / 1920, 842 * sh / 1080, 1440 * sw / 1920, 633 * sh / 1080, tocolor(30, 30, 30, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
				dxDrawText("Здорова, брат. Работу ищешь? Ну, могу помочь с этим", 		(480) * sw / 1920, 838 * sh / 1080, 1440 * sw / 1920, 633 * sh / 1080, tocolor(30, 30, 30, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
				dxDrawText("Здорова, брат. Работу ищешь? Ну, могу помочь с этим", 		(480) * sw / 1920, 840 * sh / 1080, 1440 * sw / 1920, 633 * sh / 1080, tocolor(255, 255, 255, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
			elseif(firstState == 1) then
				dxDrawText("Рыбачить умеешь? Отлично! Вот тебе снасти и удочка,", 		(482) * sw / 1920, 840 * sh / 1080, 1442 * sw / 1920, 633 * sh / 1080, tocolor(30, 30, 30, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
				dxDrawText("Рыбачить умеешь? Отлично! Вот тебе снасти и удочка,", 		(478) * sw / 1920, 840 * sh / 1080, 1438 * sw / 1920, 633 * sh / 1080, tocolor(30, 30, 30, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
				dxDrawText("Рыбачить умеешь? Отлично! Вот тебе снасти и удочка,", 		(480) * sw / 1920, 842 * sh / 1080, 1440 * sw / 1920, 633 * sh / 1080, tocolor(30, 30, 30, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
				dxDrawText("Рыбачить умеешь? Отлично! Вот тебе снасти и удочка,", 		(480) * sw / 1920, 838 * sh / 1080, 1440 * sw / 1920, 633 * sh / 1080, tocolor(30, 30, 30, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
				dxDrawText("Рыбачить умеешь? Отлично! Вот тебе снасти и удочка,", 		(480) * sw / 1920, 840 * sh / 1080, 1440 * sw / 1920, 633 * sh / 1080, tocolor(255, 255, 255, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
			elseif(firstState == 2) then
				dxDrawText("Лодку на пристани возьми. Сколько наловишь - столько и получишь.", 		(482) * sw / 1920, 840 * sh / 1080, 1442 * sw / 1920, 633 * sh / 1080, tocolor(30, 30, 30, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
				dxDrawText("Лодку на пристани возьми. Сколько наловишь - столько и получишь.", 		(478) * sw / 1920, 840 * sh / 1080, 1438 * sw / 1920, 633 * sh / 1080, tocolor(30, 30, 30, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
				dxDrawText("Лодку на пристани возьми. Сколько наловишь - столько и получишь.", 		(480) * sw / 1920, 842 * sh / 1080, 1440 * sw / 1920, 633 * sh / 1080, tocolor(30, 30, 30, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
				dxDrawText("Лодку на пристани возьми. Сколько наловишь - столько и получишь.", 		(480) * sw / 1920, 838 * sh / 1080, 1440 * sw / 1920, 633 * sh / 1080, tocolor(30, 30, 30, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
				dxDrawText("Лодку на пристани возьми. Сколько наловишь - столько и получишь.", 		(480) * sw / 1920, 840 * sh / 1080, 1440 * sw / 1920, 633 * sh / 1080, tocolor(255, 255, 255, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
			end
		elseif(allState == 2) then
			if(secondState == 0) then
				dxDrawText("Ох, нормальный улов, держи, твоя зелень как и обещал.", 		(482) * sw / 1920, 840 * sh / 1080, 1442 * sw / 1920, 633 * sh / 1080, tocolor(30, 30, 30, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
				dxDrawText("Ох, нормальный улов, держи, твоя зелень как и обещал.", 		(478) * sw / 1920, 840 * sh / 1080, 1438 * sw / 1920, 633 * sh / 1080, tocolor(30, 30, 30, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
				dxDrawText("Ох, нормальный улов, держи, твоя зелень как и обещал.", 		(480) * sw / 1920, 842 * sh / 1080, 1440 * sw / 1920, 633 * sh / 1080, tocolor(30, 30, 30, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
				dxDrawText("Ох, нормальный улов, держи, твоя зелень как и обещал.", 		(480) * sw / 1920, 838 * sh / 1080, 1440 * sw / 1920, 633 * sh / 1080, tocolor(30, 30, 30, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
				dxDrawText("Ох, нормальный улов, держи, твоя зелень как и обещал.", 		(480) * sw / 1920, 840 * sh / 1080, 1440 * sw / 1920, 633 * sh / 1080, tocolor(255, 255, 255, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
			elseif(secondState == 1) then
				dxDrawText("Приходи если надумаешь еще порыбачить", 		(482) * sw / 1920, 840 * sh / 1080, 1442 * sw / 1920, 633 * sh / 1080, tocolor(30, 30, 30, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
				dxDrawText("Приходи если надумаешь еще порыбачить", 		(478) * sw / 1920, 840 * sh / 1080, 1438 * sw / 1920, 633 * sh / 1080, tocolor(30, 30, 30, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
				dxDrawText("Приходи если надумаешь еще порыбачить", 		(480) * sw / 1920, 842 * sh / 1080, 1440 * sw / 1920, 633 * sh / 1080, tocolor(30, 30, 30, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
				dxDrawText("Приходи если надумаешь еще порыбачить", 		(480) * sw / 1920, 838 * sh / 1080, 1440 * sw / 1920, 633 * sh / 1080, tocolor(30, 30, 30, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
				dxDrawText("Приходи если надумаешь еще порыбачить", 		(480) * sw / 1920, 840 * sh / 1080, 1440 * sw / 1920, 633 * sh / 1080, tocolor(255, 255, 255, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top", false, false, true, false, false)
			end
		end
	end
end

function onClientResourceStart( arg1 )
	if(getResourceName(arg1) == "moyserver") then
		shrift = exports.moyserver:sendBebas()
		addEventHandler("onClientRender", root, onClientRender)
	end
end

function onPlayerE(  )
	local x, y, z = getElementPosition(getLocalPlayer())
	local x1, y1, z1 = -636.2724609375, -1480.90234375, 13.76089668273
	local dist = getDistanceBetweenPoints3D(x, y, z, x1, y1, z1)
	if(dist < 1.2) then
		if(allState == 0) then
			triggerServerEvent("onClientTryConnectFish", getLocalPlayer(), getLocalPlayer())
		elseif(allState == 1) then
			if(isTimer(firstTimer)) then
				killTimer(firstTimer)
			end
			firstTimer = 0
			firstState = 0
			allState = 0
			toggleAllControls(true)
			setCameraTarget(getLocalPlayer())
		elseif(allState == 2) then
			if(isTimer(secTimer)) then
				killTimer(secTimer)
			end
			secTimer = 0
			secondState = 0
			allState = 0
			toggleAllControls(true)
			setCameraTarget(getLocalPlayer())
		end
	end
end

function ClearFishingDialog(  )
	allState = 0
	firstState = 0
	if(isTimer(firstTimer)) then
		killTimer(firstTimer)
	end
	firstTimer = 0
	setCameraTarget(getLocalPlayer())
	toggleAllControls(true)
end

function onClientTryStartDialogUstr()
	if(allState == 0) then
		allState = 1
		setElementRotation(getLocalPlayer(), 0, 0, 66.3)
		setCameraMatrix(-633.2255859375, -1478.6640625, 14.754992485046, -636.0869140625, -1480.43359375, 13.760892868042)
		toggleAllControls(false)
		firstTimer = setTimer(function (  )
			local x, y, z = getElementPosition(getLocalPlayer())
			local x1, y1, z1 = -636.2724609375, -1480.90234375, 13.76089668273
			local dist = getDistanceBetweenPoints3D(x, y, z, x1, y1, z1)
			if(dist < 1.2) then
				if(firstState < 2) then
					firstState = firstState + 1
				else
					triggerServerEvent("onClientTryUstrFish", getLocalPlayer(), getLocalPlayer())
				end
			else
				killTimer(firstTimer)
				firstTimer = 0
				firstState = 0
				allState = 0
				toggleAllControls(true)
				setCameraTarget(getLocalPlayer())
			end
		end, 5000, 3)
	else
		if(isTimer(firstTimer)) then
			killTimer(firstTimer)
		end
		firstTimer = 0
		firstState = 0
		allState = 0
		toggleAllControls(true)
		setCameraTarget(getLocalPlayer())
	end
end

function onClientTryUvalFish( )
	if(allState == 0) then
		allState = 2
		setElementRotation(getLocalPlayer(), 0, 0, 66.3)
		setCameraMatrix(-633.2255859375, -1478.6640625, 14.754992485046, -636.0869140625, -1480.43359375, 13.760892868042)
		toggleAllControls(false)
		secTimer = setTimer(function (  )
			local x, y, z = getElementPosition(getLocalPlayer())
			local x1, y1, z1 = -636.2724609375, -1480.90234375, 13.76089668273
			local dist = getDistanceBetweenPoints3D(x, y, z, x1, y1, z1)
			if(dist < 1.2) then
				if(secondState < 1) then
					secondState = secondState + 1
				else
					if(isTimer(secTimer)) then
						killTimer(secTimer)
					end
					secTimer = 0
					secondState = 0
					allState = 0
					toggleAllControls(true)
					setCameraTarget(getLocalPlayer())
				end
			else
				if(isTimer(secTimer)) then
					killTimer(secTimer)
				end
				secTimer = 0
				secondState = 0
				allState = 0
				toggleAllControls(true)
				setCameraTarget(getLocalPlayer())
			end
		end, 5000, 2)
	else
		if(isTimer(secTimer)) then
			killTimer(secTimer)
		end
		secTimer = 0
		secondState = 0
		allState = 0
		toggleAllControls(true)
		setCameraTarget(getLocalPlayer())
	end
end

bindKey("e", "down", onPlayerE)
addEvent("onClientTryStartDialogUstr", true)
addEventHandler("onClientTryStartDialogUstr", root, onClientTryStartDialogUstr)
addEvent("onClientTryUvalFish", true)
addEventHandler("onClientTryUvalFish", root, onClientTryUvalFish)
addEventHandler("onClientResourceStart", root, onClientResourceStart)
addEvent("ClearFishingDialog", true)
addEventHandler("ClearFishingDialog", root, ClearFishingDialog)