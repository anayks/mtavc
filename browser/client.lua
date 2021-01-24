local sw, sh = guiGetScreenSize()
local browser = createBrowser(1920, 1080, true, true)
local GUIStarted = false
local inputTable = {}


function getVehicleRPM(vehicle)
	local vehicleRPM = 0
    if (vehicle) then  
        if (getVehicleEngineState(vehicle) == true) then
            if getVehicleCurrentGear(vehicle) > 0 then        
            	local x, y, z = getElementVelocity(vehicle)     
                vehicleRPM = math.floor(((math.floor(math.sqrt(x * x + y * y + z * z) * 200) / getVehicleCurrentGear(vehicle)) * 160) + 0.5) 
                if (vehicleRPM < 650) then
                    vehicleRPM = math.random(650, 750)
                elseif (vehicleRPM >= 9000) then
                    vehicleRPM = math.random(9000, 9900)
                end
            else
            	local x, y, z = getElementVelocity(vehicle)    
                vehicleRPM = math.floor(((math.floor(math.sqrt(x * x + y * y + z * z)) * 200) * 160) + 0.5)
                if (vehicleRPM < 650) then
                    vehicleRPM = math.random(650, 750)
                elseif (vehicleRPM >= 9000) then
                    vehicleRPM = math.random(9000, 9900)
                end
            end
        else
            vehicleRPM = 0
        end

        return tonumber(vehicleRPM)
    else
        return 0
    end
end

function onClientRender( )
	if(GUIStarted == true) then
		dxDrawImage(0, 0, sw, sh, browser, 0, 0, 0, tocolor(255,255,255,255), false)
	end
	local veh = getPedOccupiedVehicle(getLocalPlayer())
	if(veh ~= false) then
		dxDrawText(getVehicleRPM(veh), 500, 500)
	end
end

addEventHandler("onClientBrowserCreated", browser, 
	function()
		addEventHandler("onClientRender", root, onClientRender)
	end
)

addEventHandler("onClientClick", root, 
    function(button, state) 
    	if(GUIStarted == true) then
		    if state == "down" then 
		        injectBrowserMouseDown(browser, button) 
		    else 
		        injectBrowserMouseUp(browser, button) 
		    end  
		end
end) 

addEventHandler ( "onClientCursorMove", root, 
    function (  relativeX , relativeY , absoluteX , absoluteY ) 
    	if(GUIStarted == true) then
	        injectBrowserMouseMove ( browser, relativeX * 1920 , relativeY * 1080) 
	    end
    end )

function startChooseBrowser( str, arg1, arg2, arg3, arg4, arg5, arg6, arg7 )
	if(str == "login") then
		toggleControl("chatbox", false)
		loadBrowserURL(browser, "http://mta/local/avt/main.html")
		GUIStarted = true
		showCursor(true)
		focusBrowser(browser)
		fadeCamera(false, 1)
	elseif(str == "register") then
		toggleControl("chatbox", false)
		GUIStarted = true
		showCursor(true)
		focusBrowser(browser)
		loadBrowserURL(browser, "http://mta/local/regs/main.html")
		fadeCamera(false, 1)
	elseif(str == "pol") then
		toggleControl("chatbox", false)
		loadBrowserURL(browser, "http://mta/local/html/main.html")
		GUIStarted = true
		showCursor(true)
		focusBrowser(browser)
		fadeCamera(false, 1)
	elseif(str == "input") then
		triggerEvent("onDialogFalse", getLocalPlayer())
		if(inputTable[1] ~= nil) then
			executeBrowserJavascript(browser, "dialogResponseFalse()")
		end
		inputTable[1] = arg1
		inputTable[2] = arg2
		inputTable[3] = arg3
		inputTable[4] = arg4
		inputTable[5] = arg5
		loadBrowserURL(browser, "http://mta/local/input/index.html")
		GUIStarted = true
		showCursor(true)
		focusBrowser()
		toggleControl("chatbox", false)
	elseif(str == "eat") then
		loadBrowserURL(browser, "http://mta/local/eat/index.html")
		GUIStarted = true
		focusBrowser()
		showCursor(true)
		toggleControl("chatbox", false)
		inputTable[2] = arg1
		inputTable[3] = 32
	end
end

function endChooseBrowser( )
	loadBrowserURL(browser, "http://mta/local/index.html")
	GUIStarted = false
	focusBrowser()
	showCursor(false)
	toggleControl("chatbox", true)
end

function checkreg(  )
	triggerEvent("startChooseBrowser", getLocalPlayer(), "eat")
end

addCommandHandler("checkreg", checkreg)

function onClientBrowserDocumentReady( url )
	if(url == "http://mta/local/avt/main.html") then
		executeBrowserJavascript(browser, "document.getElementById(\"pname\").textContent  = \"" .. getPlayerName(localPlayer) .. "\"")
	elseif(url == "http://mta/local/regs/main.html") then
		executeBrowserJavascript(browser, "document.getElementById(\"pname\").textContent  = \"" .. getPlayerName(localPlayer) .. "\"")
	elseif(url == "http://mta/local/input/index.html") then
		focusBrowser()
		local name = inputTable[2]
		local kn1 = inputTable[4]
		local kn2 = inputTable[5]
		executeBrowserJavascript(browser, "editText(\"left-btn\", \"" .. kn1 .. "\");")
		executeBrowserJavascript(browser, "editText(\"right-btn\", \"" .. kn2 .. "\");")
		executeBrowserJavascript(browser, "editText(\"block-name\", \"" .. name .. "\");")
		local text = inputTable[3]
		local iter = 1
		for s in string.gmatch(text, "[^\n]+") do
			executeBrowserJavascript(browser, "addText(\"filler-text\", \"" .. s .. "\");")
		end
		executeBrowserJavascript(browser, "trackLoad();")
	elseif(url == "http://mta/local/eat/index.html") then
		focusBrowser(browser)
		executeBrowserJavascript(browser, "updateEat(" .. inputTable[2] .. ")")
	end
end

function trackBrowser(  )
	focusBrowser(browser)
end

addEvent("trackBrowser", true)
addEventHandler("trackBrowser", root, trackBrowser)

function DialogResponse( boolev, inputtext )
	local try = false
	if(tonumber(boolev) == 1) then
		try = true
	else
		try = false
	end
	triggerServerEvent("onDialogResponse", resourceRoot, inputTable[1], try, inputtext, nil)
	endChooseBrowser()
	inputTable = {}
end

addEvent("DialogResponse", true)
addEventHandler("DialogResponse", root, DialogResponse)

function onClientResourceStart( res )
	if(res == getThisResource()) then
		toggleControl("chatbox", true)
		triggerServerEvent("onClientLoginStart", localPlayer)
	end
end

function tryFalseResponse(  )
	if(inputTable[1] ~= nil) then
		executeBrowserJavascript(browser, "dialogResponseFalse()")
	end
end

function addBox( text, r, g, b )
	exports.myserver:addBox(text, r, g, b)
end

addEvent("tryFalseResponse", true)
addEventHandler("tryFalseResponse", root, tryFalseResponse)

function leftEatChoose(  )
	endChooseBrowser()
	triggerServerEvent("leftChooseEat", getLocalPlayer(), getLocalPlayer())
end

function rightEatChoose(  )
	endChooseBrowser()
	triggerServerEvent("rightChooseEat", getLocalPlayer(), getLocalPlayer())
end

addEvent("leftEatChoose", true)
addEventHandler("leftEatChoose", root, leftEatChoose)
addEvent("rightEatChoose", true)
addEventHandler("rightEatChoose", root, rightEatChoose)


function onClientKey( btn, press )
	if(press == true) then
		if(btn == "escape") then
			if(inputTable[1] ~= nil) then
				cancelEvent()
				executeBrowserJavascript(browser, "dialogResponseFalse()")
			elseif(inputTable[3] == 32) then
				cancelEvent()
				endChooseBrowser()
			end
		elseif(btn == "enter") then
			if(inputTable[1] ~= nil) then
				cancelEvent()
				executeBrowserJavascript(browser, "dialogResponseTrue()")
			end
		end
	end
end

addEventHandler("onClientKey", root, onClientKey)
addEventHandler("onClientResourceStart", root, onClientResourceStart)
addEventHandler("onClientBrowserDocumentReady", root, onClientBrowserDocumentReady)
addEvent("startChooseBrowser", true)
addEventHandler("startChooseBrowser", root, startChooseBrowser)
addEvent("endChooseBrowser", true)
addEventHandler("endChooseBrowser", root, endChooseBrowser)