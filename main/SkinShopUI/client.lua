local Gruz 				= false
local GruzGUI 			= false
local LoaderFull 		= false
local Courier 			= false
local CourierGUI 		= false
local GUI 				= 0
local PassCreated 		= false
local CourierStage 		= 0
local GUITable 			= {}
local GUIID 			= 0
local GUIType 			= 0
local PT 				= {}
local alg 				= false
local shrift 			= dxCreateFont("SFUIText-Regular.ttf", 14, false, "proof")
local shr 				= dxCreateFont("SFUIText-Heavy.ttf", 14, false, "proof")
local PricedownMod 		= dxCreateFont("pricedownbl.ttf", 96, false, "proof")
local AvertaReg			= dxCreateFont("MenuUI/Fonts/AvertaCyrillicRegular.otf", 14, true, "proof")
local AvertaRegSmall	= dxCreateFont("MenuUI/Fonts/AvertaCyrillicRegular.otf", 10, true, "proof")
local AvertaRegSmallest	= dxCreateFont("MenuUI/Fonts/AvertaCyrillicRegular.otf", 8, true, "proof")
local AvertaRegBig		= dxCreateFont("MenuUI/Fonts/AvertaCyrillicRegular.otf", 24, true, "proof")
local AvertaLight		= dxCreateFont("MenuUI/Fonts/AvertaCyrillicLightItalic.otf", 12)
local AvertaLightSmall	= dxCreateFont("MenuUI/Fonts/AvertaCyrillicLightItalic.otf", 10)
local AvertaLightBold	= dxCreateFont("MenuUI/Fonts/AvertaCyrillicLightItalic.otf", 24)
local AvertaBold		= dxCreateFont("MenuUI/Fonts/AvertaCyrillicSemiBold.otf", 42, false, "proof")
local AvertaBoldBig		= dxCreateFont("MenuUI/Fonts/AvertaCyrillicSemiBold.otf", 24, false, "proof")
local AvertaBoldSmall	= dxCreateFont("MenuUI/Fonts/AvertaCyrillicSemiBold.otf", 14, false, "proof")
local AvertaBoldSmallest= dxCreateFont("MenuUI/Fonts/AvertaCyrillicSemiBold.otf", 10, false, "proof")
local UniSans			= dxCreateFont("SkinShopUI/Fonts/8519.otf", 42, false, "proof")
local BebasNeue			= dxCreateFont("CarBuyUI/Fonts/bebas-neue-bold.ttf", 24, false, "proof")
local BebasNeueSmall	= dxCreateFont("CarBuyUI/Fonts/bebas-neue-bold.ttf", 18, false, "proof")
local EXP 				= 0
local LVL 				= 0
local Food 				= 0
local ChatTable 		= {}
local LoginPass 		= ""
local act 				= false
local alo 				= ""
local listitem 			= 0
local LoginCD 			= false
local errorpassword 	= 0
local TableZZ 			= {}
local Please 			= {}
local text3d 			= {}
local pogr 				= 0
local lastpogr 			= 0
local prg 				= {}
local notif 			= {}
local text3drange 		= {}
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
local rad = 0
local FishUI 			= {}
local SkinShopUI		= {}
local SkinShop 			= false
local SkinsCache		= {}
local CarBuyUI			= {}
local CarBuy 			= false
local CarCache			= {}
local MenuToggle 		= {}
local repString 		= ""
local repShift 			= false
local NameToggle		= true
local HudAlpha			= 10
local SkillBuy			= 0
local PHD 				= true
local PCD 				= true
local SCV 				= true
local checkout 			= 0
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

local FishTimerEsc = 0
local waitingFish = false
local FishLimit = 0
local NapomTimer = 0
local IDV = 0
Thread={ }
local threads={ }
local THREAD_INTERVAL=5000
local __DEBUG=true 

function Thread:new( ... )
	local o=setmetatable( { }, { __index=self } )
	if o.constuctor then
		o:constuctor( ... )
	end
	return o
end

-- szName - thread name 
-- uFunc - callback
-- iAmounts - how many times to call
function Thread:constuctor( szName, uFunc, iAmounts )
	assert( threads[szName]==nil )

	self.name=szName
	self.func=uFunc
	self.amounts=iAmounts or 1

	threads[szName]=self

	if __DEBUG then
	end
end

function Thread:start( ms )
	self.thread=coroutine.create( self.func )
	self.yields=0
	self.tick=getTickCount( )

	self:resume( )

	self.timer=setTimer( function( )
		if self:status( )=="suspended" then
			if getTickCount( )-self.tick>THREAD_INTERVAL then
				self.tick=getTickCount( )

				if __DEBUG then
				end
			end
			for i=1, self.amounts, 1 do
				self.yields=self.yields+1
				self:resume( )
			end
		end
		if self:status( )=="dead" then
			if self.timer then 
				killTimer( self.timer )
			end
			self:stop( )
		end
	end, ms, 0 )
end

function Thread:resume( )
	coroutine.resume( self.thread )
end

function Thread:status( )
	if self.thread then
		return coroutine.status( self.thread )
	end
end

function Thread:stop( )
	self.thread=nil
end

local objtable = 
{
	[0] = {["ID"]=10154, ["x"]=405.25317, ["y"]=1197.2758, ["z"]=31.03549, ["rx"]=0, ["ry"]=0, ["rz"]=0				,["Resp"]=false},
	[1] = {["ID"]=10165, ["x"]=405.23169, ["y"]=1064.6351, ["z"]=31.022636, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[2] = {["ID"]=10166, ["x"]=583.60913, ["y"]=682.01379, ["z"]=67.089485, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[3] = {["ID"]=10173, ["x"]=554.04089, ["y"]=986.21399, ["z"]=68.055664, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[4] = {["ID"]=10174, ["x"]=547.61353, ["y"]=193.51672, ["z"]=58.135971, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[5] = {["ID"]=10175, ["x"]=561.08032, ["y"]=361.20569, ["z"]=67.83831, ["rx"]=0, ["ry"]=0, ["rz"]=0				,["Resp"]=false},
	[6] = {["ID"]=10176, ["x"]=300.03608, ["y"]=756.27673, ["z"]=65.680389, ["rx"]=0, ["ry"]=0, ["rz"]=109.61		,["Resp"]=false},
	[7] = {["ID"]=10177, ["x"]=-681.67017, ["y"]=27.187622, ["z"]=14.531215, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[8] = {["ID"]=10178, ["x"]=-607.84204, ["y"]=26.033081, ["z"]=16.37096, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[9] = {["ID"]=10179, ["x"]=-534.1239, ["y"]=27.093872, ["z"]=16.316391, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[10] = {["ID"]=10180, ["x"]=-436.03857, ["y"]=32.648071, ["z"]=16.316391, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[11] = {["ID"]=10181, ["x"]=-322.09216, ["y"]=42.744995, ["z"]=16.316391, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[12] = {["ID"]=10182, ["x"]=-241.04797, ["y"]=52.894409, ["z"]=16.316395, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[13] = {["ID"]=10183, ["x"]=-176.46277, ["y"]=63.125244, ["z"]=16.439388, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[14] = {["ID"]=10184, ["x"]=-104.20947, ["y"]=77.047974, ["z"]=15.009189, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[15] = {["ID"]=10185, ["x"]=-112.93457, ["y"]=-1227.6132, ["z"]=55.639278, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[16] = {["ID"]=10186, ["x"]=-99.847656, ["y"]=-1223.3824, ["z"]=55.835598, ["rx"]=0, ["ry"]=0.01, ["rz"]=0		,["Resp"]=false},
	[17] = {["ID"]=10187, ["x"]=-130.4491, ["y"]=-1456.1763, ["z"]=56.622959, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[18] = {["ID"]=10188, ["x"]=-132.97192, ["y"]=-1457.2755, ["z"]=62.656223, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[19] = {["ID"]=10189, ["x"]=69.061523, ["y"]=-1531.4579, ["z"]=57.001827, ["rx"]=0, ["ry"]=0, ["rz"]=-9.99		,["Resp"]=false},
	[20] = {["ID"]=10193, ["x"]=170.9668, ["y"]=-893.46423, ["z"]=90.915092, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[21] = {["ID"]=10194, ["x"]=204.75342, ["y"]=-832.7124, ["z"]=61.157532, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[22] = {["ID"]=10195, ["x"]=228.72095, ["y"]=-781.08667, ["z"]=73.304298, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[23] = {["ID"]=10196, ["x"]=-132.86499, ["y"]=-1045.7732, ["z"]=63.92004, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[24] = {["ID"]=10197, ["x"]=-225.47534, ["y"]=-1086.192, ["z"]=59.014767, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[25] = {["ID"]=10226, ["x"]=72.679688, ["y"]=-793.35999, ["z"]=48.511642, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[26] = {["ID"]=10227, ["x"]=-130.76416, ["y"]=-1155.8219, ["z"]=71.848618, ["rx"]=0, ["ry"]=0, ["rz"]=-75.39	,["Resp"]=false},
	[27] = {["ID"]=10228, ["x"]=-528.79126, ["y"]=793.15149, ["z"]=114.30983, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[28] = {["ID"]=10229, ["x"]=-493.13306, ["y"]=783.92932, ["z"]=201.84435, ["rx"]=90, ["ry"]=0, ["rz"]=-90		,["Resp"]=false},
	[29] = {["ID"]=10230, ["x"]=-528.45508, ["y"]=793.54602, ["z"]=189.46796, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[30] = {["ID"]=10231, ["x"]=-355.77832, ["y"]=1237.9513, ["z"]=210.26559, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[31] = {["ID"]=10233, ["x"]=-552.96045, ["y"]=1163.9401, ["z"]=196.90869, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[32] = {["ID"]=10234, ["x"]=-519.01074, ["y"]=952.1676, ["z"]=203.64693, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[33] = {["ID"]=10235, ["x"]=-552.84961, ["y"]=1178.6253, ["z"]=152.35751, ["rx"]=0, ["ry"]=0, ["rz"]=-29.99		,["Resp"]=false},
	[34] = {["ID"]=10236, ["x"]=-519.80884, ["y"]=952.72449, ["z"]=175.019, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[35] = {["ID"]=10242, ["x"]=-808.68671, ["y"]=174.1781, ["z"]=48.16082, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[36] = {["ID"]=10244, ["x"]=-865.87579, ["y"]=-36.581909, ["z"]=43.191864, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[37] = {["ID"]=10245, ["x"]=-1685.53, ["y"]=-923.043, ["z"]=93.7048, ["rx"]=0, ["ry"]=0, ["rz"]=0				,["Resp"]=false},
	[38] = {["ID"]=10246, ["x"]=-986.30334, ["y"]=-1153.9487, ["z"]=25.205937, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[39] = {["ID"]=10247, ["x"]=-1435.8114, ["y"]=-851.38623, ["z"]=41.66935, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[40] = {["ID"]=10248, ["x"]=-854.98853, ["y"]=-986.15796, ["z"]=19.374205, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[41] = {["ID"]=10249, ["x"]=-628.71588, ["y"]=694.53527, ["z"]=30.845093, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[42] = {["ID"]=10250, ["x"]=-967.27881, ["y"]=839.13049, ["z"]=63.486835, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[43] = {["ID"]=10252, ["x"]=-532.04443, ["y"]=794.70764, ["z"]=114.30834, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[44] = {["ID"]=10255, ["x"]=-574.49786, ["y"]=793.31116, ["z"]=201.84439, ["rx"]=90, ["ry"]=0, ["rz"]=-90		,["Resp"]=false},
	[45] = {["ID"]=10260, ["x"]=-995.31677, ["y"]=578.67896, ["z"]=80.905579, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[46] = {["ID"]=10261, ["x"]=-522.6615, ["y"]=952.7467, ["z"]=175.019, ["rx"]=0, ["ry"]=0, ["rz"]=0				,["Resp"]=false},
	[47] = {["ID"]=10262, ["x"]=-448.34924, ["y"]=1284.3059, ["z"]=49.057617, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[48] = {["ID"]=10263, ["x"]=-842.74414, ["y"]=1076.0775, ["z"]=55.366425, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[49] = {["ID"]=10265, ["x"]=-674.44714, ["y"]=1165.8221, ["z"]=46.443886, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[50] = {["ID"]=10266, ["x"]=-555.2868, ["y"]=1195.1327, ["z"]=158.45349, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[51] = {["ID"]=10267, ["x"]=-367.43298, ["y"]=1239.3932, ["z"]=226.88867, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[52] = {["ID"]=10270, ["x"]=-505.34729, ["y"]=955.47791, ["z"]=164.56117, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[53] = {["ID"]=10271, ["x"]=-1233.8513, ["y"]=-364.97858, ["z"]=19.212532, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[54] = {["ID"]=10274, ["x"]=-840.05286, ["y"]=-776.26172, ["z"]=27.817425, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[55] = {["ID"]=10275, ["x"]=-937.08735, ["y"]=-399.19958, ["z"]=78.071602, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[56] = {["ID"]=10276, ["x"]=-850.17224, ["y"]=-866.67908, ["z"]=19.841253, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[57] = {["ID"]=10300, ["x"]=-936.98735, ["y"]=-399.1615, ["z"]=78.071602, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[58] = {["ID"]=10301, ["x"]=-865.57208, ["y"]=-776.15051, ["z"]=43.574009, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[59] = {["ID"]=10305, ["x"]=-906.95166, ["y"]=-613.11414, ["z"]=14.434549, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[60] = {["ID"]=10306, ["x"]=-896.93518, ["y"]=-1033.4447, ["z"]=28.677565, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[61] = {["ID"]=10309, ["x"]=-850.17224, ["y"]=-866.65363, ["z"]=19.841253, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[62] = {["ID"]=10350, ["x"]=-840.05286, ["y"]=-776.23315, ["z"]=27.817425, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[63] = {["ID"]=10352, ["x"]=-501.39175, ["y"]=997.04456, ["z"]=190.13583, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[64] = {["ID"]=10353, ["x"]=-554.10547, ["y"]=1177.2205, ["z"]=196.90869, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[65] = {["ID"]=10354, ["x"]=-437.81366, ["y"]=1139.0718, ["z"]=206.75819, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[66] = {["ID"]=10355, ["x"]=-448.34924, ["y"]=1284.3408, ["z"]=49.057617, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[67] = {["ID"]=10356, ["x"]=-520.08281, ["y"]=952.9006, ["z"]=175.019, ["rx"]=0, ["ry"]=0, ["rz"]=0				,["Resp"]=false},
	[68] = {["ID"]=10357, ["x"]=-552.74955, ["y"]=1178.6141, ["z"]=152.35751, ["rx"]=0, ["ry"]=0, ["rz"]=-29.99		,["Resp"]=false},
	[69] = {["ID"]=10358, ["x"]=-367.43298, ["y"]=1239.4471, ["z"]=226.88867, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[70] = {["ID"]=10359, ["x"]=-355.77829, ["y"]=1237.5671, ["z"]=210.26559, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[71] = {["ID"]=10360, ["x"]=-529.3916, ["y"]=793.61151, ["z"]=114.30834, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[72] = {["ID"]=10362, ["x"]=-574.49786, ["y"]=793.34601, ["z"]=201.84439, ["rx"]=90, ["ry"]=0, ["rz"]=-90		,["Resp"]=false},
	[73] = {["ID"]=10363, ["x"]=-528.45502, ["y"]=793.61914, ["z"]=189.46796, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[74] = {["ID"]=10364, ["x"]=-493.13306, ["y"]=784.00244, ["z"]=201.84435, ["rx"]=90, ["ry"]=0, ["rz"]=-90		,["Resp"]=false},
	[75] = {["ID"]=10365, ["x"]=-854.98846, ["y"]=-986.13574, ["z"]=19.374205, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[76] = {["ID"]=10366, ["x"]=38.342453, ["y"]=-1057.995, ["z"]=15.013461, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[77] = {["ID"]=10367, ["x"]=58.397934, ["y"]=-1075.182, ["z"]=15.013461, ["rx"]=0, ["ry"]=0, ["rz"]=-90			,["Resp"]=false},
	[78] = {["ID"]=10368, ["x"]=37.833466, ["y"]=-1073.7537, ["z"]=12.624837, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[79] = {["ID"]=10369, ["x"]=179.09604, ["y"]=-1006.8738, ["z"]=20.492859, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[80] = {["ID"]=10370, ["x"]=52.589035, ["y"]=-1151.0044, ["z"]=14.598751, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[81] = {["ID"]=10371, ["x"]=119.38559, ["y"]=-934.12073, ["z"]=12.938326, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[82] = {["ID"]=10372, ["x"]=-128.29275, ["y"]=-1160.7443, ["z"]=65.680405, ["rx"]=0, ["ry"]=0, ["rz"]=-75.39	,["Resp"]=false},
	[83] = {["ID"]=10373, ["x"]=211.95911, ["y"]=-835.1228, ["z"]=59.581459, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[84] = {["ID"]=10374, ["x"]=-218.40564, ["y"]=-1087.4808, ["z"]=54.072807, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[85] = {["ID"]=10375, ["x"]=83.885826, ["y"]=-797.93805, ["z"]=54.00771, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[86] = {["ID"]=10376, ["x"]=179.39458, ["y"]=-896.50745, ["z"]=75.21666, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[87] = {["ID"]=10377, ["x"]=237.59888, ["y"]=-786.25116, ["z"]=79.174667, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[88] = {["ID"]=10378, ["x"]=-220.50983, ["y"]=-1085.8324, ["z"]=59.014767, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[89] = {["ID"]=10379, ["x"]=72.679657, ["y"]=-793.33466, ["z"]=48.511642, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[90] = {["ID"]=10380, ["x"]=-134.87711, ["y"]=-1156.2214, ["z"]=55.81469, ["rx"]=0, ["ry"]=0, ["rz"]=-75.39		,["Resp"]=false},
	[91] = {["ID"]=10381, ["x"]=-132.86496, ["y"]=-1046.8219, ["z"]=61.448738, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[92] = {["ID"]=10382, ["x"]=-123.25998, ["y"]=-1049.2778, ["z"]=54.070835, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[93] = {["ID"]=10383, ["x"]=-125.18388, ["y"]=-1384.3611, ["z"]=17.586777, ["rx"]=0, ["ry"]=0.01, ["rz"]=180	,["Resp"]=false},
	[94] = {["ID"]=10384, ["x"]=113.10477, ["y"]=-1322.9796, ["z"]=8.5723486, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[95] = {["ID"]=10385, ["x"]=-5.4611511, ["y"]=-1265.1912, ["z"]=17.801966, ["rx"]=0, ["ry"]=0.01, ["rz"]=0		,["Resp"]=false},
	[96] = {["ID"]=10386, ["x"]=50.138123, ["y"]=-1258.8658, ["z"]=16.192245, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[97] = {["ID"]=10387, ["x"]=29.839993, ["y"]=-1453.8018, ["z"]=20.306267, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[98] = {["ID"]=10388, ["x"]=14.209656, ["y"]=-1526.571, ["z"]=36.604076, ["rx"]=0, ["ry"]=0, ["rz"]=-4.14		,["Resp"]=false},
	[99] = {["ID"]=10389, ["x"]=71.848669, ["y"]=-1531.9607, ["z"]=57.001827, ["rx"]=0, ["ry"]=0, ["rz"]=-9.99		,["Resp"]=false},
	[100] = {["ID"]=10390, ["x"]=-122.8035, ["y"]=-1451.4099, ["z"]=56.623032, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[101] = {["ID"]=10391, ["x"]=-118.8746, ["y"]=-1228.6979, ["z"]=52.754162, ["rx"]=0, ["ry"]=0.01, ["rz"]=0		,["Resp"]=false},
	[102] = {["ID"]=10392, ["x"]=124.06955, ["y"]=-1285.7797, ["z"]=24.386261, ["rx"]=0, ["ry"]=0.01, ["rz"]=0		,["Resp"]=false},
	[103] = {["ID"]=10393, ["x"]=-142.55717, ["y"]=-1311.0682, ["z"]=23.629, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[104] = {["ID"]=10394, ["x"]=-222.96771, ["y"]=-1297.3027, ["z"]=23.517759, ["rx"]=0, ["ry"]=0, ["rz"]=0		,["Resp"]=false},
	[105] = {["ID"]=10395, ["x"]=-99.878983, ["y"]=-1227.4554, ["z"]=59.337299, ["rx"]=0, ["ry"]=0, ["rz"]=0		,["Resp"]=false},
	[106] = {["ID"]=10396, ["x"]=-126.45591, ["y"]=-1453.1958, ["z"]=60.708969, ["rx"]=0, ["ry"]=0, ["rz"]=0		,["Resp"]=false},
	[107] = {["ID"]=10398, ["x"]=231.94819, ["y"]=-1278.8391, ["z"]=26.889872, ["rx"]=0, ["ry"]=0, ["rz"]=-12.5		,["Resp"]=false},
	[108] = {["ID"]=10399, ["x"]=216.37629, ["y"]=-1363.6788, ["z"]=21.13644, ["rx"]=0, ["ry"]=0, ["rz"]=-13.58		,["Resp"]=false},
	[109] = {["ID"]=10400, ["x"]=189.97028, ["y"]=-1454.0457, ["z"]=20.080809, ["rx"]=0, ["ry"]=0, ["rz"]=-12.5		,["Resp"]=false},
	[110] = {["ID"]=10401, ["x"]=147.3703, ["y"]=-1538.2843, ["z"]=17.939941, ["rx"]=0, ["ry"]=0, ["rz"]=-29		,["Resp"]=false},
	[111] = {["ID"]=10402, ["x"]=280.5784, ["y"]=-962.28638, ["z"]=25.69644, ["rx"]=0, ["ry"]=0, ["rz"]=-28			,["Resp"]=false},
	[112] = {["ID"]=10403, ["x"]=238.71411, ["y"]=-1249.7898, ["z"]=27.293438, ["rx"]=0, ["ry"]=0, ["rz"]=-28		,["Resp"]=false},
	[113] = {["ID"]=10404, ["x"]=219.30591, ["y"]=-1350.2113, ["z"]=24.853107, ["rx"]=0, ["ry"]=0, ["rz"]=-28		,["Resp"]=false},
	[114] = {["ID"]=10405, ["x"]=172.02377, ["y"]=-1466.7129, ["z"]=19.638186, ["rx"]=0, ["ry"]=0, ["rz"]=-28		,["Resp"]=false},
	[115] = {["ID"]=10406, ["x"]=261.01224, ["y"]=-1099.8922, ["z"]=24.38706, ["rx"]=0, ["ry"]=0, ["rz"]=-28		,["Resp"]=false},
	[116] = {["ID"]=10408, ["x"]=131.32158, ["y"]=-1462.0724, ["z"]=12.839311, ["rx"]=0, ["ry"]=0, ["rz"]=-23.99	,["Resp"]=false},
	[117] = {["ID"]=10409, ["x"]=339.42078, ["y"]=-842.76154, ["z"]=20.342464, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[118] = {["ID"]=10410, ["x"]=354.88193, ["y"]=-805.90985, ["z"]=17.956833, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[119] = {["ID"]=10411, ["x"]=321.14047, ["y"]=-881.37061, ["z"]=24.223444, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[120] = {["ID"]=10413, ["x"]=374.01059, ["y"]=-764.41193, ["z"]=25.696438, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[121] = {["ID"]=10416, ["x"]=484.46072, ["y"]=-436.04636, ["z"]=14.719481, ["rx"]=90.01, ["ry"]=0, ["rz"]=86.01	,["Resp"]=false},
	[122] = {["ID"]=10417, ["x"]=477.061, ["y"]=-68.449448, ["z"]=14.091343, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[123] = {["ID"]=10418, ["x"]=541.698, ["y"]=-272.91559, ["z"]=104.37533, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[124] = {["ID"]=10419, ["x"]=447.0369, ["y"]=-591.586, ["z"]=31.746426, ["rx"]=0, ["ry"]=0, ["rz"]=-8.83		,["Resp"]=false},
	[125] = {["ID"]=10420, ["x"]=338.86972, ["y"]=-842.61682, ["z"]=23.425945, ["rx"]=0, ["ry"]=0, ["rz"]=-8.83		,["Resp"]=false},
	[126] = {["ID"]=10421, ["x"]=559.19714, ["y"]=-4.8292542, ["z"]=85.834122, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[127] = {["ID"]=10422, ["x"]=-104.20947, ["y"]=77.098816, ["z"]=15.009189, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[128] = {["ID"]=10423, ["x"]=-176.46278, ["y"]=63.176025, ["z"]=16.439388, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[129] = {["ID"]=10424, ["x"]=-241.04793, ["y"]=52.945129, ["z"]=16.316395, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[130] = {["ID"]=10425, ["x"]=-322.09216, ["y"]=42.795837, ["z"]=16.316391, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[131] = {["ID"]=10426, ["x"]=-436.03851, ["y"]=32.698898, ["z"]=16.316391, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[132] = {["ID"]=10427, ["x"]=-534.1239, ["y"]=27.144638, ["z"]=16.316391, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[133] = {["ID"]=10428, ["x"]=-607.84198, ["y"]=26.083862, ["z"]=16.37096, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[134] = {["ID"]=10429, ["x"]=-681.67023, ["y"]=27.238419, ["z"]=14.531215, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[135] = {["ID"]=10430, ["x"]=-715.95966, ["y"]=-489.69489, ["z"]=17.802372, ["rx"]=0, ["ry"]=0, ["rz"]=0		,["Resp"]=false},
	[136] = {["ID"]=10431, ["x"]=285.34747, ["y"]=290.14917, ["z"]=20.877996, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[137] = {["ID"]=10432, ["x"]=540.13483, ["y"]=92.644196, ["z"]=32.135494, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[138] = {["ID"]=10433, ["x"]=575.36719, ["y"]=539.92944, ["z"]=21.586802, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[139] = {["ID"]=10434, ["x"]=324.94995, ["y"]=439.13635, ["z"]=18.204462, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[140] = {["ID"]=10435, ["x"]=499.88297, ["y"]=374.81641, ["z"]=13.713308, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[141] = {["ID"]=10436, ["x"]=300.23618, ["y"]=756.34973, ["z"]=60.516171, ["rx"]=0, ["ry"]=0, ["rz"]=109.61		,["Resp"]=false},
	[142] = {["ID"]=10437, ["x"]=289.18036, ["y"]=707.20044, ["z"]=13.764525, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[143] = {["ID"]=10438, ["x"]=488.37915, ["y"]=708.69226, ["z"]=23.443113, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[144] = {["ID"]=10439, ["x"]=561.08038, ["y"]=362.78204, ["z"]=66.265434, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[145] = {["ID"]=10440, ["x"]=547.71346, ["y"]=193.57391, ["z"]=58.135971, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[146] = {["ID"]=10441, ["x"]=340.47867, ["y"]=1301.6696, ["z"]=28.428963, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[147] = {["ID"]=10442, ["x"]=281.60049, ["y"]=1026.1628, ["z"]=34.33284, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[148] = {["ID"]=10443, ["x"]=564.29016, ["y"]=990.40045, ["z"]=68.055664, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[149] = {["ID"]=10444, ["x"]=585.88245, ["y"]=682.72284, ["z"]=67.089485, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[150] = {["ID"]=10445, ["x"]=529.45636, ["y"]=1167.0043, ["z"]=24.719643, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[151] = {["ID"]=10446, ["x"]=447.0108, ["y"]=774.17926, ["z"]=15.913931, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[152] = {["ID"]=10447, ["x"]=532.66718, ["y"]=1274.9451, ["z"]=31.400534, ["rx"]=0, ["ry"]=0, ["rz"]=90			,["Resp"]=false},
	[153] = {["ID"]=10448, ["x"]=209.69142, ["y"]=1233.6129, ["z"]=31.14592, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[154] = {["ID"]=10449, ["x"]=414.78543, ["y"]=1064.9396, ["z"]=30.70503, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[155] = {["ID"]=10450, ["x"]=414.28183, ["y"]=1197.3615, ["z"]=30.759724, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[156] = {["ID"]=10451, ["x"]=608.51786, ["y"]=860.39716, ["z"]=59.972218, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[157] = {["ID"]=10452, ["x"]=251.65953, ["y"]=-367.75961, ["z"]=21.376514, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[158] = {["ID"]=10455, ["x"]=48.193726, ["y"]=-548.69702, ["z"]=47.400074, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[159] = {["ID"]=10456, ["x"]=134.9998, ["y"]=-588.39557, ["z"]=54.196465, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[160] = {["ID"]=10457, ["x"]=112.45844, ["y"]=-517.23358, ["z"]=50.789158, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[161] = {["ID"]=10458, ["x"]=36.707855, ["y"]=-548.836, ["z"]=54.196465, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[162] = {["ID"]=10459, ["x"]=93.404617, ["y"]=-512.05298, ["z"]=54.196465, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[163] = {["ID"]=10460, ["x"]=115.83654, ["y"]=-583.24017, ["z"]=54.196465, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[164] = {["ID"]=10461, ["x"]=-986.30334, ["y"]=-1153.9265, ["z"]=25.205937, ["rx"]=0, ["ry"]=0, ["rz"]=0		,["Resp"]=false},
	[165] = {["ID"]=10463, ["x"]=-887.012, ["y"]=-258.614, ["z"]=23.7524, ["rx"]=0, ["ry"]=1.81, ["rz"]=-1.99		,["Resp"]=false},
	[166] = {["ID"]=10464, ["x"]=-865.87579, ["y"]=-36.534241, ["z"]=43.191864, ["rx"]=0, ["ry"]=0, ["rz"]=0		,["Resp"]=false},
	[167] = {["ID"]=10465, ["x"]=-837.54749, ["y"]=-55.771301, ["z"]=43.244934, ["rx"]=0, ["ry"]=0, ["rz"]=0		,["Resp"]=false},
	[168] = {["ID"]=10466, ["x"]=-782.96863, ["y"]=366.08252, ["z"]=107.16393, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[169] = {["ID"]=10467, ["x"]=-760.25781, ["y"]=169.90775, ["z"]=48.139095, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[170] = {["ID"]=10468, ["x"]=-808.68671, ["y"]=174.23196, ["z"]=48.16082, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[171] = {["ID"]=10469, ["x"]=-760.25781, ["y"]=169.85388, ["z"]=48.139095, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[172] = {["ID"]=10470, ["x"]=-782.96863, ["y"]=366.02209, ["z"]=107.16393, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[173] = {["ID"]=10471, ["x"]=-837.54749, ["y"]=-55.81897, ["z"]=43.244934, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[174] = {["ID"]=10472, ["x"]=102.5423, ["y"]=-512.08789, ["z"]=57.528229, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[175] = {["ID"]=10473, ["x"]=125.08215, ["y"]=-588.4071, ["z"]=57.528229, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[176] = {["ID"]=10474, ["x"]=36.707886, ["y"]=-548.87097, ["z"]=54.196465, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[177] = {["ID"]=10475, ["x"]=600.23604, ["y"]=860.32092, ["z"]=59.972218, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[178] = {["ID"]=10476, ["x"]=405.25317, ["y"]=1197.2758, ["z"]=31.03549, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[179] = {["ID"]=10477, ["x"]=405.23169, ["y"]=1064.6351, ["z"]=31.022636, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[180] = {["ID"]=10478, ["x"]=583.60913, ["y"]=682.01379, ["z"]=67.089485, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[181] = {["ID"]=10479, ["x"]=554.04089, ["y"]=986.21399, ["z"]=68.055664, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[182] = {["ID"]=10480, ["x"]=547.61353, ["y"]=193.51672, ["z"]=58.135971, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[183] = {["ID"]=10481, ["x"]=561.08032, ["y"]=361.20569, ["z"]=67.83831, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[184] = {["ID"]=10482, ["x"]=300.13621, ["y"]=756.27673, ["z"]=65.680389, ["rx"]=0, ["ry"]=0, ["rz"]=109.61		,["Resp"]=false},
	[185] = {["ID"]=10483, ["x"]=-681.67023, ["y"]=27.187622, ["z"]=14.531215, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[186] = {["ID"]=10484, ["x"]=-607.84198, ["y"]=26.033081, ["z"]=16.37096, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[187] = {["ID"]=10485, ["x"]=-534.1239, ["y"]=27.093872, ["z"]=16.316391, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[188] = {["ID"]=10486, ["x"]=-436.03851, ["y"]=32.648071, ["z"]=16.316391, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[189] = {["ID"]=10487, ["x"]=-322.09216, ["y"]=42.744995, ["z"]=16.316391, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[190] = {["ID"]=10488, ["x"]=-241.04791, ["y"]=52.894409, ["z"]=16.316395, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[191] = {["ID"]=10489, ["x"]=-176.46277, ["y"]=63.125244, ["z"]=16.439388, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[192] = {["ID"]=10490, ["x"]=-104.20947, ["y"]=77.047974, ["z"]=15.009189, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[193] = {["ID"]=10491, ["x"]=-112.93463, ["y"]=-1227.6132, ["z"]=55.639278, ["rx"]=0, ["ry"]=0, ["rz"]=0		,["Resp"]=false},
	[194] = {["ID"]=10492, ["x"]=-99.447687, ["y"]=-1223.2824, ["z"]=55.835598, ["rx"]=0, ["ry"]=0.01, ["rz"]=0		,["Resp"]=false},
	[195] = {["ID"]=10493, ["x"]=-130.5491, ["y"]=-1456.1763, ["z"]=56.622959, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[196] = {["ID"]=10558, ["x"]=-132.97198, ["y"]=-1457.2755, ["z"]=62.656223, ["rx"]=0, ["ry"]=0, ["rz"]=0		,["Resp"]=false},
	[197] = {["ID"]=10559, ["x"]=69.061646, ["y"]=-1531.4579, ["z"]=57.001827, ["rx"]=0, ["ry"]=0, ["rz"]=-9.99		,["Resp"]=false},
	[198] = {["ID"]=10560, ["x"]=170.96686, ["y"]=-893.46423, ["z"]=90.915092, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[199] = {["ID"]=10561, ["x"]=204.75354, ["y"]=-832.7124, ["z"]=61.157532, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[200] = {["ID"]=10562, ["x"]=228.72083, ["y"]=-781.08667, ["z"]=73.304298, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[201] = {["ID"]=10563, ["x"]=-132.86496, ["y"]=-1045.7732, ["z"]=63.92004, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[202] = {["ID"]=10564, ["x"]=-225.47537, ["y"]=-1086.192, ["z"]=59.014767, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[203] = {["ID"]=10565, ["x"]=72.679688, ["y"]=-793.35999, ["z"]=48.511642, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[204] = {["ID"]=10566, ["x"]=-130.76419, ["y"]=-1155.8219, ["z"]=71.848618, ["rx"]=0, ["ry"]=0, ["rz"]=-75.39	,["Resp"]=false},
	[205] = {["ID"]=10567, ["x"]=-528.79126, ["y"]=793.15149, ["z"]=114.30983, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[206] = {["ID"]=10568, ["x"]=-493.13306, ["y"]=783.92932, ["z"]=201.84435, ["rx"]=90, ["ry"]=0, ["rz"]=-90		,["Resp"]=false},
	[207] = {["ID"]=10569, ["x"]=-528.75502, ["y"]=793.74602, ["z"]=189.46796, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[208] = {["ID"]=10570, ["x"]=-355.77829, ["y"]=1237.9513, ["z"]=210.26559, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[209] = {["ID"]=10571, ["x"]=-552.96039, ["y"]=1163.9401, ["z"]=196.90869, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[210] = {["ID"]=10572, ["x"]=-519.0108, ["y"]=952.1676, ["z"]=203.64693, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[211] = {["ID"]=10573, ["x"]=-552.84955, ["y"]=1178.5253, ["z"]=152.35751, ["rx"]=0, ["ry"]=0, ["rz"]=-29.99	,["Resp"]=false},
	[212] = {["ID"]=10574, ["x"]=-519.7089, ["y"]=952.92449, ["z"]=175.019, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[213] = {["ID"]=10575, ["x"]=126.32404, ["y"]=-587.19446, ["z"]=54.196465, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[214] = {["ID"]=10576, ["x"]=103.8902, ["y"]=-516.05042, ["z"]=50.789158, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[215] = {["ID"]=10601, ["x"]=38.259888, ["y"]=-548.87097, ["z"]=47.400074, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[216] = {["ID"]=10606, ["x"]=445.59216, ["y"]=1065.4612, ["z"]=30.705032, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[217] = {["ID"]=10608, ["x"]=435.61832, ["y"]=1197.5453, ["z"]=30.759724, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[218] = {["ID"]=10609, ["x"]=564.29016, ["y"]=990.97375, ["z"]=72.361511, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[219] = {["ID"]=10610, ["x"]=608.61792, ["y"]=860.35706, ["z"]=59.972214, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[220] = {["ID"]=10611, ["x"]=589.25262, ["y"]=688.69482, ["z"]=67.16188, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[221] = {["ID"]=10612, ["x"]=529.45636, ["y"]=1166.9694, ["z"]=24.719643, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[222] = {["ID"]=10613, ["x"]=532.66718, ["y"]=1274.907, ["z"]=31.400536, ["rx"]=0, ["ry"]=0, ["rz"]=90			,["Resp"]=false},
	[223] = {["ID"]=10614, ["x"]=340.47867, ["y"]=1301.6315, ["z"]=28.428963, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[224] = {["ID"]=10615, ["x"]=209.69141, ["y"]=1233.578, ["z"]=31.14592, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[225] = {["ID"]=10616, ["x"]=547.61346, ["y"]=193.53577, ["z"]=58.135971, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[226] = {["ID"]=10617, ["x"]=561.08038, ["y"]=362.74719, ["z"]=66.265434, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[227] = {["ID"]=10618, ["x"]=325.58554, ["y"]=764.979, ["z"]=65.680397, ["rx"]=0, ["ry"]=0, ["rz"]=109.61		,["Resp"]=false},
	[228] = {["ID"]=10619, ["x"]=559.19714, ["y"]=-4.8673096, ["z"]=85.834122, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[229] = {["ID"]=10621, ["x"]=541.698, ["y"]=-272.95056, ["z"]=104.37533, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[230] = {["ID"]=10622, ["x"]=77.501282, ["y"]=-1532.2644, ["z"]=57.019032, ["rx"]=0, ["ry"]=0, ["rz"]=-9.99		,["Resp"]=false},
	[231] = {["ID"]=10623, ["x"]=-118.7746, ["y"]=-1228.7106, ["z"]=52.754158, ["rx"]=0, ["ry"]=0.01, ["rz"]=0		,["Resp"]=false},
	[232] = {["ID"]=10624, ["x"]=-117.10678, ["y"]=-1446.8563, ["z"]=56.623032, ["rx"]=0, ["ry"]=0, ["rz"]=0		,["Resp"]=false},
	[233] = {["ID"]=10625, ["x"]=-126.4559, ["y"]=-1453.2021, ["z"]=60.708969, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[234] = {["ID"]=10626, ["x"]=-69.819519, ["y"]=-1221.05, ["z"]=64.743683, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[235] = {["ID"]=10627, ["x"]=-126.01318, ["y"]=-1049.2969, ["z"]=54.070835, ["rx"]=0, ["ry"]=0, ["rz"]=0		,["Resp"]=false},
	[236] = {["ID"]=10628, ["x"]=-218.40564, ["y"]=-1085.8365, ["z"]=54.072807, ["rx"]=0, ["ry"]=0, ["rz"]=0		,["Resp"]=false},
	[237] = {["ID"]=10629, ["x"]=237.59888, ["y"]=-786.27649, ["z"]=79.174667, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[238] = {["ID"]=10630, ["x"]=179.39459, ["y"]=-896.52966, ["z"]=79.174667, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[239] = {["ID"]=10631, ["x"]=211.99536, ["y"]=-835.14819, ["z"]=59.581459, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[240] = {["ID"]=10632, ["x"]=83.885803, ["y"]=-797.9635, ["z"]=54.00771, ["rx"]=0, ["ry"]=0, ["rz"]=0			,["Resp"]=false},
	[241] = {["ID"]=10633, ["x"]=-128.19275, ["y"]=-1160.7601, ["z"]=65.68038, ["rx"]=0, ["ry"]=0, ["rz"]=-75.3		,["Resp"]=false}
}

--[=[local streamVal = 1

function checkObj( )
	local h, m = getTime()
	local x, y, z = getCameraMatrix()
	if(streamVal < 20) then
		for i=(streamVal - 1) * 11, streamVal * 11 do
			local x1, y1, z1 = objtable[i]["x"], objtable[i]["y"], objtable[i]["z"]
			local dist = getDistanceBetweenPoints3D(x, y, z, x1, y1, z1)
			if(dist < 250) then
				if(objtable[i]["Resp"] == false) then
					objtable[i]["Obj"] = createObject(objtable[i]["ID"], objtable[i]["x"], objtable[i]["y"], objtable[i]["z"], objtable[i]["rx"], objtable[i]["ry"], objtable[i]["rz"])
					objtable[i]["Resp"] = true
				end
				if(h > 22 or h < 6) then
					if(getObjectScale(objtable[i]["Obj"]) == 0) then
						if(objtable[i]["Resp"] ~= false) then
							setObjectScale(objtable[i]["Obj"], 1)
						end
					end
				else
					if(getObjectScale(objtable[i]["Obj"]) == 1) then
						if(objtable[i]["Resp"] ~= false) then
							setObjectScale(objtable[i]["Obj"], 0)
						end
					end
				end
			else
				if(objtable[i]["Resp"] == true) then
					destroyElement(objtable[i]["Obj"])
					objtable[i]["Resp"] = false
					objtable[i]["Obj"] = nil
				end
			end
		end
		streamVal = streamVal + 1
	else
		for i = 221, 241 do
			local x1, y1, z1 = objtable[i]["x"], objtable[i]["y"], objtable[i]["z"]
			local dist = getDistanceBetweenPoints3D(x, y, z, x1, y1, z1)
			if(dist < 250) then
				if(objtable[i]["Resp"] == false) then
					objtable[i]["Obj"] = createObject(objtable[i]["ID"], objtable[i]["x"], objtable[i]["y"], objtable[i]["z"], objtable[i]["rx"], objtable[i]["ry"], objtable[i]["rz"])
					objtable[i]["Resp"] = true
				end
				if(h > 22 or h < 6) then
					if(getObjectScale(objtable[i]["Obj"]) == 0) then
						if(objtable[i]["Resp"] ~= false) then
							setObjectScale(objtable[i]["Obj"], 1) 
						end
					end
				else
					if(getObjectScale(objtable[i]["Obj"]) == 1) then
						if(objtable[i]["Resp"] ~= false) then
							setObjectScale(objtable[i]["Obj"], 0)
						end
					end
				end
			else
				if(objtable[i]["Resp"] == true) then
					destroyElement(objtable[i]["Obj"])
					objtable[i]["Resp"] = false
					objtable[i]["Obj"] = nil
				end
			end
		end
		streamVal = 1
	end
end
checksuka = setTimer(testblya, 300, 1)
]=]
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
		end, 5000, 1, i)
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
		end, 5000, 1, i)
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
	["\\"]={["Raz"]=true, ["Symbol"]="э",	["SS"]="Э"},
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

function createGUICourier( )
	wdwCourierWork = guiCreateWindow(0.35, 0.4, 0.3, 0.2, "Устройство на работу курьером", true)
	btnCourierStart = guiCreateButton(0.3, 0.3, 0.4, 0.4, "Трудоустроиться", true, wdwCourierWork)
	btnCourierEnd = guiCreateButton(0.3, 0.3, 0.4, 0.4, "Уволиться", true, wdwCourierWork)
	guiSetVisible(btnCourierStart, true)
	addEventHandler("onClientGUIClick", btnCourierStart, startCourierWork, false)
	addEventHandler("onClientGUIClick", btnCourierEnd, endCourierWork, false)
	guiSetVisible(btnCourierEnd, false)
	guiSetVisible(wdwCourierWork, false)
	CourierGUI = true
end

function showCourierGUI( )
	guiSetVisible(wdwCourierWork, true)
	showCursor(true)
	GUI = GUI + 1
end

function endCourierWork()
	if(CourierCursor ~= nil) then
		detachElements(CourierCursor, CourierVeh)
		destroyElement(CourierCursor)
	end
	if(mrkCourierStart ~= nil) then
		removeEventHandler("onClientMarkerHit", mrkCourierStart, markerCourierHit)
		destroyElement(mrkCourierStart)
		destroyElement(blpCourierStart)
	end
	if(mrkCourierEnd ~= nil) then
		removeEventHandler("onClientMarkerHit", mrkCourierEnd, markerCourierEnd)
		destroyElement(mrkCourierEnd)
		destroyElement(blpCourierEnd)
	end
	CourierStage = 0
	Courier = false
	showCursor(false)
	guiSetVisible(wdwCourierWork, false)
	guiSetVisible(btnCourierStart, true)
	guiSetVisible(btnCourierEnd, false)
	triggerServerEvent("onCourierWorkEnd", getLocalPlayer())
	GUI = GUI - 1
end

function courierWorkStart( work )
	if(CourierGUI == false) then
		createGUICourier()
	end
	if(work == 0) then
		showCourierGUI()
		guiSetVisible(btnCourierEnd, false)
		guiSetVisible(btnCourierStart, true)
	elseif(work == 2) then
		showCourierGUI()
		guiSetVisible(btnCourierEnd, true)
		guiSetVisible(btnCourierStart, false)
	else
		outputChatBox("Ошибка, вы уже трудоустроены.")
	end
end

function StartLoaderWork( button )
	addBox("Вы успешно устроились на работу грузчиком.", 0, 60, 255)
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
				toggleControl("jump", true)
				toggleControl("enter_passenger", true)
				toggleControl("next_weapon", true)
				toggleControl("previous_weapon", true)
				toggleControl("aim_weapon", true)
				toggleControl("sprint", true)
				toggleControl("crouch", true)
			end
		end
	end
end

function EndLoaderWork(  )
	triggerServerEvent("OnEndWorkingLoader", getRootElement())
end

function registerBox( button )
	guiSetVisible(wdwLogin, false)
	local x = 0.375
	local y = 0.15
	local Width = 0.25
	local Height = 0.65
	wdwRegister = guiCreateWindow(x, y, Width, Height, "Регистрация", true)
	guiCreateLabel(0.4, 0.08, 0.5, 0.65, "Имя персонажа", true, wdwRegister)
	regName = guiCreateEdit(0.2, 0.13, 0.6, 0.07, "", true, wdwRegister)
	guiCreateLabel(0.37, 0.23, 0.5, 0.65, "Фамилия персонажа", true, wdwRegister)
	x = 0.2
	y = 0.4
	Width = 0.6
	Height = 0.07
	guiCreateLabel(0.45, 0.38, 0.6, 0.4, "Пароль", true, wdwRegister)
	regPass = guiCreateEdit(0.2, 0.43, Width, Height, "", true, wdwRegister)
	x = 0.46
	y = 0.53
	guiCreateLabel(x, 0.53, Width, Height, "Почта", true, wdwRegister)
	x = 0.2
	y = 0.58
	Height = 0.07
	regMail = guiCreateEdit(x, y, Width, Height, "", true, wdwRegister)
	x = 0.3
	y = 0.73
	Height = 0.05
	Width = 0.4
	btnReg = guiCreateButton(x, 0.83, Width, Height, "Зарегистрироваться", true, wdwRegister)
	y = 0.8
	btnBack = guiCreateButton(x, 0.9, Width, Height, "Назад", true, wdwRegister)
	lblNeZap = guiCreateLabel(x, y+0.1, 0.6, Height, "Вы не заполнили нужные поля", true, wdwRegister )
	guiSetVisible(lblNeZap, false)
	guiWindowSetMovable(wdwRegister, false)
	addEventHandler("onClientGUIClick", btnBack, clickBack, false)
	addEventHandler("onClientGUIClick", btnReg, clickReg, false)
end

function choosePerson( button )
	CHOOSE = true
	wdwChoose = guiCreateWindow(0.05, 0.25, 0.22, 0.35, "Выбор спавна", true)
	btnRight = guiCreateButton(0.7, 0.7, 0.2, 0.1, ">>", true, wdwChoose)
	btnLeft = guiCreateButton(0.1, 0.7, 0.2, 0.1, "<<", true, wdwChoose)
	btnChoose = guiCreateButton(0.35, 0.8, 0.30, 0.15, "Выбрать", true, wdwChoose)
	wdwPerson = guiCreateWindow(0.3, 0.6, 0.4, 0.3, "Выбор персонажа", true)
	btnLeftPerson = guiCreateButton(0.1, 0.7, 0.2, 0.15, "<<", true, wdwPerson)
	btnRightPerson = guiCreateButton(0.7, 0.7, 0.2, 0.15, ">>", true, wdwPerson)
	guiWindowSetMovable(wdwChoose, false)
	guiSetVisible(wdwChoose, true)
	addEventHandler("onClientGUIClick", btnRight, changeSpawnRight, false)
	addEventHandler("onClientGUIClick", btnLeft, changeSpawnLeft, false)
	addEventHandler("onClientGUIClick", btnLeftPerson, changePersonLeft, false)
	addEventHandler("onClientGUIClick", btnRightPerson, changePersonRight, false)
	addEventHandler("onClientGUIClick", btnChoose, choosePersonClick, false)
	onPlayerHUD()
end

function changePersonRight(  )
	triggerServerEvent("onRightPerson", getLocalPlayer())
end

function changePersonLeft( )
	triggerServerEvent("onLeftPerson", getLocalPlayer())
end

function changeSpawnRight( button )
	triggerServerEvent("onRightSpawn", getLocalPlayer())
end

function changeSpawnLeft( button )
	triggerServerEvent("onLeftSpawn", getLocalPlayer())
end

function choosePersonClick( button )
	guiSetVisible(wdwChoose, false)
	showCursor(false)
	guiSetInputEnabled(false)
	triggerServerEvent("onChooseSpawn", getLocalPlayer())
	guiSetVisible(wdwPerson, false)
end

resourceRoot = getResourceRootElement()

function clickReg(  )
	local a = guiGetText(regName)
	a = string.gsub(a, "%s+", "")
	local b = guiGetText(regPass)
	b = string.gsub(b, "%s+", "")
	local c = guiGetText(regMail)
	c = string.gsub(c, "%s+", "")

	local ch = string.len(a)
	if(ch > 12 or ch < 3) then
		outputChatBox("Имя не может содержать менее 3 и более 12 символов")
		return false
	end
	local stl = ""
	local act = false
	for i=1,ch do
		stl = string.sub(a, i, i)
		if(i == 1 and not(string.byte(stl) > 64 and string.byte(stl) < 91)) then
			outputChatBox("Имя должно начинаться с заглавной латинской буквы!")
			return false
		end
		if(i > 1 and not (string.byte(stl) > 96 and string.byte(stl) < 123)) then
			outputChatBox("В имени не может быть заглавных букв кроме первой")
			return false
		end
	end

	ch = string.len(b)
	if(ch > 24 or ch < 6) then
		outputChatBox("Ошибка: Пароль не может содержать менее 6 и более 24 символов")
		return false
	end


	ch = string.len(c)

	if(ch > 24 or ch < 6) then
		outputChatBox("Ошибка: почта не может содержать менее 6 и более 24 символов")
		return false
	end

	for i=1,ch do
		stl = string.sub(d, i, i)
		if(i == 1 and not(string.byte(stl) > 64 and string.byte(stl) < 91)) then
			outputChatBox("Фамилия должна начинаться с заглавной латинской буквы!")
			return false
		end
		if(i > 1 and not (string.byte(stl) > 96 and string.byte(stl) < 123)) then
			outputChatBox("В фамилии не может быть заглавных букв кроме первой")
			return false
		end
	end

	local valid = 0
	local iter = 0
	local itera = 0
	if(a == "" or b == "" or c == "" or d == "") then
		guiSetVisible(lblNeZap, true)
		return false
	else
		triggerServerEvent("onRegister", getLocalPlayer(), a, b, c, d)
	end
end

function clickBack( )
	guiSetVisible(wdwRegister, false)
	guiSetVisible(wdwLogin, true)
end


function closeLogin(  )
	guiSetVisible(wdwLogin, false)
	showCursor(false)
	guiSetInputEnabled(false)
end

function successRegister( tablo )
	outputChatBox("Вы успешно зарегистрированы, выберите персонажа", 0, 100, 255)
	choosePerson()
	guiSetVisible(RegisterBackground, false)
	guiSetVisible(RegisterNechto, false)
	guiSetVisible(RegisterBut, false)
	guiSetVisible(RegisterSex, false)
	Rega = false
	Rega1 = false
	Rega2 = false
	setCameraTarget(localPlayer)
	Food = 100
	showCursor(true)
	for i, n in pairs(tablo) do
		PT[i] = n
	end
	LVL = 1
	EXP = 0
	alg = true
end

function incorrectPass( errorpass )
	errorpassword = errorpass
end

function outLogin(  )
	outputChatBox("Вы не можете зайти за таким ником, он уже используется.")
end


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
	guiSetVisible(btnLoaderStart, true)
	guiSetVisible(btnLoaderEnd, false)
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
	end
end

function labelFunc( )
	for i, n in pairs(text3d) do
		local x, y, z = getElementPosition(getLocalPlayer())
		local lx, ly, lz = text3d[i]["x"], text3d[i]["y"], text3d[i]["z"]
		local pdistance = getDistanceBetweenPoints3D(x, y, z, lx, ly, lz)
		if(text3d[i]["Toggle"] == nil) then
			if pdistance <= 20 then
				text3d[i]["Toggle"] = true
				text3drange[i] = {}
				text3drange[i]["x"] = text3d[i]["x"]
				text3drange[i]["y"] = text3d[i]["y"]
				text3drange[i]["z"] = text3d[i]["z"]
				text3drange[i]["Text"] = text3d[i]["Text"]
			else
				text3d[i]["Toggle"] = true
			end
		elseif(text3d[i]["Toggle"] == false) then
			if pdistance <= 20 then
				text3d[i]["Toggle"] = true
				text3drange[i] = {}
				text3drange[i]["x"] = text3d[i]["x"]
				text3drange[i]["y"] = text3d[i]["y"]
				text3drange[i]["z"] = text3d[i]["z"]
				text3drange[i]["Text"] = text3d[i]["Text"]
			end
		elseif(text3d[i]["Toggle"] == true) then
			if pdistance >= 20 then
				text3d[i]["Toggle"] = false
				text3drange[i] = nil
			end
		end
	end
end

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
			setPedAnimation(getLocalPlayer(), "BSKTBALL", "BBALL_idle_O", 1, false)
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
				FishLimit = random
				addEventHandler("onClientMarkerHit", mrkFishUl, hitFishMarkerUl)
				addEventHandler("onClientMarkerLeave", mrkFishUl, leaveFishMarkerUl)
				addBox("Улов на данном косяке закончился.\nНа GPS поставлен маркер нового косяка.", 255, 255, 0)
			end
			waitingFish = false
		end
	end
end

function FishingTime( )
	if(Fishing == true) then
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
			setPedAnimation(getLocalPlayer(), "BSKTBALL", "BBALL_idle_O", 1, false)
		end
	end
end

function startFishingCutting(  )
	if(waitingFish == true) then
		Fishing = true
		bindKey("mouse1", "down", ClickingFish)
		FishTimer = setTimer(FishingTime, 125, 0)
		rad = 78
	end
end

function onFishingOnMarker( )
	if(waitingFish == false) then
		setPedAnimation(getLocalPlayer(), "sword", "sword_idle")
		local randtime = math.random(10, 30)
		waitingFish = true
		FishTimerEsc = setTimer(startFishingCutting, randtime * 1000, 1)
		addBox("Вы начали ловить рыбу.\nКогда она клюнет, Вам\nНеобходимо будет начать подсечку.", 0, 60, 255)
	else
		setPedAnimation(getLocalPlayer(), "BSKTBALL", "BBALL_idle_O", 1, false)
		waitingFish = false
		killTimer(FishTimerEsc)
		FishTimerEsc = 0
		addBox("Вы перестали ожидать улов.", 255, 60, 0)
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
								local speed = math.round(math.sqrt(vx * vx + vy * vy + vz * vz) * 120)
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
				addBox("Вы заплыли в зону улова.\nНажмите пробел, чтобы\nНачать ловить рыбу.", 180, 32, 61)
				FishMark = true
				bindKey("space", "up", fishStart)
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
		triggerServerEvent("onClientLoginStart", localPlayer)
		act = true
		a = 1
	end
	setTimer(labelFunc, 200, 0)
end

function OnEndWorkFish( )
	Fishing = nil
	unbindKey("mouse1", "down", ClickingFish)
	if(isTimer(FishTimer) == true) then
		killTimer(FishTimer)
	end
	FishMark = false
	unbindKey("space", "up", fishStart)
	if(mrkFishUl ~= 0) then
		destroyElement(mrkFishUl)
		destroyElement(blpFishUl)
		mrkFishUl = 0
		blpFishUl = 0
	end
	waitingFish = false
end

function onClientRender()
	local screenWidth, screenHeight = guiGetScreenSize()
	local sw, sh = guiGetScreenSize()
	if(CarBuy == true) then
		local price = CarCache[1][CarCache[2] + CarCache[4] - 1]["GosPrice"]
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
		dxDrawText("102 км/ч", (259) * sw / 1920, 788 * sh / 1080, 20 * sw / 1920, 633 * sh / 1080, tocolor(255, 255, 255, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, BebasNeue)
		dxDrawText("ПОЛНЫЙ.", (265) * sw / 1920, 838 * sh / 1080, 20 * sw / 1920, 633 * sh / 1080, tocolor(255, 255, 255, 255), (1.0) * sw / 1920, (1.0) * sh / 1080, BebasNeue)
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
		dxDrawRectangle((400) * sw / 1920, (284) * sh / 1080 + step * nowstep, (5) * sw / 1920, (pheight / CarCache[3] * 6) * sh / 1080, tocolor(216, 24, 238, 255), true)
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
		dxDrawText(SkinsCache[1][cache]["Price"], (1000 - dxw) * sw / 1920, (982) * sh / 1080, 892 * sw / 1920, 982 * sh / 1080, tocolor(255, 255, 255, 255), 1.0 * sw / 1920, 1.0 * sh / 1080, UniSans)
	end
	for i, n in pairs(text3drange) do
		if(text3drange[i] ~= nil) then
			if(text3drange[i]["x"] ~= nil) then
				local x, y, z = getElementPosition(getLocalPlayer())
				if isPlayerMapVisible() then return end
					local lx, ly, lz = text3drange[i]["x"], text3drange[i]["y"], text3drange[i]["z"]
					local pdistance = getDistanceBetweenPoints3D(x, y, z, lx, ly, lz)
					if pdistance <= 20 then
						local sx, sy, sz = getScreenFromWorldPosition (lx, ly, lz+1.05, 0.06)
						local CamX,CamY,CamZ = getCameraMatrix()
						local bHit = processLineOfSight(CamX, CamY, CamZ, lx, ly, lz, true, false, false, true, false, false, false, false )
					if not bHit and sx and sy then
						local text = text3drange[i]["Text"]
						local w = dxGetTextWidth(text, 1.2 * sw / 1920, "Arial")
						dxDrawText (text, sx-(w/2)-2, sy-23, sx-(w/2)+1,sy+1, tocolor(0, 0, 0, 255), 1.4, 1.4, "Arial")
						dxDrawText (text, sx-(w/2), sy-25, sx-(w/2), sy, tocolor(255, 255, 255, 255), 1.4, 1.4, "Arial")
					end
				end
			end
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
					dxDrawText(MenuToggle[4][2] * 150, (sm + 610 - dw2 / 2) * sw / 1920, (hm+185) * sh / 1080, sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight, "left", "top", false, false, true, false, false)
				else
					dxDrawText("500", (sm + 444) * sw / 1920, (hm+185) * sh / 1080, sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight, "left", "top", false, false, true, false, false)
					dxDrawText("87500", (sm + 600) * sw / 1920, (hm+185) * sh / 1080, sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight, "left", "top", false, false, true, false, false)
				end
			else
				if(MenuToggle[4][2] ~= 0) then
					local dw = dxGetTextWidth(MenuToggle[4][2], 1 * sw / 1920, AvertaLight)
					local dw2 = dxGetTextWidth(MenuToggle[4][2], 1 * sw / 1920, AvertaLight)
					dxDrawText(MenuToggle[4][2], (sm + 462 - dw / 2) * sw / 1920, (hm+185) * sh / 1080, sw * sw / 1920, sh * sh / 1080, tocolor(190, 190, 190, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight, "left", "top", false, false, true, false, false)
					dxDrawText(MenuToggle[4][2] * 150, (sm + 610 - dw2 / 2) * sw / 1920, (hm+185) * sh / 1080, sw * sw / 1920, sh * sh / 1080, tocolor(190, 190, 190, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight, "left", "top", false, false, true, false, false)
				else
					dxDrawText("500", (sm + 444) * sw / 1920, (hm+185) * sh / 1080, sw * sw / 1920, sh * sh / 1080, tocolor(190, 190, 190, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight, "left", "top", false, false, true, false, false)
					dxDrawText("87500", (sm + 600) * sw / 1920, (hm+185) * sh / 1080, sw * sw / 1920, sh * sh / 1080, tocolor(190, 190, 190, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaLight, "left", "top", false, false, true, false, false)
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
			dxDrawText(name,								(sm + 705) * sw / 1920, 		(hm+205) * sh / 1080, 	(sm + 705) * sw / 1920, (hm+167) * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBold, "center", "top", false, false, true, false, false)
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
				dxDrawText(PInfo["Rank"], 	(sm + 965) * sw / 1920, 		(hm+420) * sh / 1080, 	sw * sw / 1920, sh * sh / 1080, tocolor(178, 151, 232, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmallest, "left", "top", false, false, true, false, false)
			else
				if(PInfo["Work"] == 1) then
					dxDrawText("Водитель автобуса", 	(sm + 855) * sw / 1920, 		(hm+375) * sh / 1080, 	sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmall, "left", "top", false, false, true, false, false)
				elseif(PInfo["Work"] == 2) then
					dxDrawText("Таксист", 	(sm + 900) * sw / 1920, 		(hm+375) * sh / 1080, 	sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmall, "left", "top", false, false, true, false, false)
				elseif(PInfo["Work"] == 3) then
					dxDrawText("Развозчик продуктов", 	(sm + 845) * sw / 1920, 		(hm+375) * sh / 1080, 	sw * sw / 1920, sh * sh / 1080, tocolor(255, 255, 255, 255), 	1 * sw / 1920, 1 * sh / 1080, 	AvertaBoldSmall, "left", "top", false, false, true, false, false)
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
			local text = "0$"
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
			local text = "0 VC"
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
		dxDrawImage(sw/2 - 315/2, sh/2 - 315/2, 315, 315, FishUI[1])
		dxDrawText ( "ЛКМ", sw/2 - w/2, sh/2 - 12, sw, sh, tocolor ( 30, 30, 30, 255 ), 1, shrift, "left", "top", false, false, true, false, false)
		dxDrawCircle(sw/2, sh/2, rad, 0, 360, tocolor(255, 255, 255, 255), tocolor(255, 255, 255, 255), 512, 1, false)
		dxDrawImage(sw/2 - 69/2, sh/2 - 95/2, 69 * sw / 1920, 95 * sh / 1080, FishUI[3])
	end
	if(Driver == true) then
		if(getPedOccupiedVehicle(localPlayer) ~= false) then
			local veh = getPedOccupiedVehicle(localPlayer)
			if(SpeedUIBack == nil) then
				SpeedUIBack = guiCreateStaticImage(screenWidth / 1.4669, screenHeight / 1.2705, screenWidth / 3.516483, screenHeight / 5.346534653, "SpeedUI/Back.png", false)
			end
			if(SpeedUIFuel == nil) then
				SpeedUIFuel = guiCreateStaticImage(screenWidth / 1.4639, screenHeight / 1.2710, screenWidth / 3.516483, screenHeight / 5.346534653, "SpeedUI/Fuel.png", false)
			end
			if(getVehicleOverrideLights(veh) == 2) then
				if(SpeedUILights ~= nil) then
					destroyElement(SpeedUILights)
					SpeedUILights = guiCreateStaticImage(screenWidth / 1.4315, screenHeight / 1.2720, screenWidth / 3.516483, screenHeight / 5.346534653, "SpeedUI/LightsOn.png", false)
				else
					SpeedUILights = guiCreateStaticImage(screenWidth / 1.4315, screenHeight / 1.2720, screenWidth / 3.516483, screenHeight / 5.346534653, "SpeedUI/LightsOn.png", false)
				end
			else
				if(SpeedUILights ~= nil) then
					destroyElement(SpeedUILights)
					SpeedUILights = guiCreateStaticImage(screenWidth / 1.4315, screenHeight / 1.2720, screenWidth / 3.516483, screenHeight / 5.346534653, "SpeedUI/LightsOff.png", false)
				else
					SpeedUILights = guiCreateStaticImage(screenWidth / 1.4315, screenHeight / 1.2720, screenWidth / 3.516483, screenHeight / 5.346534653, "SpeedUI/LightsOff.png", false)
				end
			end
			if(isVehicleLocked(veh) == true) then
				if(SpeedUILock ~= nil) then
					destroyElement(SpeedUILock)
					SpeedUILock = guiCreateStaticImage(screenWidth / 1.4665, screenHeight / 1.2710, screenWidth / 3.516483, screenHeight / 5.346534653, "SpeedUI/VehLock.png", false)
				else
					SpeedUILock = guiCreateStaticImage(screenWidth / 1.4665, screenHeight / 1.2710, screenWidth / 3.516483, screenHeight / 5.346534653, "SpeedUI/VehLock.png", false)
				end
			else
				if(SpeedUILock ~= nil) then
					destroyElement(SpeedUILock)
					SpeedUILock = guiCreateStaticImage(screenWidth / 1.4665, screenHeight / 1.2710, screenWidth / 3.516483, screenHeight / 5.346534653, "SpeedUI/VehNotLock.png", false)
				else
					SpeedUILock = guiCreateStaticImage(screenWidth / 1.4665, screenHeight / 1.2710, screenWidth / 3.516483, screenHeight / 5.346534653, "SpeedUI/VehNotLock.png", false)
				end
			end
			guiSetVisible(SpeedUILights, true)
			guiSetVisible(SpeedUIFuel, true)
			guiSetVisible(SpeedUIBack, true)
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
			local str2 = math.round(math.sqrt(x * x + y * y + z * z) * 120)
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
				if(SpeedUIEng ~= nil) then
					destroyElement(SpeedUIEng)
					SpeedUIEng = guiCreateStaticImage(screenWidth / 1.5025, screenHeight / 1.2710, screenWidth / 3.516483, screenHeight / 5.346534653, "SpeedUI/EngOn.png", false)
				else
					SpeedUIEng = guiCreateStaticImage(screenWidth / 1.5025, screenHeight / 1.2710, screenWidth / 3.516483, screenHeight / 5.346534653, "SpeedUI/EngOn.png", false)
				end
			else
				if(SpeedUIEng ~= nil) then
					destroyElement(SpeedUIEng)
					SpeedUIEng = guiCreateStaticImage(screenWidth / 1.5025, screenHeight / 1.2710, screenWidth / 3.516483, screenHeight / 5.346534653, "SpeedUI/EngOff.png", false)
				else
					SpeedUIEng = guiCreateStaticImage(screenWidth / 1.5025, screenHeight / 1.2710, screenWidth / 3.516483, screenHeight / 5.346534653, "SpeedUI/EngOff.png", false)
				end
			end
		end
	else
		if(SpeedUIBack ~= nil) then
			destroyElement(SpeedUIBack)
			SpeedUIBack = nil
		end
		if(SpeedUIFuel ~= nil) then
			destroyElement(SpeedUIFuel)
			SpeedUIFuel = nil
		end
		if(SpeedUIEng ~= nil) then
			destroyElement(SpeedUIEng)
			SpeedUIEng = nil
		end
		if(SpeedUILights ~= nil) then
			destroyElement(SpeedUILights)
			SpeedUILights = nil
		end
		if(SpeedUILock ~= nil) then
			destroyElement(SpeedUILock)
			SpeedUILock = nil
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
		local n = getPlayerName(localPlayer)
		local NameWidth = dxGetTextWidth(n, screenWidth / 1920 * 0.8, LogSh)
		local post = screenWidth * 0.5 - NameWidth * (0.5)
		dxDrawText ( n, post, screenHeight * 0.350, screenWidth, screenHeight, tocolor(255, 255, 255, 255), screenWidth / 1920 * 0.8, screenHeight / 1080 , LogSh, "left", "top", false, false, true)
		local str = string.rep("*", string.len(al))
		if(string.len(str) == 0) then
			str = "Введите пароль"
			pos = screenWidth * 0.5 - dxGetTextWidth(str, screenWidth / 1920 * 0.8, LogSh) / 2
		else
			pos = screenWidth * 0.5 - (string.len(str) * (screenWidth * 0.0038))
		end
		if(Rega1 == true) then
			dxDrawText ( str, pos, screenHeight * 0.445, screenWidth, screenHeight, tocolor(138, 111, 192, 255), screenWidth / 1920 * 0.8, screenHeight / 1080 , LogSh, "left", "top", false, false, true)
		else
			dxDrawText ( str, pos, screenHeight * 0.445, screenWidth, screenHeight, tocolor(255, 255, 255, 255), screenWidth / 1920 * 0.8, screenHeight / 1080 , LogSh, "left", "top", false, false, true)
		end
		local str = string.rep("*", string.len(alo))
		if(string.len(str) == 0) then
			str = "Повторить пароль"
			pos = screenWidth * 0.5 - dxGetTextWidth(str, screenWidth / 1920 * 0.8, LogSh) / 2
		else
			pos = screenWidth * 0.5 - (string.len(str) * (screenWidth * 0.0038))
		end
		if(Rega2 == true) then
			dxDrawText ( str, pos, screenHeight * 0.525, screenWidth, screenHeight, tocolor(138, 111, 192, 255), screenWidth / 1920 * 0.8, screenHeight / 1080 , LogSh, "left", "top", false, false, true)
		else
			dxDrawText ( str, pos, screenHeight * 0.525, screenWidth, screenHeight, tocolor(255, 255, 255, 255), screenWidth / 1920 * 0.8, screenHeight / 1080 , LogSh, "left", "top", false, false, true)
		end
	end
	if(LoginUI == true) then
		local n = getPlayerName(localPlayer)
		local NameWidth = dxGetTextWidth(n, screenWidth / 1920 * 0.8, LogSh)
		local post = screenWidth * 0.5 - NameWidth * 0.5
		dxDrawText ( n, post, screenHeight * 0.350, screenWidth, screenHeight, tocolor(255, 255, 255, 255), screenWidth / 1920 * 0.8, screenHeight / 1080 , LogSh, "left", "top", false, false, true)
		local str = string.rep("*", string.len(LoginPass))
		local pos = 0
		if(string.len(str) == 0) then
			str = "Введите пароль"
			pos = screenWidth * 0.5 - (string.len(str) * (screenWidth * 0.0018))
		else
			pos = screenWidth * 0.5 - (string.len(str) * (screenWidth * 0.0038))
		end
		dxDrawText ( str, pos, screenHeight * 0.445, screenWidth, screenHeight, tocolor(255, 255, 255, 255), screenWidth / 1920 * 0.8, screenHeight / 1080 , LogSh, "left", "top", false, false, true)
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
	for i, n in pairs(notif) do
		local perc = 50
		perc = math.round(perc)
		local color = 255
		local x = 600 - ((50 - perc) * 12)
		local scol = 255 - (255 / (50 / perc))
		local size = notif[i]["Height"]
		local y = notif[i]["y"]
		local r, g, b = notif[i]["R"], notif[i]["G"], notif[i]["B"]
		dxDrawRectangle((x - 500) * sw / 1920, y * sh / 1080, 400 * sw / 1920, size * sh / 1080, tocolor(30, 30, 30, perc * 3), false, false)
		dxDrawRectangle((x - 492) * sw / 1920, y * sh / 1080, 4, size * sh / 1080, tocolor(r, g, b, perc * 5.1), false, false)
		dxDrawRectangle((x - 495) * sw / 1920, y * sh / 1080, 3, size * sh / 1080, tocolor(r, g, b, perc * 2.4), false, false)
		dxDrawRectangle((x - 498) * sw / 1920, y * sh / 1080, 3, size * sh / 1080, tocolor(r, g, b, perc * 1.8), false, false)
		dxDrawRectangle((x - 500) * sw / 1920, y * sh / 1080, 2, size * sh / 1080, tocolor(r, g, b, perc * 1.2), false, false)
		dxDrawRectangle((x - 488) * sw / 1920, y * sh / 1080, 3, size * sh / 1080, tocolor(r, g, b, perc * 2.4), false, false)
		dxDrawRectangle((x - 485) * sw / 1920, y * sh / 1080, 3, size * sh / 1080, tocolor(r, g, b, perc * 1.8), false, false)
		dxDrawRectangle((x - 482) * sw / 1920, y * sh / 1080, 3, size * sh / 1080, tocolor(r, g, b, perc * 1.2), false, false)
		for k, r in pairs(notif[i]["ProofedText"]) do		
			dxDrawText(notif[i]["ProofedText"][k], (x - 450) * sw / 1920, (y + 16 + ((k - 1) * 24)) * sh / 1080, 200 * sw / 1920, 200 * sh / 1080, tocolor(255, 255, 255, perc * 5.1), 0.7 * sw / 1920, 0.7 * sh / 1080, shrift)
		end
	end
end

function FuelUpdate( fuel )
	str = fuel
end

function onClientVehicleExit( thePlayer, seat, door )
	if(thePlayer == localPlayer) then
		Driver = false
	end
end


function onGridPlayerOn(  )
	if(alg == true) then
		alb = true
		playerListWindow = guiCreateWindow(0.25, 0.25, 0.5, 0.5, "Игроки на сервере", true)
		playerList = guiCreateGridList(0.0, 0.0, 1, 1, true, playerListWindow)
		local it = 0
		for _, i in pairs(PT) do
			it = it + 1
		end
		guiCreateLabel(0.88, 0.0425, 0.2, 0.2, "Игроков: " .. it, true, playerListWindow)
		guiGridListAddColumn(playerList, "ID", 0.10)
		guiGridListAddColumn(playerList, "Players", 0.55)
		guiGridListSetColumnWidth(playerList, 2, 0.55, true)
		guiGridListSetColumnWidth(playerList, 1, 0.3, true)
		for i, p in pairs(PT) do
			guiGridListAddRow(playerList, i, PT[i])
		end
		guiSetVisible(playerList, true)
	end
end

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

function onPlayerHUD( tablo, lvl, exp, food)
	if(PCD == true) then
		customShowChat(true)
	end
	Loginofc = false
	if(tablo ~= nil) then
		for i, p in pairs(tablo) do
			PT[i] = getPlayerName(p)
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
	guiSetVisible(Logins, false)
	guiSetVisible(LoginBackground, false)
	guiSetVisible(LoginCherk, false)
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
	end
end

function onGridPlus( i, s, p)
	PT[tonumber(i)] = s
	i = tonumber(i)
	if(PT[i] == nil) then
		PT[i] = getPlayerName(p)
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
		destroyElement(Logins)
		Logins = guiCreateStaticImage(0, 0, sx, sy, "LoginUI/1log.png", false )
	else
		local sx, sy = guiGetScreenSize()
		destroyElement(Logins)
		if(Loginofc == true) then
			Logins = guiCreateStaticImage(0, 0, sx, sy, "LoginUI/0log.png", false )
		end
	end
	if(al ~= nil and alo ~= nil and RegSex ~= nil) then
		if(al == alo and string.len(al) > 3) then
	 		local screenWidth, screenHeight = guiGetScreenSize()
	 		destroyElement(RegisterBut)
	 		RegisterBut = guiCreateStaticImage(0, 0, screenWidth, screenHeight, "RegisterUI/1reg.png", false)
	 		guiSetVisible(RegisterBut, true)
	 	else
	 		local screenWidth, screenHeight = guiGetScreenSize()
	 		destroyElement(RegisterBut)
	 		RegisterBut = guiCreateStaticImage(0, 0, screenWidth, screenHeight, "RegisterUI/0.png", false)
	 		guiSetVisible(RegisterBut, true)
	 	end
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
	setElementDimension(getLocalPlayer(), 0)
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
	setElementDimension(getLocalPlayer(), 0)
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
	setElementDimension(getLocalPlayer(), 0)
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

function playerPressedKey( button, press )
	if(button == "lshift" or button == "rshift") then
		if(press == true) then
			repShift = true
		else
			repShift = false
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
					setVehicleColor(CarCache[5], 255, 255, 255, 255, 255, 255)
					setElementDimension(CarCache[5], IDV)
				elseif(x > 0.0223 and x < 0.2 and y > 0.3092 and y < 0.3472) then
					CarCache[4] = 2
					destroyElement(CarCache[5])
					CarCache[5] = createVehicle(CarCache[1][max + CarCache[4] - 1]["ID"], -972.2431640625, -832.6669921875, 13.123320579529, 0, 0, 135)
					setVehicleColor(CarCache[5], 255, 255, 255, 255, 255, 255)
					setElementDimension(CarCache[5], IDV)
				elseif(x > 0.0223 and x < 0.2 and y > 0.3564 and y < 0.3935) then
					CarCache[4] = 3
					destroyElement(CarCache[5])
					CarCache[5] = createVehicle(CarCache[1][max + CarCache[4] - 1]["ID"], -972.2431640625, -832.6669921875, 13.123320579529, 0, 0, 135)
					setVehicleColor(CarCache[5], 255, 255, 255, 255, 255, 255)
					setElementDimension(CarCache[5], IDV)
				elseif(x > 0.0223 and x < 0.2 and y > 0.4064 and y < 0.4444) then
					CarCache[4] = 4
					destroyElement(CarCache[5])
					CarCache[5] = createVehicle(CarCache[1][max + CarCache[4] - 1]["ID"], -972.2431640625, -832.6669921875, 13.123320579529, 0, 0, 135)
					setVehicleColor(CarCache[5], 255, 255, 255, 255, 255, 255)
					setElementDimension(CarCache[5], IDV)
				elseif(x > 0.0223 and x < 0.2 and y > 0.4574 and y < 0.4953) then
					CarCache[4] = 5
					destroyElement(CarCache[5])
					CarCache[5] = createVehicle(CarCache[1][max + CarCache[4] - 1]["ID"], -972.2431640625, -832.6669921875, 13.123320579529, 0, 0, 135)
					setVehicleColor(CarCache[5], 255, 255, 255, 255, 255, 255)
					setElementDimension(CarCache[5], IDV)
				elseif(x > 0.0223 and x < 0.2 and y > 0.5111 and y < 0.5472) then
					CarCache[4] = 6
					destroyElement(CarCache[5])
					CarCache[5] = createVehicle(CarCache[1][max + CarCache[4] - 1]["ID"], -972.2431640625, -832.6669921875, 13.123320579529, 0, 0, 135)
					setVehicleColor(CarCache[5], 255, 255, 255, 255, 255, 255)
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
						setVehicleColor(CarCache[5], 255, 255, 255, 255, 255, 255)
					elseif(x > 0.09375 and x < 0.11041) then
						setVehicleColor(CarCache[5], 120, 120, 120, 120, 120, 120)
					elseif(x > 0.11666 and x < 0.13281) then
						setVehicleColor(CarCache[5], 0, 0, 0, 0, 0, 0)
					elseif(x > 0.13958 and x < 0.15677) then
						setVehicleColor(CarCache[5], 220, 0, 0, 220, 0, 0)
					elseif(x > 0.16302 and x < 0.17968) then
						setVehicleColor(CarCache[5], 220, 220, 0, 220, 220, 0)
					elseif(x > 0.18697 and x < 0.20312) then
						setVehicleColor(CarCache[5], 0, 60, 255, 0, 60, 255)
					end
				elseif(x > 0.11718 and y > 0.610185 and x < 0.189062 and y < 0.6527777) then
					if(getPlayerMoney(getLocalPlayer()) >= CarCache[1][max + CarCache[4] - 1]["GosPrice"]) then
						triggerServerEvent("onClientTryBuyCar", getLocalPlayer(), max + CarCache[4] - 1)
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
		if(ley == nil) then
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
									if(RegSex ~= nil) then
										triggerServerEvent("Regaru", localPlayer, al, RegSex)
									end
								end
							end
						elseif(x > 0.417 and x < 0.494 and y > 0.657 and y < 0.705) then
							destroyElement(RegisterSex)
							RegisterSex = guiCreateStaticImage(0, 0, wx, wy, "RegisterUI/sex2.png", false)
							guiSetVisible(RegisterSex, true)
							RegSex = 1
							if(al ~= nil and alo ~= nil and RegSex ~= nil) then
								if(al == alo and string.len(al) > 3) then
							 		local screenWidth, screenHeight = guiGetScreenSize()
							 		destroyElement(RegisterBut)
							 		RegisterBut = guiCreateStaticImage(0, 0, screenWidth, screenHeight, "RegisterUI/1reg.png", false)
							 		guiSetVisible(RegisterBut, true)
							 	else
							 		local screenWidth, screenHeight = guiGetScreenSize()
							 		destroyElement(RegisterBut)
							 		RegisterBut = guiCreateStaticImage(0, 0, screenWidth, screenHeight, "RegisterUI/0.png", false)
							 		guiSetVisible(RegisterBut, true)
							 	end
							 end
						elseif(x > 0.5036 and x < 0.58 and y > 0.657 and y < 0.705) then
							destroyElement(RegisterSex)
							RegisterSex = guiCreateStaticImage(0, 0, wx, wy, "RegisterUI/sex1.png", false)
							guiSetVisible(RegisterSex, true)
							RegSex = 2
							if(al ~= nil and alo ~= nil and RegSex ~= nil) then
								if(al == alo and string.len(al) > 3) then
							 		local screenWidth, screenHeight = guiGetScreenSize()
							 		destroyElement(RegisterBut)
							 		RegisterBut = guiCreateStaticImage(0, 0, screenWidth, screenHeight, "RegisterUI/1reg.png", false)
							 		guiSetVisible(RegisterBut, true)
							 	else
							 		local screenWidth, screenHeight = guiGetScreenSize()
							 		destroyElement(RegisterBut)
							 		RegisterBut = guiCreateStaticImage(0, 0, screenWidth, screenHeight, "RegisterUI/0.png", false)
							 		guiSetVisible(RegisterBut, true)
							 	end
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
								if(button == "2" and zero == true) then
									if(string.len(al) < 13) then
										al = al .. "@"
									end
								elseif(zero == true) then
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
						 	if(al ~= nil and alo ~= nil and RegSex ~= nil) then
							 	if(al == alo and string.len(al) > 3) then
							 		local screenWidth, screenHeight = guiGetScreenSize()
							 		destroyElement(RegisterBut)
							 		RegisterBut = guiCreateStaticImage(0, 0, screenWidth, screenHeight, "RegisterUI/1reg.png", false)
							 		guiSetVisible(RegisterBut, true)
							 	else
							 		local screenWidth, screenHeight = guiGetScreenSize()
							 		destroyElement(RegisterBut)
							 		RegisterBut = guiCreateStaticImage(0, 0, screenWidth, screenHeight, "RegisterUI/0.png", false)
							 		guiSetVisible(RegisterBut, true)
							 	end
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
								if(button == "2" and zero == true) then
									if(string.len(alo) < 13) then
										alo = alo .. "@"
									end
								elseif(zero == true) then
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
						 	if(al ~= nil and alo ~= nil and RegSex ~= nil) then
							 	if(al == alo and string.len(al) > 3) then
							 		local screenWidth, screenHeight = guiGetScreenSize()
							 		destroyElement(RegisterBut)
							 		RegisterBut = guiCreateStaticImage(0, 0, screenWidth, screenHeight, "RegisterUI/1reg.png", false)
							 		guiSetVisible(RegisterBut, true)
							 	else
							 		local screenWidth, screenHeight = guiGetScreenSize()
							 		destroyElement(RegisterBut)
							 		RegisterBut = guiCreateStaticImage(0, 0, screenWidth, screenHeight, "RegisterUI/0.png", false)
							 		guiSetVisible(RegisterBut, true)
							 	end
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
						local screenWidth, screenHeight = guiGetScreenSize()
						if(keyTable[tostring(button)] == true) then
							if(button == "2" and zero == true) then
								if(string.len(LoginPass) < 13) then
									LoginPass = LoginPass .. "@"
								end
							elseif(zero == true) then
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
									outputChatBox("Пожалуйста, подождите", 190, 190, 190)
								end
							else
								outputChatBox("Ошибка: Вы не ввели пароль.", 190, 190, 190)
							end
					 	end
					elseif(press == false) then
						if(button == "lshift") then
							zero = false
						elseif(button == "rshift") then
							zero = false
						elseif(button == "backspace") then
							killTimer(backTime)
						end
						if(string.len(LoginPass) > 3) then
							local sx, sy = guiGetScreenSize()
							if(isElement(Logins) == true) then
								destroyElement(Logins)
							end
							Logins = guiCreateStaticImage(0, 0, sx, sy, "LoginUI/1log.png", false )
						else
							local sx, sy = guiGetScreenSize()
							if(Logins ~= nil) then
								destroyElement(Logins)
							end
							if(Loginofc == true) then
								Logins = guiCreateStaticImage(0, 0, sx, sy, "LoginUI/0log.png", false )
							end
						end
					end
				end
			end
		end
	end
end

addEventHandler("onClientKey", root, playerPressedKey)
bindKey("F7", "up", onFS)
bindKey("TAB", "down", onGridPlayerOn)
bindKey("TAB", "up", onGridPlayerOff)
bindKey("]", "up", function( ... )
ley = true
end)


addEventHandler("onClientVehicleStartExit", getRootElement(), function ( thePlayer, seat, door )
	if(thePlayer == getRootElement()) then
		if(seat == 0) then
			Driver = false
		end
	end
end)

function onLoginUI( )
	LoginUI = true
	local screenWidth, screenHeight = guiGetScreenSize()
	LoginBackground = guiCreateStaticImage(0, 0, screenWidth, screenHeight, "LBack.png", false)
	LoginCherk = guiCreateStaticImage(0, 0, screenWidth, screenHeight, "cherk.png", false)
	ForgPass = guiCreateStaticImage(0, 0, screenWidth, screenHeight, "forgpass.png", false)
	Logins = guiCreateStaticImage(0, 0, screenWidth, screenHeight, "LoginUI/0log.png", false)
	fadeCamera(true, 0)
	setCameraMatrix(0, 0, 40, 30, 30, 35)
	showCursor(true)
	setPlayerHudComponentVisible("radar", false)
	Loginofc = true
end

function onAvtoriz(  )
	LoginUI = false
	setCameraTarget(localPlayer)
	showCursor(false)
	guiSetVisible(ForgPass, false)
	guiSetVisible(Logins, false)
	guiSetVisible(LoginCherk, false)
	guiSetVisible(LoginBackground, false)
end

function onRegisterUI( )
	local screenWidth, screenHeight = guiGetScreenSize()
	RegisterBackground = guiCreateStaticImage(0, 0, screenWidth, screenHeight, "LBack.png", false)
	RegisterNechto = guiCreateStaticImage(0, 0, screenWidth, screenHeight, "RegisterUI/line.png", false)
	RegisterBut = guiCreateStaticImage(0, 0, screenWidth, screenHeight, "RegisterUI/0.png", false)
	RegisterSex = guiCreateStaticImage(0, 0, screenWidth, screenHeight, "RegisterUI/sex0.png", false)
	guiSetVisible(RegisterBackground, true)
	guiSetVisible(RegisterNechto, true)
	guiSetVisible(RegisterBut, true)
	guiSetVisible(RegisterSex, true)
	fadeCamera(true, 0)
	setCameraMatrix(0, 0, 40, 30, 30, 35)
	setPlayerHudComponentVisible("radar", false)
	showCursor(true)
	Rega = true
	Rega1 = true
	al = ""
	alo = ""
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

function onPlayerCheckMenu(lvl, exp, sex, number, fname, fact, frank, money, house, bus, work, rank, warn, don)
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

function onClientPlayerWasted( killer, weapon, part, loss, stealth )
	if(source == localPlayer) then
		Driver = false
	end
	if(SkinShop == true) then
		SkinShopExit()
	end
	if(CarBuy == true) then
		clearBuyCar()
	end
	if(Fishing == true) then
		Fishing = false
		FishMark = false
		unbindKey("space", "up", fishStart)
		waitingFish = false
		unbindKey("mouse1", "down", ClickingFish)
	end
end

function oncdp( attacker, weapon, body )
	if(getElementType(source) == ped) then
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
										triggerServerEvent("AdminTriggerDamage", getLocalPlayer(), attacker)
										break
									else
										if(getElementInterior(source) == TableZZ[i]["Interior"]) then
											cancelEvent()
											triggerServerEvent("AdminTriggerDamage", getLocalPlayer(), attacker)
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

function CameraUpdate( rot )
	setPedCameraRotation(localPlayer, rot)
end

function onLoadGreenZone( table )
	TableZZ = table
end

function on3dTextAdd( texttable )
	local id = texttable["ID"]
	if(text3drange[id] ~= nil) then
		text3drange[id]["Text"] = texttable["Text"]
	end
	text3d[id] = {}
	text3d[id]["x"] = texttable["x"]
	text3d[id]["y"] = texttable["y"]
	text3d[id]["z"] = texttable["z"]
	text3d[id]["Text"] = texttable["Text"]
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

function onPlayerBuyCarMenu( tablo, id )
	CarBuy = true
	CarCache[1] = tablo
	CarCache[2] = 1
	CarCache[3] = table.getn(tablo)
	CarCache[4] = 1
	CarCache[5] = createVehicle(CarCache[1][1]["ID"], -972.2431640625, -832.6669921875, 13.123320579529, 0, 0, 135)
	setVehicleColor(CarCache[5], 255, 255, 255, 255, 255, 255)
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
addEvent("on3dTextAdd", true)
addEventHandler("on3dTextAdd", root, on3dTextAdd)
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
addEvent("onLoginUI", true)
addEventHandler("onLoginUI", localPlayer, onLoginUI)
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
addEvent( "onIncorrectPass", true)
addEventHandler("onIncorrectPass", localPlayer, incorrectPass)
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
addEvent("onPickupCourierWorkStart", true)
addEventHandler("onPickupCourierWorkStart", localPlayer, courierWorkStart)
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

addEventHandler("onClientRender",getRootElement(),
function()
	local sw, sh = guiGetScreenSize()
	local x,y,z = getCameraMatrix(getLocalPlayer())
	if(NameToggle == true) then
		for i,player in pairs(getElementsByType("player")) do
			if isPlayerMapVisible() then return end
				if player ~= getLocalPlayer() then
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
									local w = dxGetTextWidth(text, 1.2 * sw / 1920, "Arial")
									dxDrawText (text, sx-(w/2)-2, sy-23, sx-(w/2)+1,sy+1, tocolor (0,0,0,255), 1.2 * sw / 1920, 1.2, "Arial")
									dxDrawText (text, sx-(w/2), sy-25, sx-(w/2), sy, tocolor (255,255,255,255), 1.2 * sw / 1920, 1.2, "Arial")
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
end)

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
			if(DeagleShots == 12) then
				DeagleShots = 0
				triggerServerEvent("onPlayerUpSkill", localPlayer, 1)
			end
		elseif(weapon == 25) then
			ShotgunShots = ShotgunShots + 1
			if(ShotgunShots == 10) then
				ShotgunShots = 0
				triggerServerEvent("onPlayerUpSkill", localPlayer, 2)
			end
		elseif(weapon == 30) then
			Ak47Shots = Ak47Shots + 1
			if(Ak47Shots == 120) then
				Ak47Shots = 0
				triggerServerEvent("onPlayerUpSkill", localPlayer, 3)
			end
		elseif(weapon == 31) then
			M4Shots = M4Shots + 1
			if(M4Shots == 120) then
				M4Shots = 0
				triggerServerEvent("onPlayerUpSkill", localPlayer, 4)
			end
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