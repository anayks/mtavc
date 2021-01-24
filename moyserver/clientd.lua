local Gruz 				= false
local GruzGUI 			= false
local LoaderFull 		= false
local Courier 			= false
local CourierGUI 		= false
local GUI 				= 0
local fisha 			= false
local PassCreated 		= false
local SkillToggle		= false
local CourierStage 		= 0
local PTP 				= {}
local GUITable 			= {}
local GUIID 			= 0
local spectate 			= false
local canLoaderEnd 		= false
local Mojno				= true
local sex   			= 1

local SkinTable 		= 
{
	[1] = 2,
	[2] = 27,
	[3] = 250,
}

local WomanTable =
{
	[1] = 148,
	[2] = 141,
	[3] = 150,
}

local lastVeh			= 0
local lastpos			= 0
local lastvehpos		= 0
local skillz			= {}
local SkinTarget 		= 1
local GUIType 			= 0
local Avt 				= false
local defpos			= 0
local PT 				= {}
local alg 				= false
local shrift 			= dxCreateFont("SFUIText-Regular.ttf", 14, false, "proof")
local shr 				= dxCreateFont("SFUIText-Heavy.ttf", 14, false, "proof")
local PricedownMod 		= dxCreateFont("pricedownbl.ttf", 96, false, "proof")
local PricedownLow		= dxCreateFont("MenuUI/Fonts/AvertaCyrillicRegular.otf", 36, false, "proof")
local AvertaReg			= dxCreateFont("MenuUI/Fonts/AvertaCyrillicRegular.otf", 14, true, "proof")
local AvertaRegSmall	= dxCreateFont("MenuUI/Fonts/AvertaCyrillicRegular.otf", 10, true, "proof")
local AvertaRegSmallest	= dxCreateFont("MenuUI/Fonts/AvertaCyrillicRegular.otf", 8, true, "proof")
local AvertaRegBig		= dxCreateFont("MenuUI/Fonts/AvertaCyrillicRegular.otf", 24, true, "proof")
local AvertaLight		= dxCreateFont("MenuUI/Fonts/AvertaCyrillicLightItalic.otf", 12)
local AvertaLightSmall	= dxCreateFont("MenuUI/Fonts/AvertaCyrillicLightItalic.otf", 10)
local AvertaLightBold	= dxCreateFont("MenuUI/Fonts/AvertaCyrillicLightItalic.otf", 24)
local Robotto			= dxCreateFont("CaptureUI/Fonts/Roboto-Medium.ttf", 24, false, "proof")
local RobottoItalic		= dxCreateFont("CaptureUI/Fonts/Roboto-BoldItalic.ttf", 24, false, "proof")
local AvertaBold		= dxCreateFont("MenuUI/Fonts/AvertaCyrillicSemiBold.otf", 42, false, "proof")
local AvertaBoldBig		= dxCreateFont("MenuUI/Fonts/AvertaCyrillicSemiBold.otf", 24, false, "proof")
local AvertaBoldSmall	= dxCreateFont("MenuUI/Fonts/AvertaCyrillicSemiBold.otf", 14, false, "proof")
local AvertaBoldSmallest= dxCreateFont("MenuUI/Fonts/AvertaCyrillicSemiBold.otf", 10, false, "proof")
local UniSans			= dxCreateFont("SkinShopUI/Fonts/8519.otf", 42, false, "proof")
local BebasNeueBig		= dxCreateFont("CarBuyUI/Fonts/bebas-neue-bold.ttf", 26, false, "proof")
local BebasNeue			= dxCreateFont("CarBuyUI/Fonts/bebas-neue-bold.ttf", 24, false, "proof")
local BebasNeueSm		= dxCreateFont("CarBuyUI/Fonts/bebas-neue-bold.ttf", 20, false, "proof")
local BebasNeueSmall	= dxCreateFont("CarBuyUI/Fonts/bebas-neue-bold.ttf", 18, false, "proof")
local RBold				= dxCreateFont("BankUI/Fonts/Roboto-Bold.ttf", 14, false, "proof")
local BankCache			= {}
local EXP 				= 0
local LVL 				= 0
local Food 				= 0
local ChatTable 		= {}
local LoginPass 		= ""
local act 				= false
local alo 				= ""
local listitem 			= 0
local cpt				= false
local cptmaf1			= 0
local cptmaf2			= 0
local cptscore1			= 0
local cptscore2			= 0
local LoginCD 			= false
local errorpassword 	= 0
local TableZZ 			= {}
local Please 			= {}
local RegisterUI 		= {}
local pogr 				= 0
local lastpogr 			= 0
local prg 				= {}
local notif 			= {}
local CaptureUI			= {}
local M4Shots 			= 0
local Ak47Shots 		= 0
local DeagleShots 		= 0
local ShotgunShots		= 0
local str 				= "a"
local Driver 			= false
local FishTimer 		= ""
local HudToggle 		= false
local NewHUD 			= {}
local Menu 				= {}
local PInfo 			= {}
local mrkFishUl			= 0
local blpFishUl			= 0
local FishMark 			= false
local FishBoat			= 0
local rad 				= 0
local FishUI 			= {}
local SkinShopUI		= {}
local capttime			= 0
local SkinShop 			= false
local SkinsCache		= {}
local CarBuyUI			= {}
local CarBuy 			= false
local CarCache			= {}
local MenuToggle 		= {}
local attached3dtext	= {}
local CacheClient		= {}
local cacheattach		= {}
local repString 		= ""
local repShift 			= false
local NameToggle		= true
local HudAlpha			= 10
local SkillBuy			= 0
local PHD 				= true
local PCD 				= true
local SCV 				= true
local checkout 			= 0
local Usk 				= false
local SpeedUI 			= {}
local BankUI			= {}
local RegaruUI			= {}
local CanFish 			= false
local biztarget			= 0
local wartarget			= 0
local AllPerems			= {}
local biz 				= false
local Bank 				= {}
Bank[1] 				= false
Bank[2]					= 0
local afktime 			= 0
local warior			= ""
local TableAttach		= {}
local timerattach 		= {}
local zorka 			= 0

local FishTable			= 
{
	[1]	= {["Name"]="Белый осётр",			},
	[2] = {["Name"]="Сом",					},
	[3] = {["Name"]="Красноперая щука",		},
	[4] = {["Name"]="Желтый окунь",			},
	[5] = {["Name"]="Игловидная фарловелла"	},
	[6] = {["Name"]="Обыкновенная гамбузия"	},
	[7] = {["Name"]="Ушастый окунь",		},
	[8]	= {["Name"]="Пират-окунь",			}
}

for i=1,4 do
	skillz[i] = 0
end

AllPerems["showfps"] = false
AllPerems["Pokupka"] = false

function attach3dtext( tablo )
	local stablo = tablo
	local id = stablo["ID"]
	if(timerattach[id] ~= nil) then
		killTimer(timerattach[id])
		timerattach[id] = nil
	end
	attached3dtext[id] = {}
	attached3dtext[id]["Element"] 	= stablo["Element"]
	attached3dtext[id]["x"] 		= stablo["x"]
	attached3dtext[id]["y"] 		= stablo["y"]
	attached3dtext[id]["z"] 		= stablo["z"]
	attached3dtext[id]["Text"] 		= stablo["Text"]
	timerattach[id] = setTimer(function ( a )
		if(attached3dtext[a] ~= nil) then
			attached3dtext[a] = nil
		end
		timerattach[a] = nil
	end, 3000, 1, id)
end

addEvent("attach3dtext", true)
addEventHandler("attach3dtext", root, attach3dtext)

local FishTimerEsc = 0
local waitingFish = false
local FishLimit = 0
local NapomTimer = 0
local IDV = 0
local SkillsUI = {}

RegaruUI[1]		=	dxCreateTexture("Regaru/Choose.png", "argb", true)

SkillsUI[1]		=	dxCreateTexture("SkillsUI/Exit.png", "argb", true)
SkillsUI[2]		=	dxCreateTexture("SkillsUI/Back.png", "argb", true)

BankUI[1]		=	dxCreateTexture("BankUI/IN.png", "argb", true)
BankUI[2]		=	dxCreateTexture("BankUI/Nalog1.png", "argb", true)
BankUI[3]		=	dxCreateTexture("BankUI/Nalog2.png", "argb", true)
BankUI[4]		=	dxCreateTexture("BankUI/Nalog3.png", "argb", true)
BankUI[5]		=	dxCreateTexture("BankUI/NalogAZS.png", "argb", true)
BankUI[6]		=	dxCreateTexture("BankUI/NalogBIZ.png", "argb", true)
BankUI[7]		=	dxCreateTexture("BankUI/NalogDOM.png", "argb", true)
BankUI[8]		=	dxCreateTexture("BankUI/OUT.png", "argb", true)
BankUI[9]		=	dxCreateTexture("BankUI/OutMoney.png", "argb", true)
BankUI[10]		=	dxCreateTexture("BankUI/Phone.png", "argb", true)
BankUI[11]		=	dxCreateTexture("BankUI/RIGHT.png", "argb", true)
BankUI[12]		=	dxCreateTexture("BankUI/TopUp.png", "argb", true)
BankUI[13]		=	dxCreateTexture("BankUI/Trans.png", "argb", true)
BankUI[14]		=	dxCreateTexture("BankUI/Nalog0.png", "argb", true)

CaptureUI[1] 	=	dxCreateTexture("CaptureUI/Back.png", "argb", true)
CaptureUI[2] 	=	dxCreateTexture("CaptureUI/Start.png", "argb", true)
CaptureUI[3] 	=	dxCreateTexture("CaptureUI/Trash.png", "argb", true)
CaptureUI[4] 	=	dxCreateTexture("CaptureUI/TrashN.png", "argb", true)
CaptureUI[5] 	=	dxCreateTexture("CaptureUI/Beach.png", "argb", true)
CaptureUI[6] 	=	dxCreateTexture("CaptureUI/BeachN.png", "argb", true)
CaptureUI[7] 	=	dxCreateTexture("CaptureUI/Cinema.png", "argb", true)
CaptureUI[8] 	=	dxCreateTexture("CaptureUI/CinemaN.png", "argb", true)

SpeedUI[1]		=	dxCreateTexture("SpeedUI/Back.png", "argb", true)
SpeedUI[2]		=	dxCreateTexture("SpeedUI/Fuel.png", "argb", true)
SpeedUI[3]		=	dxCreateTexture("SpeedUI/LightsOn.png", "argb", true)
SpeedUI[4]		=	dxCreateTexture("SpeedUI/LightsOff.png", "argb", true)
SpeedUI[5]		=	dxCreateTexture("SpeedUI/EngOn.png", "argb", true)
SpeedUI[6]		=	dxCreateTexture("SpeedUI/EngOff.png", "argb", true)
SpeedUI[7]		=	dxCreateTexture("SpeedUI/VehLock.png", "argb", true)
SpeedUI[8]		=	dxCreateTexture("SpeedUI/VehNotLock.png", "argb", true)

CarBuyUI[1] 	= 	dxCreateTexture("CarBuyUI/back.png", "argb", true)
CarBuyUI[2] 	= 	dxCreateTexture("CarBuyUI/DollarIcon.png", "argb", true)
CarBuyUI[3] 	= 	dxCreateTexture("CarBuyUI/ButtonBuy.png", "argb", true)
CarBuyUI[4] 	= 	dxCreateTexture("CarBuyUI/ButtonExit.png", "argb", true)
CarBuyUI[5] 	= 	dxCreateTexture("CarBuyUI/CarColors/White.png", "argb", true)
CarBuyUI[6] 	= 	dxCreateTexture("CarBuyUI/CarColors/Gray.png", "argb", true)
CarBuyUI[7] 	= 	dxCreateTexture("CarBuyUI/CarColors/Black.png", "argb", true)
CarBuyUI[8] 	= 	dxCreateTexture("CarBuyUI/CarColors/Red.png", "argb", true)
CarBuyUI[9] 	= 	dxCreateTexture("CarBuyUI/CarColors/Yellow.png", "argb", true)
CarBuyUI[10] 	= 	dxCreateTexture("CarBuyUI/CarColors/Blue.png", "argb", true)
CarBuyUI[11] 	=	dxCreateTexture("CarBuyUI/ArrowUp.png", "argb", true)
CarBuyUI[12] 	=	dxCreateTexture("CarBuyUI/ArrowDown.png", "argb", true)

SkinShopUI[1] 	=	dxCreateTexture("SkinShopUI/Back.png", "argb", true)
SkinShopUI[2] 	=	dxCreateTexture("SkinShopUI/ButtonBuy.png", "argb", true)
SkinShopUI[3] 	=	dxCreateTexture("SkinShopUI/ButtonExit.png", "argb", true)
SkinShopUI[4] 	=	dxCreateTexture("SkinShopUI/ButtonLeft.png", "argb", true)
SkinShopUI[5] 	=	dxCreateTexture("SkinShopUI/ButtonRight.png", "argb", true)
SkinShopUI[6] 	=	dxCreateTexture("SkinShopUI/DollarIcon.png", "argb", true)

FishUI[1] 		= 	dxCreateTexture("FishUI/Back.png", "argb", true)
FishUI[2] 		= 	dxCreateTexture("FishUI/MouseA.png", "argb", true)
FishUI[3] 		= 	dxCreateTexture("FishUI/MouseB.png", "argb", true)

Menu[1] 		= 	{}
Menu[1][1] 		= 	dxCreateTexture("MenuUI/MainBack.png", "argb", true)
Menu[1][2] 		= 	dxCreateTexture("MenuUI/Settings/Back.png", "argb", true)
Menu[1][3]		=	dxCreateTexture("MenuUI/Donate/Back.png", "argb", true)
Menu[2] 		=	dxCreateTexture("MenuUI/Ava.png", "argb", true)
Menu[3] 		=	dxCreateTexture("MenuUI/StatsBack.png", "argb", true)
Menu[4] 		=	dxCreateTexture("MenuUI/Choose.png", "argb", true)
Menu[5] 		=	dxCreateTexture("MenuUI/Level/Back.png", "argb", true)
Menu[6] 		=	dxCreateTexture("MenuUI/Faction/Back.png", "argb", true)
Menu[7] 		=	dxCreateTexture("MenuUI/Icons/1.png", "argb", true)
Menu[8] 		=	dxCreateTexture("MenuUI/Icons/2.png", "argb", true)
Menu[9] 		=	dxCreateTexture("MenuUI/Icons/3.png", "argb", true)
Menu[10] 		=	dxCreateTexture("MenuUI/Icons/4.png", "argb", true)
Menu[11] 		=	dxCreateTexture("MenuUI/Icons/5.png", "argb", true)
Menu[12] 		=	dxCreateTexture("MenuUI/Icons/6.png", "argb", true)
Menu[13] 		=	dxCreateTexture("MenuUI/Icons/8.png", "argb", true)
Menu[14] 		=	dxCreateTexture("MenuUI/Icons/7.png", "argb", true)
Menu[15] 		=	{}
Menu[15][1] 	= 	dxCreateTexture("MenuUI/Faction/MafItalian.png", "argb", true)
Menu[15][2] 	= 	dxCreateTexture("MenuUI/Faction/MafColumbian.png", "argb", true)
Menu[15][3] 	= 	dxCreateTexture("MenuUI/Faction/MafMexico.png", "argb", true)
Menu[15][4] 	=	dxCreateTexture("MenuUI/Faction/MafTriada.png")
Menu[15][5] 	= 	dxCreateTexture("MenuUI/Faction/CityHall.png", "argb", true)
Menu[15][6] 	= 	dxCreateTexture("MenuUI/Faction/ViceNews.png", "argb", true)
Menu[15][7] 	= 	dxCreateTexture("MenuUI/Faction/EMS.png", "argb", true)
Menu[15][8] 	=	dxCreateTexture("MenuUI/Faction/Police.png")
Menu[15][9] 	= 	dxCreateTexture("MenuUI/Faction/Army.png", "argb", true)
Menu[16] 		= 	{}
Menu[16][1] 	= 	dxCreateTexture("MenuUI/Level/1iz8.png", "argb", true)
Menu[16][2] 	= 	dxCreateTexture("MenuUI/Level/1iz8.png", "argb", true)
Menu[16][3] 	= 	dxCreateTexture("MenuUI/Level/2iz8.png", "argb", true)
Menu[16][4] 	= 	dxCreateTexture("MenuUI/Level/3iz8.png", "argb", true)
Menu[16][5] 	= 	dxCreateTexture("MenuUI/Level/4iz8.png", "argb", true)
Menu[16][6] 	= 	dxCreateTexture("MenuUI/Level/5iz8.png", "argb", true)
Menu[16][7] 	= 	dxCreateTexture("MenuUI/Level/6iz8.png", "argb", true)
Menu[16][8] 	= 	dxCreateTexture("MenuUI/Level/7iz8.png", "argb", true)
Menu[17] 		= 	dxCreateTexture("MenuUI/Exit.png", "argb", true)
Menu[18]		=	dxCreateTexture("MenuUI/Report/ReportButton.png", "argb", true)
Menu[19]		=	dxCreateTexture("MenuUI/Report/ReportWindow.png", "argb", true)
Menu[20]		=	dxCreateTexture("MenuUI/Settings/Panel.png", "argb", true)
Menu[21]		=	dxCreateTexture("MenuUI/Settings/Save.png", "argb", true)
Menu[22]		=	dxCreateTexture("MenuUI/Settings/Activated.png", "argb", true)
Menu[23]		=	dxCreateTexture("MenuUI/Settings/Deactivated.png", "argb", true)
Menu[24]		=	{}
Menu[24][1]		=	dxCreateTexture("MenuUI/Settings/Alpha/0p.png", "argb", true)
Menu[24][2]		=	dxCreateTexture("MenuUI/Settings/Alpha/10p.png", "argb", true)
Menu[24][3]		=	dxCreateTexture("MenuUI/Settings/Alpha/20p.png", "argb", true)
Menu[24][4]		=	dxCreateTexture("MenuUI/Settings/Alpha/30p.png", "argb", true)
Menu[24][5]		=	dxCreateTexture("MenuUI/Settings/Alpha/40p.png", "argb", true)
Menu[24][6]		=	dxCreateTexture("MenuUI/Settings/Alpha/50p.png", "argb", true)
Menu[24][7]		=	dxCreateTexture("MenuUI/Settings/Alpha/60p.png", "argb", true)
Menu[24][8]		=	dxCreateTexture("MenuUI/Settings/Alpha/70p.png", "argb", true)
Menu[24][9]		=	dxCreateTexture("MenuUI/Settings/Alpha/80p.png", "argb", true)
Menu[24][10]	=	dxCreateTexture("MenuUI/Settings/Alpha/90p.png", "argb", true)
Menu[24][11]	=	dxCreateTexture("MenuUI/Settings/Alpha/100p.png", "argb", true)
Menu[25]		=	dxCreateTexture("MenuUI/Rules/Back.png", "argb", true)
Menu[26]		=	{}
Menu[26][1]		=	dxCreateTexture("MenuUI/Commands/Main.png", "argb", true)
Menu[26][2]		=	dxCreateTexture("MenuUI/Commands/Chat.png", "argb", true)
Menu[26][3]		=	dxCreateTexture("MenuUI/Commands/Faction1.png", "argb", true)
Menu[26][4]		=	dxCreateTexture("MenuUI/Commands/Faction2.png", "argb", true)
Menu[26][5]		=	dxCreateTexture("MenuUI/Commands/Faction3.png", "argb", true)
Menu[26][6]		=	dxCreateTexture("MenuUI/Commands/Faction4.png", "argb", true)
Menu[26][7]		=	dxCreateTexture("MenuUI/Commands/Vehicle.png", "argb", true)
Menu[26][8]		=	dxCreateTexture("MenuUI/Commands/Mafia.png", "argb", true)
Menu[26][9]		=	dxCreateTexture("MenuUI/Commands/Leader.png", "argb", true)
Menu[26][10]	=	dxCreateTexture("MenuUI/Commands/ArrowLeft.png", "argb", true)
Menu[26][11]	=	dxCreateTexture("MenuUI/Commands/ArrowRight.png", "argb", true)
Menu[27]		=	{}
Menu[27][1]		=	dxCreateTexture("MenuUI/Donate/Wallet/Mouse.png", "argb", true)
Menu[27][2]		=	dxCreateTexture("MenuUI/Donate/Wallet/MouseHover.png", "argb", true)
Menu[28]		=	{}
Menu[28][1]		=	dxCreateTexture("MenuUI/Donate/Name/Mouse.png", "argb", true)
Menu[28][2]		=	dxCreateTexture("MenuUI/Donate/Name/MouseHover.png", "argb", true)
Menu[29]		=	{}
Menu[29][1]		=	dxCreateTexture("MenuUI/Donate/Unwarn/Mouse.png", "argb", true)
Menu[29][2]		=	dxCreateTexture("MenuUI/Donate/Unwarn/MouseHover.png", "argb", true)
Menu[29][3]		=	dxCreateTexture("MenuUI/Donate/Unwarn/NoMouse.png", "argb", true)
Menu[30]		=	{}
Menu[30][1]		=	{}
Menu[30][1][1]	=	dxCreateTexture("MenuUI/Donate/License/Drive.png", "argb", true)
Menu[30][1][2]	=	dxCreateTexture("MenuUI/Donate/License/DriveHover.png", "argb", true)
Menu[30][2]		=	{}
Menu[30][2][1]	=	dxCreateTexture("MenuUI/Donate/License/Fly.png", "argb", true)
Menu[30][2][2]	=	dxCreateTexture("MenuUI/Donate/License/FlyHover.png", "argb", true)
Menu[30][3]		=	{}
Menu[30][3][1]	=	dxCreateTexture("MenuUI/Donate/License/Weapon.png", "argb", true)
Menu[30][3][2]	=	dxCreateTexture("MenuUI/Donate/License/WeaponHover.png", "argb", true)
Menu[31]		=	dxCreateTexture("MenuUI/Donate/ArrowLeft.png", "argb", true)
Menu[32]		=	dxCreateTexture("MenuUI/Donate/ArrowRight.png", "argb", true)
Menu[33]		=	{}
Menu[33][1]		=	{}
Menu[33][1][1]	=	dxCreateTexture("MenuUI/Donate/Skills/Ak47.png", "argb", true)
Menu[33][1][2]	=	dxCreateTexture("MenuUI/Donate/Skills/Ak47Hover.png", "argb", true)
Menu[33][2]		=	{}
Menu[33][2][1]	=	dxCreateTexture("MenuUI/Donate/Skills/Deagle.png", "argb", true)
Menu[33][2][2]	=	dxCreateTexture("MenuUI/Donate/Skills/DeagleHover.png", "argb", true)
Menu[33][3]		=	{}
Menu[33][3][1]	=	dxCreateTexture("MenuUI/Donate/Skills/M4.png", "argb", true)
Menu[33][3][2]	=	dxCreateTexture("MenuUI/Donate/Skills/M4Hover.png", "argb", true)
Menu[33][4]		=	{}
Menu[33][4][1]	=	dxCreateTexture("MenuUI/Donate/Skills/Shotgun.png", "argb", true)
Menu[33][4][2]	=	dxCreateTexture("MenuUI/Donate/Skills/ShotgunHover.png", "argb", true)
Menu[33][5]		=	{}
Menu[33][5][1]	=	dxCreateTexture("MenuUI/Donate/Skills/Fish.png", "argb", true)
Menu[33][5][2]	=	dxCreateTexture("MenuUI/Donate/Skills/FishHover.png", "argb", true)
Menu[38]		=	{}
Menu[38][1]		=	dxCreateTexture("MenuUI/Donate/Sub/Basic.png", "argb", true)
Menu[38][2]		=	dxCreateTexture("MenuUI/Donate/Sub/BasicHover.png", "argb", true)
Menu[38][3]		=	dxCreateTexture("MenuUI/Donate/Sub/Advance.png", "argb", true)
Menu[38][4]		=	dxCreateTexture("MenuUI/Donate/Sub/AdvanceHover.png", "argb", true)
Menu[38][5]		=	dxCreateTexture("MenuUI/Donate/Sub/Extended.png", "argb", true)
Menu[38][6]		=	dxCreateTexture("MenuUI/Donate/Sub/ExtendedHover.png", "argb", true)
Menu[38][7]		=	dxCreateTexture("MenuUI/Donate/Sub/Premium.png", "argb", true)
Menu[38][8]		=	dxCreateTexture("MenuUI/Donate/Sub/PremiumHover.png", "argb", true)
Menu[38][9]		=	dxCreateTexture("MenuUI/Donate/Sub/Back.png", "argb", true)
Menu[39]		=	{}
Menu[39][1]		=	dxCreateTexture("MenuUI/Donate/Promo/Back.png", "argb", true)
Menu[39][2]		=	dxCreateTexture("MenuUI/Donate/Promo/Accept.png", "argb", true)
Menu[39][3]		=	dxCreateTexture("MenuUI/Donate/Promo/Window.png", "argb", true)
Menu[40]		=	dxCreateTexture("MenuUI/Donate/Balance/Back.png", "argb", true)

function addBox( text, r, g, b )
	local da = 0
	for i, n in pairs(notif) do
		da = da + 1
	end
	if(da < 4) then
		local i = table.maxn(notif) + 1
		notif[i] = {}
		notif[i]["ProofedText"] = {}
		local l = 1
		for s in string.gmatch(text, "[^\n]+") do
			notif[i]["ProofedText"][l] = s 
			l = l + 1
			notif[i]["Height"] = 50 + (l - 2) * 24
			notif[i]["y"] = 650 - notif[i]["Height"] + 50
		end
		notif[i]["Lines"] = l - 1
		notif[i]["R"] = r
		notif[i]["G"] = g
		notif[i]["B"] = b
		if(i > 1) then
			for k, n in pairs(notif) do
				if(k ~= table.maxn(notif)) then
					notif[k]["y"] = notif[k]["y"] - notif[table.maxn(notif)]["Height"] - 20
				end
			end
		end
		setTimer(function ( d )
			notif[d] = nil
		end, 15000, 1, i)
	else
		local min = table.maxn(notif)
		for i, n in pairs(notif) do
			if(i < min) then
				min = i
			end
		end
		notif[min] = nil
		local i = table.maxn(notif) + 1
		notif[i] = {}
		notif[i]["ProofedText"] = {}
		local l = 1
		for s in string.gmatch(text, "[^\n]+") do
			notif[i]["ProofedText"][l] = s 
			l = l + 1
			notif[i]["Height"] = 50 + (l - 2) * 24
			notif[i]["y"] = 650 - notif[i]["Height"] + 50
		end
		notif[i]["Lines"] = l - 1
		notif[i]["R"] = r
		notif[i]["G"] = g
		notif[i]["B"] = b
		if(i > 1) then
			for k, n in pairs(notif) do
				if(k ~= table.maxn(notif)) then
					notif[k]["y"] = notif[k]["y"] - notif[table.maxn(notif)]["Height"] - 20
				end
			end
		end
		setTimer(function ( d )
			notif[d] = nil
		end, 15000, 1, i)
	end
end

function checkVeh( )
	if(getPedContactElement(getLocalPlayer()) ~= false) then
		local el = getPedContactElement(localPlayer)
		if(getElementType(el) == "vehicle") then
			local veh = el
			setElementVelocity(localPlayer, 0, 0, 0)
		end
	end
end

function onUsk( )
	if(getPedOccupiedVehicle(getLocalPlayer()) ~= false) then
		if(Usk == true) then
			local veh = getPedOccupiedVehicle(getLocalPlayer())
			local x, y, z = getElementVelocity(veh)
			setElementVelocity(veh, x * 1.2, y * 1.2, z * 1.2)
		end
	end
end

bindKey("lalt", "up", onUsk)
setTimer(checkVeh, 400, 0)

local keyTable = 
{
	["a"]=true,
	["b"]=true,
	["c"]=true,
	["d"]=true,
	["e"]=true,
	["f"]=true,
	["g"]=true,
	["h"]=true,
	["i"]=true,
	["j"]=true,
	["k"]=true,
	["l"]=true,
	["m"]=true,
	["n"]=true,
	["o"]=true,
	["p"]=true,
	["q"]=true,
	["r"]=true,
	["s"]=true,
	["t"]=true,
	["u"]=true,
	["v"]=true,
	["w"]=true,
	["x"]=true,
	["y"]=true,
	["z"]=true,
	["_"]=true,
	["1"]=true,
	["2"]=true,
	["3"]=true,
	["4"]=true,
	["5"]=true,
	["6"]=true,
	["7"]=true,
	["8"]=true,
	["9"]=true,
	["0"]=true
}

local repTable = 
{
	["f"]={["Raz"]=true, ["Symbol"]="а", 	["SS"]="А"},
	[","]={["Raz"]=true, ["Symbol"]="б", 	["SS"]="Б"},
	["d"]={["Raz"]=true, ["Symbol"]="в", 	["SS"]="В"},
	["u"]={["Raz"]=true, ["Symbol"]="г", 	["SS"]="Г"},
	["l"]={["Raz"]=true, ["Symbol"]="д", 	["SS"]="Д"},
	["t"]={["Raz"]=true, ["Symbol"]="е", 	["SS"]="Е"},
	["`"]={["Raz"]=true, ["Symbol"]="ё", 	["SS"]="Ё"},
	[";"]={["Raz"]=true, ["Symbol"]="ж", 	["SS"]="Ж"},
	["p"]={["Raz"]=true, ["Symbol"]="з", 	["SS"]="З"},
	["b"]={["Raz"]=true, ["Symbol"]="и", 	["SS"]="И"},
	["q"]={["Raz"]=true, ["Symbol"]="й", 	["SS"]="Й"},
	["r"]={["Raz"]=true, ["Symbol"]="к", 	["SS"]="К"},
	["k"]={["Raz"]=true, ["Symbol"]="л", 	["SS"]="Л"},
	["v"]={["Raz"]=true, ["Symbol"]="м", 	["SS"]="М"},
	["y"]={["Raz"]=true, ["Symbol"]="н", 	["SS"]="Н"},
	["j"]={["Raz"]=true, ["Symbol"]="о", 	["SS"]="О"},
	["g"]={["Raz"]=true, ["Symbol"]="п", 	["SS"]="П"},
	["h"]={["Raz"]=true, ["Symbol"]="р", 	["SS"]="Р"},
	["c"]={["Raz"]=true, ["Symbol"]="с", 	["SS"]="С"},
	["n"]={["Raz"]=true, ["Symbol"]="т", 	["SS"]="Т"},
	["e"]={["Raz"]=true, ["Symbol"]="у", 	["SS"]="У"},
	["a"]={["Raz"]=true, ["Symbol"]="ф", 	["SS"]="Ф"},
	["["]={["Raz"]=true, ["Symbol"]="х", 	["SS"]="Х"},
	["w"]={["Raz"]=true, ["Symbol"]="ц", 	["SS"]="Ц"},
	["x"]={["Raz"]=true, ["Symbol"]="ч", 	["SS"]="Ч"},
	["i"]={["Raz"]=true, ["Symbol"]="ш", 	["SS"]="Ш"},
	["o"]={["Raz"]=true, ["Symbol"]="щ", 	["SS"]="Щ"},
	["]"]={["Raz"]=true, ["Symbol"]="ъ", 	["SS"]="Ъ"},
	["s"]={["Raz"]=true, ["Symbol"]="ы", 	["SS"]="Ы"},
	["m"]={["Raz"]=true, ["Symbol"]="ь", 	["SS"]="Ь"},
	["#"]={["Raz"]=true, ["Symbol"]="э",	["SS"]="Э"},
	["."]={["Raz"]=true, ["Symbol"]="ю",	["SS"]="Ю"},
	["z"]={["Raz"]=true, ["Symbol"]="я",	["SS"]="Я"},
	["1"]={["Raz"]=true, ["Symbol"]="1"},
	["2"]={["Raz"]=true, ["Symbol"]="2"},
	["3"]={["Raz"]=true, ["Symbol"]="3"},
	["4"]={["Raz"]=true, ["Symbol"]="4"},
	["5"]={["Raz"]=true, ["Symbol"]="5"},
	["6"]={["Raz"]=true, ["Symbol"]="6"},
	["7"]={["Raz"]=true, ["Symbol"]="7"},
	["8"]={["Raz"]=true, ["Symbol"]="8"},
	["9"]={["Raz"]=true, ["Symbol"]="9"},
	["0"]={["Raz"]=true, ["Symbol"]="0"},
	["/"]={["Raz"]=true, ["Symbol"]="."},
	["-"]={["Raz"]=true, ["Symbol"]="-"},
}

local NumberTable = 
{
	["0"]=true,
	["1"]=true,
	["2"]=true,
	["3"]=true,
	["4"]=true,
	["5"]=true,
	["6"]=true,
	["7"]=true,
	["8"]=true,
	["9"]=true,
}

local NameTable = 
{
	["a"]={["Raz"]=true, ["SS"]="A"},
	["b"]={["Raz"]=true, ["SS"]="B"},
	["c"]={["Raz"]=true, ["SS"]="C"},
	["d"]={["Raz"]=true, ["SS"]="D"},
	["e"]={["Raz"]=true, ["SS"]="E"},
	["f"]={["Raz"]=true, ["SS"]="F"},
	["g"]={["Raz"]=true, ["SS"]="G"},
	["h"]={["Raz"]=true, ["SS"]="H"},
	["i"]={["Raz"]=true, ["SS"]="I"},
	["j"]={["Raz"]=true, ["SS"]="J"},
	["k"]={["Raz"]=true, ["SS"]="K"},
	["l"]={["Raz"]=true, ["SS"]="L"},
	["m"]={["Raz"]=true, ["SS"]="M"},
	["n"]={["Raz"]=true, ["SS"]="N"},
	["o"]={["Raz"]=true, ["SS"]="O"},
	["p"]={["Raz"]=true, ["SS"]="P"},
	["q"]={["Raz"]=true, ["SS"]="Q"},
	["r"]={["Raz"]=true, ["SS"]="R"},
	["s"]={["Raz"]=true, ["SS"]="S"},
	["t"]={["Raz"]=true, ["SS"]="T"},
	["u"]={["Raz"]=true, ["SS"]="U"},
	["v"]={["Raz"]=true, ["SS"]="V"},
	["w"]={["Raz"]=true, ["SS"]="W"},
	["x"]={["Raz"]=true, ["SS"]="X"},
	["y"]={["Raz"]=true, ["SS"]="Y"},
	["z"]={["Raz"]=true, ["SS"]="Z"}
}

local PromoTable = 
{
	["a"]={["Raz"]=true, ["SS"]="A"},
	["b"]={["Raz"]=true, ["SS"]="B"},
	["c"]={["Raz"]=true, ["SS"]="C"},
	["d"]={["Raz"]=true, ["SS"]="D"},
	["e"]={["Raz"]=true, ["SS"]="E"},
	["f"]={["Raz"]=true, ["SS"]="F"},
	["g"]={["Raz"]=true, ["SS"]="G"},
	["h"]={["Raz"]=true, ["SS"]="H"},
	["i"]={["Raz"]=true, ["SS"]="I"},
	["j"]={["Raz"]=true, ["SS"]="J"},
	["k"]={["Raz"]=true, ["SS"]="K"},
	["l"]={["Raz"]=true, ["SS"]="L"},
	["m"]={["Raz"]=true, ["SS"]="M"},
	["n"]={["Raz"]=true, ["SS"]="N"},
	["o"]={["Raz"]=true, ["SS"]="O"},
	["p"]={["Raz"]=true, ["SS"]="P"},
	["q"]={["Raz"]=true, ["SS"]="Q"},
	["r"]={["Raz"]=true, ["SS"]="R"},
	["s"]={["Raz"]=true, ["SS"]="S"},
	["t"]={["Raz"]=true, ["SS"]="T"},
	["u"]={["Raz"]=true, ["SS"]="U"},
	["v"]={["Raz"]=true, ["SS"]="V"},
	["w"]={["Raz"]=true, ["SS"]="W"},
	["x"]={["Raz"]=true, ["SS"]="X"},
	["y"]={["Raz"]=true, ["SS"]="Y"},
	["z"]={["Raz"]=true, ["SS"]="Z"},
	["0"]={["Raz"]=true, ["SS"]="0"},
	["1"]={["Raz"]=true, ["SS"]="1"},
	["2"]={["Raz"]=true, ["SS"]="2"},
	["3"]={["Raz"]=true, ["SS"]="3"},
	["4"]={["Raz"]=true, ["SS"]="4"},
	["5"]={["Raz"]=true, ["SS"]="5"},
	["6"]={["Raz"]=true, ["SS"]="6"},
	["7"]={["Raz"]=true, ["SS"]="7"},
	["8"]={["Raz"]=true, ["SS"]="8"},
	["9"]={["Raz"]=true, ["SS"]="9"}
}

setPlayerHudComponentVisible("weapon", 	false)
setPlayerHudComponentVisible("wanted", 	false)
setPlayerHudComponentVisible("money", 	false)
setPlayerHudComponentVisible("clock", 	false)
setPlayerHudComponentVisible("armour", 	false)
setPlayerHudComponentVisible("breath", 	false)
setPlayerHudComponentVisible("ammo", 	false)
setPlayerHudComponentVisible("health", 	false)
logF = dxCreateFont("log2.ttf", 32, true, "proof")
LogSh = dxCreateFont("log.ttf", 32, true, "proof")

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

function dxDrawRing (posX, posY, radius, width, startAngle, amount, color, postGUI, absoluteAmount, anglesPerLine)
	if (type (posX) ~= "number") or (type (posY) ~= "number") or (type (startAngle) ~= "number") or (type (amount) ~= "number") then
		return false
	end
	if absoluteAmount then
		stopAngle = amount + startAngle
	else
		stopAngle = (amount * 360) + startAngle
	end
	anglesPerLine = type (anglesPerLine) == "number" and anglesPerLine or 1
	radius = type (radius) == "number" and radius or 50
	width = type (width) == "number" and width or 5
	color = color or tocolor (255, 255, 255, 255)
	postGUI = type (postGUI) == "boolean" and postGUI or false
	absoluteAmount = type (absoluteAmount) == "boolean" and absoluteAmount or false
	
	for i = startAngle, stopAngle, anglesPerLine do
		local startX = math.cos (math.rad (i)) * (radius - width)
		local startY = math.sin (math.rad (i)) * (radius - width)
		local endX = math.cos (math.rad (i)) * (radius + width)
		local endY = math.sin (math.rad (i)) * (radius + width)
		dxDrawLine (startX + posX, startY + posY, endX + posX, endY + posY, color, width, postGUI)
	end
	return math.floor ((stopAngle - startAngle)/anglesPerLine)
end


function StartLoaderWork( button )
	addBox("Вы успешно устроились на работу грузчиком.\nЧтобы получить зарплату и закончить работу,\nНеобходимо уволиться на этом же месте.", 0, 60, 255)
	triggerServerEvent("OnStartWorkingLoader", getLocalPlayer())
	Gruz = true
	mrkLoaderStart = createMarker(-653.9072265625, -1332.8095703125, 15.318496704102, "cylinder", 1.8, 220, 0, 0, 220)
	blpLoaderStart = createBlip(-653.9072265625, -1332.8095703125, 15.318496704102, 0, 2, 220, 0, 0, 220, 16, 64000)
	addEventHandler("onClientMarkerHit", mrkLoaderStart, MarkerLoaderStart)
	GUI = GUI - 1
end

function MarkerLoaderStart( hitPlayer, matchingDimension )
	if(hitPlayer == localPlayer) then
		if(source == mrkLoaderStart) then
			if(isPedInVehicle(hitPlayer) == false) then
				LoaderFull = true
				mrkLoaderEnd = createMarker(-673.3388671875, -1357.328125, 10.029188156128, "cylinder", 1.8, 220, 0, 0, 220)
				blpLoaderEnd = createBlip(-673.3388671875, -1357.328125, 10.029188156128, 0, 2, 220, 0, 0, 220, 16, 64000)
				removeEventHandler("onClientMarkerHit", mrkLoaderStart, MarkerLoaderStart)
				destroyElement(mrkLoaderStart)
				destroyElement(blpLoaderStart)
				addEventHandler("onClientMarkerHit", mrkLoaderEnd, MarkerLoaderEnd)
				triggerServerEvent("OnLoaderStart", localPlayer)
				toggleControl("enter_exit", false)
				toggleControl("fire", false)
				toggleControl("jump", false)
				toggleControl("enter_passenger", false)
				toggleControl("next_weapon", false)
				toggleControl("previous_weapon", false)
				toggleControl("aim_weapon", false)
				toggleControl("sprint", false)
				toggleControl("crouch", false)
			end
		end
	end
end

function MarkerLoaderEnd( hitPlayer, matchingDimension )
	if(hitPlayer == localPlayer) then
		if(source == mrkLoaderEnd) then
			if(isPedInVehicle(hitPlayer) == false) then
				if(canLoaderEnd == false) then
					canLoaderEnd = true
					LoaderFull = false
					mrkLoaderStart = createMarker(-653.9072265625, -1332.8095703125, 15.318496704102, "cylinder", 1.8, 220, 0, 0, 220)
					blpLoaderStart = createBlip(-653.9072265625, -1332.8095703125, 15.318496704102, 0, 2, 220, 0, 0, 220, 16, 64000)
					addEventHandler("onClientMarkerHit", mrkLoaderStart , MarkerLoaderStart)
					removeEventHandler("onClientMarkerHit", mrkLoaderEnd, MarkerLoaderEnd)
					destroyElement(mrkLoaderEnd)
					destroyElement(blpLoaderEnd)
					triggerServerEvent("OnLoaderEnd", localPlayer)
					toggleControl("enter_exit", true)
					toggleControl("fire", true)
					toggleControl("enter_passenger", true)
					toggleControl("next_weapon", true)
					toggleControl("previous_weapon", true)
					toggleControl("aim_weapon", true)
					toggleControl("sprint", true)
					toggleControl("crouch", true)
					setTimer(function ( )
						canLoaderEnd = false
					end, 15000, 1)
				else
					triggerServerEvent("etoPizdec2", getLocalPlayer(), getLocalPlayer())
				end
			end
		end
	end
end

function EndLoaderWork(  )
	triggerServerEvent("OnEndWorkingLoader", getRootElement())
end

function choosePerson( button )
	CHOOSE = true
	setElementModel(getLocalPlayer(), SkinTable[1])
	--onPlayerHUD()
end

function chooseSpawn(  )
	showCursor(false)
	local skin = 0
	if(sex == 1) then
		skin = SkinTable[SkinTarget]
	else
		skin = WomanTable[SkinTarget]
	end
	triggerServerEvent("onChooseSpawn", getLocalPlayer(), skin, sex)
	triggerEvent("endChooseBrowser", getLocalPlayer())
	CHOOSE = false
	onPlayerHUD()
end

addEvent("chooseSpawn", true)
addEventHandler("chooseSpawn", root, chooseSpawn)


function choosePersonClick( button )
	guiSetVisible(wdwChoose, false)
	showCursor(false)
	guiSetInputEnabled(false)
	triggerServerEvent("onChooseSpawn", getLocalPlayer())
	guiSetVisible(wdwPerson, false)
end

resourceRoot = getResourceRootElement()


function clickBack( )
	guiSetVisible(wdwRegister, false)
	guiSetVisible(wdwLogin, true)
end


function closeLogin(  )
	guiSetVisible(wdwLogin, false)
	showCursor(false)
	guiSetInputEnabled(false)
end

function randomVn(  )
	if(sex == 1) then
		local rand = math.random(1, 3)
		SkinTarget = rand
		setElementModel(getLocalPlayer(), SkinTable[rand])
	else
		local rand = math.random(1, 3)
		SkinTarget = rand
		setElementModel(getLocalPlayer(), WomanTable[rand])
	end
end

addEvent("randomVn", true)
addEventHandler("randomVn", root, randomVn)

function successRegister( tablo, sex)
	outputChatBox("Вы успешно зарегистрированы, выберите персонажа", 0, 100, 255)
	Rega = false
	Rega1 = false
	Rega2 = false
	setCameraTarget(localPlayer)
	Food = 100
	for i, n in pairs(tablo) do
		PT[i] = {}
		PT[i]["p"] = n
		PT[i]["n"] = getPlayerName(n)
		PT[i]["i"] = i
	end
	LVL = 1
	EXP = 0
	alg = true
	setTime(12, 0)
	CHOOSE = true
	triggerEvent("startChooseBrowser", root)
end

function outLogin(  )
	outputChatBox("Вы не можете зайти за таким ником, он уже используется.")
end

timus = setTimer(function ( )
	if(capttime > 0) then
		capttime = capttime - 1
	else
		cpt = false
	end
end, 1000, 0)

function ClearLoadWork(  )
	if(Gruz == true) then
		if(LoaderFull == false) then
			removeEventHandler("onClientMarkerHit", localPlayer, MarkerLoaderStart)
			destroyElement(mrkLoaderStart)
			destroyElement(blpLoaderStart)
		else
			removeEventHandler("onClientMarkerHit", localPlayer, MarkerLoaderEnd)
			destroyElement(mrkLoaderEnd)
			destroyElement(blpLoaderEnd)
		end
	else
	end
	Gruz = false
	LoaderFull = false
	toggleControl("enter_exit", true)
	toggleControl("fire", true)
	toggleControl("jump", true)
	toggleControl("enter_passenger", true)
	toggleControl("next_weapon", true)
	toggleControl("previous_weapon", true)
	toggleControl("aim_weapon", true)
	toggleControl("sprint", true)
	toggleControl("crouch", true)
end

function clickClosePass( button )
	guiSetVisible(wdwPlayerPass, false)
	removeEventHandler("onClientGUIClick", btnClosePass, clickClosePass)
	showCursor(false)
	GUI = GUI - 1
end

function showPlayerPass( name, money, skin, player2 )
	if(GUI > 0) then
		triggerServerEvent("GUIWasOpened", player2)
	else
		if(PassCreated == false) then
			wdwPlayerPass = guiCreateWindow(0.35, 0.3, 0.3, 0.4, "Паспорт", true )
			guiCreateLabel(0.2, 0.2, 0.3, 0.1, "Имя и Фамилия", true, wdwPlayerPass)
			lblName = guiCreateLabel(0.6, 0.2, 0.3, 0.1, name .. " ", true, wdwPlayerPass)
			guiCreateLabel(0.2, 0.4, 0.3, 0.1, "Денег на руках", true, wdwPlayerPass)
			lblMoney = guiCreateLabel(0.6, 0.4, 0.3, 0.1, "$" .. money, true, wdwPlayerPass)
			guiCreateLabel(0.2, 0.6, 0.3, 0.1, "Скин", true, wdwPlayerPass)
			lblSkin = guiCreateLabel(0.6, 0.6, 0.3, 0.1, skin .. " id", true, wdwPlayerPass)
			guiSetVisible(wdwPlayerPass, false)
			btnClosePass = guiCreateButton(0.35, 0.8, 0.3, 0.15, "Закрыть", true, wdwPlayerPass)
			addEventHandler("onClientGUIClick", btnClosePass, clickClosePass)
			showCursor(true)
			PassCreated = true
		else
			guiSetText(lblName, name)
			guiSetText(lblMoney, "$" .. money)
			guiSetText(lblSkin, skin .. " id")
			guiSetVisible(wdwPlayerPass, true)
			addEventHandler("onClientGUIClick", btnClosePass, clickClosePass)
			showCursor(true)
		end
		guiSetVisible(wdwPlayerPass, true)
		GUI = GUI + 1
	end
end

function startCourierVeh( veh )
	if(CourierStage == 0) then
		mrkCourierStart = createMarker(-1006.375, -1385.2783203125, 10.563765525818, "cylinder", 2.5, 220, 0, 0, 220)
		CourierStage = 1
		outputChatBox("На складе создан маркер. Подъедьте, чтобы загрузиться")
		blpCourierStart = createBlip(-1006.375, -1385.2783203125, 9.563765525818, 0, 2, 220, 0, 0, 220, 0, 65535)
		addEventHandler("onClientMarkerHit", mrkCourierStart, markerCourierHit)
		CourierVeh = veh
	end
end

function ClientEnterVehicle( thePlayer, seat )
	if(seat == 0 and thePlayer == localPlayer) then
		if(getElementModel(source) ~= 481) then
			Driver = true
			lastVeh = source
		end
	end
end

function markerCourierHit( hitPlayer, matchingDimension )
	if(hitPlayer == localPlayer) then
		if(source == mrkCourierStart) then
			local veh = getPedOccupiedVehicle (hitPlayer)
			if(veh == CourierVeh) then
				if(getPedOccupiedVehicleSeat(hitPlayer) == 0) then
					removeEventHandler("onClientMarkerHit", mrkCourierStart, markerCourierHit)
					destroyElement(mrkCourierStart)
					destroyElement(blpCourierStart)
					mrkCourierStart = nil
					randomPos = math.random(1, 3)
					if(randomPos == 1) then
						mrkCourierEnd = createMarker(-183.0234375, -969.505859375, 9.423469543457, "cylinder", 2.5, 220, 0, 0, 220)
						blpCourierEnd = createBlip(-183.0234375, -969.505859375, 9.423469543457, 0, 2, 220, 0, 0, 220, 0, 65535)
						outputChatBox("Заказ оформлен. Вам необходимо отвезти груз в больницу! Оплата 2000$")
					elseif(randomPos == 2) then
						mrkCourierEnd = createMarker(-1558.248046875, 1270.552734375, 7.6996593475342, "cylinder", 2.5, 220, 0, 0, 220)
						blpCourierEnd = createBlip(-1558.248046875, 1270.552734375, 7.6996593475342, 0, 2, 220, 0, 0, 220, 0, 65535)
						outputChatBox("Заказ оформлен. Вам необходимо отвезти груз на стадион! Оплата 4000$")
					elseif(randomPos == 3) then
						mrkCourierEnd = createMarker(373.5146484375, 985.8154296875, 11.344575881958, "cylinder", 2.5, 220, 0, 0, 220)
						blpCourierEnd = createBlip(373.5146484375, 985.8154296875, 11.344575881958, 0, 2, 220, 0, 0, 220, 0, 65535)
						outputChatBox("Заказ оформлен. Вам необходимо отвезти груз в торговый центр! Оплата 6000$")
					end
					CourierStage = 2
					addEventHandler("onClientMarkerHit", mrkCourierEnd, markerCourierEnd)
				else
				end
			else
			end
		else
		end
	end
end

function markerCourierEnd( hitPlayer, matchingDimension )
	if(hitPlayer == localPlayer) then
		if(source == mrkCourierEnd) then
			local veh = getPedOccupiedVehicle (hitPlayer)
			if(veh == CourierVeh) then
				removeEventHandler("onClientMarkerHit", mrkCourierEnd, markerCourierHit)
				destroyElement(mrkCourierEnd)
				destroyElement(blpCourierEnd)
				mrkCourierEnd = nil
				outputChatBox("Вы выполнили доставку. Можете вернуться на склад")
				mrkCourierStart = createMarker(-1006.375, -1385.2783203125, 9.563765525818, "cylinder", 2.5, 220, 0, 0, 220)
				blpCourierStart = createBlip(-1006.375, -1385.2783203125, 9.563765525818, 0, 2, 220, 0, 0, 220, 0, 65535)
				triggerServerEvent("onCourierOrderEnd", localPlayer, randomPos * 2000)
				addEventHandler("onClientMarkerHit", mrkCourierStart, markerCourierHit)
				CourierStage = 1
			end
		end
	end
end

function ClearCourierWork( )
	if(mrkCourierStart ~= nil) then
		removeEventHandler("onClientMarkerHit", mrkCourierStart, markerCourierHit)
		destroyElement(mrkCourierStart)
		destroyElement(blpCourierStart)
		mrkCourierStart = nil
	end
	if(mrkCourierEnd ~= nil) then
		removeEventHandler("onClientMarkerHit", mrkCourierEnd, markerCourierEnd)
		destroyElement(mrkCourierEnd)
		destroyElement(blpCourierEnd)
		mrkCourierEnd = nil
	end
	CourierStage = 0
	Courier = false
end

local BusGUI = false

function createGUIBusWork( )
	wdwBusWork = guiCreateWindow()
	BusGUI = true
end


function onPlayerCheckFps( command )
	if(AllPerems["showfps"] == false) then
		AllPerems["showfps"] = true
	else
		AllPerems["showfps"] = false
	end
end

function onPlayerClickGUIYes( )
	if(GUITable[1] ~= nil) then
		showCursor(false)
		if(GUIType == 2) then
			triggerServerEvent("onDialogResponse", resourceRoot, GUIID, true, guiGetText(GUITable[4]))
			destroyElement(GUITable[1])
		elseif(GUIType == 3) then
			local listitem = guiGridListGetSelectedItem(GUITable[4])
			triggerServerEvent("onDialogResponse", resourceRoot, GUIID, true, nil, listitem)
			destroyElement(GUITable[1])
		else
			triggerServerEvent("onDialogResponse", resourceRoot, GUIID, true, nil)
			destroyElement(GUITable[1])
		end
		GUITable = {}
	end
end

function onPlayerClickGUINo( )
	if(GUITable[1] ~= nil) then
		showCursor(false)
		if(GUIType == 2) then
			triggerServerEvent("onDialogResponse", resourceRoot, GUIID, false, guiGetText(GUITable[4]))
			destroyElement(GUITable[1])
		elseif(GUIType == 3) then
			local listitem = guiGridListGetSelectedItem(GUITable[4])
			triggerServerEvent("onDialogResponse", resourceRoot, GUIID, false, nil, listitem)
			destroyElement(GUITable[1])
		else
			triggerServerEvent("onDialogResponse", resourceRoot, GUIID, false, nil)
			destroyElement(GUITable[1])
		end
		GUITable = {}
	end
end

function doubleClickGUIF(  )
	local selectedRow, selectedCol = guiGridListGetSelectedItem(GUITable[4])
	onPlayerClickGUIYes()
end

function showPlayerDialog( arg )
	if(tonumber(arg[3]) == 2) then
		local ItemsGUI = tonumber(table.getn(GUITable))
		if(ItemsGUI > 0) then
			onPlayerClickGUINo()
		end
		local text = arg[5]
		local ttext = {}
		local i = 1
		local max = 0
		for s in string.gmatch(text, "[^\n]+") do
			ttext[i] = s
			i = i + 1
			if(string.len(s) > max) then
				max = string.len(s)
			end
		end
		local x, y = guiGetScreenSize()
		local width = 150 + (max*4)
		local height = 175 + ((i-1) * 18)
		local wx = (x/2 - width/2)
		local wy = (y/2 - height/2)
		GUITable[1] = guiCreateWindow(wx, wy, width, height, arg[4], false)
		guiWindowSetMovable(GUITable[1], false)
		guiWindowSetSizable(GUITable[1], false)
		guiSetVisible(GUITable[1], true)
		local wwx = 75
		local widths = 200 
		local wwwx = width / 2 - (widths/2)
		local wwy = (height * 0.3 + ((i - 1) * 20) / 2)
		local w4x = wwwx + widths - 90
		GUITable[2] = guiCreateButton(wwwx, height-60, 90, 40, arg[6], false, GUITable[1])
		GUITable[3] = guiCreateButton(w4x, height-60, 90, 40, arg[7], false, GUITable[1])
		GUITable[4] = guiCreateEdit(wwwx, height-115, widths, 40, "", false, GUITable[1])
		addEventHandler("onClientGUIClick", GUITable[2], onPlayerClickGUIYes, false)
		addEventHandler("onClientGUIClick", GUITable[3], onPlayerClickGUINo, false)
		for i, k in pairs(ttext) do
			local abr = i + 4
			GUITable[abr] = guiCreateLabel(wwx, 18 * (i+1), width - 120, 18, ttext[i], false, GUITable[1])
		end
		GUITable[5] = tonumber(arg[3])
		GUIID = tonumber(arg[2])
		GUIType = tonumber(arg[3])
		showCursor(true)
	end
	if(tonumber(arg[3]) == 1) then
		local ItemsGUI = table.getn(GUITable)
		if(ItemsGUI > 0) then
			onPlayerClickGUINo()
		end
		local text = arg[5]
		local ttext = {}
		local i = 1
		local max = 0
		for s in string.gmatch(text, "[^\n]+") do
			ttext[i] = s
			i = i + 1
			if(string.len(s) > max) then
				max = string.len(s)
			end
		end
		local x, y = guiGetScreenSize()
		local width = 150 + (max*3.6)
		local height = 120 + ((i-1) * 18)
		local wx = (x/2 - width/2)
		local wy = (y/2 - height/2)
		GUITable[1] = guiCreateWindow(wx, wy, width, height, arg[4], false)
		guiWindowSetMovable(GUITable[1], false)
		guiWindowSetSizable(GUITable[1], false)
		guiSetVisible(GUITable[1], true)
		local wwx = width * 0.15
		local widths = 180 
		local wwwx = width / 2 - (widths/2)
		local wwy = (height * 0.3 + ((i - 1) * 20) / 2)
		local w4x = wwwx + widths - 70
		GUITable[2] = guiCreateButton(wwwx, height-60, 70, 40, arg[6], false, GUITable[1])
		GUITable[3] = guiCreateButton(w4x, height-60, 70, 40, arg[7], false, GUITable[1])
		addEventHandler("onClientGUIClick", GUITable[2], onPlayerClickGUIYes, false)
		addEventHandler("onClientGUIClick", GUITable[3], onPlayerClickGUINo, false)
		for i, k in pairs(ttext) do
			local abr = 3 + 4
			GUITable[abr] = guiCreateLabel(75, 18 * (i+1), width*0.8, 18, ttext[i], false, GUITable[1])
		end
		GUIID = tonumber(arg[2])
		GUIType = tonumber(arg[3])
		showCursor(true)
		GUITable[5] = tonumber(arg[3])
	end
	if(tonumber(arg[3]) == 3) then
		local ItemsGUI = table.getn(GUITable)
		if(ItemsGUI > 0) then
			onPlayerClickGUINo()
		end
		local text = arg[5]
		local ttext = {}
		local i = 1
		for s in string.gmatch(text, "[^\n]+") do
			ttext[i] = s
			i = i + 1
		end
		local t3 = ttext
		ttext = {}
		afl = 0
		for i in pairs(t3) do
			ttext[i] = {}
			k = 1
			for s in string.gmatch(t3[i], "[^\t]+") do
				if(i == 1) then
					afl = afl + 1
				end
				ttext[i][k] = s
				k = k + 1
			end
		end
		local x, y = guiGetScreenSize()
		local height = 0
		if(i > 15) then
			height = 500
		else
			height = 160 + ((i-1) * 14)
		end
		local width = 550
		if(x > 1280 and #ttext[1] > 2) then
			width = x * 0.4
		end
		local wx = (x/2 - width / 2)
		local wy = (y/2 - height / 2)
		GUITable[1] = guiCreateWindow(wx, wy, width, height, arg[4], false)
		guiWindowSetMovable(GUITable[1], false)
		guiWindowSetSizable(GUITable[1], false)
		guiSetVisible(GUITable[1], true)
		GUITable[2] = guiCreateButton(120, height-60, 70, 40, arg[6], false, GUITable[1])
		GUITable[3] = guiCreateButton(width-190, height-60, 70, 40, arg[7], false, GUITable[1])
		addEventHandler("onClientGUIClick", GUITable[2], onPlayerClickGUIYes, false)
		addEventHandler("onClientGUIClick", GUITable[3], onPlayerClickGUINo, false)
		GUITable[4] = guiCreateGridList(width * 0.01, 30, width * 0.98, height - (height * 0.1) - 100, false, GUITable[1])
		for i, s in pairs(ttext[1]) do
			local tre = 0.95 / afl
			guiGridListAddColumn(GUITable[4], s, tre)
		end
		for i, s in pairs(ttext) do
			if(i > 1) then
				local row = guiGridListAddRow(GUITable[4])
				for k, gl in pairs(ttext[i]) do
					guiGridListSetItemText(GUITable[4], row, k, tostring(gl), false, false)
				end
			end
		end
		guiGridListSetSortingEnabled(GUITable[4], false)
		guiGridListSetSelectionMode(GUITable[4], 0)
		guiGridListSetSelectedItem(GUITable[4], 0, 1)
		GUIID = tonumber(arg[2])
		GUIType = tonumber(arg[3])
		showCursor(true)
		GUITable[5] = tonumber(arg[3])
		addEventHandler("onClientGUIDoubleClick", GUITable[4], doubleClickGUIF)
	end
end

addEventHandler("onClientRender",getRootElement(),
function()
	local sw, sh = guiGetScreenSize()
	local x,y,z = getCameraMatrix(getLocalPlayer())
	if(NameToggle == true) then
		for i,playerd in pairs(PT) do
			local player = PT[i]["p"]
			if isPlayerMapVisible() then return end
			if player ~= getLocalPlayer() then
				if(isElement(player)) then
					local px,py,pz = getElementPosition (player)
					local pdistance = getDistanceBetweenPoints3D ( x,y,z,px,py,pz )
					if pdistance <= 20 then
						local sx,sy,sz = getScreenFromWorldPosition ( px, py, pz+1.05, 0.06 )
						local CamX,CamY,CamZ = getCameraMatrix()
						local bHit = processLineOfSight(CamX,CamY,CamZ,px,py,pz, true, false, false, true, false, false, false, false )
						if not bHit and sx and sy then
							if(getElementInterior(player) == getElementInterior(localPlayer)) then
								if(getElementDimension(player) == getElementDimension(localPlayer)) then
									if(Please[player] ~= nil) then
										health = getElementHealth (player)
										text = string.gsub(getPlayerName(player), '#%x%x%x%x%x%x', '' ) .. " (" .. Please[player] .. ")"
										local w = dxGetTextWidth(text, 1.4, "arial")
										dxDrawText (text, sx-(w/2), sy-24, sx-(w/2), sy+1, tocolor (0,0,0,255), 1.4, 1.4, "arial")
										dxDrawText (text, sx-(w/2), sy-26, sx-(w/2), sy+1, tocolor (0,0,0,255), 1.4, 1.4, "arial")
										dxDrawText (text, sx-(w/2)+1, sy-25, sx-(w/2)+1, sy+1, tocolor (0,0,0,255), 1.4, 1.4, "arial")
										dxDrawText (text, sx-(w/2)-1, sy-25, sx-(w/2)-1, sy+1, tocolor (0,0,0,255), 1.4, 1.4, "arial")
										if(PT[i] ~= nil) then
											if(PT[i]["rbga"] ~= nil) then
												if(PT[i]["rgba"][1] ~= nil and PT[i]["rgba"][2] ~= nil and PT[i]["rgba"][3] ~= nil) then
													dxDrawText (text, sx-(w/2), sy-25, sx-(w/2), sy, tocolor (PT[i]["rgba"][1],PT[i]["rgba"][2],PT[i]["rgba"][3]), 1.4, 1.4, "arial")
												else
													dxDrawText (text, sx-(w/2), sy-25, sx-(w/2), sy, tocolor (255, 255, 255), 1.4, 1.4, "arial")
												end
											else
												dxDrawText (text, sx-(w/2), sy-25, sx-(w/2), sy, tocolor (255, 255, 255), 1.4, 1.4, "arial")
											end
										else
											dxDrawText (text, sx-(w/2), sy-25, sx-(w/2), sy, tocolor (255, 255, 255), 1.4, 1.4, "arial")
										end
										local koef = 1.25
										dxDrawRectangle (sx-52/koef,sy+8,104/koef, 11,tocolor(0,0,0,150), false, false, false, true, false)
										dxDrawRectangle (sx-50/koef,sy+10,100/koef,7,tocolor(120,0,0,150), false, false, false, true, false)
										dxDrawRectangle (sx-50/koef,sy+10,health/koef,7,tocolor(240,0,0,150), false, false, false, true, false)
										if(getPedArmor(player) > 0) then
											local armor = getPedArmor(player)
											dxDrawRectangle (sx-52/koef,sy-5,104/koef, 11,tocolor(0,0,0,150), false, false, false, true, false)
											dxDrawRectangle (sx-50/koef,sy-3,100/koef,7,tocolor(180, 180, 180,150), false, false, false, true, false)
											dxDrawRectangle (sx-50/koef,sy-3,armor/koef,7,tocolor(240,240,240,150), false, false, false, true, false)
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end)

function animSped(player,anim, speed)
	setPedAnimationSpeed(player,anim, speed)
	setPedAnimationProgress(player, 'pass_Smoke_in_car', 0)
	toggleControl('fire', false)
end


addEvent("animSped", true)
addEventHandler( "animSped", root, animSped)

function gotovo(  )
	Avt = true
end

addEvent("gotovo", true)
addEventHandler("gotovo", root, gotovo)
function ClickingFish( )
	if(Fishing == true) then
		rad = rad + 5
		if(rad >= 157) then
			rad = 0
			Fishing = false
			unbindKey("mouse1", "down", ClickingFish)
			killTimer(FishTimer)
			FishTimer = nil
			local cifra = math.random(1, 8)
			local cifra1 = math.random(1, 22)
			triggerServerEvent("onClientFished", getLocalPlayer(), cifra1, FishTable[cifra]["Name"], getLocalPlayer())
			triggerServerEvent("AnimFromClient", getLocalPlayer(), getLocalPlayer(), "BSKTBALL", "BBALL_idle_O", false)
			FishLimit = FishLimit - 1
			if(FishLimit == 0) then
				FishMark = false
				removeEventHandler("onClientMarkerHit", mrkFishUl, hitFishMarkerUl)
				removeEventHandler("onClientMarkerLeave", mrkFishUl, leaveFishMarkerUl)
				destroyElement(mrkFishUl)
				destroyElement(blpFishUl)
				local it = math.random(1, 5)
				if(it == 1) then
					mrkFishUl = createMarker(-364.4453125, -1930.8115234375, 5.6484160423279, "checkpoint", 25, 255, 0, 0, 255)
					blpFishUl = createBlip(-364.4453125, -1930.8115234375, 5.6484160423279, 0, 2.4, 255, 0, 0, 255, 5.6, 64000)
				elseif(it == 2) then
					mrkFishUl = createMarker(-238.9052734375, -1989.14453125, 5.6448402404785, "checkpoint", 25, 255, 0, 0, 255)
					blpFishUl = createBlip(-238.9052734375, -1989.14453125, 5.6448402404785, 0, 2.4, 255, 0, 0, 255, 5.6, 64000)
				elseif(it == 3) then
					mrkFishUl = createMarker(-52.125, -2227.3173828125, 5.6482119560242, "checkpoint", 25, 255, 0, 0, 255)
					blpFishUl = createBlip(-52.125, -2227.3173828125, 5.6482119560242, 0, 2.4, 255, 0, 0, 255, 5.6, 64000)
				elseif(it == 4) then
					mrkFishUl = createMarker(-350.873046875, -2349.279296875, 5.6603546142578, "checkpoint", 25, 255, 0, 0, 255)
					blpFishUl = createBlip(-350.873046875, -2349.279296875, 5.6603546142578, 0, 2.4, 255, 0, 0, 255, 5.6, 64000)
				elseif(it == 5) then
					mrkFishUl = createMarker(-479.5224609375, -2273.3779296875, 5.6565608978271, "checkpoint", 25, 255, 0, 0, 255)
					blpFishUl = createBlip(-479.5224609375, -2273.3779296875, 5.6565608978271, 0, 2.4, 255, 0, 0, 255, 5.6, 64000)
				end
				local random = math.random(3, 8)
				addEventHandler("onClientMarkerHit", mrkFishUl, hitFishMarkerUl)
				addEventHandler("onClientMarkerLeave", mrkFishUl, leaveFishMarkerUl)
				addBox("Улов на данном косяке закончился.\nНа GPS поставлен маркер нового косяка.", 255, 255, 0)
				addBox("Если Вы хотите закончить работу,\nОтправляйтесь обратно в порт и\nСдайте работу на месте её получения.", 255, 255, 0)
				unbindKey("space", "up", fishStart)
				CanFish = false
			end
			toggleAllControls(true)
			waitingFish = false
			fisha = true
			setTimer(function ( ... )
				fisha = false
			end, 9000, 1)
		end
	end
end

function FishingTime( )
	if(Fishing == true) then
		if(isElementInWater(getLocalPlayer()) == false) then
			if(rad >= 2) then
				rad = rad - 2
			else
				Fishing = false
				unbindKey("mouse1", "down", ClickingFish)
				killTimer(FishTimer)
				rad = 0
				FishTimer = nil
				addBox("Вы не подсекли и отпустили рыбу!", 255, 0, 0)
				waitingFish = false
				triggerServerEvent("AnimFromClient", getLocalPlayer(), getLocalPlayer(), "BSKTBALL", "BBALL_idle_O", false)
			end
		else
			Fishing = false
			unbindKey("mouse1", "down", ClickingFish)
			killTimer(FishTimer)
			rad = 0
			FishTimer = nil
			addBox("Вы упали в воду и завершили подсечку!", 255, 0, 0)
			toggleAllControls(true)
			waitingFish = false
			triggerServerEvent("AnimFromClient", getLocalPlayer(), getLocalPlayer(), "BSKTBALL", "BBALL_idle_O", false)
		end
	end
end

function startFishingCutting(  )
	if(waitingFish == true) then
		if(fisha == false) then
			Fishing = true
			bindKey("mouse1", "down", ClickingFish)
			FishTimer = setTimer(FishingTime, 125, 0)
			rad = 78
		else
			triggerServerEvent("fakefish", getLocalPlayer(), getLocalPlayer())
		end
	end
end

function onFishingOnMarker( )
	if(waitingFish == false) then
		triggerServerEvent("AnimFromClient", getLocalPlayer(), getLocalPlayer(), "sword", "sword_idle", true)
		local randtime = math.random(10, 30)
		waitingFish = true
		FishTimerEsc = setTimer(startFishingCutting, randtime * 1000, 1)
		addBox("Вы начали ловить рыбу.\nКогда она клюнет, Вам\nНеобходимо будет начать подсечку.", 0, 60, 255)
		toggleAllControls(false)
	else
		triggerServerEvent("AnimFromClient", getLocalPlayer(), getLocalPlayer(), "BSKTBALL", "BBALL_idle_O", false)
		waitingFish = false
		killTimer(FishTimerEsc)
		FishTimerEsc = 0
		addBox("Вы перестали ожидать улов.", 255, 60, 0)
		toggleAllControls(true)
	end
end

function fishStart( )
	local localPlayer = getLocalPlayer()
	if(getPedOccupiedVehicle(localPlayer) == false) then
		local cont = getPedContactElement(localPlayer)
		if(cont ~= false) then
			if(getElementType(cont) == "vehicle") then
				if(cont == FishBoat) then
					if(isElementInWater(cont) == true) then
						if(Fishing == false or Fishing == nil) then
							if(FishMark == true) then
								local vx, vy, vz = getElementVelocity(cont)
								local speed = math.round(math.sqrt(vx * vx + vy * vy + vz * vz) * 200)
								if(speed < 2) then
									onFishingOnMarker()
								else
									addBox("Лодку необходимо остановить.", 255, 0, 0)
								end
							else
								addBox("Вы не находитесь у косяка.", 255, 0, 0)
							end
						else
							addBox("Вы уже начали ловить рыбу!", 255, 0, 0)
						end
					else
						addBox("Необходимо, чтобы лодка находилась в воде,\nПока Вы ловите рыбу.", 255, 0, 0)
					end
				else
					addBox("Вы не находитесь\nНа своей арендованной лодке.", 255, 0, 0)
				end
			end
		end
	end
end

function clearFish( )
	FishBoat = 0
end

function onStartCapture( tb, wariors )
	biztarget = tb
	biz = true
	showCursor(true)
	wartarget = 1
	warior = wariors
end

function onPlayerCheckBank( money, arg2, dom, dengi, dbe, biz, tip, pmoney, tele )
	PInfo["BMoney"] = money
	Bank[1] = true
	showCursor(true)
	PInfo["Name"] = arg2
	BankCache[1] = 0
	BankCache[2] = 0
	BankCache[3] = {}
	BankCache[3][1] = 0
	BankCache[3][2] = ""
	BankCache[3][3] = 0
	BankCache[5] = 0
	BankCache[6] = 0
	BankCache[7] = 0
	BankCache[8] = 0
	BankCache[9] = dom
	BankCache[10] = biz
	BankCache[11] = tip
	BankCache[12] = dbe
	BankCache[13] = dengi
	BankCache[14] = pmoney
	showChat(false)
	HudToggle = false
	setPlayerHudComponentVisible("radar", false)
	BankCache[15] = tele
end

function onCheckRadio( command )
	if(getPedOccupiedVehicle(getLocalPlayer()) ~= false) then
		local veh = getPedOccupiedVehicle(getLocalPlayer())
		if(getElementModel(veh) ~= 481) then
			if(AllPerems[1] ~= nil) then
				stopSound(AllPerems[1])
				AllPerems[1] = nil
			else
				AllPerems[1] = playSound("http://radio.plaza.one/mp3")
			end
		end
	end
end

addCommandHandler("radio", onCheckRadio)
addEvent("onPlayerCheckBank", true)
addEventHandler("onPlayerCheckBank", root, onPlayerCheckBank)
addEvent("onStartCapture", true)
addEventHandler("onStartCapture", root, onStartCapture)
addEvent("clearFish", true)
addEventHandler("clearFish", root, clearFish)

function onClientClearFish( )
	unbindKey("lshift", "up", fishStart)
	if(Fishing == true) then
		rad = 0
		Fishing = false
		unbindKey("mouse1", "down", ClickingFish)
		killTimer(FishTimer)
		FishTimer = nil
	end
	FishMark = 0
	FishBoat = 0
	if(isElement(mrkFishUl) == true) then
		destroyElement(mrkFishUl)
		destroyElement(blpFishUl)
	end
	mrkFishUl = 0
	blpFishUl = 0
	waitingFish = false
end

function hitFishMarkerUl( hitPlayer, dim )
	if(isElement(hitPlayer) == true) then
		if(getElementType(hitPlayer) == "player") then
			if(hitPlayer == getLocalPlayer()) then
				addBox("Вы заплыли в зону улова.\nОстановите и полностью заглушите лодку (CTRL).\nЧтобы начать рыбачить, нажмите ПРОБЕЛ.", 180, 32, 61)
				FishMark = true
				bindKey("space", "up", fishStart)
				CanFish = true
			end
		end
	end
end

function leaveFishMarkerUl( leftPlayer, dim )
	if(isElement(leftPlayer) == true) then
		if(getElementType(leftPlayer) == "player") then
			if(leftPlayer == getLocalPlayer()) then
				addBox("Вы выплыли из зоны улова.\nЧтобы снова начать ловить рыбу,\nНеобходимо снова подплыть к косяку.", 180, 32, 61)
				FishMark = false
				unbindKey("space", "up", fishStart)
				CanFish = false
				toggleAllControls(true)
				if(Fishing == true) then
					rad = 0
					Fishing = false
					unbindKey("mouse1", "down", ClickingFish)
					killTimer(FishTimer)
					FishTimer = nil
					addBox("Вы покинули место улова\nИ перестали ловить рыбу.", 255, 0, 0)
				end
			end
		end
	end
end

function onStartWorkFish( boat )
	local it = math.random(1, 5)
	if(it == 1) then
		mrkFishUl = createMarker(-364.4453125, -1930.8115234375, 5.6484160423279, "checkpoint", 25, 255, 0, 0, 255)
		blpFishUl = createBlip(-364.4453125, -1930.8115234375, 5.6484160423279, 0, 2.4, 255, 0, 0, 255, 5.6, 64000)
	elseif(it == 2) then
		mrkFishUl = createMarker(-238.9052734375, -1989.14453125, 5.6448402404785, "checkpoint", 25, 255, 0, 0, 255)
		blpFishUl = createBlip(-238.9052734375, -1989.14453125, 5.6448402404785, 0, 2.4, 255, 0, 0, 255, 5.6, 64000)
	elseif(it == 3) then
		mrkFishUl = createMarker(-52.125, -2227.3173828125, 5.6482119560242, "checkpoint", 25, 255, 0, 0, 255)
		blpFishUl = createBlip(-52.125, -2227.3173828125, 5.6482119560242, 0, 2.4, 255, 0, 0, 255, 5.6, 64000)
	elseif(it == 4) then
		mrkFishUl = createMarker(-350.873046875, -2349.279296875, 5.6603546142578, "checkpoint", 25, 255, 0, 0, 255)
		blpFishUl = createBlip(-350.873046875, -2349.279296875, 5.6603546142578, 0, 2.4, 255, 0, 0, 255, 5.6, 64000)
	elseif(it == 5) then
		mrkFishUl = createMarker(-479.5224609375, -2273.3779296875, 5.6565608978271, "checkpoint", 25, 255, 0, 0, 255)
		blpFishUl = createBlip(-479.5224609375, -2273.3779296875, 5.6565608978271, 0, 2.4, 255, 0, 0, 255, 5.6, 64000)
	end
	local random = math.random(3, 8)
	FishLimit = random
	FishBoat = boat
	NapomTimer = setTimer(function (  )
		if(Fishing == true) then
			addBox("Вы можете сдать пойманную рыбу\nКогда закончите ловлю,\nВернувшись в порт на место устройства\nИ уволясь с работы.", 255, 255, 0)
		else
			killTimer(NapomTimer)
			NapomTimer = 0
		end
	end, 120 * 1000, 0)
	addEventHandler("onClientMarkerHit", mrkFishUl, hitFishMarkerUl)
	addEventHandler("onClientMarkerLeave", mrkFishUl, leaveFishMarkerUl)
end

function onClientResourceStart( )
	if(a ~= 1) then
		customShowChat(false)
		act = true
		a = 1
		triggerServerEvent("onOsnLoad", getLocalPlayer(), getLocalPlayer())
	end
end

function OnEndWorkFish( )
	Fishing = nil
	unbindKey("mouse1", "down", ClickingFish)
	if(isTimer(FishTimer) == true) then
		killTimer(FishTimer)
	end
	FishMark = false
	unbindKey("space", "up", fishStart)
	CanFish = false
	toggleAllControls(true)
	if(mrkFishUl ~= 0) then
		destroyElement(mrkFishUl)
		destroyElement(blpFishUl)
		mrkFishUl = 0
		blpFishUl = 0
	end
	waitingFish = false
end

function renderBank( )
	local sw, sh = guiGetScreenSize()
	if(Bank[2] == 0) then
		dxDrawImage((1920 - 1160)/2 * sw / 1920, (1080 - 651)/2 * sh / 1080, 1160 * sw / 1920, 651 * sh / 1080, BankUI[9])
		local wt2 = dxGetTextWidth(PInfo["BMoney"], 1 * sw / 1920, RBold)
		dxDrawText(PInfo["BMoney"], 	sw/2 - wt2/2 - 15 * sw / 1920, 445 * sh / 1080, sw/2 + wt2/2, 700 * sh / 1080, tocolor(0, 0, 0, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top")
		local str = BankCache[1]
		if(str == 0) then
			str = "Начните вводить сумму"
		else
			str = str .. "$"
		end
		local wt2 = dxGetTextWidth(str, 1 * sw / 1920, RBold)
		dxDrawText(str, 	sw/2 - wt2/2 - 15 * sw / 1920, 535 * sh / 1080, sw/2 + wt2/2, 700 * sh / 1080, tocolor(0, 0, 0, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top")
		local str = math.ceil(BankCache[1] / 100)
		local wt2 = dxGetTextWidth(str .. "$", 1 * sw / 1920, RBold)
		dxDrawText(str .. "$", 	sw/2 - wt2/2 - 15 * sw / 1920, 638 * sh / 1080, sw/2 + wt2/2, 700 * sh / 1080, tocolor(0, 0, 0, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top")
		dxDrawImage((1920 - 388)/2 * sw / 1920 - 6 * sw / 1920, 700 * sh / 1080, 388 * sw / 1920, 44 * sh / 1080, BankUI[8])
	elseif(Bank[2] == 1) then
		local wt2 = dxGetTextWidth(PInfo["BMoney"], 1 * sw / 1920, RBold)
		dxDrawImage((1920 - 1160)/2 * sw / 1920, (1080 - 651)/2 * sh / 1080, 1160 * sw / 1920, 651 * sh / 1080, BankUI[12])
		dxDrawText(PInfo["BMoney"], 	sw/2 - wt2/2 - 15 * sw / 1920, 445 * sh / 1080, sw/2 + wt2/2, 700 * sh / 1080, tocolor(0, 0, 0, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top")
		local str = BankCache[2]
		if(str == 0) then
			str = "Начните вводить сумму"
		else
			str = str .. "$"
		end
		local wt2 = dxGetTextWidth(str, 1 * sw / 1920, RBold)
		dxDrawText(str, 	sw/2 - wt2/2 - 15 * sw / 1920, 535 * sh / 1080, sw/2 + wt2/2, 700 * sh / 1080, tocolor(0, 0, 0, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top")
		local wd = dxGetTextWidth("Пользуйтесь нашим банком ;)", 1 * sw / 1920, RBold)
		dxDrawText("Пользуйтесь нашим банком ;)", 	sw/2 - wd/2, 638 * sh / 1080, sw/2 + wd/2, 700 * sh / 1080, tocolor(0, 0, 0, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top")
		dxDrawImage((1920 - 388)/2 * sw / 1920 - 6 * sw / 1920, 700 * sh / 1080, 388 * sw / 1920, 44 * sh / 1080, BankUI[1])
	elseif(Bank[2] == 2) then
		dxDrawImage((1920 - 1160)/2 * sw / 1920, (1080 - 651)/2 * sh / 1080, 1160 * sw / 1920, 651 * sh / 1080, BankUI[13])
		local str = BankCache[3][2]
		if(str == "" and BankCache[3][1] == 0) then
			str = "Введите имя"
			local wt2 = dxGetTextWidth(str, 1 * sw / 1920, RBold)
			dxDrawText(str, 	sw/2 - wt2/2 - 15 * sw / 1920, 412 * sh / 1080, sw/2 + wt2/2, 700 * sh / 1080, tocolor(190, 30, 160, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top")
		elseif(str == "" and BankCache[3][1] == 1) then
			str = "Нажми на меня :3"
			local wt2 = dxGetTextWidth(str, 1 * sw / 1920, RBold)
			dxDrawText(str, 	sw/2 - wt2/2 - 15 * sw / 1920, 412 * sh / 1080, sw/2 + wt2/2, 700 * sh / 1080, tocolor(0, 0, 0, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top")
		elseif(BankCache[3][1] == 0) then
			local wt2 = dxGetTextWidth(str, 1 * sw / 1920, RBold)
			dxDrawText(str, 	sw/2 - wt2/2 - 15 * sw / 1920, 412 * sh / 1080, sw/2 + wt2/2, 700 * sh / 1080, tocolor(190, 30, 160, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top")
		else
			local wt2 = dxGetTextWidth(str, 1 * sw / 1920, RBold)
			dxDrawText(str, 	sw/2 - wt2/2 - 15 * sw / 1920, 412 * sh / 1080, sw/2 + wt2/2, 700 * sh / 1080, tocolor(0, 0, 0, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top")
		end
		local str = BankCache[3][3]
		if(str == 0 and BankCache[3][1] == 1) then
			str = "Введите сумму перевода"
			local wt2 = dxGetTextWidth(str, 1 * sw / 1920, RBold)
			dxDrawText(str, 	sw/2 - wt2/2 - 15 * sw / 1920, 502 * sh / 1080, sw/2 + wt2/2, 700 * sh / 1080, tocolor(190, 30, 160, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top")
		elseif(str > 0 and BankCache[3][1] == 1) then
			local wt2 = dxGetTextWidth(str, 1 * sw / 1920, RBold)
			dxDrawText(str, 	sw/2 - wt2/2 - 15 * sw / 1920, 502 * sh / 1080, sw/2 + wt2/2, 700 * sh / 1080, tocolor(190, 30, 160, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top")
		elseif(str == 0 and BankCache[3][1] == 0) then
			str = "Нажми, чтобы ввести сумму!"
			local wt2 = dxGetTextWidth(str, 1 * sw / 1920, RBold)
			dxDrawText(str, 	sw/2 - wt2/2 - 15 * sw / 1920, 502 * sh / 1080, sw/2 + wt2/2, 700 * sh / 1080, tocolor(0, 0, 0, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top")
		else
			local wt2 = dxGetTextWidth(str, 1 * sw / 1920, RBold)
			dxDrawText(str, 	sw/2 - wt2/2 - 15 * sw / 1920, 502 * sh / 1080, sw/2 + wt2/2, 700 * sh / 1080, tocolor(0, 0, 0, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top")
		end
		if(tonumber(str) ~= nil) then
			str = math.ceil(str / 100)
		else
			str = "Сумма не введена!"
		end
		local wd = dxGetTextWidth(str, 1 * sw / 1920, RBold)
		dxDrawText(str, 	sw/2 - wd/2 - 15 * sw / 1920, 605 * sh / 1080, sw/2 + wd/2, 700 * sh / 1080, tocolor(0, 0, 0, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top")
		dxDrawImage((1920 - 388)/2 * sw / 1920 - 6 * sw / 1920, 700 * sh / 1080, 388 * sw / 1920, 44 * sh / 1080, BankUI[11])
	elseif(Bank[2] == 3) then
		local x, y = getCursorPosition()
		if(BankCache[6] == 0) then
			if(x > 0.422395 and x < 0.567708 and y > 0.46562 and y < 0.54074) then
				dxDrawImage((1920 - 1160)/2 * sw / 1920, (1080 - 651)/2 * sh / 1080, 1160 * sw / 1920, 651 * sh / 1080, BankUI[3])
			elseif(x > 0.422395 and x < 0.567708 and y > 0.56 and y < 0.631) then
				dxDrawImage((1920 - 1160)/2 * sw / 1920, (1080 - 651)/2 * sh / 1080, 1160 * sw / 1920, 651 * sh / 1080, BankUI[4])
			elseif(x > 0.422395 and x < 0.567708 and y > 0.374074 and y < 0.448148) then
				dxDrawImage((1920 - 1160)/2 * sw / 1920, (1080 - 651)/2 * sh / 1080, 1160 * sw / 1920, 651 * sh / 1080, BankUI[2])
			else
				dxDrawImage((1920 - 1160)/2 * sw / 1920, (1080 - 651)/2 * sh / 1080, 1160 * sw / 1920, 651 * sh / 1080, BankUI[14])
			end
		elseif(BankCache[6] == 1) then
			dxDrawImage((1920 - 1160)/2 * sw / 1920, (1080 - 651)/2 * sh / 1080, 1160 * sw / 1920, 651 * sh / 1080, BankUI[7])
			local wt2 = dxGetTextWidth(BankCache[13] * 50 .. "/" .. 50 * 30 * 24, 1 * sw / 1920, RBold)
			dxDrawText(BankCache[13] * 50 .. "/" .. 50 * 30 * 24, 	sw/2 - wt2/2 - 15 * sw / 1920, 445 * sh / 1080, sw/2 + wt2/2, 700 * sh / 1080, tocolor(0, 0, 0, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top")
			local str = BankCache[7]
			if(str == 0) then
				str = "Начните вводить сумму"
			else
				str = str .. "$"
			end
			local wt2 = dxGetTextWidth(str, 1 * sw / 1920, RBold)
			dxDrawText(str, 	sw/2 - wt2/2 - 15 * sw / 1920, 535 * sh / 1080, sw/2 + wt2/2, 700 * sh / 1080, tocolor(0, 0, 0, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top")
			local str = "Пользуйтесь нашим банком ;)"
			local wt2 = dxGetTextWidth(str, 1 * sw / 1920, RBold)
			dxDrawText(str, 	sw/2 - wt2/2 - 15 * sw / 1920, 638 * sh / 1080, sw/2 + wt2/2, 700 * sh / 1080, tocolor(0, 0, 0, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top")
			dxDrawImage((1920 - 388)/2 * sw / 1920 - 6 * sw / 1920, 700 * sh / 1080, 388 * sw / 1920, 44 * sh / 1080, BankUI[1])
		elseif(BankCache[6] == 2) then
			dxDrawImage((1920 - 1160)/2 * sw / 1920, (1080 - 651)/2 * sh / 1080, 1160 * sw / 1920, 651 * sh / 1080, BankUI[6])
			local wt2 = dxGetTextWidth(BankCache[12] * 50 .. "/" .. 50 * 30 * 24, 1 * sw / 1920, RBold)
			dxDrawText(BankCache[12] * 50 .. "/" .. 50 * 30 * 24, 	sw/2 - wt2/2 - 15 * sw / 1920, 445 * sh / 1080, sw/2 + wt2/2, 700 * sh / 1080, tocolor(0, 0, 0, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top")
			local str = BankCache[7]
			if(str == 0) then
				str = "Начните вводить сумму"
			else
				str = str .. "$"
			end
			local wt2 = dxGetTextWidth(str, 1 * sw / 1920, RBold)
			dxDrawText(str, 	sw/2 - wt2/2 - 15 * sw / 1920, 535 * sh / 1080, sw/2 + wt2/2, 700 * sh / 1080, tocolor(0, 0, 0, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top")
			local str = "Пользуйтесь нашим банком ;)"
			local wt2 = dxGetTextWidth(str, 1 * sw / 1920, RBold)
			dxDrawText(str, 	sw/2 - wt2/2 - 15 * sw / 1920, 638 * sh / 1080, sw/2 + wt2/2, 700 * sh / 1080, tocolor(0, 0, 0, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top")
			dxDrawImage((1920 - 388)/2 * sw / 1920 - 6 * sw / 1920, 700 * sh / 1080, 388 * sw / 1920, 44 * sh / 1080, BankUI[1])
		elseif(BankCache[6] == 3) then
			dxDrawImage((1920 - 1160)/2 * sw / 1920, (1080 - 651)/2 * sh / 1080, 1160 * sw / 1920, 651 * sh / 1080, BankUI[5])
			local wt2 = dxGetTextWidth(BankCache[12] * 50 .. "/" .. 50 * 30 * 24, 1 * sw / 1920, RBold)
			dxDrawText(BankCache[12] * 50 .. "/" .. 50 * 30 * 24, 	sw/2 - wt2/2 - 15 * sw / 1920, 445 * sh / 1080, sw/2 + wt2/2, 700 * sh / 1080, tocolor(0, 0, 0, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top")
			local str = BankCache[7]
			if(str == 0) then
				str = "Начните вводить сумму"
			else
				str = str .. "$"
			end
			local wt2 = dxGetTextWidth(str, 1 * sw / 1920, RBold)
			dxDrawText(str, 	sw/2 - wt2/2 - 15 * sw / 1920, 535 * sh / 1080, sw/2 + wt2/2, 700 * sh / 1080, tocolor(0, 0, 0, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top")
			local str = "Пользуйтесь нашим банком ;)"
			local wt2 = dxGetTextWidth(str, 1 * sw / 1920, RBold)
			dxDrawText(str, 	sw/2 - wt2/2 - 15 * sw / 1920, 638 * sh / 1080, sw/2 + wt2/2, 700 * sh / 1080, tocolor(0, 0, 0, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top")
			dxDrawImage((1920 - 388)/2 * sw / 1920 - 6 * sw / 1920, 700 * sh / 1080, 388 * sw / 1920, 44 * sh / 1080, BankUI[1])
		end
	elseif(Bank[2] == 4) then
		dxDrawImage((1920 - 1160)/2 * sw / 1920, (1080 - 651)/2 * sh / 1080, 1160 * sw / 1920, 651 * sh / 1080, BankUI[10])
		local wt2 = dxGetTextWidth(BankCache[14], 1 * sw / 1920, RBold)
		dxDrawText(BankCache[14], 	sw/2 - wt2/2 - 15 * sw / 1920, 445 * sh / 1080, sw/2 + wt2/2, 700 * sh / 1080, tocolor(0, 0, 0, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top")
		local str = BankCache[5]
		if(str == 0) then
			str = "Начните вводить сумму!"
		end
		local wt2 = dxGetTextWidth(str, 1 * sw / 1920, RBold)
		dxDrawText(str, 	sw/2 - wt2/2 - 15 * sw / 1920, 535 * sh / 1080, sw/2 + wt2/2, 700 * sh / 1080, tocolor(0, 0, 0, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top")
		local wd = dxGetTextWidth("Пользуйтесь нашим банком ;)", 1 * sw / 1920, RBold)
		dxDrawText("Пользуйтесь нашим банком ;)", 	sw/2 - wd/2, 638 * sh / 1080, sw/2 + wd/2, 700 * sh / 1080, tocolor(0, 0, 0, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, shrift, "center", "top")
		dxDrawImage((1920 - 388)/2 * sw / 1920 - 6 * sw / 1920, 700 * sh / 1080, 388 * sw / 1920, 44 * sh / 1080, BankUI[1])
	end
	local wt = dxGetTextWidth(PInfo["Name"], 1 * sw / 1920, shrift)
	local wt2 = dxGetTextWidth(PInfo["BMoney"], 1 * sw / 1920, shrift)
	dxDrawText("На счету:", 		1200, 255 * sh / 1080, (1452 - 15) * sw / 1920 - wt2, 700 * sh / 1080, tocolor(45, 45, 45, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, 	shrift, "right", "top")
	dxDrawText("Владелец счета:", 	1200, 280 * sh / 1080, (1452 - 15) * sw / 1920 - wt, 700 * sh / 1080, tocolor(45, 45, 45, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, 	shrift, "right", "top")
	dxDrawText(PInfo["BMoney"], 	1200, 255 * sh / 1080, (1452) * sw / 1920, 700 * sh / 1080, tocolor(0, 0, 0, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, 				shrift, "right", "top")
	dxDrawText(PInfo["Name"], 		1200, 280 * sh / 1080, (1452) * sw / 1920, 700 * sh / 1080, tocolor(0, 0, 0, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, 				shrift, "right", "top")
end

function Registra( )
	local sw, sh = guiGetScreenSize()
	dxDrawImage(50 * sw / 1920, 	75 * sh / 1080, 	702 * sw / 1920, 	133 * sh / 1080, 	RegaruUI[1])
end

local mus = {}

--mus[1] = playSound3D("http://radio.plaza.one/mp3", 478.529296875, -63.830078125, 9.9436388015747, true)
--mus[2] = playSound3D("http://radio.plaza.one/mp3", 457.9970703125, -50.884765625, 11.437395095825, true)
--mus[3] = playSound3D("http://radio.plaza.one/mp3", 468.408203125, -51.744140625, 15.666376113892, true)
--mus[4] = playSound3D("http://radio.plaza.one/mp3", 489.8193359375, -76.1240234375, 11.445549964905, true)
--mus[5] = playSound3D("http://radio.plaza.one/mp3", 487.6748046875, -54.3515625, 11.453023910522, true)
--mus[6] = playSound3D("http://radio.plaza.one/mp3", 469.6025390625, -77.076171875, 11.445568084717, true)
--mus[7] = playSound3D("http://radio.plaza.one/mp3", 461.5947265625, -66.5107421875, 11.445568084717, true)
mus[1] = playSound3D("http://radio.plaza.one/mp3",476.662109375, -65.333984375, 9.9436388015747)

for i,n in pairs(mus) do
	setSoundVolume(n, 3.5)
end

setSoundMaxDistance(mus[1], 55)

function onClientMinimize()
	triggerServerEvent("onTriggerAfk", getLocalPlayer(), getLocalPlayer(), true)
end
addEventHandler( "onClientMinimize", root, onClientMinimize )

function onClientRestore( didClearRenderTargets )
	triggerServerEvent("onTriggerAfk", getLocalPlayer(), getLocalPlayer(), false)
end
addEventHandler("onClientRestore",root, onClientRestore)

function captcha( )
	local sw, sh = guiGetScreenSize()
	if(cpt == true) then
		local r, g, b = 255, 0, 30
		local perc = 50
		local h = 840
		dxDrawRectangle(810 * sw / 1920, (h) * sh / 1080, 		300 * sw / 1920, 	200 * sh / 1080,	tocolor(30, 30, 30, 250), true)
		dxDrawRectangle(958 * sw / 1920, (h+90) * sh / 1080, 	4, 					80 * sh / 1080,		tocolor(220, 220, 220, 255), true, false)
		dxDrawRectangle(810 * sw / 1920, (h + 9) * sh / 1080, 	300 * sw / 1920, 4,						tocolor(r, g, b, perc * 5.1), true, false)
		dxDrawRectangle(810 * sw / 1920, (h + 13) * sh / 1080, 	300 * sw / 1920, 3,						tocolor(r, g, b, perc * 2.4), true, false)
		dxDrawRectangle(810 * sw / 1920, (h + 16) * sh / 1080, 	300 * sw / 1920, 3,						tocolor(r, g, b, perc * 1.8), true, false)
		dxDrawRectangle(810 * sw / 1920, (h + 19) * sh / 1080, 	300 * sw / 1920, 2,						tocolor(r, g, b, perc * 1.2), true, false)
		dxDrawRectangle(810 * sw / 1920, (h + 6) * sh / 1080, 	300 * sw / 1920, 3,						tocolor(r, g, b, perc * 2.4), true, false)
		dxDrawRectangle(810 * sw / 1920, (h + 3) * sh / 1080, 	300 * sw / 1920, 3,						tocolor(r, g, b, perc * 1.8), true, false)
		dxDrawRectangle(810 * sw / 1920, (h) * sh / 1080, 		300 * sw / 1920, 3,						tocolor(r, g, b, perc * 1.2), true, false)
		dxDrawRectangle(810 * sw / 1920, (h + 189) * sh / 1080, 300 * sw / 1920, 4,						tocolor(r, g, b, perc * 5.1), true, false)
		dxDrawRectangle(810 * sw / 1920, (h+193) * sh / 1080, 	300 * sw / 1920, 3,						tocolor(r, g, b, perc * 2.4), true, false)
		dxDrawRectangle(810 * sw / 1920, (h+196) * sh / 1080, 	300 * sw / 1920, 3,						tocolor(r, g, b, perc * 1.8), true, false)
		dxDrawRectangle(810 * sw / 1920, (h+199) * sh / 1080, 	300 * sw / 1920, 2,						tocolor(r, g, b, perc * 1.2), true, false)
		dxDrawRectangle(810 * sw / 1920, (h+186) * sh / 1080, 	300 * sw / 1920, 3,						tocolor(r, g, b, perc * 2.4), true, false)
		dxDrawRectangle(810 * sw / 1920, (h+183) * sh / 1080, 	300 * sw / 1920, 3,						tocolor(r, g, b, perc * 1.8), true, false)
		dxDrawRectangle(810 * sw / 1920, (h+180) * sh / 1080, 	300 * sw / 1920, 3,						tocolor(r, g, b, perc * 1.2), true, false)
		local minute = math.floor(capttime / 60)
		if(minute < 10) then
			minute = "0" .. minute
		end 
		local sec = math.fmod(capttime, 60)
		if(sec < 10) then
			sec = "0" .. sec
		end
		dxDrawText(minute .. ":" .. sec, 	(810) * sw / 1920, (h + 33) * sh / 1080, 1110 * sw / 1920, 633 * sh / 1080, tocolor(255, 255, 255, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, BebasNeueSm, "center", "top", false, false, true, false, false)
		local str = ""
		if(cptmaf1 == 1) then
			str = "LCN"
		elseif(cptmaf1 == 2) then
			str = "Col.Maf."
		elseif(cptmaf1 == 3) then
			str = "Mexico"
		else
			str = "Triada"
		end
		dxDrawText(str, 	(810) * sw / 1920, 925 * sh / 1080, 960 * sw / 1920, 633 * sh / 1080, tocolor(255, 255, 255, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, BebasNeueSm, "center", "top", false, false, true, false, false)
		local str = ""
		if(cptmaf2 == 1) then
			str = "LCN"
		elseif(cptmaf2 == 2) then
			str = "Col.Maf."
		elseif(cptmaf2 == 3) then
			str = "Mexico"
		else
			str = "Triada"
		end
		dxDrawText(str, 	(960) * sw / 1920, 925 * sh / 1080, 1110 * sw / 1920, 633 * sh / 1080, tocolor(255, 255, 255, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, BebasNeueSm, "center", "top", false, false, true, false, false)
		dxDrawText(cptscore1, 		(810) * sw / 1920, 970 * sh / 1080, 960 * sw / 1920, 633 * sh / 1080, tocolor(255, 255, 255, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, BebasNeueSm, "center", "top", false, false, true, false, false)
		dxDrawText(cptscore2, 		(960) * sw / 1920, 970 * sh / 1080, 1110 * sw / 1920, 633 * sh / 1080, tocolor(255, 255, 255, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, BebasNeueSm, "center", "top", false, false, true, false, false)
	end
end

function triggerSkills( arg1, arg2, arg3, arg4  )
	SkillToggle = true
	showCursor(true)
	skillz[1] = arg1
	skillz[2] = arg2
	skillz[3] = arg3
	skillz[4] = arg4
end

addEvent("triggerSkills", true)
addEventHandler("triggerSkills", root, triggerSkills)

function renderSkills(  )
	if(SkillToggle == true) then
		local sw, sh = guiGetScreenSize()
		dxDrawImage((467) * sw / 1920, 	(263) * sh / 1080, 	(986) * sw / 1920,	(554) * sh / 1080,			SkillsUI[2])
		dxDrawImage((751) * sw / 1920, 	(740) * sh / 1080, 	(418) * sw / 1920,	(49) * sh / 1080,			SkillsUI[1])
		if(skillz[1] >= 25) then
			dxDrawRectangle((804) * sw / 1920, (414) * sh / 1080, (56) * sw / 1920, (17) * sh / 1080, tocolor(255, 255, 255, 255), true)
		else
			local skilly = (skillz[1]) / 25
			if(skilly > 0) then
				dxDrawRectangle((804) * sw / 1920, (414) * sh / 1080, (56 * skilly) * sw / 1920, (17) * sh / 1080, tocolor(255, 255, 255, 255), true)
			end
		end
		if(skillz[1] >= 50) then
			dxDrawRectangle((880) * sw / 1920, (414) * sh / 1080, (56) * sw / 1920, (17) * sh / 1080, tocolor(255, 255, 255, 255), true)
		else
			local skilly = (skillz[1] - 25) / 25
			if(skilly > 0) then
				dxDrawRectangle((880) * sw / 1920, (414) * sh / 1080, (56 * skilly) * sw / 1920, (17) * sh / 1080, tocolor(255, 255, 255, 255), true)
			end
		end
		if(skillz[1] >= 75) then
			dxDrawRectangle((956) * sw / 1920, (414) * sh / 1080, (56) * sw / 1920, (17) * sh / 1080, tocolor(255, 255, 255, 255), true)
		else
			local skilly = (skillz[1] - 50) / 25
			if(skilly > 0) then
				dxDrawRectangle((956) * sw / 1920, (414) * sh / 1080, (56 * skilly) * sw / 1920, (17) * sh / 1080, tocolor(255, 255, 255, 255), true)
			end
		end
		if(skillz[1] > 75) then
			local skilly = (skillz[1] - 75) / 25
			if(skilly > 0) then
				dxDrawRectangle((1033) * sw / 1920, (414) * sh / 1080, (56 * skilly) * sw / 1920, (17) * sh / 1080, tocolor(255, 255, 255, 255), true)
			end
		end
		if(skillz[2] >= 25) then
			dxDrawRectangle((804) * sw / 1920, (500) * sh / 1080, (56) * sw / 1920, (17) * sh / 1080, tocolor(255, 255, 255, 255), true)
		else
			local skilly = (skillz[2]) / 25
			if(skilly > 0) then
				dxDrawRectangle((804) * sw / 1920, (500) * sh / 1080, (56 * skilly) * sw / 1920, (17) * sh / 1080, tocolor(255, 255, 255, 255), true)
			end
		end
		if(skillz[2] >= 50) then
			dxDrawRectangle((880) * sw / 1920, (500) * sh / 1080, (56) * sw / 1920, (17) * sh / 1080, tocolor(255, 255, 255, 255), true)
		else
			local skilly = (skillz[2] - 25) / 25
			if(skilly > 0) then
				dxDrawRectangle((880) * sw / 1920, (500) * sh / 1080, (56 * skilly) * sw / 1920, (17) * sh / 1080, tocolor(255, 255, 255, 255), true)
			end
		end
		if(skillz[2] >= 75) then
			dxDrawRectangle((956) * sw / 1920, (500) * sh / 1080, (56) * sw / 1920, (17) * sh / 1080, tocolor(255, 255, 255, 255), true)
		else
			local skilly = (skillz[2] - 50) / 25
			if(skilly > 0) then
				dxDrawRectangle((956) * sw / 1920, (500) * sh / 1080, (56 * skilly) * sw / 1920, (17) * sh / 1080, tocolor(255, 255, 255, 255), true)
			end
		end
		if(skillz[2] > 75) then
			local skilly = (skillz[2] - 75) / 25
			if(skilly > 0) then
				dxDrawRectangle((1033) * sw / 1920, (500) * sh / 1080, (56 * skilly) * sw / 1920, (17) * sh / 1080, tocolor(255, 255, 255, 255), true)
			end
		end
		if(skillz[3] >= 25) then
			dxDrawRectangle((804) * sw / 1920, (581) * sh / 1080, (56) * sw / 1920, (17) * sh / 1080, tocolor(255, 255, 255, 255), true)
		else
			local skilly = (skillz[3]) / 25
			if(skilly > 0) then
				dxDrawRectangle((804) * sw / 1920, (581) * sh / 1080, (56 * skilly) * sw / 1920, (17) * sh / 1080, tocolor(255, 255, 255, 255), true)
			end
		end
		if(skillz[3] >= 50) then
			dxDrawRectangle((880) * sw / 1920, (581) * sh / 1080, (56) * sw / 1920, (17) * sh / 1080, tocolor(255, 255, 255, 255), true)
		else
			local skilly = (skillz[3] - 25) / 25
			if(skilly > 0) then
				dxDrawRectangle((880) * sw / 1920, (581) * sh / 1080, (56 * skilly) * sw / 1920, (17) * sh / 1080, tocolor(255, 255, 255, 255), true)
			end
		end
		if(skillz[3] >= 75) then
			dxDrawRectangle((956) * sw / 1920, (581) * sh / 1080, (56) * sw / 1920, (17) * sh / 1080, tocolor(255, 255, 255, 255), true)
		else
			local skilly = (skillz[3] - 50) / 25
			if(skilly > 0) then
				dxDrawRectangle((956) * sw / 1920, (581) * sh / 1080, (56 * skilly) * sw / 1920, (17) * sh / 1080, tocolor(255, 255, 255, 255), true)
			end
		end
		if(skillz[3] > 75) then
			local skilly = (skillz[3] - 75) / 25
			if(skilly > 0) then
				dxDrawRectangle((1033) * sw / 1920, (581) * sh / 1080, (56 * skilly) * sw / 1920, (17) * sh / 1080, tocolor(255, 255, 255, 255), true)
			end
		end
		if(skillz[4] >= 25) then
			dxDrawRectangle((804) * sw / 1920, (665) * sh / 1080, (56) * sw / 1920, (17) * sh / 1080, tocolor(255, 255, 255, 255), true)
		else
			local skilly = (skillz[4]) / 25
			if(skilly > 0) then
				dxDrawRectangle((804) * sw / 1920, (665) * sh / 1080, (56 * skilly) * sw / 1920, (17) * sh / 1080, tocolor(255, 255, 255, 255), true)
			end
		end
		if(skillz[4] >= 50) then
			dxDrawRectangle((880) * sw / 1920, (665) * sh / 1080, (56) * sw / 1920, (17) * sh / 1080, tocolor(255, 255, 255, 255), true)
		else
			local skilly = (skillz[4] - 25) / 25
			if(skilly > 0) then
				dxDrawRectangle((880) * sw / 1920, (665) * sh / 1080, (56 * skilly) * sw / 1920, (17) * sh / 1080, tocolor(255, 255, 255, 255), true)
			end
		end
		if(skillz[4] >= 75) then
			dxDrawRectangle((956) * sw / 1920, (665) * sh / 1080, (56) * sw / 1920, (17) * sh / 1080, tocolor(255, 255, 255, 255), true)
		else
			local skilly = (skillz[4] - 50) / 25
			if(skilly > 0) then
				dxDrawRectangle((956) * sw / 1920, (665) * sh / 1080, (56 * skilly) * sw / 1920, (17) * sh / 1080, tocolor(255, 255, 255, 255), true)
			end
		end
		if(skillz[4] > 75) then
			local skilly = (skillz[4] - 75) / 25
			if(skilly > 0) then
				dxDrawRectangle((1033) * sw / 1920, (665) * sh / 1080, (56 * skilly) * sw / 1920, (17) * sh / 1080, tocolor(255, 255, 255, 255), true)
			end
		end
		dxDrawText(skillz[1] .. " / 100%", 		(1120) * sw / 1920, 402 * sh / 1080, 1110 * sw / 1920, 633 * sh / 1080, tocolor(255, 255, 255, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, BebasNeueSm, "left", "top", false, false, true, false, false)
		dxDrawText(skillz[2] .. " / 100%", 		(1120) * sw / 1920, 488 * sh / 1080, 1110 * sw / 1920, 633 * sh / 1080, tocolor(255, 255, 255, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, BebasNeueSm, "left", "top", false, false, true, false, false)
		dxDrawText(skillz[3] .. " / 100%", 		(1120) * sw / 1920, 569 * sh / 1080, 1110 * sw / 1920, 633 * sh / 1080, tocolor(255, 255, 255, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, BebasNeueSm, "left", "top", false, false, true, false, false)
		dxDrawText(skillz[4] .. " / 100%", 		(1120) * sw / 1920, 654 * sh / 1080, 1110 * sw / 1920, 633 * sh / 1080, tocolor(255, 255, 255, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, BebasNeueSm, "left", "top", false, false, true, false, false)
	end
end


function afdt(  )
	if(zorka == 0) then
		triggerServerEvent("afffdey", getLocalPlayer(), getLocalPlayer())
		toggleAllControls(false)
		zorka = 1
		setCameraMatrix(101.2041015625, 250.9365234375, 22.931956481934, 96.94921875, 252.4111328125, 22.331956481934)
		setElementRotation(getLocalPlayer(), 0, 0, 20)
		CacheClient[1] = setTimer(function (  )
			if(zorka == 1) then
				local x, y, z = getElementPosition(getLocalPlayer())
				local x1, y1, z1 = 96.7099609375, 251.8427734375, 21.731956481934
				local dist = getDistanceBetweenPoints3D(x, y, z, x1, y1, z1)
				if(dist < 0.9) then
					zorka = 2
				else
					zorka = 0
					setCameraTarget(getLocalPlayer(), getLocalPlayer())	
					toggleAllControls(true)
					killTimer(CacheClient[1])
					CacheClient[1] = nil
				end
			elseif(zorka == 2) then
				local x, y, z = getElementPosition(getLocalPlayer())
				local x1, y1, z1 = 96.7099609375, 251.8427734375, 21.731956481934
				local dist = getDistanceBetweenPoints3D(x, y, z, x1, y1, z1)
				if(dist < 0.9) then
					zorka = 3
				else
					zorka = 0
					setCameraTarget(getLocalPlayer(), getLocalPlayer())	
					toggleAllControls(true)
					killTimer(CacheClient[1])
					CacheClient[1] = nil
				end
			elseif(zorka == 3) then
				local x, y, z = getElementPosition(getLocalPlayer())
				local x1, y1, z1 = 96.7099609375, 251.8427734375, 21.731956481934
				local dist = getDistanceBetweenPoints3D(x, y, z, x1, y1, z1)
				if(dist < 0.9) then
					zorka = 4
				else
					zorka = 0
					setCameraTarget(getLocalPlayer(), getLocalPlayer())	
					toggleAllControls(true)
					killTimer(CacheClient[1])
					CacheClient[1] = nil
				end
			else
				local x, y, z = getElementPosition(getLocalPlayer())
				local x1, y1, z1 = 96.7099609375, 251.8427734375, 21.731956481934
				local dist = getDistanceBetweenPoints3D(x, y, z, x1, y1, z1)
				if(dist < 0.9) then
					if(zorka == 4) then
						triggerServerEvent("onTryStartPhoto", getLocalPlayer(), getLocalPlayer())
					end
					zorka = 0
					setCameraTarget(getLocalPlayer(), getLocalPlayer())	
					toggleAllControls(true)
				else
					zorka = 0
					setCameraTarget(getLocalPlayer(), getLocalPlayer())	
					toggleAllControls(true)
					killTimer(CacheClient[1])
					CacheClient[1] = nil
				end
			end
		end, 5 * 1000, 4)
	end
end

function aaaar( arg1 )
	setCameraMatrix(101.2041015625, 250.9365234375, 22.931956481934, 96.94921875, 252.4111328125, 22.331956481934)
	setElementRotation(getLocalPlayer(), 0, 0, 20)
	zorka = 4 + arg1
	toggleAllControls(false)
	setTimer(function (  )
		toggleAllControls(true)
		setCameraTarget(getLocalPlayer())
		zorka = 0
		triggerServerEvent("checkqwf", getLocalPlayer(), getLocalPlayer())
	end, 5000, 1)
end

addEvent("aaaar", true)
addEventHandler("aaaar", root, aaaar)
addEvent("afdt", true)
addEventHandler("afdt", root, afdt)

setAmbientSoundEnabled("gunfire", false)

function npcConnect(  )
	if(getPedOccupiedVehicle(getLocalPlayer()) == false) then
		local x, y, z = getElementPosition(getLocalPlayer())
		local x1, y1, z1 = 96.7099609375, 251.8427734375, 21.731956481934
		local dist = getDistanceBetweenPoints3D(x, y, z, x1, y1, z1)
		if(dist < 0.9 and act == false) then
			if(zorka == 0) then
				triggerServerEvent("afffdey", getLocalPlayer(), getLocalPlayer())
			else
				zorka = 0
				setCameraTarget(getLocalPlayer(), getLocalPlayer())	
				toggleAllControls(true)
				if(CacheClient[1] ~= nil) then
					if(isTimer(CacheClient[1])) then
						killTimer(CacheClient[1])
					end
					CacheClient[1] = nil
				end
			end
		elseif(zorka > 0) then
			if(CacheClient[1] ~= nil) then
				if(isTimer(CacheClient[1])) then
					killTimer(CacheClient[1])
				end
				CacheClient[1] = nil
			end
			zorka = 0
			setCameraTarget(getLocalPlayer(), getLocalPlayer())	
			toggleAllControls(true)
		end
	end
end

function onPlayerSetDrunk( pid )
	if(getCameraShakeLevel() + pid <= 255) then
		setCameraShakeLevel(getCameraShakeLevel() + pid)
	else
		addBox("Вы пьяны в стельку!", 255, 255, 0)
	end
end

setTimer(function (  )
	if(getCameraShakeLevel() - 50 >= 0) then
		setCameraShakeLevel(getCameraShakeLevel() - 50)
	else
		setCameraShakeLevel(0)
	end
end, 5 * 60 * 1000, 0)

addEvent("onPlayerSetDrunk", true)
addEventHandler("onPlayerSetDrunk", root, onPlayerSetDrunk)

function sendBebas(  )
	return BebasNeueSm
end

function sendPrice(  )
	return BebasNeueBig
end

function onClientRender()
	local screenWidth, screenHeight = guiGetScreenSize()
	local sw, sh = guiGetScreenSize()
	renderSkills()
	captcha()
	if(CHOOSE == true) then
		Registra()
	elseif(CarBuy == true) then
		local price = CarCache[1][CarCache[2] + CarCache[4] - 1]["GosPrice"]
		local speed = CarCache[1][CarCache[2] + CarCache[4] - 1]["Speed"]
		local pr = CarCache[1][CarCache[2] + CarCache[4] - 1]["DriveType"]
		local privod = "j"
		if(pr == "rwd") then
			privod = "ЗАДНИЙ"
		elseif(pr == "fwd") then
			privod = "ПЕРЕДНИЙ"
		else
			privod = "ПОЛНЫЙ"
		end
		dxDrawImage(0, 					0, 					1920 * sw / 1920,	1080 * sh / 1080,			CarBuyUI[1])
		dxDrawImage((135) * sw / 1920, 	(672) * sh / 1080, 	(19) * sw / 1920,	(32) * sh / 1080,			CarBuyUI[2])
		dxDrawImage((227) * sw / 1920, 	(661) * sh / 1080, 	(134) * sw / 1920,	(45) * sh / 1080,			CarBuyUI[3])
		dxDrawImage((125) * sw / 1920, 	(983) * sh / 1080,	(174) * sw / 1920, 	(59) * sh / 1080,			CarBuyUI[4])
		dxDrawImage((135) * sw / 1920, 	(742) * sh / 1080,	(30) * sw / 1920, 	(30) * sh / 1080,			CarBuyUI[5])
		dxDrawImage((180) * sw / 1920, 	(742) * sh / 1080,	(30) * sw / 1920, 	(30) * sh / 1080,			CarBuyUI[6])
		dxDrawImage((225) * sw / 1920, 	(742) * sh / 1080,	(30) * sw / 1920, 	(30) * sh / 1080,			CarBuyUI[7])
		dxDrawImage((270) * sw / 1920, 	(742) * sh / 1080,	(30) * sw / 1920, 	(30) * sh / 1080,			CarBuyUI[8])
		dxDrawImage((315) * sw / 1920, 	(742) * sh / 1080,	(30) * sw / 1920, 	(30) * sh / 1080,			CarBuyUI[9])
		dxDrawImage((360) * sw / 1920, 	(742) * sh / 1080,	(30) * sw / 1920, 	(30) * sh / 1080,			CarBuyUI[10])
		dxDrawImage((393) * sw / 1920, 	(264) * sh / 1080,	(19) * sw / 1920, 	(14) * sh / 1080,			CarBuyUI[11])
		dxDrawImage((393) * sw / 1920, 	(597) * sh / 1080,	(19) * sw / 1920, 	(14) * sh / 1080,			CarBuyUI[12])
		dxDrawText(price, (23) * sw / 1920, 666 * sh / 1080, 20 * sw / 1920, 633 * sh / 1080, tocolor(255, 255, 255, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, BebasNeue)
		dxDrawText(speed .. " км/ч.", (259) * sw / 1920, 788 * sh / 1080, 20 * sw / 1920, 633 * sh / 1080, tocolor(255, 255, 255, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, BebasNeue)
		dxDrawText(privod, (265) * sw / 1920, 838 * sh / 1080, 20 * sw / 1920, 633 * sh / 1080, tocolor(255, 255, 255, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, BebasNeue)
		dxDrawText("100л.", (283) * sw / 1920, 888 * sh / 1080, 20 * sw / 1920, 633 * sh / 1080, tocolor(255, 255, 255, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, BebasNeue)
		if(CarCache[4] == 1) then
			dxDrawRectangle((45) * sw / 1920, (284) * sh / 1080, (340) * sw / 1920, (40) * sh / 1080, tocolor(198, 23, 217, 240), true)
		else
			dxDrawRectangle((45) * sw / 1920, (284) * sh / 1080, (340) * sw / 1920, (40) * sh / 1080, tocolor(30, 30, 30, 240), true)
		end
		if(CarCache[4] == 2) then
			dxDrawRectangle((45) * sw / 1920, (336) * sh / 1080, (340) * sw / 1920, (40) * sh / 1080, tocolor(198, 23, 217, 240), true)
		else
			dxDrawRectangle((45) * sw / 1920, (336) * sh / 1080, (340) * sw / 1920, (40) * sh / 1080, tocolor(30, 30, 30, 240), true)
		end
		if(CarCache[4] == 3) then
			dxDrawRectangle((45) * sw / 1920, (388) * sh / 1080, (340) * sw / 1920, (40) * sh / 1080, tocolor(198, 23, 217, 240), true)
		else
			dxDrawRectangle((45) * sw / 1920, (388) * sh / 1080, (340) * sw / 1920, (40) * sh / 1080, tocolor(30, 30, 30, 240), true)
		end
		if(CarCache[4] == 4) then
			dxDrawRectangle((45) * sw / 1920, (442) * sh / 1080, (340) * sw / 1920, (40) * sh / 1080, tocolor(198, 23, 217, 240), true)
		else
			dxDrawRectangle((45) * sw / 1920, (442) * sh / 1080, (340) * sw / 1920, (40) * sh / 1080, tocolor(30, 30, 30, 240), true)
		end
		if(CarCache[4] == 5) then
			dxDrawRectangle((45) * sw / 1920, (496) * sh / 1080, (340) * sw / 1920, (40) * sh / 1080, tocolor(198, 23, 217, 240), true)
		else
			dxDrawRectangle((45) * sw / 1920, (496) * sh / 1080, (340) * sw / 1920, (40) * sh / 1080, tocolor(30, 30, 30, 240), true)
		end
		if(CarCache[4] == 6) then 
			dxDrawRectangle((45) * sw / 1920, (552) * sh / 1080, (340) * sw / 1920, (40) * sh / 1080, tocolor(198, 23, 217, 240), true)
		else
			dxDrawRectangle((45) * sw / 1920, (552) * sh / 1080, (340) * sw / 1920, (40) * sh / 1080, tocolor(30, 30, 30, 240), true)
		end
		dxDrawRectangle((400) * sw / 1920, (284) * sh / 1080, (5) * sw / 1920, (308) * sh / 1080, tocolor(255, 255, 255, 255), true)
		local max = CarCache[2]
		local pheight = 308
		local step = (pheight - (pheight / CarCache[3] * 6)) / (CarCache[3] - 6) 
		local maxstep = CarCache[3] - 6
		local nowstep = maxstep - (maxstep - max) - 1
		dxDrawRectangle((400) * sw / 1920, (284 + step * nowstep) * sh / 1080, (5) * sw / 1920, (pheight / CarCache[3] * 6) * sh / 1080, tocolor(216, 24, 238, 255), true)
		dxDrawText(CarCache[1][max]["Name"], (50) * sw / 1920, (286) * sh / 1080, (102) * sw / 1920, (286) * sh / 1080, tocolor(255, 255, 255, 255), (1) * sw / 1920, (1) * sh / 1080, BebasNeueSmall, "left", "top", false, false, true) 
		dxDrawText(CarCache[1][max+1]["Name"], 	(50) * sw / 1920, (339) * sh / 1080, (102) * sw / 1920, (339) * sh / 1080, tocolor(255, 255, 255, 255), (1) * sw / 1920, (1) * sh / 1080, BebasNeueSmall, "left", "top", false, false, true)
		dxDrawText(CarCache[1][max+2]["Name"], 	(50) * sw / 1920, (391) * sh / 1080, (102) * sw / 1920, (391) * sh / 1080, tocolor(255, 255, 255, 255), (1) * sw / 1920, (1) * sh / 1080, BebasNeueSmall, "left", "top", false, false, true)
		dxDrawText(CarCache[1][max+3]["Name"], 	(50) * sw / 1920, (446) * sh / 1080, (102) * sw / 1920, (446) * sh / 1080, tocolor(255, 255, 255, 255), (1) * sw / 1920, (1) * sh / 1080, BebasNeueSmall, "left", "top", false, false, true)
		dxDrawText(CarCache[1][max+4]["Name"], 	(50) * sw / 1920, (500) * sh / 1080, (102) * sw / 1920, (501) * sh / 1080, tocolor(255, 255, 255, 255), (1) * sw / 1920, (1) * sh / 1080, BebasNeueSmall, "left", "top", false, false, true)
		dxDrawText(CarCache[1][max+5]["Name"], 	(50) * sw / 1920, (556) * sh / 1080, (102) * sw / 1920, (556) * sh / 1080, tocolor(255, 255, 255, 255), (1) * sw / 1920, (1) * sh / 1080, BebasNeueSmall, "left", "top", false, false, true)
	elseif(SkinShop == true) then
		dxDrawImage((691) * sw / 1920,	(972) * sh / 1080, 	(555) * sw / 1920,		(92) * sh / 1080,		SkinShopUI[1])
		dxDrawImage((1470) * sw / 1920,	(972) * sh / 1080, 	(190) * sw / 1920,		(90) * sh / 1080,		SkinShopUI[2])
		dxDrawImage((285) * sw / 1920,	(972) * sh / 1080, 	(190) * sw / 1920,		(90) * sh / 1080,		SkinShopUI[3])
		dxDrawImage((583) * sw / 1920,	(972) * sh / 1080, 	(90) * sw / 1920,		(90) * sh / 1080,		SkinShopUI[4])
		dxDrawImage((1261) * sw / 1920,	(972) * sh / 1080, 	(90) * sw / 1920,		(90) * sh / 1080,		SkinShopUI[5])
		dxDrawImage((1034) * sw / 1920,	(988) * sh / 1080, 	(60) * sw / 1920,		(60) * sh / 1080,		SkinShopUI[6])
		local cache = SkinsCache[2][2]
		local dxw = dxGetTextWidth(SkinsCache[1][cache]["Price"], 1 * sw / 1920, UniSans)
		dxDrawText(SkinsCache[1][cache]["Price"], (800) * sw / 1920, (982) * sh / 1080, (1000) * sw / 1920, (982) * sh / 1080, tocolor(255, 255, 255, 255), 1.0 * sw / 1920, 1.0 * sh / 1080, UniSans, "right")
	end
	for i,n in pairs(attached3dtext) do
		if(isElement(n["Element"]) == true) then
			local x, y, z = getElementPosition(n["Element"])
			x = x + n["x"]
			y = y + n["y"]
			z = z + n["z"]
			if isPlayerMapVisible() then return end
			if(getElementDimension(n["Element"]) == getElementDimension(getLocalPlayer())) then
				if(getElementInterior(n["Element"]) == getElementInterior(getLocalPlayer())) then
					local px, py, pz = getCameraMatrix()
					local pdistance = getDistanceBetweenPoints3D(x, y, z, px, py, pz)
					if(pdistance < 15) then
						local sx, sy, sz = getScreenFromWorldPosition (x, y, z+1.05, 0.06)
						local CamX,CamY,CamZ = getCameraMatrix()
						local bHit = processLineOfSight(CamX, CamY, CamZ, x, y, z, true, false, false, true, false, false, false, false )
						if not bHit and sx and sy then
							local text = attached3dtext[i]["Text"]
							local w = dxGetTextWidth(text, 1.2 * sw / 1920, "Arial")
							dxDrawText (text, sx - w - 2, sy-23 + 2, sx + w - 2,sy+1, tocolor(0, 0, 0, 255), 1.2, 1.2, "Arial", "center", "top", false, false, false, true)
							dxDrawText (text, sx - w, sy-23, sx + w,sy+1, tocolor(255, 255, 255, 255), 1.2, 1.2, "Arial", "center", "top", false, false, false, true)
						end
					end
				end
			end
		else
			attached3dtext[i] = nil
		end
	end
	if(MenuToggle[1] == true) then
		local hm = 108
		local sm = 371
		if(MenuToggle[2] == 4) then
			dxDrawImage((sm) 			* sw / 1920,		(hm) * sh / 1080,			(1178) * sw / 1920,		(864) * sh / 1080,			Menu[1][2])
		elseif(MenuToggle[2] == 3) then
			if(MenuToggle[3][1] == 1) then
				dxDrawImage((sm) 		* sw / 1920,		(hm) * sh / 1080,			(1179) * sw / 1920,		(864) * sh / 1080,			Menu[26][1])
			elseif(MenuToggle[3][1] == 2) then
				dxDrawImage((sm) 		* sw / 1920,		(hm) * sh / 1080,			(1179) * sw / 1920,		(864) * sh / 1080,			Menu[26][2])
			elseif(MenuToggle[3][1] == 3) then 
				if(MenuToggle[3][2] == 1) then
					dxDrawImage((sm) 				* sw / 1920,		(hm) * sh / 1080,				(1179) * sw / 1920,		(864) * sh / 1080,			Menu[26][3])
					dxDrawImage((sm + 1130) 		* sw / 1920,		(hm + 415) * sh / 1080,			(18) * sw / 1920,		(37) * sh / 1080,			Menu[26][11])
				elseif(MenuToggle[3][2] == 2) then
					dxDrawImage((sm) 				* sw / 1920,		(hm) * sh / 1080,				(1179) * sw / 1920,		(864) * sh / 1080,			Menu[26][4])
					dxDrawImage((sm + 310) 			* sw / 1920,		(hm + 415) * sh / 1080,			(18) * sw / 1920,		(37) * sh / 1080,			Menu[26][10])
					dxDrawImage((sm + 1130) 		* sw / 1920,		(hm + 415) * sh / 1080,			(18) * sw / 1920,		(37) * sh / 1080,			Menu[26][11])
				elseif(MenuToggle[3][2] == 3) then
					dxDrawImage((sm) 				* sw / 1920,		(hm) * sh / 1080,				(1179) * sw / 1920,		(864) * sh / 1080,			Menu[26][5])
					dxDrawImage((sm + 310) 			* sw / 1920,		(hm + 415) * sh / 1080,			(18) * sw / 1920,		(37) * sh / 1080,			Menu[26][10])
					dxDrawImage((sm + 1130) 		* sw / 1920,		(hm + 415) * sh / 1080,			(18) * sw / 1920,		(37) * sh / 1080,			Menu[26][11])
				elseif(MenuToggle[3][2] == 4) then
					dxDrawImage((sm) 				* sw / 1920,		(hm) * sh / 1080,				(1179) * sw / 1920,		(864) * sh / 1080,			Menu[26][6])
					dxDrawImage((sm + 310) 			* sw / 1920,		(hm + 415) * sh / 1080,			(18) * sw / 1920,		(37) * sh / 1080,			Menu[26][10])
				end
			elseif(MenuToggle[3][1] == 4) then
				dxDrawImage((sm) 		* sw / 1920,		(hm) * sh / 1080,			(1179) * sw / 1920,		(864) * sh / 1080,			Menu[26][7])
			elseif(MenuToggle[3][1] == 5) then
				dxDrawImage((sm) 		* sw / 1920,		(hm) * sh / 1080,			(1179) * sw / 1920,		(864) * sh / 1080,			Menu[26][8])
			else
				dxDrawImage((sm) 		* sw / 1920,		(hm) * sh / 1080,			(1179) * sw / 1920,		(864) * sh / 1080,			Menu[26][9])
			end
		elseif(MenuToggle[2] == 5) then
			dxDrawImage((sm) 		* sw / 1920,		(hm) * sh / 1080,			(1179) * sw / 1920,		(864) * sh / 1080,			Menu[25])
		elseif(MenuToggle[2] == 6) then
			local x, y = getCursorPosition()
			dxDrawImage((sm) 		* sw / 1920,		(hm) * sh / 1080,			(1178) * sw / 1920,		(864) * sh / 1080,					Menu[1][3])
			dxDrawImage((sm + 75) 		* sw / 1920,		(hm + 770) * sh / 1080,			(141) * sw / 1920,		(43) * sh / 1080,			Menu[40])
			local str = PInfo["Donate"] .. " VC"
			local wdx = dxGetTextWidth(str, 1 * sw / 1920, AvertaRegSmallest)
			dxDrawText("Баланс:", (sm + 95) * sw / 1920, 	(hm + 785) * sh / 1080, 		(sm + 100) * sw / 1920, (hm + 790) * sh / 1080, tocolor(30, 30, 30, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaRegSmallest, "left", "top", false, false, true, false, false)
			dxDrawText(str, (sm + 175 - wdx / 2) * sw / 1920, 	(hm + 785) * sh / 1080, 		(sm + 100) * sw / 1920, (hm + 790) * sh / 1080, tocolor(30, 30, 30, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaRegSmallest, "left", "top", false, false, true, false, false)
			if(x > 0.396874 and x < 0.558333 and y > 0.205555 and y < 0.379629) then
				dxDrawImage((sm + 375) 	* sw / 1920,		(hm + 95) * sh / 1080,		(342) * sw / 1920,		(224) * sh / 1080,			Menu[27][2])
			else
				dxDrawImage((sm + 375) 	* sw / 1920,		(hm + 95) * sh / 1080,		(342) * sw / 1920,		(224) * sh / 1080,			Menu[27][1])
			end
			if(x > 0.58802 and x < 0.75104 and y > 0.200925 and y < 0.376851) then
				dxDrawImage((sm + 745) 	* sw / 1920,		(hm + 95) * sh / 1080,		(342) * sw / 1920,		(224) * sh / 1080,			Menu[28][2])
			else
				dxDrawImage((sm + 745) 	* sw / 1920,		(hm + 95) * sh / 1080,		(342) * sw / 1920,		(224) * sh / 1080,			Menu[28][1])
			end
			if(PInfo["Warn"] > 0) then
				if(not(x > 0.39843 and x < 0.56302 and y > 0.423148 and y < 0.602777)) then
					dxDrawImage((sm + 375) 	* sw / 1920,		(hm + 330) * sh / 1080,		(342) * sw / 1920,		(224) * sh / 1080,			Menu[29][1])
				else
					dxDrawImage((sm + 375) 	* sw / 1920,		(hm + 330) * sh / 1080,		(342) * sw / 1920,		(224) * sh / 1080,			Menu[29][2])
				end
			else
				dxDrawImage((sm + 375) 	* sw / 1920,		(hm + 330) * sh / 1080,		(339) * sw / 1920,		(224) * sh / 1080,			Menu[29][3])
			end
			if(x > 0.589062 and x < 0.751041 and y > 0.41574 and y < 0.59537) then
				dxDrawImage((sm + 745) 	* sw / 1920,		(hm + 330) * sh / 1080,		(342) * sw / 1920,		(224) * sh / 1080,			Menu[30][MenuToggle[4][4]][2])
			else
				dxDrawImage((sm + 745) 	* sw / 1920,		(hm + 330) * sh / 1080,		(342) * sw / 1920,		(224) * sh / 1080,			Menu[30][MenuToggle[4][4]][1])
			end
			if(SkillBuy == 1) then
				dxDrawImage((sm + 350) 	* sw / 1920,		(hm + 660) * sh / 1080,		(18) * sw / 1920,		(37) * sh / 1080,			Menu[31])
			else
				dxDrawImage((sm + 1115) * sw / 1920,		(hm + 660) * sh / 1080,		(18) * sw / 1920,		(37) * sh / 1080,			Menu[32])
			end
			if(y > 0.634259 and y < 0.818518 and x > 0.401041 and x < 0.47708) then 
				dxDrawImage((sm + 395) 	* sw / 1920,		(hm + 565) * sh / 1080,		(160) * sw / 1920,		(224) * sh / 1080,			Menu[33][SkillBuy+1][2])
			else
				dxDrawImage((sm + 395) 	* sw / 1920,		(hm + 565) * sh / 1080,		(160) * sw / 1920,		(224) * sh / 1080,			Menu[33][SkillBuy+1][1])
			end
			if(y > 0.634259 and y < 0.818518 and x > 0.4875 and x < 0.56875) then
				dxDrawImage((sm + 565) 	* sw / 1920,		(hm + 565) * sh / 1080,		(160) * sw / 1920,		(224) * sh / 1080,			Menu[33][SkillBuy+2][2])
			else
				dxDrawImage((sm + 565) 	* sw / 1920,		(hm + 565) * sh / 1080,		(160) * sw / 1920,		(224) * sh / 1080,			Menu[33][SkillBuy+2][1])
			end
			if(y > 0.634259 and y < 0.818518 and x > 0.57864 and x < 0.65468) then
				dxDrawImage((sm + 735) 	* sw / 1920,		(hm + 565) * sh / 1080,		(160) * sw / 1920,		(224) * sh / 1080,			Menu[33][SkillBuy+3][2])
			else
				dxDrawImage((sm + 735) 	* sw / 1920,		(hm + 565) * sh / 1080,		(160) * sw / 1920,		(224) * sh / 1080,			Menu[33][SkillBuy+3][1])
			end
			if(y > 0.634259 and y < 0.818518 and x > 0.666145 and x < 0.74427) then
				dxDrawImage((sm + 905) 	* sw / 1920,		(hm + 565) * sh / 1080,		(160) * sw / 1920,		(224) * sh / 1080,			Menu[33][SkillBuy+4][2])
			else
				dxDrawImage((sm + 905) 	* sw / 1920,		(hm + 565) * sh / 1080,		(160) * sw / 1920,		(224) * sh / 1080,			Menu[33][SkillBuy+4][1])
			end
			if(MenuToggle[4][1] == 2) then
				if(MenuToggle[4][3] ~= "") then
					local dx = dxGetTextWidth(MenuToggle[4][3], 1 * sw / 1920, AvertaLight)
					if(dx <= 209) then
						dxDrawText(MenuToggle[4][3], (sm + 816) * sw / 1920, (hm+187) * sh / 1080, (sm + 1025) * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight, "left", "top", true, false, true, false, false)
					else
						dxDrawText(MenuToggle[4][3], (sm + 816) * sw / 1920, (hm+187) * sh / 1080, (sm + 1025) * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight, "right", "top", true, false, true, false, false)
					end
				else
					dxDrawText("Введите никнейм", (sm + 816) * sw / 1920, (hm+187) * sh / 1080, sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight, "left", "top", false, false, true, false, false)
				end
			else
				if(MenuToggle[4][3] ~= "") then
					local dx = dxGetTextWidth(MenuToggle[4][3], 1 * sw / 1920, AvertaLight)
					if(dx <= 209) then
						dxDrawText(MenuToggle[4][3], (sm + 816) * sw / 1920, (hm+187) * sh / 1080, (sm + 1025) * sw / 1920, sh * sh / 1080, tocolor(190, 190, 190, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight, "left", "top", true, false, true, false, false)
					else
						dxDrawText(MenuToggle[4][3], (sm + 816) * sw / 1920, (hm+187) * sh / 1080, (sm + 1025) * sw / 1920, sh * sh / 1080, tocolor(190, 190, 190, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight, "right", "top", true, false, true, false, false)
					end
				else
					dxDrawText("Введите никнейм", (sm + 816) * sw / 1920, (hm+187) * sh / 1080, sw * sw / 1920, sh * sh / 1080, tocolor(190, 190, 190, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight, "left", "top", false, false, true, false, false)
				end
			end
			if(MenuToggle[4][1] == 1) then
				if(MenuToggle[4][2] ~= 0) then
					local dw = dxGetTextWidth(MenuToggle[4][2], 1 * sw / 1920, AvertaLight)
					local dw2 = dxGetTextWidth(MenuToggle[4][2], 1 * sw / 1920, AvertaLight)
					dxDrawText(MenuToggle[4][2], (sm + 462 - dw / 2) * sw / 1920, (hm+185) * sh / 1080, sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight, "left", "top", false, false, true, false, false)
					dxDrawText(MenuToggle[4][2] * 200 * PInfo["Coefmoney"], (sm + 610 - dw2 / 2) * sw / 1920, (hm+185) * sh / 1080, sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight, "left", "top", false, false, true, false, false)
				else
					dxDrawText("500", (sm + 444) * sw / 1920, (hm+185) * sh / 1080, sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight, "left", "top", false, false, true, false, false)
					dxDrawText(500 * 200 * PInfo["Coefmoney"], (sm + 590) * sw / 1920, (hm+185) * sh / 1080, sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight, "left", "top", false, false, true, false, false)
				end
			else
				if(MenuToggle[4][2] ~= 0) then
					local dw = dxGetTextWidth(MenuToggle[4][2], 1 * sw / 1920, AvertaLight)
					local dw2 = dxGetTextWidth(MenuToggle[4][2], 1 * sw / 1920, AvertaLight)
					dxDrawText(MenuToggle[4][2], (sm + 462 - dw / 2) * sw / 1920, (hm+185) * sh / 1080, sw * sw / 1920, sh * sh / 1080, tocolor(190, 190, 190, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight, "left", "top", false, false, true, false, false)
					dxDrawText(MenuToggle[4][2] * 200 * PInfo["Coefmoney"], (sm + 610 - dw2 / 2) * sw / 1920, (hm+185) * sh / 1080, sw * sw / 1920, sh * sh / 1080, tocolor(190, 190, 190, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight, "left", "top", false, false, true, false, false)
				else
					dxDrawText("500", (sm + 444) * sw / 1920, (hm+185) * sh / 1080, sw * sw / 1920, sh * sh / 1080, tocolor(190, 190, 190, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight, "left", "top", false, false, true, false, false)
					dxDrawText(500 * 200 * PInfo["Coefmoney"], (sm + 590) * sw / 1920, (hm+185) * sh / 1080, sw * sw / 1920, sh * sh / 1080, tocolor(190, 190, 190, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight, "left", "top", false, false, true, false, false)
				end
			end
		elseif(MenuToggle[2] == 7) then
			local x, y = getCursorPosition()
			dxDrawImage((sm) 		* sw / 1920,		(hm) * sh / 1080,			(1179) * sw / 1920,		(864) * sh / 1080,			Menu[38][9])
			if(x > 0.434374 and x < 0.544791 and y > 0.262037 and y < 0.521296) then
				dxDrawImage((sm + 450) 	* sw / 1920,		(hm + 165) * sh / 1080,		(237) * sw / 1920,		(302) * sh / 1080,			Menu[38][2])
			else
				dxDrawImage((sm + 450) 	* sw / 1920,		(hm + 165) * sh / 1080,		(237) * sw / 1920,		(302) * sh / 1080,			Menu[38][1])
			end
			if(x > 0.61302 and x < 0.726562 and y > 0.262037 and y < 0.521296) then
				dxDrawImage((sm + 795) 	* sw / 1920,		(hm + 165) * sh / 1080,		(237) * sw / 1920,		(302) * sh / 1080,			Menu[38][4])
			else
				dxDrawImage((sm + 795) 	* sw / 1920,		(hm + 165) * sh / 1080,		(237) * sw / 1920,		(302) * sh / 1080,			Menu[38][3])
			end
			if(x > 0.434374 and x < 0.544791 and y > 0.575925 and y < 0.836111) then
				dxDrawImage((sm + 450) 	* sw / 1920,		(hm + 507) * sh / 1080,		(237) * sw / 1920,		(302) * sh / 1080,			Menu[38][6])
			else
				dxDrawImage((sm + 450) 	* sw / 1920,		(hm + 507) * sh / 1080,		(237) * sw / 1920,		(302) * sh / 1080,			Menu[38][5])
			end
			if(x > 0.61302 and x < 0.726562 and y > 0.575925 and y < 0.836111) then
				dxDrawImage((sm + 795) 	* sw / 1920,		(hm + 507) * sh / 1080,		(237) * sw / 1920,		(302) * sh / 1080,			Menu[38][8])
			else
				dxDrawImage((sm + 795) 	* sw / 1920,		(hm + 507) * sh / 1080,		(237) * sw / 1920,		(302) * sh / 1080,			Menu[38][7])
			end
		elseif(MenuToggle[2] == 8) then
			dxDrawImage((sm) 		* sw / 1920,		(hm) * sh / 1080,			(1179) * sw / 1920,		(864) * sh / 1080,			Menu[39][1])
			dxDrawImage((sm + 484) 	* sw / 1920,		(hm + 56) * sh / 1080,		(527) * sw / 1920,		(696) * sh / 1080,			Menu[39][3])
			dxDrawImage((sm + 552) 	* sw / 1920,		(hm + 628) * sh / 1080,		(393) * sw / 1920,		(62) * sh / 1080,			Menu[39][2])
			local wdx = dxGetTextWidth(MenuToggle[5], 1 * sw / 1920, AvertaRegBig)
			if(wdx <= 355) then
				dxDrawText(MenuToggle[5], (sm + 570) * sw / 1920, (hm+555) * sh / 1080, (sm + 925) * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaRegBig, "left", "top", true, false, true, false, false)
			else
				dxDrawText(MenuToggle[5], (sm + 570) * sw / 1920, (hm+555) * sh / 1080, (sm + 925) * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaRegBig, "right", "top", true, false, true, false, false)
			end
		else
			dxDrawImage((sm) 	* sw / 1920,	(hm) * sh / 1080,		(1178) * sw / 1920,		(864) * sh / 1080,		Menu[1][1])
		end
		if(MenuToggle[2] == 1) then
			dxDrawImage((sm + 9) 	* sw / 1920,	(hm+122) * sh / 1080,	(274) * sw / 1920,		(96) * sh / 1080,		Menu[4])
			dxDrawImage((sm + 660) 	* sw / 1920,	(hm+60) * sh / 1080,	(160) * sw / 1920,		(160) * sh / 1080,		Menu[2])
			dxDrawImage((sm + 376) 	* sw / 1920,	(hm+499) * sh / 1080,	(707) * sw / 1920,		(365) * sh / 1080,		Menu[3])
			dxDrawImage((sm + 386) 	* sw / 1920,	(hm+277) * sh / 1080,	(413) * sw / 1920,		(217) * sh / 1080,		Menu[5])
			dxDrawImage((sm + 803) 	* sw / 1920,	(hm+277) * sh / 1080,	(273) * sw / 1920,		(217) * sh / 1080,		Menu[6])
			if(PInfo["Faction"] > 0) then
				dxDrawImage((sm + 805) * sw / 1920,	(hm+285) * sh / 1080, (271) * sw / 1920, (213) * sh / 1080,	Menu[15][PInfo["Faction"]])
			end
			local expfull = (PInfo["Lvl"] - 1) * 4 + 8
			local expch = expfull / 8
			local tmp = PInfo["Exp"]
			if(PInfo["Exp"] ~= 0) then
				tmp = 1
			end
			expch = math.floor(tmp/expch)
			if(expch == 0) then
				expch = 1
			else
				expch = expch + 1
			end
			dxDrawImage((sm + 375) * sw / 1920,		(hm+280) * sh / 1080, 	(413) * sw / 1920,		(217) * sh / 1080,		Menu[16][expch])
			local name = getPlayerName(localPlayer)
			local w  = dxGetTextWidth(name, 1 * sw / 1920, AvertaBold)
			local max = 512
			local text = PInfo["Lvl"]
			local expost = expfull - PInfo["Exp"]
			local wtext = dxGetTextWidth(text, 1 * sw / 1920, AvertaBoldBig)
			text = tonumber(text)
			local nword = ""
			local bword = ""
			if(math.floor(expost/10) ~= 1 and math.floor(expost/10) ~= 0 and expost % 10 > 1 and expost % 10 < 5) then
				bword = "Осталось"
				nword = "часа"
			elseif(expost % 10 == 1) then
				bword = "Остался"
				nword = "час"
			else
				bword = "Осталось"
				nword = "часов"
			end
			local widthebana = dxGetTextWidth(name, 1 * sw / 1920, AvertaBold)
			dxDrawText(name,								(sm + 740) * sw / 1920, 		(hm+205) * sh / 1080, 	(sm + 740) * sw / 1920, (hm+167) * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBold, "center", "top", false, false, true, false, false)
			dxDrawText("Уровень персонажа", 				(sm + 430) * sw / 1920, 		(hm+300) * sh / 1080, 	sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmall, "left", "top", false, false, true, false, false)
			if(PInfo["Faction"] ~= 0) then
				dxDrawText("Моя организация", 		(sm + 835) * sw / 1920, 		(hm+300) * sh / 1080, 	sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmall, "left", "top", false, false, true, false, false)
			else
				dxDrawText("Моя профессия", 		(sm + 835) * sw / 1920, 		(hm+300) * sh / 1080, 	sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmall, "left", "top", false, false, true, false, false)
			end
			dxDrawText("Статистика", 						(sm + 430) * sw / 1920, 		(hm+521) * sh / 1080, 	sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmall, "left", "top", false, false, true, false, false)
			dxDrawText("Уровень", 							(sm + 441) * sw / 1920, 		(hm+558) * sh / 1080, 	sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "left", "top", false, false, true, false, false)
			dxDrawText("Наличные деньги", 					(sm + 441) * sw / 1920, 		(hm+611) * sh / 1080, 	sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "left", "top", false, false, true, false, false)
			dxDrawText("Деньги в банке", 					(sm + 441) * sw / 1920, 		(hm+674) * sh / 1080, 	sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "left", "top", false, false, true, false, false)
			dxDrawText("Номер дома", 						(sm + 441) * sw / 1920, 		(hm+738) * sh / 1080, 	sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "left", "top", false, false, true, false, false)
			dxDrawText("Номер бизнеса", 					(sm + 441) * sw / 1920, 		(hm+799) * sh / 1080, 	sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "left", "top", false, false, true, false, false)
			dxDrawText("Пол", 								(sm + 766) * sw / 1920, 		(hm+558) * sh / 1080, 	sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "left", "top", false, false, true, false, false)
			dxDrawText("Организация", 						(sm + 766) * sw / 1920, 		(hm+611) * sh / 1080, 	sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "left", "top", false, false, true, false, false)
			dxDrawText("Ранг в организации",				(sm + 766) * sw / 1920, 		(hm+674) * sh / 1080, 	sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "left", "top", false, false, true, false, false)
			dxDrawText("Номер телефона", 					(sm + 766) * sw / 1920, 		(hm+738) * sh / 1080, 	sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "left", "top", false, false, true, false, false)
			dxDrawText("Донат", 							(sm + 766) * sw / 1920, 		(hm+799) * sh / 1080, 	sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "left", "top", false, false, true, false, false)
			if(PInfo["Rank"] ~= 0) then
				dxDrawText(PInfo["Rank"], 	(sm + 968) * sw / 1920, 		(hm+420) * sh / 1080, 	(sm + 975) * sw / 1920, sh * sh / 1080, tocolor(178, 151, 232, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "center", "top", false, false, true, false, false)
			else
				if(PInfo["Work"] == 1) then
					dxDrawText("Водитель автобуса", 	(sm + 855) * sw / 1920, 		(hm+375) * sh / 1080, 	sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmall, "left", "top", false, false, true, false, false)
				elseif(PInfo["Work"] == 2) then
					dxDrawText("Таксист", 	(sm + 900) * sw / 1920, 		(hm+375) * sh / 1080, 	sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmall, "left", "top", false, false, true, false, false)
				elseif(PInfo["Work"] == 3) then
					dxDrawText("Развозчик продуктов", 	(sm + 845) * sw / 1920, 		(hm+375) * sh / 1080, 	sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmall, "left", "top", false, false, true, false, false)
				elseif(PInfo["Work"] == 4) then
					dxDrawText("Водитель эвакуатора", (sm + 745) * sw / 1920, 		(hm+375) * sh / 1080, 	 (sm + 1000) * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmall, "center", "top", false, false, true, false, false)
				else
					dxDrawText("Безработный", 	(sm + 870) * sw / 1920, 		(hm+375) * sh / 1080, 	sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmall, "left", "top", false, false, true, false, false)
				end
			end
			dxDrawText(bword ..  "#B29AE4 " .. (PInfo["Lvl"] - 1) * 4 + 8 - PInfo["Exp"] .. " #FFFFFF" .. nword, 	(sm + 615) * sw / 1920, (hm+366) * sh / 1080, sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "left", "top", false, false, true, true, false)
			dxDrawText("до получения #B29AE4нового",		(sm + 615) * sw / 1920, 		(hm+388) * sh / 1080, 	(sw) * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "left", "top", false, false, true, true, false)
			dxDrawText("уровня",							(sm + 615) * sw / 1920, 		(hm+408) * sh / 1080, 	(sw) * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "left", "top", false, false, true, true, false)
			dxDrawText(text,								(sm + max - 8 - wtext / 2) * sw / 1920, (hm+365) * sh / 1080, 	(sw) * sw / 1920, sh * sh / 1080, tocolor(178, 151, 232, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldBig, "left", "top", false, false, true, true, false)
			dxDrawText("уровень",							(sm + 478) * sw / 1920, 		(hm+405) * sh / 1080, 	(sw) * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "left", "top", false, false, true, true, false)
			local max = 685
			local text = PInfo["Lvl"]
			local wtest = dxGetTextWidth(text, 1 * sw / 1920, AvertaBoldSmallest)
			dxDrawText(text, 			(sm) * sw / 1920, (hm+558) * sh / 1080, (sm + max) * sw / 1920, sh * sh / 1080, tocolor(178, 151, 232, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "right", "top", false, false, true, false, false)
			local text = PInfo["Money"] .. "$"
			local wtest = dxGetTextWidth(text, 1 * sw / 1920, AvertaBoldSmallest)
			dxDrawText(text, 			(sm) * sw / 1920, (hm+611) * sh / 1080, (sm + max) * sw / 1920, sh * sh / 1080, tocolor(178, 151, 232, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "right", "top", false, false, true, false, false)
			local text = PInfo["Bank"] .. "$"
			local wtest = dxGetTextWidth(text, 1 * sw / 1920, AvertaBoldSmallest)
			dxDrawText(text, 			(sm) * sw / 1920, (hm+674) * sh / 1080, (sm + max) * sw / 1920, sh * sh / 1080, tocolor(178, 151, 232, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "right", "top", false, false, true, false, false)
			local text = PInfo["House"]
			local wtest = dxGetTextWidth(text, 1 * sw / 1920, AvertaBoldSmallest)
			if(text == "Отсутствует") then
				dxDrawText(text, 		(sm) * sw / 1920, (hm+738) * sh / 1080, (sm + max) * sw / 1920, sh * sh / 1080, tocolor(159, 155, 170, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "right", "top", false, false, true, false, false)
			else
				dxDrawText(text, 		(sm) * sw / 1920, (hm+738) * sh / 1080, (sm + max) * sw / 1920, sh * sh / 1080, tocolor(178, 151, 232, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "right", "top", false, false, true, false, false)
			end
			local text = PInfo["Bus"]
			local wtest = dxGetTextWidth(text, 1 * sw / 1920, AvertaBoldSmallest)
			if(text == "Отсутствует") then
				dxDrawText(text, 		(sm) * sw / 1920, (hm+799) * sh / 1080, (sm + max) * sw / 1920, sh * sh / 1080, tocolor(159, 155, 170, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "right", "top", false, false, true, false, false)
			else
				dxDrawText(text, 		(sm) * sw / 1920, (hm+799) * sh / 1080, (sm + max) * sw / 1920, sh * sh / 1080, tocolor(178, 151, 232, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "right", "top", false, false, true, false, false)
			end
			local max = 1010
			local text = PInfo["Sex"]
			local wtest = dxGetTextWidth(text, 1 * sw / 1920, AvertaBoldSmallest)
			dxDrawText(text, 			(sm) * sw / 1920, (hm+558) * sh / 1080, (sm + max) * sw / 1920, sh * sh / 1080, tocolor(178, 151, 232, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "right", "top", false, false, true, false, false)
			local text = PInfo["FName"]
			local wtest = dxGetTextWidth(text, 1 * sw / 1920, AvertaBoldSmallest)
			if(text == "Отсутствует") then
				dxDrawText(text, (sm) * sw / 1920, (hm+611) * sh / 1080, (sm + max) * sw / 1920, sh * sh / 1080, tocolor(159, 155, 170, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "right", "top", false, false, true, false, false)
			else
				dxDrawText(text, (sm) * sw / 1920, (hm+611) * sh / 1080, (sm + max) * sw / 1920, sh * sh / 1080, tocolor(178, 151, 232, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "right", "top", false, false, true, false, false)
			end
			local text = PInfo["FRank"]
			local wtest = dxGetTextWidth(text, 1 * sw / 1920, AvertaBoldSmallest)
			if(text == "Отсутствует") then
				dxDrawText(text, 		(sm) * sw / 1920, (hm+674) * sh / 1080, (sm + max) * sw / 1920, sh * sh / 1080, tocolor(159, 155, 170, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "right", "top", false, false, true, false, false)
			else
				dxDrawText(text, 		(sm) * sw / 1920, (hm+674) * sh / 1080, (sm + max) * sw / 1920, sh * sh / 1080, tocolor(178, 151, 232, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "right", "top", false, false, true, false, false)
			end
			local text = PInfo["PhoneNumber"][1] .. "-" .. PInfo["PhoneNumber"][2]
			local wtest = dxGetTextWidth(text, 1 * sw / 1920, AvertaBoldSmallest)
			dxDrawText(text, 			(sm) * sw / 1920, (hm+738) * sh / 1080, (sm + max) * sw / 1920, sh * sh / 1080, tocolor(178, 151, 232, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "right", "top", false, false, true, false, false)
			local text = PInfo["Donate"] .. " VC"
			local wtest = dxGetTextWidth(text, 1 * sw / 1920, AvertaBoldSmallest)
			dxDrawText(text, 			(sm) * sw / 1920, (hm+799) * sh / 1080, (sm + max) * sw / 1920, sh * sh / 1080, tocolor(178, 151, 232, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "right", "top", false, false, true, false, false)
		elseif(MenuToggle[2] == 2) then
			dxDrawImage((sm + 9) 	* sw / 1920,	(hm+192) * sh / 1080,	(274) * sw / 1920,		(96) * sh / 1080,		Menu[4])
			dxDrawImage((sm + 392) 	* sw / 1920,	(hm+255) * sh / 1080,	(704) * sw / 1920,		(385) * sh / 1080,		Menu[19])
			dxDrawImage((sm + 615) 	* sw / 1920,	(hm+515) * sh / 1080,	(248) * sw / 1920,		(73) * sh / 1080,		Menu[18])
			if(repString ~= "") then
				local tw = dxGetTextWidth(repString, 1 * sw / 1920, AvertaLightBold)
				if(tw > (549) * sw / 1920 ) then
					dxDrawText(repString, (sm + 470) * sw / 1920,	(hm+445) * sh / 1080, (sm + 1019) * sw / 1920,	(hm+515) * sh / 1080, tocolor(255, 255, 255, 255), 1 * sw / 1920, 1 * sh / 1080, AvertaLightBold,	"right", "top", true, false, true, false, false)
				else
					dxDrawText(repString, (sm + 470) * sw / 1920,	(hm+445) * sh / 1080, (sm + 1019) * sw / 1920,	(hm+515) * sh / 1080, tocolor(255, 255, 255, 255), 1 * sw / 1920, 1 * sh / 1080, AvertaLightBold,	"left", "top", true, false, true, false, false)
				end
			else
				dxDrawText("Введите Ваш текст", (sm + 470) 	* sw / 1920,	(hm+445) * sh / 1080, (sm + 615) * sw / 1920,	(hm+515) * sh / 1080, tocolor(76, 74, 92, 255), 1 * sw / 1920, 1 * sh / 1080, AvertaLightBold,	"left", "top", false, false, true, false, false)
			end
		elseif(MenuToggle[2] == 3) then
			dxDrawImage((sm + 9) 	* sw / 1920,	(hm+260) * sh / 1080,	(274) * sw / 1920,		(96) * sh / 1080,		Menu[4])
		elseif(MenuToggle[2] == 4) then
			dxDrawImage((sm + 9) 	* sw / 1920,	(hm+334) * sh / 1080,	(274) * sw / 1920,		(96) * sh / 1080,		Menu[4])
			dxDrawImage((sm + 480) 	* sw / 1920,	(hm+40) * sh / 1080,	(533) * sw / 1920,		(812) * sh / 1080,		Menu[20])
			if(PHD == true) then
				dxDrawImage((sm + 910) 	* sw / 1920,	(hm+140) * sh / 1080,	(66) * sw / 1920,		(44) * sh / 1080,		Menu[22])
			else
				dxDrawImage((sm + 910) 	* sw / 1920,	(hm+140) * sh / 1080,	(66) * sw / 1920,		(44) * sh / 1080,		Menu[23])
			end
			if(NameToggle == true) then
				dxDrawImage((sm + 910) 	* sw / 1920,	(hm+230) * sh / 1080,	(66) * sw / 1920,		(44) * sh / 1080,		Menu[22])
			else
				dxDrawImage((sm + 910) 	* sw / 1920,	(hm+230) * sh / 1080,	(66) * sw / 1920,		(44) * sh / 1080,		Menu[23])
			end
			if(PCD == true) then
				dxDrawImage((sm + 910) 	* sw / 1920,	(hm+320) * sh / 1080,	(66) * sw / 1920,		(44) * sh / 1080,		Menu[22])
			else
				dxDrawImage((sm + 910) 	* sw / 1920,	(hm+320) * sh / 1080,	(66) * sw / 1920,		(44) * sh / 1080,		Menu[23])
			end
			dxDrawImage((sm + 910) 	* sw / 1920,	(hm+580) * sh / 1080,	(66) * sw / 1920,		(44) * sh / 1080,		Menu[23])
			dxDrawImage((sm + 910) 	* sw / 1920,	(hm+690) * sh / 1080,	(66) * sw / 1920,		(44) * sh / 1080,		Menu[23])
			dxDrawImage((sm + 545) 	* sw / 1920,	(hm+425) * sh / 1080,	(445) * sw / 1920,		(40) * sh / 1080,		Menu[24][HudAlpha + 1])
			dxDrawText("HUD", (sm + 545) * sw / 1920,	(hm+115) * sh / 1080, (sm + 1019) * sw / 1920,	(hm+515) * sh / 1080, tocolor(255, 255, 255, 255), 1 * sw / 1920, 1 * sh / 1080, AvertaLight,	"left", "top", false, false, true, false, false)
			dxDrawText("Включает и выключает внутриигровой интерфейс.", (sm + 545) * sw / 1920,	(hm+155) * sh / 1080, (sm + 1019) * sw / 1920,	(hm+515) * sh / 1080, tocolor(255, 255, 255, 255), 1 * sw / 1920, 1 * sh / 1080, AvertaLightSmall,	"left", "top", false, false, true, false, false)
			dxDrawText("Ники", (sm + 545) * sw / 1920,	(hm+205) * sh / 1080, (sm + 1019) * sw / 1920,	(hm+515) * sh / 1080, tocolor(255, 255, 255, 255), 1 * sw / 1920, 1 * sh / 1080, AvertaLight,	"left", "top", false, false, true, false, false)
			dxDrawText("Скрывает никнеймы игроков.", (sm + 545) * sw / 1920,	(hm+245) * sh / 1080, (sm + 1019) * sw / 1920,	(hm+515) * sh / 1080, tocolor(255, 255, 255, 255), 1 * sw / 1920, 1 * sh / 1080, AvertaLightSmall,	"left", "top", false, false, true, false, false)
			dxDrawText("Чат", (sm + 545) * sw / 1920,	(hm+295) * sh / 1080, (sm + 1019) * sw / 1920,	(hm+515) * sh / 1080, tocolor(255, 255, 255, 255), 1 * sw / 1920, 1, AvertaLight,	"left", "top", false, false, true, false, false)
			dxDrawText("Скрывает и показывает чат.", (sm + 545) * sw / 1920,	(hm+335) * sh / 1080, (sm + 1019) * sw / 1920,	(hm+515) * sh / 1080, tocolor(255, 255, 255, 255), 1 * sw / 1920, 1 * sh / 1080, AvertaLightSmall,	"left", "top", false, false, true, false, false)
			dxDrawText("E-mail", (sm + 545) * sw / 1920,	(hm+555) * sh / 1080, (sm + 1019) * sw / 1920,	(hm+505) * sh / 1080, tocolor(255, 255, 255, 255), 1 * sw / 1920, 1 * sh / 1080, AvertaLight,	"left", "top", false, false, true, false, false)
			dxDrawText("Подтверждение электронной почты.", (sm + 545) * sw / 1920,	(hm+595) * sh / 1080, (sm + 1019) * sw / 1920,	(hm+515) * sh / 1080, tocolor(255, 255, 255, 255), 1 * sw / 1920, 1 * sh / 1080, AvertaLightSmall,	"left", "top", false, false, true, false, false)
			dxDrawText("Google authenticator", (sm + 545) * sw / 1920,	(hm+665) * sh / 1080, (sm + 1019) * sw / 1920,	(hm+615) * sh / 1080, tocolor(255, 255, 255, 255), 1 * sw / 1920, 1 * sh / 1080, AvertaLight,	"left", "top", false, false, true, false, false)
			dxDrawText("Дополнительная привязка.", (sm + 545) * sw / 1920,	(hm+705) * sh / 1080, (sm + 1019) * sw / 1920,	(hm+515) * sh / 1080, tocolor(255, 255, 255, 255), 1 * sw / 1920, 1 * sh / 1080, AvertaLightSmall,	"left", "top", false, false, true, false, false)
			dxDrawText("Прозрачность HUD", (sm + 545) * sw / 1920,	(hm+385) * sh / 1080, (sm + 1019) * sw / 1920,	(hm+505) * sh / 1080, tocolor(255, 255, 255, 255), 1 * sw / 1920, 1 * sh / 1080, AvertaLight, "left", "top", false, false, true, false, false)
		elseif(MenuToggle[2] == 5) then
			dxDrawImage((sm + 9) 	* sw / 1920,	(hm+409) * sh / 1080,	(274) * sw / 1920,		(96) * sh / 1080,		Menu[4])
		elseif(MenuToggle[2] == 6) then
			dxDrawImage((sm + 9) 	* sw / 1920,	(hm+485) * sh / 1080,	(274) * sw / 1920,		(96) * sh / 1080,		Menu[4])
		elseif(MenuToggle[2] == 7) then
			dxDrawImage((sm + 9) 	* sw / 1920,	(hm+560) * sh / 1080,	(274) * sw / 1920,		(96) * sh / 1080,		Menu[4])
		else
			dxDrawImage((sm + 9) 	* sw / 1920,	(hm+635) * sh / 1080,	(274) * sw / 1920,		(96) * sh / 1080,		Menu[4])
		end
		dxDrawImage((sm + 46) 	* sw / 1920,	(hm+155) * sh / 1080,	(19) * sw / 1920,		(20) * sh / 1080,		Menu[7])
		dxDrawImage((sm + 46) 	* sw / 1920,	(hm+225) * sh / 1080,	(19) * sw / 1920,		(20) * sh / 1080,		Menu[8])
		dxDrawImage((sm + 46) 	* sw / 1920,	(hm+295) * sh / 1080,	(19) * sw / 1920,		(20) * sh / 1080,		Menu[9])
		dxDrawImage((sm + 46) 	* sw / 1920,	(hm+369) * sh / 1080,	(19) * sw / 1920,		(20) * sh / 1080,		Menu[10])
		dxDrawImage((sm + 46) 	* sw / 1920,	(hm+445) * sh / 1080,	(19) * sw / 1920,		(20) * sh / 1080,		Menu[11])
		dxDrawImage((sm + 46) 	* sw / 1920,	(hm+519) * sh / 1080,	(19) * sw / 1920,		(20) * sh / 1080,		Menu[12])
		dxDrawImage((sm + 46) 	* sw / 1920,	(hm+594) * sh / 1080,	(19) * sw / 1920,		(20) * sh / 1080,		Menu[13])
		dxDrawImage((sm + 46) 	* sw / 1920,	(hm+669) * sh / 1080,	(19) * sw / 1920,		(20) * sh / 1080,		Menu[14])
		if(MenuToggle[2] == 1) then
			dxDrawText("Статистика", 		(sm + 90) * sw / 1920, (hm+155) * sh / 1080, (sw) * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaReg,		"left", "top", false, false, true, false, false)
		else
			dxDrawText("Статистика", 		(sm + 90) * sw / 1920, (hm+155) * sh / 1080, (sw) * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight,	"left", "top", false, false, true, false, false)
		end
		if(MenuToggle[2] == 2) then
			dxDrawText("Репорт", 			(sm + 91) * sw / 1920, (hm+225) * sh / 1080, (sw) * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaReg,	"left", "top", false, false, true, false, false)
		else
			dxDrawText("Репорт", 			(sm + 91) * sw / 1920, (hm+225) * sh / 1080, (sw) * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight,	"left", "top", false, false, true, false, false)
		end
		if(MenuToggle[2] == 3) then
			dxDrawText("Команды сервера", 	(sm + 90) * sw / 1920, (hm+293) * sh / 1080, (sw) * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaReg,	"left", "top", false, false, true, false, false)
		else
			dxDrawText("Команды сервера", 	(sm + 90) * sw / 1920, (hm+293) * sh / 1080, (sw) * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight,	"left", "top", false, false, true, false, false)
		end
		if(MenuToggle[2] == 4) then
			dxDrawText("Настройки", 		(sm + 91) * sw / 1920, (hm+367) * sh / 1080, (sw) * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaReg,	"left", "top", false, false, true, false, false)
		else
			dxDrawText("Настройки", 		(sm + 91) * sw / 1920, (hm+367) * sh / 1080, (sw) * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight,	"left", "top", false, false, true, false, false)
		end
		if(MenuToggle[2] == 5) then
			dxDrawText("Правила", 			(sm + 91) * sw / 1920, (hm+443) * sh / 1080, (sw) * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaReg,	"left", "top", false, false, true, false, false)
		else 
			dxDrawText("Правила", 			(sm + 91) * sw / 1920, (hm+443) * sh / 1080, (sw) * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight,	"left", "top", false, false, true, false, false)
		end
		if(MenuToggle[2] == 6) then
			dxDrawText("Донат", 			(sm + 90) * sw / 1920, (hm+516) * sh / 1080, (sw) * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaReg,	"left", "top", false, false, true, false, false)
		else 
			dxDrawText("Донат", 			(sm + 90) * sw / 1920, (hm+516) * sh / 1080, (sw) * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight,	"left", "top", false, false, true, false, false)
		end
		if(MenuToggle[2] == 7) then
			dxDrawText("Подписки", 			(sm + 90) * sw / 1920, (hm+592) * sh / 1080, (sw) * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaReg,	"left", "top", false, false, true, false, false)
		else 
			dxDrawText("Подписки", 			(sm + 90) * sw / 1920, (hm+592) * sh / 1080, (sw) * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight,	"left", "top", false, false, true, false, false)
		end
		if(MenuToggle[2] == 8) then
			dxDrawText("Промокод", 			(sm + 90) * sw / 1920, (hm+668) * sh / 1080, (sw) * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaReg,	"left", "top", false, false, true, false, false)
		else 
			dxDrawText("Промокод", 			(sm + 90) * sw / 1920, (hm+668) * sh / 1080, (sw) * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight,	"left", "top", false, false, true, false, false)
		end
		dxDrawImage((sm + 1137) * sw / 1920,	(hm+12) * sh / 1080, 	(31) * sw / 1920,		(29) * sh / 1080,		Menu[17])
	elseif(Fishing == true) then
		dxDrawImage(sw/2 - (315 * sw / 1920)/2, sh/2 - (315 * sh / 1080)/2, 315 * sw / 1920, 315 * sh / 1080, FishUI[1])
		dxDrawCircle(sw/2, sh/2, rad * sw / 1920, 0, 360, tocolor(255, 255, 255, 255), tocolor(255, 255, 255, 255), 512, 1, false)
		dxDrawImage(sw/2 - (69 * sw / 1920)/2, sh/2 - (95 * sh / 1080)/2, 69 * sw / 1920, 95 * sh / 1080, FishUI[3])
	elseif(biz == true) then
		dxDrawImage(sw/2 - (1028 * sw / 1920)/2, 					sh/2 - (454 * sh / 1080) /2, 					1028 * sw / 1920, 	454 * sh / 1080, 	CaptureUI[1])
		dxDrawImage(sw/2 - (418 * sw / 1920)/2 + 10 * sw / 1920, 	sh/2 - (49 * sh / 1080) / 2 + 180 * sh / 1080, 	418 * sw / 1920, 	49 * sh / 1080, 	CaptureUI[2])
		if(wartarget == 1) then
			dxDrawImage(sw/2 - (95 * sw / 1920)/2 - 160 * sw / 1920, 	sh/2 - (63 * sh / 1080) / 2 - 100 * sh / 1080, 	95 * sw / 1920, 	63 * sh / 1080, 	CaptureUI[3])
			dxDrawImage(sw/2 - (95 * sw / 1920)/2, 						sh/2 - (63 * sh / 1080) / 2 - 100 * sh / 1080, 	95 * sw / 1920, 	63 * sh / 1080, 	CaptureUI[6])
			dxDrawImage(sw/2 - (95 * sw / 1920)/2 + 160 * sw / 1920, 	sh/2 - (63 * sh / 1080) / 2 - 100 * sh / 1080, 	95 * sw / 1920, 	63 * sh / 1080, 	CaptureUI[8])
		elseif(wartarget == 2) then
			dxDrawImage(sw/2 - (95 * sw / 1920)/2 - 160 * sw / 1920, 	sh/2 - (63 * sh / 1080) / 2 - 100 * sh / 1080, 	95 * sw / 1920, 	63 * sh / 1080, 	CaptureUI[4])
			dxDrawImage(sw/2 - (95 * sw / 1920)/2, 						sh/2 - (63 * sh / 1080) / 2 - 100 * sh / 1080, 	95 * sw / 1920, 	63 * sh / 1080, 	CaptureUI[5])
			dxDrawImage(sw/2 - (95 * sw / 1920)/2 + 160 * sw / 1920, 	sh/2 - (63 * sh / 1080) / 2 - 100 * sh / 1080, 	95 * sw / 1920, 	63 * sh / 1080, 	CaptureUI[8])
		else
			dxDrawImage(sw/2 - (95 * sw / 1920)/2 - 160 * sw / 1920, 	sh/2 - (63 * sh / 1080) / 2 - 100 * sh / 1080, 	95 * sw / 1920, 	63 * sh / 1080, 	CaptureUI[4])
			dxDrawImage(sw/2 - (95 * sw / 1920)/2, 						sh/2 - (63 * sh / 1080) / 2 - 100 * sh / 1080, 	95 * sw / 1920, 	63 * sh / 1080, 	CaptureUI[6])
			dxDrawImage(sw/2 - (95 * sw / 1920)/2 + 160 * sw / 1920, 	sh/2 - (63 * sh / 1080) / 2 - 100 * sh / 1080, 	95 * sw / 1920, 	63 * sh / 1080, 	CaptureUI[7])
		end
		local w = dxGetTextWidth("Вы уверены, что хотите начать войну за бизнес?", 1 * sw / 1920, Robotto)
		dxDrawText("Вы уверены, что хотите начать войну за бизнес?", 	sw/2 - w/2, 	sh/2 - (63 * sh / 1080) / 2, (sw) * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, Robotto,"left", "top", false, false, true, false, false)
		local w = dxGetTextWidth("Ваш противник: " .. warior, 1 * sw / 1920, Robotto)
		dxDrawText("Ваш противник: " .. warior, 	sw/2 - w/2, 	sh/2 - (63 * sh / 1080) / 2 + 55 * sh / 1080, (sw) * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, Robotto,"left", "top", false, false, true, false, false)
		local w = dxGetTextWidth("Бизнес: " .. biztarget, 1 * sw / 1920, RobottoItalic)
		dxDrawText("Бизнес: " .. biztarget, 	sw/2 - w/2, 	sh/2 - (63 * sh / 1080) / 2 + 135 * sh / 1080, (sw) * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, RobottoItalic,"left", "top", false, false, true, false, false)
	end
	if(Driver == true) then
		if(getPedOccupiedVehicle(localPlayer) ~= false) then
			local veh = getPedOccupiedVehicle(localPlayer)
			dxDrawImage(screenWidth / 1.4669, screenHeight / 1.2705, screenWidth / 3.516483, screenHeight / 5.346534653, SpeedUI[1])
			dxDrawImage(screenWidth / 1.4639, screenHeight / 1.2710, screenWidth / 3.516483, screenHeight / 5.346534653, SpeedUI[2])
			if(getVehicleOverrideLights(veh) == 2) then
				dxDrawImage(screenWidth / 1.4315, screenHeight / 1.2720, screenWidth / 3.516483, screenHeight / 5.346534653, SpeedUI[3])
			else
				dxDrawImage(screenWidth / 1.4315, screenHeight / 1.2720, screenWidth / 3.516483, screenHeight / 5.346534653, SpeedUI[4])
			end
			if(isVehicleLocked(veh) == true) then
				dxDrawImage(screenWidth / 1.4665, screenHeight / 1.2710, screenWidth / 3.516483, screenHeight / 5.346534653, SpeedUI[7])
			else
				dxDrawImage(screenWidth / 1.4665, screenHeight / 1.2710, screenWidth / 3.516483, screenHeight / 5.346534653, SpeedUI[8])
			end
			local screenWidth, screenHeight = guiGetScreenSize()
			if(tonumber(str) ~= nil) then
				if(tonumber(str) < 100) then
					if(tonumber(str) < 10) then
						str = "00"..tonumber(str)
					else
						str = "0"..tonumber(str)
					end
				end
			end
			if(tonumber(str) == 0) then
				str = "000"
			end
			dxDrawText ( str, screenWidth-screenWidth*0.253, screenHeight - screenHeight * 0.12, screenWidth, screenHeight, tocolor ( 255,255,255,255 ), screenWidth / 900, screenHeight / 900 * 1.7, "pricedown",  "left", "top", false, false, true, false, false )
			local x, y, z = getElementVelocity( getPedOccupiedVehicle (localPlayer))
			local str2 = math.round(math.sqrt(x * x + y * y + z * z) * 200)
			local xro = screenWidth-screenWidth*0.160
			if(tonumber(str2) ~= nil) then
				if(tonumber(str2) < 100) then
					if(tonumber(str2) < 10) then
						str2 = "00"..str2
					else
						str2 = "0"..str2
					end
				elseif(tonumber(str2) >= 100 and tonumber(str2) < 200) then
					local screenWidth, screenHeight = guiGetScreenSize()
					xro = screenWidth - (screenWidth * 0.145)
				end
			end

			dxDrawText ( str2, xro, screenHeight - screenHeight * 0.22, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1 * screenWidth / 1920, 1 * screenHeight / 1080 * 1.15, PricedownMod,  "left", "top", false, false, true, false, false)	
			if(getVehicleEngineState(getPedOccupiedVehicle (localPlayer)) == true) then
				dxDrawImage(screenWidth / 1.5025, screenHeight / 1.2710, screenWidth / 3.516483, screenHeight / 5.346534653, SpeedUI[5])
			else
				dxDrawImage(screenWidth / 1.5025, screenHeight / 1.2710, screenWidth / 3.516483, screenHeight / 5.346534653, SpeedUI[6])
			end
		end
	end
	local strel = getPlayerMoney()
	if(strel > 99999999) then
		strel = 99999999
	end
	local text = "EXP: " .. EXP .. "/" .. (LVL - 1) * 4 + 8 ..""
	local hp = math.round(getElementHealth(localPlayer))
	local armour = math.round(getPedArmor(localPlayer))
	local ox = math.round(getPedOxygenLevel(localPlayer) / 10)
	if(Rega == true) then
		local mx, my = getCursorPosition()
		dxDrawImage(0, 0, 1920 * sw / 1920, 1080 * sh / 1080, RegisterUI[1])
		dxDrawImage(0, 0, 1920 * sw / 1920, 1080 * sh / 1080, RegisterUI[2])
		if(alo == al and al ~= nil and al ~= "" and string.len(al) > 3) then
			if(mx > 0.43 and mx < 0.56 and my > 0.74 and my < 0.80) then
				dxDrawImage(0, 0, 1920 * sw / 1920, 1080 * sh / 1080, RegisterUI[6], 0, 0, 0, tocolor(255, 255, 255, 255))
			else
				dxDrawImage(0, 0, 1920 * sw / 1920, 1080 * sh / 1080, RegisterUI[6], 0, 0, 0, tocolor(235, 235, 235, 235))
			end
		else
			if(mx > 0.43 and mx < 0.56 and my > 0.74 and my < 0.80) then
				dxDrawImage(0, 0, 1920 * sw / 1920, 1080 * sh / 1080, RegisterUI[7], 0, 0, 0)
			else
				dxDrawImage(0, 0, 1920 * sw / 1920, 1080 * sh / 1080, RegisterUI[7], 0, 0, 0, tocolor(235, 235, 235, 235))
			end
		end
		local n = getPlayerName(localPlayer)
		local NameWidth = dxGetTextWidth(n, screenWidth / 1920 * 0.8, LogSh)
		local post = screenWidth * 0.5 - NameWidth * (0.5)
		if(LogSh ~= false) then
			dxDrawText ( n, post, screenHeight * 0.350, screenWidth, screenHeight, tocolor(255, 255, 255, 255), screenWidth / 1920 * 0.8, screenHeight / 1080 , LogSh, "left", "top", false, false, true)
		else
			dxDrawText ( n, post, screenHeight * 0.350, screenWidth, screenHeight, tocolor(255, 255, 255, 255), screenWidth / 1920 * 0.8, screenHeight / 1080 , "pricedown", "left", "top", false, false, true)
		end
		local str = al
		if(string.len(str) == 0) then
			str = "Введите пароль"
			pos = screenWidth * 0.5 - dxGetTextWidth(str, screenWidth / 1920 * 0.8, LogSh) / 2
		else
			pos = screenWidth * 0.5 - (string.len(str) * (screenWidth * 0.0038))
		end
		if(LogSh ~= false) then
			if(Rega1 == true) then
				dxDrawText ( str, pos, screenHeight * 0.445, screenWidth, screenHeight, tocolor(198, 111, 192, 255), screenWidth / 1920 * 0.8, screenHeight / 1080 , LogSh, "left", "top", false, false, true)
			else
				local x, y = getCursorPosition()
				if(x > 0.41 and x < 0.58 and y > 0.43 and y < 0.50) then
					dxDrawText ( str, pos, screenHeight * 0.445, screenWidth, screenHeight, tocolor(198, 141, 221, 255), screenWidth / 1920 * 0.8, screenHeight / 1080 , LogSh, "left", "top", false, false, true)
				else
					dxDrawText ( str, pos, screenHeight * 0.445, screenWidth, screenHeight, tocolor(255, 255, 255, 255), screenWidth / 1920 * 0.8, screenHeight / 1080 , LogSh, "left", "top", false, false, true)
				end
			end
		else
			if(Rega1 == true) then
				dxDrawText ( str, pos, screenHeight * 0.445, screenWidth, screenHeight, tocolor(138, 111, 192, 255), screenWidth / 1920 * 0.8, screenHeight / 1080 , "pricedown", "left", "top", false, false, true)
			else
				dxDrawText ( str, pos, screenHeight * 0.445, screenWidth, screenHeight, tocolor(255, 255, 255, 255), screenWidth / 1920 * 0.8, screenHeight / 1080 , "pricedown", "left", "top", false, false, true)
			end
		end
		local str = alo
		if(string.len(str) == 0) then
			str = "Повторить пароль"
			pos = screenWidth * 0.5 - dxGetTextWidth(str, screenWidth / 1920 * 0.8, LogSh) / 2
		else
			pos = screenWidth * 0.5 - (string.len(str) * (screenWidth * 0.0038))
		end
		if(LogSh ~= false) then
			if(Rega2 == true) then
				dxDrawText ( str, pos, screenHeight * 0.525, screenWidth, screenHeight, tocolor(198, 111, 192, 255), screenWidth / 1920 * 0.8, screenHeight / 1080 , LogSh, "left", "top", false, false, true)
			else
				local x, y = getCursorPosition()
				if(x < 0.58 and x > 0.43 and y > 0.51 and y < 0.58) then
					dxDrawText ( str, pos, screenHeight * 0.525, screenWidth, screenHeight, tocolor(198, 141, 222, 255), screenWidth / 1920 * 0.8, screenHeight / 1080 , LogSh, "left", "top", false, false, true)
				else
					dxDrawText ( str, pos, screenHeight * 0.525, screenWidth, screenHeight, tocolor(255, 255, 255, 255), screenWidth / 1920 * 0.8, screenHeight / 1080 , LogSh, "left", "top", false, false, true)
				end
			end
		else
			if(Rega2 == true) then
				dxDrawText ( str, pos, screenHeight * 0.525, screenWidth, screenHeight, tocolor(138, 111, 192, 255), screenWidth / 1920 * 0.8, screenHeight / 1080 , "pricedown", "left", "top", false, false, true)
			else
				dxDrawText ( str, pos, screenHeight * 0.525, screenWidth, screenHeight, tocolor(255, 255, 255, 255), screenWidth / 1920 * 0.8, screenHeight / 1080 , "pricedown", "left", "top", false, false, true)
			end
		end
	end
	if(LoginUI == true) then
		local n = getPlayerName(localPlayer)
		local NameWidth = dxGetTextWidth(n, screenWidth / 1920 * 0.8, LogSh)
		local post = screenWidth * 0.5 - NameWidth * 0.5
		if(LogSh ~= false) then
			dxDrawText ( n, post, screenHeight * 0.350, screenWidth, screenHeight, tocolor(255, 255, 255, 255), screenWidth / 1920 * 0.8, screenHeight / 1080 , LogSh, "left", "top", false, false, true)
		else
			dxDrawText ( n, post, screenHeight * 0.350, screenWidth, screenHeight, tocolor(255, 255, 255, 255), screenWidth / 1920 * 0.8, screenHeight / 1080 , "pricedown", "left", "top", false, false, true)
		end
		local str = string.rep("*", string.len(LoginPass))
		local pos = 0
		if(string.len(str) == 0) then
			str = "Введите пароль"
			pos = screenWidth * 0.5 - (string.len(str) * (screenWidth * 0.0018))
		else
			pos = screenWidth * 0.5 - (string.len(str) * (screenWidth * 0.0038))
		end
		if(LogSh ~= false) then
			dxDrawText ( str, pos, screenHeight * 0.445, screenWidth, screenHeight, tocolor(255, 255, 255, 255), screenWidth / 1920 * 0.8, screenHeight / 1080 , LogSh, "left", "top", false, false, true)
		else
			dxDrawText ( str, pos, screenHeight * 0.445, screenWidth, screenHeight, tocolor(255, 255, 255, 255), screenWidth / 1920 * 0.8, screenHeight / 1080 , "pricedown", "left", "top", false, false, true)
		end
		if(errorpassword ~= nil) then
			if(errorpassword > 0) then
				dxDrawText ("Попытка авторизации: " .. errorpassword .. "/3", screenWidth * 0.405, screenHeight * 0.725, screenWidth, screenHeight, tocolor(255, 255, 255, 255), screenWidth / 1920 * 0.8, screenHeight / 1080 , LogSh, "left", "top", false, false, true)
			end
		end
	end
	if(PHD == true) then
		if(HudToggle == true) then
			local ad = 255 / 10
			dxDrawImage(screenWidth / 1.367521, screenHeight / 38.571428, screenWidth / 3.8709, screenHeight / 4.9090, NewHUD[1], 	0, 0, 0, tocolor(255, 255, 255, ad * HudAlpha), true)
			dxDrawImage(screenWidth / 1.367521, screenHeight / 38.571428, screenWidth / 3.8709, screenHeight / 4.9090, NewHUD[2], 	0, 0, 0, tocolor(255, 255, 255, ad * HudAlpha), true)
			dxDrawImage(screenWidth / 1.367521, screenHeight / 38.571428, screenWidth / 3.8709, screenHeight / 4.9090, NewHUD[3], 	0, 0, 0, tocolor(255, 255, 255, ad * HudAlpha), true)
			dxDrawImage(screenWidth / 1.339521, screenHeight / 38.571428, screenWidth / 3.8709, screenHeight / 4.9090, NewHUD[4], 	0, 0, 0, tocolor(255, 255, 255, ad * HudAlpha), true)
			dxDrawImage(screenWidth / 1.367521, screenHeight / 38.571428, screenWidth / 3.8709, screenHeight / 4.9090, NewHUD[5], 	0, 0, 0, tocolor(255, 255, 255, ad * HudAlpha), true)
			dxDrawImage(screenWidth / 1.350521, screenHeight / 38.571428, screenWidth / 3.8709, screenHeight / 4.9090, NewHUD[6], 	0, 0, 0, tocolor(255, 255, 255, ad * HudAlpha), true)
			dxDrawImage(screenWidth / 1.367521, screenHeight / 38.571428, screenWidth / 3.8709, screenHeight / 4.9090, NewHUD[7], 	0, 0, 0, tocolor(255, 255, 255, ad * HudAlpha), true)
			dxDrawImage(screenWidth / 1.367521, screenHeight / 38.571428, screenWidth / 3.8709, screenHeight / 4.9090, NewHUD[8], 	0, 0, 0, tocolor(255, 255, 255, ad * HudAlpha), true)
			dxDrawImage(screenWidth / 1.367521, screenHeight / 38.571428, screenWidth / 3.8709, screenHeight / 4.9090, NewHUD[9], 	0, 0, 0, tocolor(255, 255, 255, ad * HudAlpha), true)
			dxDrawText ( strel, screenWidth-screenWidth*0.207, screenHeight * 0.116, screenWidth, screenHeight, tocolor(255, 255, 255, ad * HudAlpha), screenWidth / 1610, screenHeight / 910 , "pricedown", "left", "top", false, false, true)
			dxDrawText(text, screenWidth-screenWidth*0.120, screenHeight * 0.105, screenWidth, screenHeight, tocolor(144, 144, 144, ad * HudAlpha), screenWidth / 3600, screenHeight / 2200, shrift, "left", "top", false, false, true)
			dxDrawText(hp, screenWidth-screenWidth*0.135, screenHeight * 0.052, screenWidth, screenHeight, tocolor(255, 255, 255, ad * HudAlpha), screenWidth / 2800, screenHeight / 1400, shr, "left", "top", false, false, true)
			dxDrawText(Food, screenWidth-screenWidth*0.135, screenHeight * 0.077, screenWidth, screenHeight, tocolor(255, 255, 255, ad * HudAlpha), screenWidth / 2800, screenHeight / 1400, shr, "left", "top", false, false, true)
			dxDrawText(LVL, screenWidth-screenWidth*0.134, screenHeight * 0.100, screenWidth, screenHeight, tocolor(255, 255, 255, ad * HudAlpha), screenWidth / 2800, screenHeight / 1400, shr, "left", "top", false, false, true)
			dxDrawText(armour, screenWidth-screenWidth*0.125, screenHeight * 0.123, screenWidth, screenHeight, tocolor(255, 255, 255, ad * HudAlpha), screenWidth / 2800, screenHeight / 1400, shr, "left", "top", false, false, true)
			dxDrawText(ox, screenWidth-screenWidth*0.0935, screenHeight * 0.123, screenWidth, screenHeight, tocolor(255, 255, 255, ad * HudAlpha), screenWidth / 2800, screenHeight / 1400, shr, "left", "top", false, false, true)
			dxDrawRectangle(screenWidth-screenWidth*0.209, screenHeight * 0.057, screenWidth * 0.0715, screenHeight * 0.004, tocolor(38, 58, 62, ad * HudAlpha), true)
			dxDrawRectangle(screenWidth-screenWidth*0.209, screenHeight * 0.061, screenWidth * 0.0715, screenHeight * 0.004, tocolor(28, 42, 45, ad * HudAlpha), true)
			dxDrawRectangle(screenWidth-screenWidth*0.209, screenHeight * 0.057, (screenWidth * 0.0715)  * hp / 100, screenHeight * 0.004, tocolor(220, 0, 0, ad * HudAlpha), true)
			dxDrawRectangle(screenWidth-screenWidth*0.209, screenHeight * 0.061, (screenWidth * 0.0715)  * hp / 100, screenHeight * 0.004, tocolor(160, 0, 0, ad * HudAlpha), true)
			dxDrawRectangle(screenWidth-screenWidth*0.209, screenHeight * 0.08, screenWidth * 0.0715, screenHeight * 0.004, tocolor(38, 58, 62, ad * HudAlpha), true)
			dxDrawRectangle(screenWidth-screenWidth*0.209, screenHeight * 0.084, screenWidth * 0.0715, screenHeight * 0.004, tocolor(28, 42, 45, ad * HudAlpha), true)
			dxDrawRectangle(screenWidth-screenWidth*0.209, screenHeight * 0.08, (screenWidth * 0.0715) * Food / 100, screenHeight * 0.004, tocolor(244, 244, 244, ad * HudAlpha), true)
			dxDrawRectangle(screenWidth-screenWidth*0.209, screenHeight * 0.084, (screenWidth * 0.0715) * Food / 100, screenHeight * 0.004, tocolor(177, 177, 177, ad * HudAlpha), true)
			dxDrawRectangle(screenWidth-screenWidth*0.209, screenHeight * 0.105, screenWidth * 0.0715, screenHeight * 0.004, tocolor(38, 58, 62, ad * HudAlpha), true)
			dxDrawRectangle(screenWidth-screenWidth*0.209, screenHeight * 0.109, screenWidth * 0.0715, screenHeight * 0.004, tocolor(28, 42, 45, ad * HudAlpha), true)
			dxDrawRectangle(screenWidth-screenWidth*0.209, screenHeight * 0.105, (screenWidth * 0.0715) / ((LVL - 1) * 4 + 8) * EXP, screenHeight * 0.004, tocolor(91, 185, 91, ad * HudAlpha), true)
			dxDrawRectangle(screenWidth-screenWidth*0.209, screenHeight * 0.109, (screenWidth * 0.0715) / ((LVL - 1) * 4 + 8) * EXP, screenHeight * 0.004, tocolor(95, 136, 95, ad * HudAlpha), true)
			if(getPedWeapon(localPlayer) == 30) then
				local ammoin = getPedAmmoInClip(localPlayer)
				local ammo = getPedTotalAmmo(localPlayer)
				dxDrawImage(screenWidth / 1.367521, screenHeight / 34.838709, screenWidth / 3.8709, screenHeight / 4.9090, NewHUD[10], 	0, 0, 0, tocolor(255, 255, 255, 255), true)
				dxDrawImage(screenWidth / 1.367521, screenHeight / 34.838709, screenWidth / 3.8709, screenHeight / 4.9090, NewHUD[11], 	0, 0, 0, tocolor(255, 255, 255, 255), true)
				dxDrawImage(screenWidth / 1.367521, screenHeight / 34.838709, screenWidth / 3.8709, screenHeight / 4.9090, NewHUD[12], 	0, 0, 0, tocolor(255, 255, 255, 255), true)
				dxDrawText(ammoin .. " / " .. ammo - ammoin, screenWidth-screenWidth*0.184, screenHeight * 0.195, screenWidth, screenHeight, tocolor(255, 255, 255, 255), (screenWidth / 3100), screenHeight / 1400, shr, "left", "top", false, false, true)
			elseif(getPedWeapon(localPlayer) == 24) then
				local ammoin = getPedAmmoInClip(localPlayer)
				local ammo = getPedTotalAmmo(localPlayer)
				dxDrawImage(screenWidth / 1.367521, screenHeight / 34.838709, screenWidth / 3.8709, screenHeight / 4.9090, NewHUD[10], 	0, 0, 0, tocolor(255, 255, 255, 255), true)
				dxDrawImage(screenWidth / 1.367521, screenHeight / 34.838709, screenWidth / 3.8709, screenHeight / 4.9090, NewHUD[11], 	0, 0, 0, tocolor(255, 255, 255, 255), true)
				dxDrawImage(screenWidth / 1.367521, screenHeight / 34.838709, screenWidth / 3.8709, screenHeight / 4.9090, NewHUD[13], 	0, 0, 0, tocolor(255, 255, 255, 255), true)
				dxDrawText(ammoin .. " / " .. ammo - ammoin, screenWidth-screenWidth*0.184, screenHeight * 0.195, screenWidth, screenHeight, tocolor(255, 255, 255, 255), (screenWidth / 3100), screenHeight / 1400, shr, "left", "top", false, false, true)
			elseif(getPedWeapon(localPlayer) == 25) then
				local ammoin = getPedAmmoInClip(localPlayer)
				local ammo = getPedTotalAmmo(localPlayer)
				dxDrawImage(screenWidth / 1.367521, screenHeight / 34.838709, screenWidth / 3.8709, screenHeight / 4.9090, NewHUD[10], 	0, 0, 0, tocolor(255, 255, 255, 255), true)
				dxDrawImage(screenWidth / 1.367521, screenHeight / 34.838709, screenWidth / 3.8709, screenHeight / 4.9090, NewHUD[11], 	0, 0, 0, tocolor(255, 255, 255, 255), true)
				dxDrawImage(screenWidth / 1.367521, screenHeight / 34.838709, screenWidth / 3.8709, screenHeight / 4.9090, NewHUD[14], 	0, 0, 0, tocolor(255, 255, 255, 255), true)
				dxDrawText(ammoin .. " / " .. ammo - ammoin, screenWidth-screenWidth*0.184, screenHeight * 0.195, screenWidth, screenHeight, tocolor(255, 255, 255, 255), (screenWidth / 3100), screenHeight / 1400, shr, "left", "top", false, false, true)
			elseif(getPedWeapon(localPlayer) == 31) then
				local ammoin = getPedAmmoInClip(localPlayer)
				local ammo = getPedTotalAmmo(localPlayer)
				dxDrawImage(screenWidth / 1.367521, screenHeight / 34.838709, screenWidth / 3.8709, screenHeight / 4.9090, NewHUD[10], 	0, 0, 0, tocolor(255, 255, 255, 255), true)
				dxDrawImage(screenWidth / 1.367521, screenHeight / 34.838709, screenWidth / 3.8709, screenHeight / 4.9090, NewHUD[11], 	0, 0, 0, tocolor(255, 255, 255, 255), true)
				dxDrawImage(screenWidth / 1.367521, screenHeight / 34.838709, screenWidth / 3.8709, screenHeight / 4.9090, NewHUD[15], 	0, 0, 0, tocolor(255, 255, 255, 255), true)
				dxDrawText(ammoin .. " / " .. ammo - ammoin, screenWidth-screenWidth*0.184, screenHeight * 0.195, screenWidth, screenHeight, tocolor(255, 255, 255, 255), (screenWidth / 3100), screenHeight / 1400, shr, "left", "top", false, false, true)
			end
			local w = getPlayerWantedLevel()
			for i=1,w do
				dxDrawImage(screenWidth / 1.367521 - screenWidth * 0.01793 * (i - 1), screenHeight / 38.571428,  screenWidth / 3.8709, screenHeight / 4.9090, NewHUD[16], 0, 0, 0, tocolor(255, 255, 255, 255), true)
			end
		end
	end
	if(waitingFish == true) then
		if(isElementInWater(getLocalPlayer()) == true) then
			triggerServerEvent("AnimFromClient", getLocalPlayer(), getLocalPlayer(), "BSKTBALL", "BBALL_idle_O", false)
			waitingFish = false
			killTimer(FishTimerEsc)
			FishTimerEsc = 0
			addBox("Вы перестали ожидать улов,\nПотому что упали в воду.", 255, 60, 0)
			toggleAllControls(true)
		end
	end
	if(Bank[1] == true) then
		renderBank()
	end
	for i, n in pairs(notif) do
		if(notif[i]["ProofedText"] ~= nil) then
			local perc = 50
			perc = math.round(perc)
			local color = 255
			local x = 600 - ((50 - perc) * 12)
			local scol = 255 - (255 / (50 / perc))
			local size = notif[i]["Height"]
			local y = notif[i]["y"]
			local r, g, b = notif[i]["R"], notif[i]["G"], notif[i]["B"]
			dxDrawRectangle((x - 500) * sw / 1920, y * sh / 1080, 400 * sw / 1920, size * sh / 1080, tocolor(30, 30, 30, perc * 3), true, false)
			dxDrawRectangle((x - 492) * sw / 1920, y * sh / 1080, 4, size * sh / 1080, tocolor(r, g, b, perc * 5.1), true, false)
			dxDrawRectangle((x - 495) * sw / 1920, y * sh / 1080, 3, size * sh / 1080, tocolor(r, g, b, perc * 2.4), true, false)
			dxDrawRectangle((x - 498) * sw / 1920, y * sh / 1080, 3, size * sh / 1080, tocolor(r, g, b, perc * 1.8), true, false)
			dxDrawRectangle((x - 500) * sw / 1920, y * sh / 1080, 2, size * sh / 1080, tocolor(r, g, b, perc * 1.2), true, false)
			dxDrawRectangle((x - 488) * sw / 1920, y * sh / 1080, 3, size * sh / 1080, tocolor(r, g, b, perc * 2.4), true, false)
			dxDrawRectangle((x - 485) * sw / 1920, y * sh / 1080, 3, size * sh / 1080, tocolor(r, g, b, perc * 1.8), true, false)
			dxDrawRectangle((x - 482) * sw / 1920, y * sh / 1080, 3, size * sh / 1080, tocolor(r, g, b, perc * 1.2), true, false)
			for k, r in pairs(notif[i]["ProofedText"]) do		
				dxDrawText(notif[i]["ProofedText"][k], (x - 450) * sw / 1920, (y + 16 + ((k - 1) * 24)) * sh / 1080, 200 * sw / 1920, 200 * sh / 1080, tocolor(255, 255, 255, perc * 5.1), 0.7 * sw / 1920, 0.7 * sh / 1080, shrift, "left", "top", false, false, true)
			end
		end
	end
end

function FuelUpdate( fuel )
	str = fuel
	str = math.floor(str)
end

function onClientVehicleExit( thePlayer, seat, door )
	if(thePlayer == localPlayer) then
		Driver = false
		if(AllPerems[1] ~= nil) then
			stopSound(AllPerems[1])
			AllPerems[1] = nil
		end
	end
end


function onGridPlayerOn(  )
	if(alg == true) then
		if(table.getn(GUITable) == 0 and SkinShop == false and CarBuy == false and MenuToggle[1] == nil) then
			alb = true
			playerListWindow = guiCreateWindow(0.25, 0.25, 0.5, 0.5, "Игроки на сервере", true)
			playerList = guiCreateGridList(0.0, 0.03, 1, 1, true, playerListWindow)
			local it = 0
			for _, i in pairs(PT) do
				it = it + 1
			end
			guiCreateLabel(0.88, 0.0425, 0.2, 0.2, "Игроков: " .. it, true, playerListWindow)
			guiGridListAddColumn(playerList, "ID", 0.10)
			guiGridListAddColumn(playerList, "Players", 0.55)
			guiGridListAddColumn(playerList, "Ping", 0.55)
			guiGridListSetColumnWidth(playerList, 3, 0.25, true)
			guiGridListSetColumnWidth(playerList, 2, 0.35, true)
			guiGridListSetColumnWidth(playerList, 1, 0.2, true)
			for i, n in pairs(PT) do
				if(getPlayerName(getLocalPlayer()) == n["n"]) then
					guiGridListAddRow(playerList, i, n["n"], getPlayerPing(n["p"]))
					break
				end
			end
			for i, p in pairs(PT) do
				if(getPlayerName(getLocalPlayer()) ~= p["n"]) then 
					if(isElement(p["p"])) then
						guiGridListAddRow(playerList, i, p["n"], getPlayerPing(p["p"]))
					end
				end
			end
			guiSetVisible(playerList, true)
			showCursor(true, false)
		end
	end
end

function Regars( arg1, arg2 )
	if(arg1 == arg2) then
		if(string.len(arg1) > 2) then
			triggerServerEvent("Regaru", localPlayer, arg1)
		else
			addBox("Вы не ввели пароль.", 255, 0, 0)
		end
	else
		addBox("Пароли не совпадают.", 255, 0, 0)
	end
end

addEvent("Regars", true)
addEventHandler("Regars", root, Regars)

function customShowChat( booleva )
	if(booleva == true) then
		if(PCD == true) then
			showChat(true)
		end
	else
		showChat(false)
	end
	if(SCV == false) then
		if(booleva == false) then
			showChat(false)
		end
	else
		if(PCD == true) then
			if(booleva == true) then
				showChat(true)
			end
		else
			if(booleva == false) then
				showChat(false)
			end
		end
	end
end

function onPlayerHUD( tablo, lvl, exp, food, ct)
	if(PCD == true) then
		customShowChat(true)
	end
	Loginofc = false
	if(tablo ~= nil) then
		for i, p in pairs(tablo) do
			if(PT[i] == nil) then
				PT[i] = {}
			end
			PT[i]["p"] = p
			PT[i]["n"] = getPlayerName(p)
			PT[i]["i"] = i
		end
	end
	alg = true
	local screenWidth, screenHeight = guiGetScreenSize ( ) 
	NewHUD[1] = 	dxCreateTexture("HudUI/back.png", "argb", true)
	NewHUD[2] = 	dxCreateTexture("HudUI/logo.png", "argb", true)
	NewHUD[3] = 	dxCreateTexture("HudUI/money.png", "argb", true)
	NewHUD[4] = 	dxCreateTexture("HudUI/armor.png", "argb", true)
	NewHUD[5] = 	dxCreateTexture("HudUI/zv.png", "argb", true)
	NewHUD[6] = 	dxCreateTexture("HudUI/o2.png", "argb", true)
	NewHUD[7] = 	dxCreateTexture("HudUI/food.png", "argb", true)
	NewHUD[8] = 	dxCreateTexture("HudUI/exp.png", "argb", true)
	NewHUD[9] = 	dxCreateTexture("HudUI/health.png", "argb", true)
	NewHUD[10] = 	dxCreateTexture("HudUI/wbox.png", "argb", true)
	NewHUD[11] = 	dxCreateTexture("HudUI/patr.png", "argb", true)
	NewHUD[12] = 	dxCreateTexture("HudUI/ak47.png", "argb", true)
	NewHUD[13] = 	dxCreateTexture("HudUI/deagle.png", "argb", true)
	NewHUD[14] = 	dxCreateTexture("HudUI/shotgun.png", "argb", true)
	NewHUD[15] = 	dxCreateTexture("HudUI/m4.png", "argb", true)
	NewHUD[16] = 	dxCreateTexture("HudUI/zv2.png", "argb", true)
	setPlayerHudComponentVisible("radar", true)
	errorpassword = 0
	HudToggle = true
	if(lvl ~= nil and exp ~= nil and food ~= nil) then
		LVL = lvl
		EXP = exp
		Food = math.round(food)
	end
	LoginPass = ""
	act = false
	ley = ""
end

function onGridPlayerOff( )
	if(alb == true) then
		guiSetVisible(playerListWindow, false)
		destroyElement(playerListWindow)
		alb = false
		showCursor(false)
	end
end

function onGridPlus( i, s, p)
	if(PT[tonumber(i)] == nil) then
		PT[tonumber(i)] = {} 
	end
	PT[tonumber(i)]["n"] = s
	PT[tonumber(i)]["p"] = p
	i = tonumber(i)
	if(PT[i]["n"] == nil) then
		PT[i]["n"] = getPlayerName(p)
	end
	Please[p] = i
end

function onGridMinus( i,s,n )
	PT[tonumber(i)] = nil
	if(Please[s] ~= nil) then
		Please[s] = nil
	end
end

function onFoodUpdate( stri )
	stri = tonumber(stri)
	stri = math.round(stri)
	Food = stri
end

function onFS( )
	customShowChat( not isChatVisible())
	setPlayerHudComponentVisible("radar", not isPlayerHudComponentVisible("radar"))
	HudToggle = not HudToggle
end

function onEXPUpdate( exp, lvl )
	EXP = exp
	LVL = lvl
end

function avtr( pass )
	if(pass ~= nil) then
		if(string.len(pass) > 3 and string.len(pass) < 20) then
			local mojno = true
			for i=1,a do
				local str = string.sub(pass, i, i)
				local bit = string.byte(str)
				if((bit >= 65 and bit <= 90) or (bit >= 97 and bit <= 122) or (bit >= 48 and bit <= 57) or bit == 95) then
				else
					mojno = false
				end
			end
			if(mojno == true) then
				triggerServerEvent("Avtorizovalsya", localPlayer, pass)
			else
				addBox("Вы ввели запрещенные символы.", 255, 0, 0)
			end
		else
			addBox("Вы не ввели пароль.", 255, 0, 0)
		end
	else
		addBox("Вы не ввели пароль", 255, 0, 0)
	end
end

addEvent("avtr", true)
addEventHandler("avtr", root, avtr)

function backTimer( )
	if(Rega1 == true) then
		if(string.len(al) > 0) then
			al = string.sub(al, 1, string.len(al) - 1)
		end
	elseif(Rega2 == true) then
		if(string.len(alo) > 0) then
			alo = string.sub(alo, 1, string.len(alo) - 1)
		end
	else
		if(string.len(LoginPass) > 0) then
			LoginPass = string.sub(LoginPass, 1, string.len(LoginPass) - 1)
		end
	end
	if(string.len(LoginPass) > 3) then
		local sx, sy = guiGetScreenSize()
	else
		local sx, sy = guiGetScreenSize()
	end
end

function onClientSkinShopEnd( skin )
	SkinShop = false
	showCursor(false)
	toggleAllControls(true)
	SkinsCache = {}
	HudToggle = true
	setPlayerHudComponentVisible("radar", true)
	customShowChat(true)
	setCameraTarget(getLocalPlayer())
	setElementModel(getLocalPlayer(), skin)
	triggerServerEvent("verntodim", getLocalPlayer(), getLocalPlayer())
end

function SkinShopExit( )
	SkinShop = false
	showCursor(false)
	toggleAllControls(true)
	setElementModel(getLocalPlayer(), SkinsCache[4])
	SkinsCache = {}
	addBox("Вы отказались от покупки одежды.", 0, 60, 255)
	HudToggle = true
	setPlayerHudComponentVisible("radar", true)
	customShowChat(true)
	setCameraTarget(getLocalPlayer())
	triggerServerEvent("verntodim", getLocalPlayer(), getLocalPlayer())
end

function SkinShopLeft(  )
	if(SkinsCache[2][2] > 1) then
		SkinsCache[2][2] = SkinsCache[2][2] - 1
		local cache = SkinsCache[2][2]
		SkinsCache[2][1] = SkinsCache[1][cache]["ID"]
		setElementModel(getLocalPlayer(), SkinsCache[2][1])
	end
end

function SkinShopRight(  )
	if(SkinsCache[2][2] < SkinsCache[3]) then
		SkinsCache[2][2] = SkinsCache[2][2] + 1
		local cache = SkinsCache[2][2]
		SkinsCache[2][1] = SkinsCache[1][cache]["ID"]
		setElementModel(getLocalPlayer(), SkinsCache[2][1])
	end
end

function SkinShopBuy( )
	local tid = SkinsCache[2][2]
	if(SkinsCache[1][tid]["Price"] <= getPlayerMoney(getLocalPlayer())) then
		triggerServerEvent("onClientTryBuySkin", getLocalPlayer(), tid)
	else
		addBox("У Вас недостаточно денег для покупки.", 255, 0, 0)
	end
end

function clearBuyCar( )
	CarBuy = false
	if(CarCache[5] ~= nil) then
		destroyElement(CarCache[5])
	end
	CarCache = {}
	showCursor(false)
	setPlayerHudComponentVisible("radar", true)
	customShowChat(true)
	HudToggle = true
	setCameraTarget(getLocalPlayer())
	triggerServerEvent("verntodim", getLocalPlayer(), getLocalPlayer())
end

function exitFromCarBuy( )
	clearBuyCar()
end

function trigServerTrade( )
	if(MenuToggle[4][2] > 0) then
		triggerServerEvent("onPlayerDonateServerTrade", getLocalPlayer(), MenuToggle[4][2])
		MenuToggle = {}
		customShowChat(true)
		setPlayerHudComponentVisible("radar", true)
		HudToggle = true
		showCursor(false)
		cancelEvent()
		repString = ""
	else
		addBox("Ошибка: Вы не ввели сумму обмена.", 255, 0, 0)
	end
end

function trigServerChangeName( )
	if(string.len(MenuToggle[4][3]) > 3 and string.len(MenuToggle[4][3]) < 21) then
		triggerServerEvent("onPlayersChangeNick", getLocalPlayer(), getLocalPlayer(), MenuToggle[4][3])
		MenuToggle = {}
		customShowChat(true)
		setPlayerHudComponentVisible("radar", true)
		HudToggle = true
		showCursor(false)
		cancelEvent()
		repString = ""
	else
		addBox("Ник может быть\nОт 4 до 20 символов.", 255, 0, 0)
	end
end

function trigServerUnwarn( )
	if(PInfo["Warn"] > 0) then
		triggerServerEvent("onPlayerDonateUnwarn", getLocalPlayer(), getLocalPlayer())
		MenuToggle = {}
		customShowChat(true)
		setPlayerHudComponentVisible("radar", true)
		HudToggle = true
		showCursor(false)
		cancelEvent()
		repString = ""
	else
		addBox("Ошибка: У Вас нет предупреждений.", 255, 0, 0)
	end
end

function trigServerBuyLic( )
	triggerServerEvent("onPlayerBuyLicense", getLocalPlayer(), getLocalPlayer(), MenuToggle[4][4])
	MenuToggle = {}
	customShowChat(true)
	setPlayerHudComponentVisible("radar", true)
	HudToggle = true
	showCursor(false)
	cancelEvent()
	repString = ""
end

function trigServerBuyAk( )
	local i = 1
	triggerServerEvent("onPlayerDonateSkills", getLocalPlayer(), getLocalPlayer(), i + SkillBuy)
	MenuToggle = {}
	customShowChat(true)
	setPlayerHudComponentVisible("radar", true)
	HudToggle = true
	showCursor(false)
	cancelEvent()
	repString = ""
end

function trigServerBuyDeagle( )
	local i = 2
	triggerServerEvent("onPlayerDonateSkills", getLocalPlayer(), getLocalPlayer(), i + SkillBuy)
	MenuToggle = {}
	customShowChat(true)
	setPlayerHudComponentVisible("radar", true)
	HudToggle = true
	showCursor(false)
	cancelEvent()
	repString = ""
end

function trigServerBuyM4( )
	local i = 3
	triggerServerEvent("onPlayerDonateSkills", getLocalPlayer(), getLocalPlayer(), i + SkillBuy)
	MenuToggle = {}
	customShowChat(true)
	setPlayerHudComponentVisible("radar", true)
	HudToggle = true
	showCursor(false)
	cancelEvent()
	repString = ""
end

function trigServerBuyShotgun( )
	local i = 4
	triggerServerEvent("onPlayerDonateSkills", getLocalPlayer(), getLocalPlayer(), i + SkillBuy)
	MenuToggle = {}
	customShowChat(true)
	setPlayerHudComponentVisible("radar", true)
	HudToggle = true
	showCursor(false)
	cancelEvent()
	repString = ""
end

function onPlayerBuySub( ci )
	triggerServerEvent("onPlayerBuySub", getLocalPlayer(), getLocalPlayer(), ci)
	MenuToggle = {}
	customShowChat(true)
	setPlayerHudComponentVisible("radar", true)
	HudToggle = true
	showCursor(false)
	cancelEvent()
	repString = ""
end

function onPlayerTryPromo( )
	local stre = MenuToggle[5]
	if(string.len(stre) > 2 and string.len(stre) < 25) then
		triggerServerEvent("onPlayerTryPromo", getLocalPlayer(), getLocalPlayer(), MenuToggle[5])
		MenuToggle = {}
		customShowChat(true)
		setPlayerHudComponentVisible("radar", true)
		HudToggle = true
		showCursor(false)
		cancelEvent()
		repString = ""
	else
		addBox("Ошибка: Вы ввели слишком\nМаленький промокод.", 255, 0, 0)
	end
end

function onTryGetMoney( )
	if(BankCache[1] > 0) then
		local player = getLocalPlayer()
		triggerServerEvent("onTryGetMoney", player, player, BankCache[1])
		customShowChat(true)
		HudToggle = true
		setPlayerHudComponentVisible("radar", true)
		Bank[1] = false
		showCursor(false)
		cancelEvent()
	else
		addBox("Вы не ввели сумму.", 255, 0, 0)
	end
end

function onTryEnterMoney( )
	if(BankCache[2] > 0) then
		local player = getLocalPlayer()
		triggerServerEvent("onTryEnterMoney", player, player, BankCache[2])
		customShowChat(true)
		HudToggle = true
		setPlayerHudComponentVisible("radar", true)
		Bank[1] = false
		showCursor(false)
		cancelEvent()
	else
		addBox("Вы не ввели сумму.", 255, 0, 0)
	end
end

function onTryTrans( )
	if(BankCache[3][3] > 0) then
		local player = getLocalPlayer()
		triggerServerEvent("onTryTrans", player, player, BankCache[3][3], BankCache[3][2])
		customShowChat(true)
		HudToggle = true
		setPlayerHudComponentVisible("radar", true)
		Bank[1] = false
		showCursor(false)
		cancelEvent()
	else
		addBox("Вы не ввели сумму.", 255, 0, 0)
	end
end

function onTryPayHouse( )
	if(BankCache[7] > 0) then
		local player = getLocalPlayer()
		triggerServerEvent("onTryPayHouse", player, player, math.floor(BankCache[7] / 50))
		customShowChat(true)
		HudToggle = true
		setPlayerHudComponentVisible("radar", true)
		Bank[1] = false
		showCursor(false)
		cancelEvent()
	else
		addBox("Вы не ввели сумму.", 255, 0, 0)
	end
end

function checkWeapon(  )
	if((getPedWeapon(getLocalPlayer()) > 32 and getPedWeapon(getLocalPlayer()) ~= 43)  or getElementHealth(getLocalPlayer()) > 101) then
		triggerServerEvent("etoPizdec", getLocalPlayer(), getLocalPlayer())
	elseif(getPedOccupiedVehicle(getLocalPlayer()) == false) then
		local vx, vy, vz = getElementVelocity(getLocalPlayer())
		local speed = math.round(math.sqrt(vx * vx + vy * vy + vz * vz) * 200)
		if(speed >= 220) then
			triggerServerEvent("etoPizdec2", getLocalPlayer(), getLocalPlayer())
		end
	elseif(isPedWearingJetpack(getLocalPlayer()) == true) then
		triggerServerEvent("etoPizdec2", getLocalPlayer(), getLocalPlayer())
	elseif(getPedOccupiedVehicle(getLocalPlayer()) ~= false) then
		local player = getLocalPlayer()
		local veh = getPedOccupiedVehicle(player)
		local vx, vy, vz = getElementVelocity(veh)
		local speed = math.round(math.sqrt(vx * vx + vy * vy + vz * vz) * 200)
		if(speed >= 400) then
			triggerServerEvent("etoPizdec3", getLocalPlayer(), getLocalPlayer())
		end
	end
	if(getPedOccupiedVehicle(getLocalPlayer()) ~= false) then
		if(getPedOccupiedVehicle(getLocalPlayer()) == lastVeh) then
			if(lastvehpos == 0) then
				local x, y, z = getElementPosition(getPedOccupiedVehicle(getLocalPlayer()))
				lastvehpos = {[1] = x, [2] = y, [3]=z}
			else
				local x, y, z = lastvehpos[1], lastvehpos[2], lastvehpos[3]
				local x1, y1, z1 = getElementPosition(getPedOccupiedVehicle(getLocalPlayer()))
				lastvehpos[1], lastvehpos[2], lastvehpos[3] = x1, y1, z1
				local dist = getDistanceBetweenPoints3D(x, y, z, x1, y1, z1)
				local x2, y2, z2 = getElementVelocity(getPedOccupiedVehicle(getLocalPlayer()))
				if(dist > 80) then
					local speed = math.round(math.sqrt(x2 * x2 + y2 * y2 + z2 * z2) * 200)
					if(speed < 15) then
						triggerServerEvent("maybecheat", getLocalPlayer(), getLocalPlayer())
					end
				end
			end
		else
			lastVeh = getPedOccupiedVehicle(getLocalPlayer())
		end
	else
		lastVeh = 0
		lastvehpos = 0
	end
	if(Avt == true) then
		if(defpos == 0) then
			if(getElementInterior(getLocalPlayer()) == 0) then
				if(getPedOccupiedVehicle(getLocalPlayer()) == false) then
					local x, y, z = getElementPosition(getLocalPlayer())
					defpos = {}
					defpos[1], defpos[2], defpos[3] = x, y, z
				end
			end
		else
			if(getPedOccupiedVehicle(getLocalPlayer()) == false) then
				if(getElementInterior(getLocalPlayer()) == 0) then
					local x, y, z = getElementPosition(getLocalPlayer())
					local x1, y1, z1 = defpos[1], defpos[2], defpos[3]
					defpos[1], defpos[2], defpos[3] = getElementPosition(getLocalPlayer())
					local dist = getDistanceBetweenPoints3D(x, y, z, x1, y1, z1)
					local dist2 = getDistanceBetweenPoints3D(-164.3251953125, -1258.267578125, 10.687592506409, -145.123046875, -1258.9306640625, 11.557376861572) / 15
					local xa, ya, za = getElementVelocity(getLocalPlayer())
					if(za >= -0.3) then
						if(dist > dist2 + 6) then
							local speed = math.round(math.sqrt(xa * xa + ya * ya + za * za) * 200)
							triggerServerEvent("maybetp", getLocalPlayer(), getLocalPlayer(), x, y, z, x1, y1, z1)
						end
					end
				else
					defpos = 0
				end
			else
				local veh = getPedOccupiedVehicle(getLocalPlayer())
				local x, y, z = getElementPosition(veh)
				defpos[1], defpos[2], defpos[3] = x, y, z
			end
		end
	end
end

setTimer(checkWeapon, 100, 0)

function onTryPayBiz( )
	if(BankCache[7] > 0) then
		local player = getLocalPlayer()
		triggerServerEvent("onTryPayBiz", player, player, math.floor(BankCache[7] / 50))
		customShowChat(true)
		HudToggle = true
		setPlayerHudComponentVisible("radar", true)
		Bank[1] = false
		showCursor(false)
		cancelEvent()
	else
		addBox("Вы не ввели сумму.", 255, 0, 0)
	end
end

function onTryPayPhone( )
	if(BankCache[5] > 0) then
		local player = getLocalPlayer()
		triggerServerEvent("onTryPayPhone", player, player, BankCache[5])
		customShowChat(true)
		HudToggle = true
		setPlayerHudComponentVisible("radar", true)
		Bank[1] = false
		showCursor(false)
		cancelEvent()
	else
		addBox("Вы не ввели сумму.", 255, 0, 0)
	end
end

function leftPerson( )
	if(sex == 1) then
		if(SkinTarget == 1) then
			SkinTarget = 3
			setElementModel(getLocalPlayer(), SkinTable[SkinTarget])
		else
			SkinTarget = SkinTarget - 1
			setElementModel(getLocalPlayer(), SkinTable[SkinTarget])
		end
	else
		if(SkinTarget == 1) then
			SkinTarget = 3
			setElementModel(getLocalPlayer(), WomanTable[SkinTarget])
		else
			SkinTarget = SkinTarget - 1
			setElementModel(getLocalPlayer(), WomanTable[SkinTarget])
		end
	end
end

function rightPerson( )
	if(sex == 1) then
		if(SkinTarget == 3) then
			SkinTarget = 1
			setElementModel(getLocalPlayer(), SkinTable[SkinTarget])
		else
			SkinTarget = SkinTarget + 1
			setElementModel(getLocalPlayer(), SkinTable[SkinTarget])
		end
	else
		if(SkinTarget == 3) then
			SkinTarget = 1
			setElementModel(getLocalPlayer(), WomanTable[SkinTarget])
		else
			SkinTarget = SkinTarget + 1
			setElementModel(getLocalPlayer(), WomanTable[SkinTarget])
		end
	end
end

function chooseMale(  )
	SkinTarget = 1
	setElementModel(getLocalPlayer(), SkinTable[SkinTarget])
	sex = 1
end

function chooseFemale(  )
	SkinTarget = 1
	setElementModel(getLocalPlayer(), WomanTable[SkinTarget])
	sex = 2
end

addEvent("chooseMale", true)
addEventHandler("chooseMale", root, chooseMale)
addEvent("chooseFemale", true)
addEventHandler("chooseFemale", root, chooseFemale)
addEvent("leftPerson", true)
addEventHandler("leftPerson", root, leftPerson)
addEvent("rightPerson", true)
addEventHandler("rightPerson", root, rightPerson)

function playerPressedKey( button, press )
	if(button == "lshift" or button == "rshift") then
		if(press == true) then
			repShift = true
		else
			repShift = false
		end
	elseif(button == "capslock") then
		if(press == true) then
			if(repShift == false) then
				repShift = true
			else
				repShift = false
			end
		end
	elseif(Bank[1] == true) then
		if(press == true) then
			if(button == "mouse1") then
				local x, y = getCursorPosition()
				if(x > 0.23333 and x < 0.355729 and y > 0.314814 and y < 0.428703) then
					Bank[2] = 0
				elseif(x > 0.23333 and x < 0.355729 and y > 0.450925 and y < 0.571296) then
					Bank[2] = 1
				elseif(x > 0.23333 and x < 0.355729 and y > 0.589 and y < 0.709) then
					customShowChat(true)
					HudToggle = true
					setPlayerHudComponentVisible("radar", true)
					Bank[1] = false
					showCursor(false)
					cancelEvent()
				elseif(x > 0.636979 and x < 0.760937 and y > 0.314814 and y < 0.433333) then
					Bank[2] = 2
				elseif(x > 0.636979 and x < 0.760937 and y > 0.45 and y < 0.57129) then
					Bank[2] = 3
					BankCache[6] = 0
				elseif(x > 0.636979 and x < 0.760937 and y > 0.59166 and y < 0.712962) then	
					Bank[2] = 4
				end
				if(Bank[2] == 0) then
					if(x > 0.395312 and x < 0.597916 and y > 0.64537 and y < 0.689814) then
						onTryGetMoney()
					end
				elseif(Bank[2] == 1) then
					if(x > 0.395312 and x < 0.597916 and y > 0.64537 and y < 0.689814) then
						onTryEnterMoney()
					end
				elseif(Bank[2] == 2) then
					if(x > 0.393229 and x < 0.597395 and y > 0.37407 and y < 0.41388) then
						BankCache[3][1] = 0
					elseif(x > 0.393229 and x < 0.597395 and y > 0.45648 and y < 0.5) then
						BankCache[3][1] = 1
					elseif(x > 0.395312 and x < 0.597916 and y > 0.64537 and y < 0.689814) then
						onTryTrans()
					end
				elseif(Bank[2] == 3) then
					if(BankCache[6] == 0) then
						if(x > 0.422395 and x < 0.567708 and y > 0.46562 and y < 0.54074) then
							if(BankCache[10] > 0) then
								if(BankCache[11] ~= 2) then
									BankCache[6] = 2
								else
									addBox("У Вас нет бизнеса.", 255, 0, 0)
								end
							else
								addBox("У Вас нет бизнеса!", 255, 0, 0)
							end
						elseif(x > 0.422395 and x < 0.567708 and y > 0.56 and y < 0.631) then
							if(BankCache[10] > 0) then
								if(BankCache[11] == 2) then
									BankCache[6] = 3
								else
									addBox("У Вас нет заправки!", 255, 0, 0)
								end
							else
								addBox("У Вас нет заправки!", 255, 0, 0)
							end
						elseif(x > 0.422395 and x < 0.567708 and y > 0.374074 and y < 0.448148) then
							if(BankCache[9] > 0) then
								BankCache[6] = 1
							else
								addBox("У Вас нет дома.", 255, 0, 0)
							end
						end
					elseif(BankCache[6] == 1) then
						if(x > 0.394791 and x < 0.598437 and y > 0.64444 and y < 0.69074) then
							if(BankCache[7] >= 50) then
								local ost = BankCache[7] % 50
								if(ost == 0) then
									onTryPayHouse()
								else
									addBox("Введите число, кратное 50$.", 255, 0, 0)
								end
							else
								addBox("Сумма должна быть больше 50$!", 255, 0, 0)
							end
						end
					elseif(BankCache[6] == 2) then
						if(x > 0.394791 and x < 0.598437 and y > 0.64444 and y < 0.69074) then
							if(BankCache[7] >= 50) then
								local ost = BankCache[7] % 50
								if(ost == 0) then
									onTryPayBiz()
								else
									addBox("Введите число, кратное 50$.", 255, 0, 0)
								end
							else
								addBox("Сумма должна быть больше 50$!", 255, 0, 0)
							end
						end
					elseif(BankCache[6] == 3) then
						if(x > 0.394791 and x < 0.598437 and y > 0.64444 and y < 0.69074) then
							if(BankCache[7] >= 50) then
								local ost = BankCache[7] % 50
								if(ost == 0) then
									onTryPayBiz()
								else
									addBox("Введите число, кратное 50$.", 255, 0, 0)
								end
							else
								addBox("Сумма должна быть больше 50$!", 255, 0, 0)
							end
						end
					end
				elseif(Bank[2] == 4) then
					if(x > 0.395312 and x < 0.597916 and y > 0.64537 and y < 0.689814) then
						if(BankCache[15] ~= 0) then
							onTryPayPhone()
						else
							addBox("У Вас нет телефона\nЧтобы его пополнить.", 255, 0, 0)
						end
					end
				end
			end
		end
		if(Bank[2] == 0) then
			if(NumberTable[tostring(button)] ~= nil) then
				if(NumberTable[tostring(button)] == true) then
					if(press == true) then
						if(BankCache[1] ~= 0) then
							local perem = tonumber(tostring(BankCache[1]) .. tostring(button))
							if(perem <= 999999) then
								BankCache[1] = tonumber(tostring(BankCache[1]) .. tostring(button))
							end
						else
							BankCache[1] = tonumber(tostring(button))
						end
					end
				end
			elseif(button == "backspace") then
				if(press == true) then
					local stringd = tostring(BankCache[1])
					if(string.len(stringd) > 1) then
						stringd = string.sub(stringd, 1, string.len(stringd) - 1)
						BankCache[1] = tonumber(stringd)
					else
						BankCache[1] = 0
					end
				end
			end
		elseif(Bank[2] == 1) then
			if(NumberTable[tostring(button)] ~= nil) then
				if(NumberTable[tostring(button)] == true) then
					if(press == true) then
						if(BankCache[2] ~= 0) then
							local perem = tonumber(tostring(BankCache[2]) .. tostring(button))
							if(perem <= 999999) then
								BankCache[2] = tonumber(tostring(BankCache[2]) .. tostring(button))
							end
						else
							BankCache[2] = tonumber(tostring(button))
						end
					end
				end
			elseif(button == "backspace") then
				if(press == true) then
					local stringd = tostring(BankCache[2])
					if(string.len(stringd) > 1) then
						stringd = string.sub(stringd, 1, string.len(stringd) - 1)
						BankCache[2] = tonumber(stringd)
					else
						BankCache[2] = 0
					end
				end
			end
		elseif(Bank[2] == 2) then
			if(BankCache[3][1] == 0) then
				if(NameTable[tostring(button)] ~= nil) then
					if(press == true) then
						if(string.len(BankCache[3][2]) < 20) then
							if(repShift == true) then
								BankCache[3][2] = BankCache[3][2] .. NameTable[tostring(button)]["SS"]
							else
								BankCache[3][2] = BankCache[3][2] .. tostring(button)
							end
						end
					end
				elseif(button == "-") then
					if(press == true) then
						if(string.len(BankCache[3][2]) < 20) then
							if(repShift == true) then
								BankCache[3][2] = BankCache[3][2] .. "_"
							end
						end
					end
				elseif(button == "backspace") then
					if(press == true) then
						if(string.len(BankCache[3][2]) > 0) then
							BankCache[3][2] = string.sub(BankCache[3][2], 1, string.len(BankCache[3][2]) - 1)
						end
					end
				end
			elseif(BankCache[3][1] == 1) then
				if(NumberTable[tostring(button)] ~= nil) then
					if(NumberTable[tostring(button)] == true) then
						if(press == true) then
							if(BankCache[3][3] ~= 0) then
								local perem = tonumber(tostring(BankCache[3][3]) .. tostring(button))
								if(perem <= 999999) then
									BankCache[3][3] = tonumber(tostring(BankCache[3][3]) .. tostring(button))
								end
							else
								BankCache[3][3] = tonumber(tostring(button))
							end
						end
					end
				elseif(button == "backspace") then
					if(press == true) then
						local stringd = tostring(BankCache[3][3])
						if(string.len(stringd) > 1) then
							stringd = string.sub(stringd, 1, string.len(stringd) - 1)
							BankCache[3][3] = tonumber(stringd)
						else
							BankCache[3][3] = 0
						end
					end
				end
			end
		elseif(Bank[2] == 3) then
			if(BankCache[6] > 0) then
				if(NumberTable[tostring(button)] ~= nil) then
					if(NumberTable[tostring(button)] == true) then
						if(press == true) then
							if(BankCache[7] ~= 0) then
								local perem = tonumber(tostring(BankCache[7]) .. tostring(button))
								if(perem <= 999999) then
									BankCache[7] = tonumber(tostring(BankCache[7]) .. tostring(button))
								end
							else
								BankCache[7] = tonumber(tostring(button))
							end
						end
					end
				elseif(button == "backspace") then
					if(press == true) then
						local stringd = tostring(BankCache[7])
						if(string.len(stringd) > 1) then
							stringd = string.sub(stringd, 1, string.len(stringd) - 1)
							BankCache[7] = tonumber(stringd)
						else
							BankCache[7] = 0
						end
					end
				end
			end
		elseif(Bank[2] == 4) then
			if(NumberTable[tostring(button)] ~= nil) then
				if(NumberTable[tostring(button)] == true) then
					if(press == true) then
						if(BankCache[5] ~= 0) then
							local perem = tonumber(tostring(BankCache[5]) .. tostring(button))
							if(perem <= 999999) then
								BankCache[5] = tonumber(tostring(BankCache[5]) .. tostring(button))
							end
						else
							BankCache[5] = tonumber(tostring(button))
						end
					end
				end
			elseif(button == "backspace") then
				if(press == true) then
					local stringd = tostring(BankCache[5])
					if(string.len(stringd) > 1) then
						stringd = string.sub(stringd, 1, string.len(stringd) - 1)
						BankCache[5] = tonumber(stringd)
					else
						BankCache[5] = 0
					end
				end
			end
		end
	elseif(biz == true) then
		if(press == true) then
			if(button == "mouse1") then
				local x, y = getCursorPosition()
				if(x > 0.39427 and x < 0.615104 and y > 0.643518 and y < 0.687962) then
					biz = false
					showCursor(false)
					triggerServerEvent("onTriggerCapt", getLocalPlayer(), getLocalPlayer(), biztarget, wartarget)
					cancelEvent()
				elseif(x > 0.39 and x < 0.44 and y > 0.37777 and y < 0.42685) then
					wartarget = 1
				elseif(x > 0.4734 and x < 0.525 and y > 0.37777 and y < 0.42685) then
					wartarget = 2
				elseif(x > 0.5567 and x < 0.60854 and y > 0.37777 and y < 0.42685) then
					wartarget = 3
				end
			end
		end
	elseif(SkillToggle == true) then
		if(press == true) then
			if(button == "mouse1") then
				local x, y = getCursorPosition()
				if(x > 0.3895 and x < 0.6114 and y > 0.6824 and y < 0.7296) then
					showCursor(false)
					SkillToggle = false
					cancelEvent()
				end
			end
		end
	elseif(MenuToggle[1] == true) then
		if(button == "mouse1") then
			local x, y = getCursorPosition()
			if(press == true) then
				if(x > 0.786 and x < 0.8005 and y > 0.1111 and y < 0.13785) then
					MenuToggle = {}
					customShowChat(true)
					setPlayerHudComponentVisible("radar", true)
					HudToggle = true
					showCursor(false)
					cancelEvent()
					repString = ""
				elseif(x > 0.21302 and x < 0.340104) then
					if(y > 0.228703 and y < 0.275000) then
						MenuToggle[2] = 1
					elseif(y > 0.29444 and y < 0.333333) then
						MenuToggle[2] = 2
					elseif(y > 0.364814 and y < 0.396296) then
						MenuToggle[2] 		= 3
						MenuToggle[3] 		= {}
						MenuToggle[3][1]	= 1
						MenuToggle[3][2]	= 1
					elseif(y > 0.426851 and y < 0.463888) then
						MenuToggle[2] = 4
					elseif(y > 0.500925 and y < 0.535185) then
						MenuToggle[2] = 5
					elseif(y > 0.565740 and y < 0.600000) then
						MenuToggle[2] = 6
						MenuToggle[4] = {}
						MenuToggle[4][1] = 0
						MenuToggle[4][2] = 0
						MenuToggle[4][3] = ""
						MenuToggle[4][4] = 1
					elseif(y > 0.651581 and y < 0.677777) then
						MenuToggle[2] = 7
					elseif(y > 0.722222 and y < 0.741666) then
						MenuToggle[2] = 8
						MenuToggle[5] = ""
					end
				else
					if(MenuToggle[2] == 2) then
						if(x > 0.51875 and y > 0.585185 and x < 0.636979 and y < 0.625925) then
							if(string.len(repString) > 0) then
								triggerServerEvent("onPlayerReportFromMenu", getLocalPlayer(), repString)
								MenuToggle = {}
								customShowChat(true)
								setPlayerHudComponentVisible("radar", true)
								HudToggle = true
								showCursor(false)
								cancelEvent()
								repString = ""
							else
								addBox("Ошибка: Вы не ввели текст.", 255, 0, 0)
							end
						end
					elseif(MenuToggle[2] == 4) then
						if(x > 0.482291 and x < 0.706250) then
							if(x > 0.672395 and x < 0.697395) then
								if(y > 0.23611 and y < 0.25333) then
									if(PHD == true) then
										PHD = false
									else
										PHD = true
									end
								elseif(y > 0.31851 and y < 0.34573) then
									if(NameToggle == true) then
										NameToggle = false
									else
										NameToggle = true
									end
								elseif(y > 0.40185 and y < 0.43148) then
									if(PCD == true) then
										PCD = false
										customShowChat(false)
									else
										PCD = true
										customShowChat(true)
									end
								elseif(y > 0.64351 and y < 0.67037) then
									addBox("Недоступно на Бета-Тестировании.", 255, 0, 0)
								elseif(y > 0.74259 and y < 0.77407) then
									addBox("Недоступно на Бета-Тестировании.", 255, 0, 0)
								else
									if(y > 0.489814 and y < 0.528703) then
										local perem = x
										local ras = 0.706250 - 0.482291
										local shag = ras / 10
										for i=0,10 do
											if(perem >= 0.482291 + shag * i and perem <= 0.482291 + shag * (i+1)) then
												local pshag = shag / 2
												if(0.482291 + (shag * i) + pshag >= perem) then
													HudAlpha = i
												else
													HudAlpha = i + 1
												end
												break
											end
										end
									end
								end
							elseif(y > 0.489814 and y < 0.528703) then
								local perem = x
								local ras = 0.706250 - 0.482291
								local shag = ras / 10
								for i=0,10 do
									if(perem >= 0.482291 + shag * i and perem <= 0.482291 + shag * (i+1)) then
										local pshag = shag / 2
										if(0.482291 + (shag * i) + pshag >= perem) then
											HudAlpha = i
										else
											HudAlpha = i + 1
										end
										break
									end
								end
							end
						end
					elseif(MenuToggle[2] == 3) then
						local x, y = getCursorPosition()
						if(y > 0.2 and y < 0.229) then
							if(x > 0.404687 and x < 0.421354) then
								MenuToggle[3][1] = 2
							elseif(x > 0.365104 and x < 0.404687) then
								MenuToggle[3][1] = 1
							elseif(x > 0.421354 and x < 0.470312) then
								MenuToggle[3][1] = 3
							elseif(x > 0.470312 and x < 0.521875) then
								MenuToggle[3][1] = 4
							elseif(x > 0.521875 and x < 0.591666) then
								MenuToggle[3][1] = 5
							elseif(x > 0.591666 and x < 0.627604) then
								MenuToggle[3][1] = 6
							end
						elseif(y > 0.475925 and y < 0.52037) then
							if(x > 0.779166 and x < 0.79166) then
								if(MenuToggle[3][2] < 4) then
									MenuToggle[3][2] = MenuToggle[3][2] + 1
								end
							elseif(x > 0.352083 and 0.364583) then
								if(MenuToggle[3][2] > 1) then
									MenuToggle[3][2] = MenuToggle[3][2] - 1
								end
							end
						end
					elseif(MenuToggle[2] == 6) then
						local x, y = getCursorPosition()
						if(x > 0.408333 and x < 0.4609375 and y > 0.262037 and y < 0.3) then
							MenuToggle[4][1] = 1
						elseif(x > 0.61093 and x < 0.735416 and y > 0.26111 and y < 0.307407) then
							MenuToggle[4][1] = 2
						elseif(y > 0.475 and y < 0.533333) then
							if(x > 0.70677 and x < 0.729687) then
								if(MenuToggle[4][4] < 3) then
									MenuToggle[4][4] = MenuToggle[4][4] + 1
								else
									MenuToggle[4][4] = 1
								end
							elseif(x > 0.60677 and x < 0.633854) then
								if(MenuToggle[4][4] > 1) then
									MenuToggle[4][4] = MenuToggle[4][4] - 1
								else
									MenuToggle[4][4] = 3
								end
							end
						elseif(x > 0.769791 and x < 0.785416 and y > 0.703703 and y < 0.748148) then
							if(SkillBuy == 0) then
								SkillBuy = 1
							end
						elseif(x > 0.370312 and x < 0.384375 and y > 0.703703 and y < 0.748148) then
							if(SkillBuy == 1) then
								SkillBuy = 0
							end
						elseif(x > 0.448437 and x < 0.504166 and y > 0.332407 and y < 0.358333) then -- обмен
							trigServerTrade()
						elseif(y > 0.332407 and y < 0.358333 and x > 0.644791 and x < 0.702083) then -- имя
							trigServerChangeName()
						elseif(y > 0.55 and y < 0.576851 and x > 0.447916 and x < 0.504166) then -- снять варн
							trigServerUnwarn()
						elseif(y > 0.55 and y < 0.576851 and x > 0.645833 and x < 0.70052) then -- купить лицензию
							trigServerBuyLic()
						elseif(y > 0.776851 and y < 0.79537) then
							if(x > 0.415104 and x < 0.465624) then -- ak/deagle
								trigServerBuyAk()
							elseif(x > 0.503645 and x < 0.554166) then -- deagle/m4
								trigServerBuyDeagle()
							elseif(x > 0.591666 and x < 0.64375) then -- m4/shotgun
								trigServerBuyM4()
							elseif(x > 0.681249 and x < 0.73124) then -- shotgun/fish
								trigServerBuyShotgun()
							end
						end
					elseif(MenuToggle[2] == 7) then
						local x, y = getCursorPosition()
						if(x > 0.455208 and x < 0.521875 and y > 0.472222 and y < 0.503703) then
							onPlayerBuySub(1)
						elseif(x > 0.634374 and x < 0.703645 and y > 0.472222 and y < 0.503703) then
							onPlayerBuySub(2)
						elseif(x > 0.455208 and x < 0.521875 and y > 0.786111 and y < 0.815740) then
							onPlayerBuySub(3)
						elseif(x > 0.634374 and x < 0.703645 and y > 0.786111 and y < 0.815740) then
							onPlayerBuySub(4)
						end
					elseif(MenuToggle[2] == 8) then
						local x, y = getCursorPosition()
						if(x > 0.479687 and x < 0.685416 and y > 0.679629 and y < 0.738888) then
							onPlayerTryPromo()
						end
					end
				end
			end
		else
			if(MenuToggle[2] == 2) then
				if(repTable[tostring(button)] ~= nil) then
					if(repTable[tostring(button)]["Raz"] == true and button ~= "/" and button ~= "1" and button ~= "7" and button ~= "backspace") then
						if(press == true) then
							if(string.byte(repTable[tostring(button)]["Symbol"]) > 191 and string.byte(repTable[tostring(button)]["Symbol"]) < 223) then
								if(repShift == true) then
									repString = repString .. string.upper(repTable[tostring(button)]["SS"])
								else
									repString = repString .. tostring(repTable[tostring(button)]["Symbol"])
								end
							else
								if(tonumber(tostring(button)) ~= nil) then
									if(press == true) then
										if(tonumber(tostring(button)) > -1 and tonumber(tostring(button)) < 10) then
											repString = repString .. tostring(button)
										end
									end
								end
							end
						end
					elseif(button == "/") then
						if(press == true) then
							if(repShift == false) then
								repString = repString .. "."
							else
								repString = repString .. ","
							end
						end
					elseif(button == "1") then
						if(press == true) then
							if(repShift == false) then
								repString = repString .. "1"
							else
								repString = repString .. "!"
							end
						end
					elseif(button == "7") then
						if(press == true) then
							if(repShift == false) then
								repString = repString .. "7"
							else
								repString = repString .. "?"
							end
						end
					end
				elseif(button == "space") then
					if(press == true) then
						repString = repString .. " "
					end
				elseif(button == "backspace") then
					if(press == true) then
						if(string.len(repString) > 0) then
							local tempstr = string.sub(repString, string.len(repString), string.len(repString))
							if(tempstr == "!" or tempstr == "?" or tempstr == "." or tempstr == "-" or tempstr == "," or tempstr == " " or tempstr == "1" or tempstr == "2" or tempstr == "3" or tempstr == "4" or tempstr == "5" or tempstr == "6" or tempstr == "7" or tempstr == "8" or tempstr == "9" or tempstr == "0") then
								repString = string.sub(repString, 1, string.len(repString) - 1)
							else
								repString = string.sub(repString, 1, string.len(repString) - 2)
							end
						end
					end
				elseif(button == "enter") then
					if(press == true) then
						if(string.len(repString) > 0) then
							triggerServerEvent("onPlayerReportFromMenu", getLocalPlayer(), repString)
							MenuToggle = {}
							customShowChat(true)
							setPlayerHudComponentVisible("radar", true)
							HudToggle = true
							showCursor(false)
							cancelEvent()
							repString = ""
						else
							addBox("Ошибка: Вы не ввели текст.", 255, 0, 0)
						end 
					end
				end
			elseif(MenuToggle[2] == 6) then
				if(MenuToggle[4][1] == 1) then
					if(NumberTable[tostring(button)] ~= nil) then
						if(NumberTable[tostring(button)] == true) then
							if(press == true) then
								if(MenuToggle[4][2] ~= 0) then
									local perem = tonumber(tostring(MenuToggle[4][2]) .. tostring(button))
									if(perem <= 99999) then
										MenuToggle[4][2] = tonumber(tostring(MenuToggle[4][2]) .. tostring(button))
									end
								else
									MenuToggle[4][2] = tonumber(tostring(button))
								end
							end
						end
					elseif(button == "backspace") then
						if(press == true) then
							local stringd = tostring(MenuToggle[4][2])
							if(string.len(stringd) > 1) then
								stringd = string.sub(stringd, 1, string.len(stringd) - 1)
								MenuToggle[4][2] = tonumber(stringd)
							else
								MenuToggle[4][2] = 0
							end
						end
					end
				elseif(MenuToggle[4][1] == 2) then
					if(NameTable[tostring(button)] ~= nil) then
						if(press == true) then
							if(string.len(MenuToggle[4][3]) < 20) then
								if(repShift == true) then
									MenuToggle[4][3] = MenuToggle[4][3] .. NameTable[tostring(button)]["SS"]
								else
									MenuToggle[4][3] = MenuToggle[4][3] .. tostring(button)
								end
							end
						end
					elseif(button == "-") then
						if(press == true) then
							if(string.len(MenuToggle[4][3]) < 20) then
								if(repShift == true) then
									MenuToggle[4][3] = MenuToggle[4][3] .. "_"
								end
							end
						end
					elseif(button == "backspace") then
						if(press == true) then
							if(string.len(MenuToggle[4][3]) > 0) then
								MenuToggle[4][3] = string.sub(MenuToggle[4][3], 1, string.len(MenuToggle[4][3]) - 1)
							end
						end
					end
				end
			elseif(MenuToggle[2] == 8) then
				if(press == true) then
					if(PromoTable[tostring(button)] ~= nil) then
						if(string.len(MenuToggle[5]) < 20) then
							if(repShift == true) then
								MenuToggle[5] = MenuToggle[5] .. PromoTable[tostring(button)]["SS"]
							else
								MenuToggle[5] = MenuToggle[5] .. tostring(button)
							end
						end
					elseif(button == "backspace") then
						if(string.len(MenuToggle[5]) > 0) then
							MenuToggle[5] = string.sub(MenuToggle[5], 1, string.len(MenuToggle[5]) - 1)
						end
					end
				end
			end
		end	
	elseif(CarBuy == true) then
		local x, y = getCursorPosition()
		if(button == "mouse1") then
			if(press == true) then
				local max = CarCache[2]
				if(x > 0.065 and y > 0.908 and x < 0.156 and y < 0.962) then
					exitFromCarBuy()
					cancelEvent()
				elseif(x > 0.0223 and y > 0.2611 and x < 0.2 and y < 0.3009) then
					CarCache[4] = 1
					destroyElement(CarCache[5])
					CarCache[5] = createVehicle(CarCache[1][max + CarCache[4] - 1]["ID"], -972.2431640625, -832.6669921875, 13.123320579529, 0, 0, 135)
					setVehicleColor(CarCache[5], 125, 125, 125, 125, 125, 125)
					setElementDimension(CarCache[5], IDV)
				elseif(x > 0.0223 and x < 0.2 and y > 0.3092 and y < 0.3472) then
					CarCache[4] = 2
					destroyElement(CarCache[5])
					CarCache[5] = createVehicle(CarCache[1][max + CarCache[4] - 1]["ID"], -972.2431640625, -832.6669921875, 13.123320579529, 0, 0, 135)
					setVehicleColor(CarCache[5], 125, 125, 125, 125, 125, 125)
					setElementDimension(CarCache[5], IDV)
				elseif(x > 0.0223 and x < 0.2 and y > 0.3564 and y < 0.3935) then
					CarCache[4] = 3
					destroyElement(CarCache[5])
					CarCache[5] = createVehicle(CarCache[1][max + CarCache[4] - 1]["ID"], -972.2431640625, -832.6669921875, 13.123320579529, 0, 0, 135)
					setVehicleColor(CarCache[5], 125, 125, 125, 125, 125, 125)
					setElementDimension(CarCache[5], IDV)
				elseif(x > 0.0223 and x < 0.2 and y > 0.4064 and y < 0.4444) then
					CarCache[4] = 4
					destroyElement(CarCache[5])
					CarCache[5] = createVehicle(CarCache[1][max + CarCache[4] - 1]["ID"], -972.2431640625, -832.6669921875, 13.123320579529, 0, 0, 135)
					setVehicleColor(CarCache[5], 125, 125, 125, 125, 125, 125)
					setElementDimension(CarCache[5], IDV)
				elseif(x > 0.0223 and x < 0.2 and y > 0.4574 and y < 0.4953) then
					CarCache[4] = 5
					destroyElement(CarCache[5])
					CarCache[5] = createVehicle(CarCache[1][max + CarCache[4] - 1]["ID"], -972.2431640625, -832.6669921875, 13.123320579529, 0, 0, 135)
					setVehicleColor(CarCache[5], 125, 125, 125, 125, 125, 125)
					setElementDimension(CarCache[5], IDV)
				elseif(x > 0.0223 and x < 0.2 and y > 0.5111 and y < 0.5472) then
					CarCache[4] = 6
					destroyElement(CarCache[5])
					CarCache[5] = createVehicle(CarCache[1][max + CarCache[4] - 1]["ID"], -972.2431640625, -832.6669921875, 13.123320579529, 0, 0, 135)
					setVehicleColor(CarCache[5], 125, 125, 125, 125, 125, 125)
					setElementDimension(CarCache[5], IDV)
				elseif(x > 0.203 and x < 0.2145 and y > 0.2424 and y < 0.2537) then
					if(CarCache[2] > 1) then
						CarCache[2] = CarCache[2] - 1
						CarCache[4] = CarCache[4] + 1
					end
				elseif(x > 0.203 and x < 0.2145 and y > 0.5518 and y < 0.5611) then
					if(CarCache[2] + 5 < CarCache[3]) then
						CarCache[2] = CarCache[2] + 1
						CarCache[4] = CarCache[4] - 1
					end
				elseif(y > 0.684 and y < 0.7148) then
					if(x > 0.0692 and x < 0.08593) then
						setVehicleColor(CarCache[5], 125, 125, 125, 125, 125, 125)
						CarCache[6] = 0
					elseif(x > 0.09375 and x < 0.11041) then
						setVehicleColor(CarCache[5], 60, 60, 60, 60, 60, 60)
						CarCache[6] = 1
					elseif(x > 0.11666 and x < 0.13281) then
						setVehicleColor(CarCache[5], 15, 15, 15, 15, 15, 15)
						CarCache[6] = 2
					elseif(x > 0.13958 and x < 0.15677) then
						setVehicleColor(CarCache[5], 80, 0, 0, 80, 0, 0)
						CarCache[6] = 3
					elseif(x > 0.16302 and x < 0.17968) then
						setVehicleColor(CarCache[5], 125, 125, 0, 125, 125, 0)
						CarCache[6] = 4
					elseif(x > 0.18697 and x < 0.20312) then
						setVehicleColor(CarCache[5], 0, 30, 125, 0, 30, 125)
						CarCache[6] = 5
					end
				elseif(x > 0.11718 and y > 0.610185 and x < 0.189062 and y < 0.6527777) then
					if(getPlayerMoney(getLocalPlayer()) >= CarCache[1][max + CarCache[4] - 1]["GosPrice"]) then
						if(AllPerems["Pokupka"] == true) then
							triggerServerEvent("onClientTryBuyCar", getLocalPlayer(), max + CarCache[4] - 1, CarCache[6])
						else
							addBox("Вы просто смотрите авто.", 255, 0, 0)
						end
					else
						addBox("Ошибка: У Вас недостаточно денег.", 255, 0, 0)
					end
				end
			end
		elseif(button == "mouse_wheel_up") then
			if(press == true) then
				if(CarCache[2] > 1) then
					CarCache[2] = CarCache[2] - 1
					CarCache[4] = CarCache[4] + 1
				end
			end
		elseif(button == "mouse_wheel_down") then
			if(press == true) then
				if(CarCache[2] + 5 < CarCache[3]) then
					CarCache[2] = CarCache[2] + 1
					CarCache[4] = CarCache[4] - 1
				end
			end
		end
	elseif(SkinShop == true) then
		if(button == "mouse1") then
			if(press == true) then
				local x, y = getCursorPosition()
				if(x > 0.148 and y > 0.899 and x < 0.244 and y < 0.9824) then
					cancelEvent()
					SkinShopExit()
				elseif(x > 0.303 and y > 0.8990 and x < 0.350 and y < 0.981) then
					SkinShopLeft()
				elseif(x > 0.656 and y > 0.898 	and x < 0.703 and y < 0.981) then
					SkinShopRight()
				elseif(x > 0.765 and y > 0.898 	and x < 0.864 and y < 0.981) then
					cancelEvent()
					SkinShopBuy()
				end
			end
		end
	else
		if(button == "mouse1") then
			if(press == true) then
				if(Rega == true) then
					local x, y = getCursorPosition()
					local wx, wy = guiGetScreenSize()
					if(x < 0.58 and x > 0.43 and y > 0.51 and y < 0.58) then
						Rega1 = false
						Rega2 = true
					elseif(x > 0.41 and x < 0.58 and y > 0.43 and y < 0.50) then
						local wx, wy = guiGetScreenSize()
						Rega1 = true
						Rega2 = false
					elseif(x > 0.43 and x < 0.56 and y > 0.74 and y < 0.80) then
						if(al == alo) then
							if(string.len(al) > 2) then
								triggerServerEvent("Regaru", localPlayer, al)
							else
								addBox("Вы не ввели пароль.", 255, 0, 0)
							end
						else
							addBox("Пароли не совпадают.", 255, 0, 0)
						end
					else
						Rega1 = false
						Rega2 = false
					end
				elseif(string.len(LoginPass) > 3) then
					local x, y = getCursorPosition()
					if(x > 0.438 and x < 0.556 and y > 0.598 and y < 0.659) then
						if(LoginCD == false) then
							triggerServerEvent("Avtorizovalsya", localPlayer, LoginPass)
							LoginPass = ""
							LoginCD = true
							setTimer(function(  )
								LoginCD = false
							end, 3000, 1)
						else
							outputChatBox("Пожалуйста, подождите", 160, 160, 160)
						end
					end
				end
			end
		else
			if(Rega == true) then
				if(Rega1 == true) then
					if(press == true) then
						if(keyTable[tostring(button)] == true) then
							if(button == "2" and repShift == true) then
								if(string.len(al) < 13) then
									al = al .. "@"
								end
							elseif(repShift == true) then
								if(string.len(al) < 13) then
									al = al .. string.upper(button)
								end
							else
								if(string.len(al) < 13) then
									al = al .. button 
								end
							end
						elseif(button == "lshift") then
							zero = true
						elseif(button == "rshift") then
							zero = true
						elseif(button == "backspace") then
							if(string.len(al) > 0) then
								al = string.sub(al, 1, string.len(al) - 1)
							end
							backTime = setTimer(backTimer, 75, 0)
						elseif(button == "enter") then

					 	end
					elseif(press == false) then
						if(button == "lshift") then
							zero = false
						elseif(button == "rshift") then
							zero = false
						elseif(button == "backspace") then
							killTimer(backTime)
						end
					end
				elseif(Rega2 == true) then
					if(press == true) then
						if(keyTable[tostring(button)] == true) then
							if(button == "2" and repShift == true) then
								if(string.len(alo) < 13) then
									alo = alo .. "@"
								end
							elseif(repShift == true) then
								if(string.len(alo) < 13) then
									alo = alo .. string.upper(button)
								end
							else
								if(string.len(alo) < 13) then
									alo = alo .. button 
								end
							end
						elseif(button == "lshift") then
							zero = true
						elseif(button == "rshift") then
							zero = true
						elseif(button == "backspace") then
							if(string.len(alo) > 0) then
								alo = string.sub(alo, 1, string.len(alo) - 1)
							end
							backTime = setTimer(backTimer, 75, 0)
						elseif(button == "enter") then
							alo = ""
							act = false
					 	end
					elseif(press == false) then
						if(button == "lshift") then
							zero = false
						elseif(button == "rshift") then
							zero = false
						elseif(button == "backspace") then
							killTimer(backTime)
						end
					end
				end
			else
				if(press == true) then
					if(LoginUI == true) then
						local screenWidth, screenHeight = guiGetScreenSize()
						if(keyTable[tostring(button)] == true) then
							if(button == "2" and repShift == true) then
								if(string.len(LoginPass) < 13) then
									LoginPass = LoginPass .. "@"
								end
							elseif(repShift == true) then
								if(string.len(LoginPass) < 13) then
									LoginPass = LoginPass .. string.upper(button)
								end
							else
								if(string.len(LoginPass) < 13) then
									LoginPass = LoginPass .. button 
								end
							end
						elseif(button == "lshift") then
							zero = true
						elseif(button == "rshift") then
							zero = true
						elseif(button == "backspace") then
							if(string.len(LoginPass) > 0) then
								LoginPass = string.sub(LoginPass, 1, string.len(LoginPass) - 1)
							end
							backTime = setTimer(backTimer, 75, 0)
						elseif(button == "enter") then
							if(string.len(LoginPass) > 3) then
								if(LoginCD == false) then
									triggerServerEvent("Avtorizovalsya", localPlayer, LoginPass)
									LoginPass = ""
									LoginCD = true
									setTimer(function(  )
										LoginCD = false
									end, 3000, 1)
								else
									addBox("Пожалуйста, подождите", 190, 190, 190)
								end
							else
								addBox("Ошибка: Вы не ввели пароль.", 190, 190, 190)
							end
					 	end
					else
						if(button == "2") then
							local ItemsGUI = tonumber(table.getn(GUITable))
							if(ItemsGUI == 0) then
								if(isChatBoxInputActive() == false) then
									triggerServerEvent("TryEndWork", getLocalPlayer(), getLocalPlayer())
								end
							end
						elseif(button == "escape") then
							if(#GUITable > 0) then
								onPlayerClickGUINo()
								cancelEvent()
							end
						elseif(button == "enter") then
							if(#GUITable > 0) then
								local row, col = guiGridListGetSelectedItem(GUITable[4])
								if(row > -1) then
									onPlayerClickGUIYes()
									cancelEvent()
								end
							end
						elseif(button == "arrow_d") then
							if(#GUITable > 0) then
								if(GUITable[5] == 3) then
									local row, col = guiGridListGetSelectedItem(GUITable[4])
									if(row > -1) then
										local rows = guiGridListGetRowCount(GUITable[4])
										if(row < rows - 1) then
											guiGridListSetSelectedItem(GUITable[4], row + 1, 1)
										else
											guiGridListSetSelectedItem(GUITable[4], 0, 1)
										end
									else
										guiGridListSetSelectedItem(GUITable[4], 0, 1)
									end
								end
							end
						elseif(button == "arrow_u") then
							if(#GUITable > 0) then
								if(GUITable[5] == 3) then
									local rows = guiGridListGetRowCount(GUITable[4])
									local row, col = guiGridListGetSelectedItem(GUITable[4])
									if(row > 0) then
										guiGridListSetSelectedItem(GUITable[4], row-1, 1)
									else
										guiGridListSetSelectedItem(GUITable[4], rows-1, 1)
									end
								end
							end
						end
					end
				elseif(press == false) then
					if(button == "lshift") then
						zero = false
					elseif(button == "rshift") then
						zero = false
					elseif(button == "backspace") then
						if(isTimer(backTime) == true) then
							killTimer(backTime)
						end
					end
					if(string.len(LoginPass) > 3) then
						local sx, sy = guiGetScreenSize()
					else
						local sx, sy = guiGetScreenSize()
					end
				end
			end
		end
	end
end

function fffd( )
	if(MenuToggle[1] == nil) then
		triggerServerEvent("trigCheckMenu", getLocalPlayer(), getLocalPlayer())
	else
		MenuToggle = {}
		customShowChat(true)
		setPlayerHudComponentVisible("radar", true)
		HudToggle = true
		showCursor(false)
		cancelEvent()
		repString = ""
	end
end

addEventHandler("onClientKey", root, playerPressedKey)
bindKey("F7", "up", onFS)
bindKey("TAB", "down", onGridPlayerOn)
bindKey("TAB", "up", onGridPlayerOff)
bindKey("F1", "down", fffd)

addEventHandler("onClientVehicleStartExit", getRootElement(), function ( thePlayer, seat, door )
	if(thePlayer == getRootElement()) then
		if(seat == 0) then
			Driver = false
		end
	end
end)

function onAvtoriz(  )
	LoginUI = false
	setCameraTarget(localPlayer)
	showCursor(false)
	Avt = true
	triggerEvent("endChooseBrowser", getLocalPlayer())
end

function onRegisterUI( )
	showCursor(false)
	triggerEvent("startChooseBrowser", getLocalPlayer(), "register")
	setPlayerHudComponentVisible("radar", false)
	showCursor(true)
end

function onPlayerMarkerBuilder( hitPlayer, matchingDimension )
	if(hitPlayer == localPlayer) then
		if(getPedOccupiedVehicle(localPlayer) == false) then
			if(mrkBuilder == source) then
				local x, y, z = getElementPosition(mrkBuilder)
				local x1, y1, z1 = getElementPosition(localPlayer)
				local dist = getDistanceBetweenPoints3D(x, y, z, x1, y1, z1)
				if(dist < 4) then
					destroyElement(mrkBuilder)
					destroyElement(blpBuilder)
					mrkBuilderSec = createMarker(312.3193359375, -242.5205078125, 28.607975006104, "cylinder", 1.8, 225, 0, 0, 225)
					blpBuilderSec = createBlip(312.3193359375, -242.5205078125, 28.607975006104, 0, 2, 255, 0, 0, 255, 1, 64000)
					addEventHandler("onClientMarkerHit", mrkBuilderSec, onPlayerMarkerBuilderSec)
					mrkBuilder = nil
					blpBuilder = nil
					checkTimer = setTimer(checkAn, 55, 0)
					triggerServerEvent("mrkBuildStart", localPlayer)
					toggleControl("enter_exit", false)
					toggleControl("fire", false)
					toggleControl("jump", false)
					toggleControl("enter_passenger", false)
					toggleControl("next_weapon", false)
					toggleControl("previous_weapon", false)
					toggleControl("aim_weapon", false)
					toggleControl("sprint", false)
					toggleControl("crouch", false)
				end
			end
		end
	end
end

function onPlayerCheckMenu(lvl, exp, sex, number, fname, fact, frank, money, house, bus, work, rank, warn, don, bank, coefmoney)
	onPlayerClickGUINo()
	showCursor(true)
	MenuToggle[1] = true
	MenuToggle[2] = 1
	MenuToggle[9] = don
	customShowChat(false)
	setPlayerHudComponentVisible("radar", false)
	HudToggle = false
	PInfo["Lvl"] = lvl
	PInfo["Exp"] = exp
	PInfo["Sex"] = sex
	PInfo["Faction"] = fact
	PInfo["FName"] = fname
	PInfo["FRank"] = frank
	PInfo["Rank"] = rank
	PInfo["Money"] = money
	PInfo["House"] = house
	PInfo["Bus"] = bus
	PInfo["Work"] = work
	PInfo["Warn"] = warn
	PInfo["Donate"] = don
	PInfo["Coefmoney"] = coefmoney
	PInfo["Bank"] = bank
	local temp = number
	number = {}
	number[1] = math.floor(temp / 1000)
	number[2] = temp % 1000
	if(number[2] < 100) then
		if(number[2] < 10) then
			number[2] = "00" .. number[2]
		else
			number[2] = "0" .. number[2]
		end
	end
	PInfo["PhoneNumber"] = number
	if(sex == 1) then
		PInfo["Sex"] = "Мужской"
	else
		PInfo["Sex"] = "Женский"
	end
end

function onPlayerMarkerBuilderSec( hitPlayer, matchingDimension )
	if(hitPlayer == localPlayer) then
		if(getPedOccupiedVehicle(localPlayer) == false) then
			if(mrkBuilderSec == source) then
				local x, y, z = getElementPosition(mrkBuilderSec)
				local x1, y1, z1 = getElementPosition(localPlayer)
				local dist = getDistanceBetweenPoints3D(x, y, z, x1, y1, z1)
				if(dist < 3) then
					if(canLoaderEnd == false) then
						canLoaderEnd = true
						destroyElement(mrkBuilderSec)
						destroyElement(blpBuilderSec)
						mrkBuilder = createMarker(310.7568359375, -242.1298828125, 11.428287506104, "cylinder", 1.8, 225, 0, 0, 225)
						blpBuilder = createBlip(310.7568359375, -242.1298828125, 11.428287506104, 0, 1, 255, 0, 0, 255, 1, 64000)
						addEventHandler("onClientMarkerHit", mrkBuilder, onPlayerMarkerBuilder)
						BuilderGruz = BuilderGruz + 1
						addBox("Вы перенесли " .. BuilderGruz .. " груз(-а/-ов).", 0, 255, 100)
						killTimer(checkTimer)
						checkTimer = nil
						triggerServerEvent("ClearBuilderGruz", localPlayer)
						triggerServerEvent("BuilderEndGruz", localPlayer)
						mrkBuilderSec = nil
						blpBuilderSec = nil
						builderer = 0
						toggleControl("fire", true)
						toggleControl("jump", true)
						toggleControl("enter_passenger", true)
						toggleControl("next_weapon", true)
						toggleControl("previous_weapon", true)
						toggleControl("aim_weapon", true)
						toggleControl("sprint", true)
						toggleControl("crouch", true)
						setTimer(function ( )
							canLoaderEnd = false
						end, 15000, 1)
					else
						triggerServerEvent("etoPizdec2", getLocalPlayer(), getLocalPlayer())
					end
				end
			end
		end
	end
end

function checkAn( )
	local agf = getPedMoveState(localPlayer)
	if(agf == "jump" or agf == "fall") then
		if(mrkBuilderSec ~= nil) then
			builderer = builderer + 1
			if(builderer == 4) then
				if(checkTimer ~= nil) then
					killTimer(checkTimer)
					checkTimer = nil
				end
				destroyElement(mrkBuilderSec)
				destroyElement(blpBuilderSec)
				mrkBuilderSec = nil
				blpBuilderSec = nil
				if(mrkBuilder == nil) then
					mrkBuilder = createMarker(310.7568359375, -242.1298828125, 11.428287506104, "cylinder", 1.8, 225, 0, 0, 225)
					blpBuilder = createBlip(310.7568359375, -242.1298828125, 11.428287506104, 0, 1, 255, 0, 0, 255, 1, 64000)
					addEventHandler("onClientMarkerHit", mrkBuilder, onPlayerMarkerBuilder)
				end
				addBox("Вы уронили груз, подберите новый в начале.", 255, 0, 0)
				triggerServerEvent("ClearBuilderGruz", localPlayer)
				builderer = 0
				toggleControl("enter_exit", true)
				toggleControl("fire", true)
				toggleControl("jump", true)
				toggleControl("enter_passenger", true)
				toggleControl("next_weapon", true)
				toggleControl("previous_weapon", true)
				toggleControl("aim_weapon", true)
				toggleControl("sprint", true)
				toggleControl("crouch", true)
			end
		end
	else
		builderer = 0
	end
end

function BuilderStart()
	mrkBuilder = createMarker(310.7568359375, -242.1298828125, 11.428287506104, "cylinder", 1.8, 225, 0, 0, 225)
	blpBuilder = createBlip(310.7568359375, -242.1298828125, 11.42828750610, 0, 1.4, 255, 0, 0, 255, 1, 64000)
	addEventHandler("onClientMarkerHit", mrkBuilder, onPlayerMarkerBuilder)
	BuilderGruz = 0
	builderer = 0
end

function BuilderEnd(  )
	if(mrkBuilder ~= nil) then
		destroyElement(mrkBuilder)
		destroyElement(blpBuilder)
		mrkBuilder = nil
		blpBuilder = nil
	end
	if(mrkBuilderSec ~= nil) then
		destroyElement(mrkBuilderSec)
		destroyElement(blpBuilderSec)
		mrkBuilderSec = nil
		blpBuilderSec = nil
	end
	if(checkTimer ~= nil) then
		killTimer(checkTimer)
		checkTimer = nil
	end
	triggerServerEvent("BuilderZP", localPlayer, BuilderGruz)
	triggerServerEvent("ClearBuilderGruz", localPlayer)
	builderer = 0
	toggleControl("fire", true)
	toggleControl("jump", true)
	toggleControl("enter_passenger", true)
	toggleControl("next_weapon", true)
	toggleControl("previous_weapon", true)
	toggleControl("aim_weapon", true)
	toggleControl("sprint", true)
	toggleControl("crouch", true)
end

function onClientPlayerWasted( killer, weapon, part, loss, stealth )
	if(source == localPlayer) then
		Driver = false
		if(SkinShop == true) then
			SkinShopExit()
		end
		if(CarBuy == true) then
			clearBuyCar()
			addBox("Вы погибли при выборе авто.", 255, 0, 0)
		end
		if(Fishing == true) then
			Fishing = false
			FishMark = false
			unbindKey("space", "up", fishStart)
			CanFish = false
			toggleAllControls(true)
			waitingFish = false
			unbindKey("mouse1", "down", ClickingFish)
		end
		if(zorka > 0) then
			zorka = 0
			setCameraTarget(getLocalPlayer(), getLocalPlayer())	
			toggleAllControls(true)
		end
		if(AllPerems[1] ~= nil) then
			stopSound(AllPerems[1])
			AllPerems[1] = nil
		end
	end
end

function oncdp( attacker, weapon, body )
	if(getElementType(source) == "ped" and getElementType(source) ~= "player") then
		cancelEvent()
	end
end

function onppd( attacker, weapon, body)
	if(source == localPlayer) then
		if(getElementType(source) == "player") then
			if(attacker ~= source) then
				if(attacker ~= false) then
					if(attacker ~= nil) then
						if(getElementType(attacker) == "player") then
							local x, y, z = getElementPosition(source)
							for i, n in pairs(TableZZ) do
								if(x > TableZZ[i]["x1"] and x < TableZZ[i]["x2"] and y > TableZZ[i]["y1"] and y < TableZZ[i]["y2"]) then
									if(TableZZ[i]["Interior"] == nil) then
										cancelEvent()
										if(Mojno == true) then
											setTimer(function ( ... )
												Mojno = true
											end, 400, 1)
											triggerServerEvent("AdminTriggerDamage", getLocalPlayer(), attacker)
											Mojno = false
											break
										end
									else
										if(getElementInterior(source) == TableZZ[i]["Interior"]) then
											cancelEvent()
											if(Mojno == true) then
												setTimer(function ( ... )
													Mojno = true
												end, 400, 1)
												triggerServerEvent("AdminTriggerDamage", getLocalPlayer(), attacker)
												Mojno = false
												break
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
	if(source == localPlayer) then
		if(attacker ~= nil) then
			if(attacker ~= false) then
				if(getElementType(attacker) == "player") then
					if(weapon == 23) then
						cancelEvent()
						triggerServerEvent("DamageSukaTazer", getLocalPlayer(), getLocalPlayer(), attacker)
					end
				end
			end
		end
	end
end

function CameraUpdate( rot )
	setPedCameraRotation(localPlayer, rot)
end

function onLoadGreenZone( table )
	TableZZ = table
end

function onPlayerEnterSkinShop( tablo )
	SkinShop = true
	showCursor(true)
	SkinsCache[1] = tablo
	SkinsCache[2] = {}
	SkinsCache[2][1] = SkinsCache[1][1]["ID"]
	SkinsCache[2][2] = 1
	SkinsCache[3] = table.getn(tablo)
	local pl = getLocalPlayer()
	SkinsCache[4] = getElementModel(pl)
	setElementModel(getLocalPlayer(), SkinsCache[2][1])
	setCameraMatrix(422.7607421875, 1021.5302734375, 19.22015838623, 422.779296875, 1018.189453125, 18.92015838623)
	HudToggle = false
	setPlayerHudComponentVisible("radar", false)
	customShowChat(false)
end

function onPlayerBuyCarMenu( tablo, id, booleva )
	if(booleva == false) then
		AllPerems["Pokupka"] = false
	else
		AllPerems["Pokupka"] = true
	end
	CarBuy = true
	CarCache[1] = tablo
	CarCache[2] = 1
	CarCache[3] = table.getn(tablo)
	CarCache[4] = 1
	CarCache[5] = createVehicle(CarCache[1][1]["ID"], -972.2431640625, -832.6669921875, 13.123320579529, 0, 0, 135)
	CarCache[6] = 3
	setVehicleColor(CarCache[5], 125, 125, 125, 125, 125, 125)
	showCursor(true)
	setPlayerHudComponentVisible("radar", false)
	customShowChat(false)
	HudToggle = false
	setCameraMatrix(-974.0205078125, -846.65234375, 16.123320579529, -973.2431640625, -832.6669921875, 13.123320579529)
	IDV = id
	setElementDimension(CarCache[5], IDV)
end

function onClientBoughtCar( )
	clearBuyCar()
end

function onUskToggle( )
	Usk = not Usk
end

function onTryFish( command )
	local localPlayer = getLocalPlayer()
	if(getPedOccupiedVehicle(localPlayer) == false) then
		local cont = getPedContactElement(localPlayer)
		if(cont ~= false) then
			if(getElementType(cont) == "vehicle") then
				if(cont == FishBoat) then
					if(isElementInWater(cont) == true) then
						if(Fishing == false or Fishing == nil) then
							if(FishMark == true) then
								local vx, vy, vz = getElementVelocity(cont)
								local speed = math.round(math.sqrt(vx * vx + vy * vy + vz * vz) * 200)
								if(speed < 2) then
									onFishingOnMarker()
								else
									addBox("Лодку необходимо остановить.", 255, 0, 0)
								end
							else
								addBox("Вы не находитесь у косяка.", 255, 0, 0)
							end
						else
							addBox("Вы уже начали ловить рыбу!", 255, 0, 0)
						end
					else
						addBox("Необходимо, чтобы лодка находилась в воде,\nПока Вы ловите рыбу.", 255, 0, 0)
					end
				else
					addBox("Вы не находитесь\nНа своей арендованной лодке.", 255, 0, 0)
				end
			end
		end
	end
end

function onddd( attacker, theweapon, loss )
	if(getVehicleOccupant(source, 0) == false) then
		if(attacker == getLocalPlayer() and theweapon == 22) then
			triggerServerEvent("onCheckId", getLocalPlayer(), getLocalPlayer(), source)
		end
		cancelEvent()
	end
end

function msgforcamera( msg, x, y, z, r, g, b, distr, asf )
	local x1, y1, z1 = getCameraMatrix()
	local dist = getDistanceBetweenPoints3D(x, y, z, x1, y1, z1)
	if(distr ~= nil) then
		if(dist < distr) then
			if(asf ~= nil) then
				if(asf == true) then
					outputChatBox(msg, r, g, b, true)
				else
					outputChatBox(msg, r, g, b, false)
				end
			else
				outputChatBox(msg, r, g, b, false)
			end
		end
	else
		if(dist < 20) then
			outputChatBox(msg, r, g, b, false)
		end
	end
end

function onAddClist( id, player, color )
	local r, g, b, a = 0, 0, 0, 0
	if(color ~= nil) then
		if(color == 1) then
			r, g, b, a = 170, 102, 204, 220
		elseif(color == 2) then
			r, g, b, a = 220, 120, 20, 220
		elseif(color == 3) then
			r, g, b, a = 0, 160, 30, 220
		elseif(color == 4) then
			r, g, b, a = 80, 20, 0, 220
		elseif(color == 5) then
			r, g, b, a = 0, 220, 220, 220
		elseif(color == 6) then
			r, g, b, a = 250, 250, 0, 220
		elseif(color == 7) then
			r, g, b, a = 240, 0, 60, 220
		elseif(color == 8) then
			r, g, b, a = 0, 60, 255, 220
		elseif(color == 9) then
			r, g, b, a = 150, 75, 0, 220
		else
			r, g, b, a = 220, 220, 220, 90
		end
	else
		r, g, b, a = 220, 220, 220, 90
	end
	TableAttach[id] = {}
	TableAttach[id]["blp"] = createBlipAttachedTo(player, 0, 2.4, r, g, b, a, 0, 80)
	TableAttach[id]["p"] = player
	PT[id]["rgba"] = {}
	PT[id]["rgba"][1], PT[id]["rgba"][2], PT[id]["rgba"][3] = r, g, b
	PT[id]["p"] = player
end

function onChangeClist( id, player, color )
	if(TableAttach[id] ~= nil) then 
		if(isElement(TableAttach[id]["blp"])) then
			destroyElement(TableAttach[id]["blp"])
		end
	end
	local r, g, b, a = 0, 0, 0, 0
	if(color ~= nil) then
		if(color == 1) then
			r, g, b, a = 170, 102, 204, 220
		elseif(color == 2) then
			r, g, b, a = 220, 120, 20, 220
		elseif(color == 3) then
			r, g, b, a = 0, 160, 30, 220
		elseif(color == 4) then
			r, g, b, a = 40, 10, 0, 220
		elseif(color == 5) then
			r, g, b, a = 0, 220, 220, 220
		elseif(color == 6) then
			r, g, b, a = 250, 250, 0, 220
		elseif(color == 7) then
			r, g, b, a = 240, 0, 60, 220
		elseif(color == 8) then
			r, g, b, a = 0, 60, 255, 220
		elseif(color == 9) then
			r, g, b, a = 150, 75, 0, 220
		else
			r, g, b, a = 220, 220, 220, 90
		end
	else
		r, g, b, a = 220, 220, 220, 90
	end
	TableAttach[id] = {}
	TableAttach[id]["blp"] = createBlipAttachedTo(player, 0, 2.4, r, g, b, a, 0, 80)
	TableAttach[id]["p"] = player
	PT[id]["rbga"] = {}
	PT[id]["rgba"][1], PT[id]["rgba"][2], PT[id]["rgba"][3] = r, g, b
	PT[id]["p"] = player
end

function onDelClist( id )
	destroyElement(TableAttach[id]["blp"])
	TableAttach[id]["blp"] = nil 
end

setTimer(function ( ... )
	for i,n in pairs(TableAttach) do
		if(isElement(n["p"]) == false) then
			destroyElement(n["blp"])
			TableAttach[i] = nil
		end
	end
end, 10000, 1)

function captureToggle( booleva, maf1, maf2, scora1, scora2 )
	if(booleva == true) then
		cpt = booleva
		cptmaf1 = maf1
		cptmaf2 = maf2
		cptscore1 = 0
		if(scora1 ~= nil) then
			cptscore1 = scora1
		end
		cptscore2 = 0
		if(scora2 ~= nil) then
			cptscore2 = scora2
		end
		capttime = 600
	else
		cpt = booleva
	end
end

function captplus( maf )
	if(maf == 1) then
		cptscore1 = cptscore1 + 1
	else
		cptscore2 = cptscore2 + 1
	end
end

addEvent("captplus", true)
addEventHandler("captplus", root, captplus)
addEvent("onChangeClist", true)
addEventHandler("onChangeClist", root, onChangeClist)
addEvent("captureToggle", true)
addEventHandler("captureToggle", root, captureToggle)
addEvent("msgforcamera", true)
addEventHandler("msgforcamera", root, msgforcamera)
addEventHandler("onClientVehicleDamage", root, onddd)
addCommandHandler("fishing", onTryFish)
addEvent("onAddClist", true)
addEventHandler("onAddClist", root, onAddClist)
addEvent("onDelClist", true)
addEventHandler("onDelClist", root, onDelClist)
addEvent("onUskToggle", true)
addEventHandler("onUskToggle", root, onUskToggle)
addEvent("onClientBoughtCar", true)
addEventHandler("onClientBoughtCar", root, onClientBoughtCar)
addEvent("onPlayerBuyCarMenu", true)
addEventHandler("onPlayerBuyCarMenu", root, onPlayerBuyCarMenu)
addEvent("onClientSkinShopEnd", true)
addEventHandler("onClientSkinShopEnd", root, onClientSkinShopEnd)
addEvent("onPlayerEnterSkinShop", true)
addEventHandler("onPlayerEnterSkinShop", root, onPlayerEnterSkinShop)
addEvent("onClientClearFish", true)
addEventHandler("onClientClearFish", root, onClientClearFish)
addEvent("onPlayerCheckMenu", true)
addEventHandler("onPlayerCheckMenu", root, onPlayerCheckMenu)
addEvent("OnEndWorkFish", true)
addEventHandler("OnEndWorkFish", root, OnEndWorkFish)
addEvent("onStartWorkFish", true)
addEventHandler("onStartWorkFish", root, onStartWorkFish)
addEvent("onBoxAdd", true)
addEventHandler("onBoxAdd", root, addBox)
addEventHandler("onClientPlayerDamage", root, onppd)
addEvent("LoadGreenZone", true)
addEventHandler("LoadGreenZone", root, onLoadGreenZone)
addEventHandler("onClientPedDamage", root, oncdp)
addEvent("onCourierEnterVeh", true)
addEventHandler("onCourierEnterVeh", root, startCourierVeh)
addEventHandler("onClientPlayerWasted", root, onClientPlayerWasted)
addEvent("BuilderStart", true)
addEventHandler("BuilderStart", root, BuilderStart)
addEvent("BuilderEnd", true)
addEventHandler("BuilderEnd", root, BuilderEnd)
addEvent("onRegisterUI", true)
addEventHandler("onRegisterUI", localPlayer, onRegisterUI)
addEvent("Avtoriz", true)
addEventHandler("Avtoriz", localPlayer, onAvtoriz)
addEvent("onEXPUpdate", true)
addEventHandler("onEXPUpdate", localPlayer, onEXPUpdate)
addEvent("Food", true)
addEventHandler("Food", localPlayer, onFoodUpdate)
addEvent("onGridMinus", true)
addEventHandler("onGridMinus", localPlayer, onGridMinus)
addEvent("onGridPlus", true)
addEventHandler("onGridPlus", localPlayer, onGridPlus)
addEvent("onGridPlayerOff", true)
addEventHandler("onGridPlayerOff", localPlayer, onGridPlayerOff)
addEvent("onPlayerHUD", true)
addEventHandler("onPlayerHUD", localPlayer, onPlayerHUD)
addEvent("onGridPlayerOn", true)
addEventHandler("onGridPlayer", localPlayer, onGridPlayerOn)
addEvent("onOutLogin", true)
addEventHandler("onOutLogin", localPlayer, outLogin)
addEvent( "onGreeting", true)
addEventHandler( "onGreeting", localPlayer, closeLogin )
addEvent( "onSuccessRegister", true)
addEventHandler("onSuccessRegister", localPlayer, successRegister)
addEvent("LoaderWorkStart", true)
addEventHandler("LoaderWorkStart", localPlayer, StartLoaderWork)
addEvent("EndLoaderWork", true)
addEventHandler("EndLoaderWork", localPlayer, EndLoaderWork)
addEvent("ClearLoadWork", true)
addEventHandler("ClearLoadWork", localPlayer, ClearLoadWork)
addEvent("ShowPlayerPass", true)
addEventHandler("ShowPlayerPass", localPlayer, showPlayerPass)
addEventHandler("onClientVehicleEnter",  getRootElement(), ClientEnterVehicle)
addEvent("ClearCourierWork", true)
addEventHandler("ClearCourierWork", localPlayer, ClearCourierWork)
addEvent("showPlayerDialog", true)
addEventHandler("showPlayerDialog", localPlayer, showPlayerDialog)
addEventHandler("onClientVehicleExit", root, onClientVehicleExit)
addEventHandler ( "onClientRender", root, onClientRender )
addEvent("FuelUpdate", true)
addEventHandler("FuelUpdate", root, FuelUpdate)
addEvent("CameraUpdate", true)
addEventHandler("CameraUpdate", root, CameraUpdate)
addEventHandler("onClientResourceStart", getRootElement( ), onClientResourceStart)

local screenW,screenH = guiGetScreenSize()
local sW,sH = (screenW/1920),(screenH/1080)
setPlayerNametagShowing(localPlayer, false)

-- state variables
local speed = 0
local camFov = 70
local camRoll = 0
local strafespeed = 0
local rotX, rotY = 0,0
local isSlowCamHack = true
local velocityX, velocityY, velocityZ

-- configurable parameters
local slowOptions = {
	normalMaxSpeed = 0.05,
	slowMaxSpeed = 0.012,
	fastMaxSpeed = 1,
	acceleration = 0.002,
	decceleration = 0.001,
	mouseSensitivity = 0.006
}

local fastOptions = {
	normalMaxSpeed = 1,
	slowMaxSpeed = 0.1,
	fastMaxSpeed = 5,
	acceleration = 0.3,
	decceleration = 0.15,
	mouseSensitivity = 0.3
}

local camKeys = {
	key_fastMove = "lshift",
	key_slowMove = "lalt",
	key_forward = "forwards",
	key_backward = "backwards",
	key_left = "left",
	key_right = "right",
	key_forward_veh = "accelerate",
	key_backward_veh = "brake_reverse",
	key_left_veh = "vehicle_left",
	key_right_veh = "vehicle_right",
	key_up_fov = "c",
	key_down_fov = "z",
	key_left_roll = "q",
	key_right_roll = "e"
}

local controlToKey = {
	["forwards"] = "w",
	["backwards"] = "s",
	["left"] = "a",
	["right"] = "d",
	["accelerate"] = "w",
	["brake_reverse"] = "s",
	["vehicle_left"] = "a",
	["vehicle_right"] = "d"
}

local mouseFrameDelay = 0

local mta_getKeyState = getKeyState
function getKeyState(key)
	if isMTAWindowActive() then
		return false
	end
	if key == "lshift" or key == "lalt" or key == "arrow_u" or key == "arrow_d" or key == "arrow_l" or key == "arrow_r" or key == "z" or key == "c" or key == "q" or key == "e" then
		return mta_getKeyState(key)
	else 
		return mta_getKeyState(controlToKey[key]) or getPedControlState(localPlayer, key)
	end
end

-- PRIVATE

function camFrame()
	setPedWeaponSlot(localPlayer, 0 )
	if getKeyState( camKeys.key_right_roll ) then
		if camRoll - 1 < -45 then
			return
		else
			camRoll = camRoll - 0.5
		end
	elseif getKeyState( camKeys.key_left_roll ) then
		if camRoll + 1 > 45 then
			return
		else
			camRoll = camRoll + 0.5
		end
	end
	if getKeyState( camKeys.key_down_fov ) then
		if camFov - 1 < 0 then
			return
		else
			camFov = camFov - 0.5
		end
	elseif getKeyState( camKeys.key_up_fov ) then
		if camFov + 1 > 180 then
			return
		else
			camFov = camFov + 0.5
		end
	end
	
	if isSlowCamHack then
		-- Calculate what the maximum speed that the camera should be able to move at.
		local mspeed = slowOptions.normalMaxSpeed
		if getKeyState ( camKeys.key_fastMove ) then
			mspeed = slowOptions.fastMaxSpeed
		elseif getKeyState ( camKeys.key_slowMove ) then
			mspeed = slowOptions.slowMaxSpeed
		end
		
		local acceleration = slowOptions.acceleration
		local decceleration = slowOptions.decceleration
	
	    -- Check to see if the forwards/backwards camKeys are pressed
	    local speedKeyPressed = false
	    if ( getKeyState ( camKeys.key_forward ) or getKeyState ( camKeys.key_forward_veh ) ) and not getKeyState("arrow_u") then
			speed = speed + acceleration 
	        speedKeyPressed = true
	    end
		if ( getKeyState ( camKeys.key_backward ) or getPedControlState( localPlayer, camKeys.key_backward_veh ) ) and not getKeyState("arrow_d") then
			speed = speed - acceleration 
	        speedKeyPressed = true
	    end

	    -- Check to see if the strafe camKeys are pressed
	    local strafeSpeedKeyPressed = false
		if ( getKeyState ( camKeys.key_right ) or getKeyState ( camKeys.key_right_veh ) ) and not getKeyState("arrow_r") then
	        if strafespeed > 0 then -- for instance response
	            strafespeed = 0
	        end
	        strafespeed = strafespeed - acceleration / 2
	        strafeSpeedKeyPressed = true
	    end
		if ( getKeyState ( camKeys.key_left ) or getKeyState ( camKeys.key_left_veh ) ) and not getKeyState("arrow_l") then
	        if strafespeed < 0 then -- for instance response
	            strafespeed = 0
	        end
	        strafespeed = strafespeed + acceleration / 2
	        strafeSpeedKeyPressed = true
	    end

	    -- If no forwards/backwards camKeys were pressed, then gradually slow down the movement towards 0
	    if speedKeyPressed ~= true then
			if speed > 0 then
				speed = speed - decceleration
			elseif speed < 0 then
				speed = speed + decceleration
			end
	    end

	    -- If no strafe camKeys were pressed, then gradually slow down the movement towards 0
	    if strafeSpeedKeyPressed ~= true then
			if strafespeed > 0 then
				strafespeed = strafespeed - decceleration
			elseif strafespeed < 0 then
				strafespeed = strafespeed + decceleration
			end
	    end

	    -- Check the ranges of values - set the speed to 0 if its very close to 0 (stops jittering), and limit to the maximum speed
	    if speed > -decceleration and speed < decceleration then
	        speed = 0
	    elseif speed > mspeed then
	        speed = mspeed
	    elseif speed < -mspeed then
	        speed = -mspeed
	    end
	 
	    if strafespeed > -(acceleration / 2) and strafespeed < (acceleration / 2) then
	        strafespeed = 0
	    elseif strafespeed > mspeed then
	        strafespeed = mspeed
	    elseif strafespeed < -mspeed then
	        strafespeed = -mspeed
	    end
	else
		-- Calculate what the maximum speed that the camera should be able to move at.
		local mspeed = fastOptions.normalMaxSpeed
		if getKeyState ( camKeys.key_fastMove ) then
			mspeed = fastOptions.fastMaxSpeed
		elseif getKeyState ( camKeys.key_slowMove ) then
			mspeed = fastOptions.slowMaxSpeed
		end
		
		local acceleration = fastOptions.acceleration
		local decceleration = fastOptions.decceleration
	
	    -- Check to see if the forwards/backwards camKeys are pressed
	    local speedKeyPressed = false
	    if ( getKeyState ( camKeys.key_forward ) or getKeyState ( camKeys.key_forward_veh ) ) and not getKeyState("arrow_u") then
			speed = speed + acceleration 
	        speedKeyPressed = true
	    end
		if ( getKeyState ( camKeys.key_backward ) or getPedControlState (localPlayer, camKeys.key_backward_veh ) ) and not getKeyState("arrow_d") then
			speed = speed - acceleration 
	        speedKeyPressed = true
	    end

	    -- Check to see if the strafe camKeys are pressed
	    local strafeSpeedKeyPressed = false
		if ( getKeyState ( camKeys.key_right ) or getKeyState ( camKeys.key_right_veh ) ) and not getKeyState("arrow_r") then
	        if strafespeed > 0 then -- for instance response
	            strafespeed = 0
	        end
	        strafespeed = strafespeed - acceleration / 2
	        strafeSpeedKeyPressed = true
	    end
		if ( getKeyState ( camKeys.key_left ) or getKeyState ( camKeys.key_left_veh ) ) and not getKeyState("arrow_l") then
	        if strafespeed < 0 then -- for instance response
	            strafespeed = 0
	        end
	        strafespeed = strafespeed + acceleration / 2
	        strafeSpeedKeyPressed = true
	    end

	    -- If no forwards/backwards camKeys were pressed, then gradually slow down the movement towards 0
	    if speedKeyPressed ~= true then
			if speed > 0 then
				speed = speed - decceleration
			elseif speed < 0 then
				speed = speed + decceleration
			end
	    end

	    -- If no strafe camKeys were pressed, then gradually slow down the movement towards 0
	    if strafeSpeedKeyPressed ~= true then
			if strafespeed > 0 then
				strafespeed = strafespeed - decceleration
			elseif strafespeed < 0 then
				strafespeed = strafespeed + decceleration
			end
	    end

	    -- Check the ranges of values - set the speed to 0 if its very close to 0 (stops jittering), and limit to the maximum speed
	    if speed > -decceleration and speed < decceleration then
	        speed = 0
	    elseif speed > mspeed then
	        speed = mspeed
	    elseif speed < -mspeed then
	        speed = -mspeed
	    end
	 
	    if strafespeed > -(acceleration / 2) and strafespeed < (acceleration / 2) then
	        strafespeed = 0
	    elseif strafespeed > mspeed then
	        strafespeed = mspeed
	    elseif strafespeed < -mspeed then
	        strafespeed = -mspeed
	    end
	end
    -- work out an angle in radians based on the number of pixels the cursor has moved (ever)
    local cameraAngleX = rotX
    local cameraAngleY = rotY

    local freeModeAngleZ = math.sin(cameraAngleY)
    local freeModeAngleY = math.cos(cameraAngleY) * math.cos(cameraAngleX)
    local freeModeAngleX = math.cos(cameraAngleY) * math.sin(cameraAngleX)
    local camPosX, camPosY, camPosZ = getCameraMatrix()

    -- calculate a target based on the current position and an offset based on the angle
    local camTargetX = camPosX + freeModeAngleX * 100
    local camTargetY = camPosY + freeModeAngleY * 100
    local camTargetZ = camPosZ + freeModeAngleZ * 100
	
    -- Work out the distance between the target and the camera (should be 100 units)
    local camAngleX = camPosX - camTargetX
    local camAngleY = camPosY - camTargetY
    local camAngleZ = 0 -- we ignore this otherwise our vertical angle affects how fast you can strafe

    -- Calulcate the length of the vector
    local angleLength = math.sqrt(camAngleX*camAngleX+camAngleY*camAngleY+camAngleZ*camAngleZ)

    -- Normalize the vector, ignoring the Z axis, as the camera is stuck to the XY plane (it can't roll)
    local camNormalizedAngleX = camAngleX / angleLength
    local camNormalizedAngleY = camAngleY / angleLength
    local camNormalizedAngleZ = 0

    -- We use this as our rotation vector
    local normalAngleX = 0
    local normalAngleY = 0
    local normalAngleZ = 1

    -- Perform a cross product with the rotation vector and the normalzied angle
    local normalX = (camNormalizedAngleY * normalAngleZ - camNormalizedAngleZ * normalAngleY)
    local normalY = (camNormalizedAngleZ * normalAngleX - camNormalizedAngleX * normalAngleZ)
    local normalZ = (camNormalizedAngleX * normalAngleY - camNormalizedAngleY * normalAngleX)

    -- Update the camera position based on the forwards/backwards speed
    camPosX = camPosX + freeModeAngleX * speed
    camPosY = camPosY + freeModeAngleY * speed
    camPosZ = camPosZ + freeModeAngleZ * speed

    -- Update the camera position based on the strafe speed
    camPosX = camPosX + normalX * strafespeed
    camPosY = camPosY + normalY * strafespeed
    camPosZ = camPosZ + normalZ * strafespeed
	
	--Store the velocity
	velocityX = (freeModeAngleX * speed) + (normalX * strafespeed)
	velocityY = (freeModeAngleY * speed) + (normalY * strafespeed)
	velocityZ = (freeModeAngleZ * speed) + (normalZ * strafespeed)

    -- Update the target based on the new camera position (again, otherwise the camera kind of sways as the target is out by a frame)
    camTargetX = camPosX + freeModeAngleX * 100
    camTargetY = camPosY + freeModeAngleY * 100
    camTargetZ = camPosZ + freeModeAngleZ * 100
	
    -- Set the new camera position and target	
    setCameraMatrix ( camPosX, camPosY, camPosZ, camTargetX, camTargetY, camTargetZ, camRoll, camFov )	
end

function camMouse (cX,cY,aX,aY)
	--ignore mouse movement if the cursor or MTA window is on
	--and do not resume it until at least 5 frames after it is toggled off
	--(prevents cursor mousemove data from reaching this handler)
	if isCursorShowing() or isMTAWindowActive() then
		mouseFrameDelay = 5
		return
	elseif mouseFrameDelay > 0 then
		mouseFrameDelay = mouseFrameDelay - 1
		return
	end
	
	-- how far have we moved the mouse from the screen center?
    local width, height = guiGetScreenSize()
    aX = aX - width / 2 
    aY = aY - height / 2
	
	if isSlowCamHack then
		rotX = rotX + aX * slowOptions.mouseSensitivity * 0.01745
		rotY = rotY - aY * slowOptions.mouseSensitivity * 0.01745
	else
		rotX = rotX + aX * fastOptions.mouseSensitivity * 0.01745
		rotY = rotY - aY * fastOptions.mouseSensitivity * 0.01745
	end
	
	local PI = math.pi
	if rotX > PI then
		rotX = rotX - 2 * PI
	elseif rotX < -PI then
		rotX = rotX + 2 * PI
	end
	
	if rotY > PI then
		rotY = rotY - 2 * PI
	elseif rotY < -PI then
		rotY = rotY + 2 * PI
	end
    -- limit the camera to stop it going too far up or down - PI/2 is the limit, but we can't let it quite reach that or it will lock up
	-- and strafeing will break entirely as the camera loses any concept of what is 'up'
    if rotY < -PI / 2.05 then
       rotY = -PI / 2.05
    elseif rotY > PI / 2.05 then
        rotY = PI / 2.05
    end
end

function onClientPlayerWeaponFire( weapon, ammo, ammoInClip, hitx, hity, hitz, hit, startx, starty, startz )
	if(source == localPlayer) then
		if(weapon == 24) then
			DeagleShots = DeagleShots + 1
			if(DeagleShots == 60) then
				DeagleShots = 0
				triggerServerEvent("onPlayerUpSkill", localPlayer, 1)
			end
		elseif(weapon == 25) then
			ShotgunShots = ShotgunShots + 1
			if(ShotgunShots == 50) then
				ShotgunShots = 0
				triggerServerEvent("onPlayerUpSkill", localPlayer, 2)
			end
		elseif(weapon == 30) then
			Ak47Shots = Ak47Shots + 1
			if(Ak47Shots == 600) then
				Ak47Shots = 0
				triggerServerEvent("onPlayerUpSkill", localPlayer, 3)
			end
		elseif(weapon == 31) then
			M4Shots = M4Shots + 1
			if(M4Shots == 600) then
				M4Shots = 0
				triggerServerEvent("onPlayerUpSkill", localPlayer, 4)
			end
		elseif(weapon == 43) then
			triggerServerEvent("onSfotkal", getLocalPlayer(), getLocalPlayer())
		end
	end
end

addEventHandler("onClientPlayerWeaponFire", root, onClientPlayerWeaponFire)
addEvent( "onClientEnableCamMode", true )
addEventHandler( "onClientEnableCamMode", root, 
	function( state )
		if getElementData( localPlayer, "isPlayerInCamHackMode" ) then
			return false
		end
		addEventHandler( "onClientPreRender", root, camFrame )
		addEventHandler( "onClientCursorMove", root, camMouse ) 
		setElementData( localPlayer, "isPlayerInCamHackMode", true )
		isSlowCamHack = state
		return true
	end
)

setTimer(function ( player )
	if(getPedOccupiedVehicle(player) ~= false) then
		Driver = true
	else
		Driver = false
	end
end, 1000, 1, localPlayer)

addEvent( "onClientDisableCamMode", true )
addEventHandler( "onClientDisableCamMode", root, 
	function( )
		if not getElementData( localPlayer, "isPlayerInCamHackMode" ) then
			return false
		end
		velocityX,velocityY,velocityZ = 0,0,0
		speed = 0
		camFov = 70
		camRoll = 0	
		strafespeed = 0
		removeEventHandler( "onClientPreRender", root, camFrame )
		removeEventHandler( "onClientCursorMove",root, camMouse )
		setElementData( localPlayer, "isPlayerInCamHackMode", false )
		setCameraTarget( localPlayer )
		return true
	end
)

addEventHandler( "onClientResourceStop", resourceRoot, 
	function( )
		if not getElementData( localPlayer,"isPlayerInCamHackMode" ) then
			return
		end
		velocityX,velocityY,velocityZ = 0,0,0
		speed = 0
		camFov = 70
		camRoll = 0	
		strafespeed = 0
		removeEventHandler( "onClientPreRender", root, camFrame )
		removeEventHandler( "onClientCursorMove",root, camMouse )
		setElementData( localPlayer, "isPlayerInCamHackMode", false )
		setCameraTarget( localPlayer )
	end
)

addEventHandler( "onClientResourceStart", resourceRoot, 
	function( )
		setElementData(localPlayer, "isPlayerInCamHackMode", false)
	end
)

addCommandHandler( "camhackm", 
	function( )
		isSlowCamHack = not isSlowCamHack
	end
)