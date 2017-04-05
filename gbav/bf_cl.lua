local placed = false

local re1 = 255
local re2 = 255
local re3 = 255

local ge1 = 255
local ge2 = 255
local ge3 = 255

local be1 = 255
local be2 = 255
local be3 = 255

local capZone1 = 0
local capZone2 = 0
local capZone3 = 0

local ready = false

local playerBlue = false
local playerRed = false

local blipColor1 = 0
local blipColor2 = 0
local blipColor3 = 0

local blueLive = 0
local redLive = 0

local fpv = false

local vehPlace = {
	{-1716.41491699219,-503.871643066406,37.510311126709,134.671585083008},
	{-1537.81494140625,-649.959838867188,28.4416961669922,177.585220336914},
	{-1315.56079101563,-774.653686523438,19.3924312591553,216.263580322266},
	{-1234.52404785156,-999.468872070313,4.38893032073975,2.60956883430481},
	{-1133.04565429688,-1205.001953125,1.69255089759827,29.323974609375},
	{-818.642456054688,-1058.66015625,12.179726600647,303.109039306641},
	{-870.481994628906,-893.331787109375,15.3677988052368,225.233551025391},
	{-1064.65625,-699.882751464844,21.3444499969482,303.376495361328},
	{-1207.22302246094,-434.776275634766,33.0682411193848,309.580139160156},
	{-1351.11206054688,-402.857147216797,35.9140853881836,126.464248657227},
	{-1517.60461425781,-189.069519042969,53.717155456543,54.5469779968262},
	{-1328.27563476563,-76.3801956176758,48.6511001586914,351.591003417969},
	{-1077.00903320313,-192.52668762207,37.1787948608398,269.859832763672},
	{-859.589721679688,-262.365356445313,39.2776947021484,126.465782165527},
	{-945.952087402344,-499.271575927734,36.1285133361816,294.704040527344},
	{-693.062927246094,-632.963012695313,31.0765075683594,179.067031860352},
	{-574.655578613281,-854.671875,25.9085903167725,355.673095703125},
	{-273.129791259766,-884.762451171875,30.7052230834961,331.63818359375},
	{-265.272888183594,-616.102416992188,32.7994918823242,265.079681396484},
	{-96.9162368774414,-590.328002929688,35.6047554016113,298.996337890625},
	{-27.3748245239258,-726.548950195313,32.1734352111816,161.029510498047},
	{163.667419433594,-782.144470214844,31.0940227508545,188.144073486328},
	{278.939392089844,-606.233520507813,42.5656471252441,83.7102432250977},
	{-82.875846862793,-1022.33758544922,27.8205661773682,246.495300292969},
	{214.795379638672,-991.460083007813,28.6546363830566,229.904296875},
	{392.059509277344,-904.647155761719,28.9380626678467,267.404876708984},
	{455.750244140625,-691.871520996094,27.3446674346924,357.973937988281},
	{14.293438911438,-398.140502929688,39.0746841430664,101.322814941406},
	{196.714492797852,-275.535125732422,48.3882598876953,250.291015625},
	{-72.6758270263672,-180.997100830078,50.0045509338379,55.9565734863281},
	{-44.4184646606445,83.57763671875,73.9271392822266,250.935150146484},
	{171.410263061523,145.898986816406,100.355476379395,251.100036621094},
	{352.717163085938,74.8239593505859,97.2079238891602,65.2503280639648},
	{94.3901977539063,-30.7767162322998,67.5734558105469,343.04345703125},
	{273.797729492188,-143.630630493164,64.9865264892578,71.8207168579102},
	{332.644195556641,-423.700592041016,44.2008361816406,122.378433227539},
	{-330.690673828125,-323.890441894531,30.3325748443604,162.280960083008},
	{-520.292846679688,-395.606140136719,34.5783920288086,359.656158447266},
	{-651.34033203125,-115.469360351563,37.3471641540527,99.2345199584961},
	{-413.977691650391,-80.5591430664063,41.7438545227051,45.6100883483887},
	{464.8916015625,-1121.45520019531,28.8244705200195,179.481994628906},
	{279.25830078125,-1419.34387207031,28.9339752197266,52.8894119262695},
	{24.7856597900391,-1456.82360839844,29.9832592010498,129.639038085938},
	{-86.4300537109375,-1262.62915039063,28.819709777832,93.0297241210938},
	{-296.166320800781,-1327.65490722656,30.8192386627197,257.751098632813},
	{-354.505157470703,-1621.51586914063,19.0634365081787,155.399200439453},
	{-182.298599243164,-1758.82141113281,29.4125537872314,231.643630981445},
	{313.129486083984,-1711.9384765625,28.8410968780518,320.961639404297},
	{228.640579223633,-1880.11120605469,25.6347846984863,219.651809692383},
	{373.560211181641,-1971.41735839844,23.7628345489502,273.969665527344},
	{519.189208984375,-1657.57116699219,28.7786540985107,139.480270385742},
	{752.30517578125,-1726.048828125,28.9440040588379,222.458694458008},
	{989.751770019531,-1777.87158203125,30.8593826293945,12.3263101577759},
	{934.243774414063,-1949.64660644531,30.1803379058838,242.353454589844},
	{968.934326171875,-1454.43933105469,30.7493057250977,355.5068359375},
	{778.327331542969,-1219.97192382813,25.868989944458,256.301086425781},
	{767.255493164063,-1045.11206054688,26.1826324462891,273.531005859375},
	{751.085876464844,-877.883422851563,24.5846099853516,268.951843261719},
	{-287.276550292969,-1111.49060058594,22.641788482666,248.252319335938},
	{-676.311950683594,-1212.06921386719,10.116415977478,123.260810852051},
	{-1039.50268554688,-1558.50012207031,4.60759878158569,302.499237060547},
	{-1172.01489257813,-1407.85400390625,3.96807718276978,202.118637084961},
}

local chekPointBF = {
	{-2305.42993164063,3126.28247070313,32.5363006591797},
	{-1155.25671386719,4922.35302734375,221.735321044922},
	{-551.157531738281,5305.58203125,81.6729354858398},
	{501.103393554688,5593.2392578125,795.415283203125},
	{72.5872268676758,6523.68017578125,31.2918586730957},
	{2216.39428710938,5597.95703125,53.8238334655762},
	{3315.51123046875,5168.24072265625,18.4152221679688},
	{3796.37182617188,4462.32861328125,5.01826763153076},
	{3553.65966796875,3722.244140625,37.0692100524902},
	{2953.26049804688,2797.17138671875,40.7336311340332},
	{2019.92761230469,2901.49145507813,48.476634979248},
	{1688.89086914063,2605.56713867188,45.2812042236328},
	{1384.94909667969,3137.7529296875,40.5826797485352},
	{290.961120605469,2863.40649414063,43.6424217224121},
	{734.404174804688,1295.38415527344,360.012908935547},
	{657.951416015625,552.98828125,129.621215820313},
	{2767.99951171875,1513.69873046875,24.5005741119385},
	{2549.11791992188,-384.141845703125,92.7084121704102},
	{1535.8876953125,-2095.86865234375,76.8133773803711},
	{1017.12945556641,-3004.47021484375,5.61737680435181},
	{-1333.10034179688,-3046.40991210938,13.6608724594116},
	{-1836.59362792969,-1221.35949707031,12.7342309951782},
	{-2240.17504882813,265.974700927734,174.615493774414},
	{-1551.29772949219,118.572059631348,56.6403007507324},
	{-427.420013427734,1116.31481933594,326.78271484375},
	{371.600372314453,42.4482803344727,93.3451919555664},
	{1028.0087890625,-319.175720214844,49.2897415161133},
	{1365.92834472656,-579.942749023438,74.0934066772461},
	{970.103698730469,-1624.22229003906,30.1106929779053},
	{499.420043945313,-2160.77001953125,5.63377952575684},
	{-272.081909179688,-1905.79260253906,27.7554397583008},
	{-533.651977539063,-1682.11206054688,19.1376132965088},
	{-399.084747314453,-2335.10791015625,63.5958976745605},
	{-937.034301757813,-1260.50268554688,7.79446077346802},
	{-1126.17761230469,-964.728637695313,2.15019464492798},
	{-1314.56018066406,-662.228149414063,26.2820816040039},
	{-826.501342773438,-113.28572845459,37.5029907226563},
	{-1047.69384765625,785.275146484375,167.243865966797},
	{43.201244354248,-392.647827148438,55.2849273681641},
	{56.9707450866699,-707.823669433594,30.92551612854},
	{-167.022888183594,-1074.091796875,18.6852970123291},
	{-745.113464355469,-834.701538085938,22.3992767333984},
	{350.880279541016,-587.370056152344,43.3150177001953}
}

local stratPoint = {
	{-75.1452, -818.625, 325.176},
	{323.839,-209.899,54.086},
	{-1113.139,-309.137,37.661}
}

local chekPointBF2 = {
    {-3099.834,1267.301,20.220},
	{-3095.425,1295.823,20.202},
	{-3089.397,1315.935,20.203}
}

local place0 = stratPoint[1]
local place1 = chekPointBF[1]
local place2 = chekPointBF[2]
local place3 = chekPointBF[3]
local place4 = stratPoint[1]
local placeR = stratPoint[3]
local placeB = stratPoint[2]

local spawnPlace = 1

local usSkinList = {"BF4UsAssault", "BF4UsEngineer", "BF4UsSniper", "BF4UsSupport"}
blueSkin = usSkinList[1]

local rusSkinList = {"BF4RusAssault", "BF4RusEngineer", "BF4RusSniper", "BF4RusSupport"}
redSkin = rusSkinList[1]

local num = 1

local firstWeaponList = {"WEAPON_PISTOL","WEAPON_HEAVYPISTOL","WEAPON_PROXMINE","WEAPON_STUNGUN", "WEAPON_STICKYBOMB","WEAPON_KNIFE",}
local secondWeaponList = {"WEAPON_ASSAULTSMG","WEAPON_PUMPSHOTGUN","WEAPON_SNIPERRIFLE","WEAPON_RPG", "WEAPON_HOMINGLAUNCHER",}
local grenades = {"WEAPON_GRENADE","WEAPON_SMOKEGRENADE","WEAPON_MOLOTOV","WEAPON_BZGAS"}

local vehBlipPlaced = false


--[[local relationType = {"COP","ARMY"}
local relationNeutral = 3

Citizen.CreateThread(function()
    while true do
        Wait(50)
		
        for _, group in ipairs(relationType) do
            SetRelationshipBetweenGroups(relationNeutral, GetHashKey('PLAYER'), GetHashKey(group))
            SetRelationshipBetweenGroups(relationNeutral, GetHashKey(group), GetHashKey('PLAYER'))
        end
    end
end)]]


local plyPos = GetEntityCoords(GetPlayerPed(-1))



Citizen.CreateThread(function()
    while true do
        Wait(0)
        if NetworkIsSessionStarted() then
        	NetworkSetFriendlyFireOption(true)
			--SetCanAttackFriendly(GetPlayerPed(-1), true, true)
            TriggerServerEvent('bf:firstJoin')
            return
        end
    end
end)

--GetVehiclePedIsTryingToEnter()




function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
	N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
	DrawText(x - 0.1+w, y - 0.02+h)
end

function ShowSkin(skin)
	local usSkinList = {"BF4UsAssault", "BF4UsEngineer", "BF4UsSniper", "BF4UsSupport"}
	local rusSkinList = {"BF4RusAssault", "BF4RusEngineer", "BF4RusSniper", "BF4RusSupport"}
	fpv = false
	if playerBlue then
		plySkin = usSkinList[skin]
	elseif playerRed then
		plySkin = rusSkinList[skin]	
	end
	model = GetHashKey(plySkin)
	RequestModel(model)
	TriggerEvent('chatMessage', '', { 0, 0, 0 }, '^1 Model demandé')
	while not HasModelLoaded(model) do -- Wait for model to load
		Citizen.Wait(0)
	end
	TriggerEvent('chatMessage', '', { 0, 0, 0 }, '^1 Model chargé '..model)
	classShow = CreatePed(4,  model, place4[1], place4[2], place4[3],  180.0,  false,  true)
	--classShow = CreatePed(4,  model, -72.733, -823.289, 326.175,  180.0,  false,  true)
	TriggerEvent('chatMessage', '', { 0, 0, 0 }, '^1 Ped Créé')
	FreezeEntityPosition(classShow, true)
	--Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(classShow)) -- ENTITY::SET_ENTITY_AS_NO_LONGER_NEEDED
	local weaHash2 = GetHashKey(secondWeaponList[1])
	GiveWeaponToPed(classShow, weaHash2, 1000, 0, false) -- mitralleuse
	SetCurrentPedWeapon(classShow,  weaHash2,  true)
	SetPlayerModel(PlayerId(), model)
	--SetModelAsNoLongerNeeded(model)
end 

RegisterNetEvent('bf:placeVeh')
AddEventHandler('bf:placeVeh', function()
	local armyVehList = {"rhino","rhino","rhino","rhino","buzzard2","buzzard","tiger","tiger","tiger","tiger","tiger","tiger","tiger","tiger","tiger","tiger","tiger","tiger","tiger","tiger","tiger","tiger","tiger","tiger","tiger","tiger"}
	for i = 1, #vehPlace do
		Wait(0)
		local numVeh = GetRandomIntInRange(1, #armyVehList)
		local veh = armyVehList[numVeh]
		local modelVeh = GetHashKey(veh)
		TriggerEvent('chatMessage', '', { 0, 0, 0 }, '^1 Place: '..i)
		TriggerEvent('chatMessage', '', { 0, 0, 0 }, '^1 Vehivle: '..veh)
		local NextVehPlace = vehPlace[i]
		RequestModel(modelVeh)
		while not HasModelLoaded(modelVeh) do -- Wait for model to load
			Citizen.Wait(0)
		end
		militaryVeh = CreateVehicle(modelVeh ,NextVehPlace[1], NextVehPlace[2], NextVehPlace[3], NextVehPlace[4], true, false) --Determiné la voiture a afficher, le 1er fasle permet de la rendre visible que pour le joueur qui l'a généré
		--Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(militaryVeh)) --Préparer la voiture a etre detruite des qu'elle sera hors de vue du joueur 
		--TriggerEvent('chatMessage', '', { 0, 0, 0 }, '^1 Client: Voiture choisie: '..modelVeh)
		SetVehicleOnGroundProperly(militaryVeh) --S'assure que la voiture soit posé normalement aui sol
		SetVehicleHasBeenOwnedByPlayer(militaryVeh, false) --Permet au joueur de la demarrer de suite, ou d'entrer dedans sans la braquer
		local id = NetworkGetNetworkIdFromEntity(militaryVeh) --Aucune idée, mais necessaire a ce que j'ai compris
		SetNetworkIdCanMigrate(id, true)
		if i == #vehPlace then return end
	end
	--future code to place car on the map
	TriggerEvent('chatMessage', '', { 0, 0, 0 }, '^1 Vehicle Placed')
end)

Citizen.CreateThread(function()
	while true do
		for i = 1, #vehPlace do
			local NextVehPlace = vehPlace[i]
			vehBlip = AddBlipForCoord(NextVehPlace[1], NextVehPlace[2], NextVehPlace[3])
			SetBlipSprite(vehBlip,  426) --426->tiger, 421->tank, 64->Heli
			SetBlipColour(vehBlip,  25) --1=red, 25=dark green
			SetBlipAsShortRange(vehBlip,  true)
			vehBlipPlaced = true
			if i == #vehPlace then
				TriggerEvent('chatMessage', '', { 0, 0, 0 }, '^1 Blip Placed')
			 	return 
			 end
		end
	end
end)

RegisterNetEvent('bf:placePlayer')
AddEventHandler('bf:placePlayer', function()
 	if playerBlue then
 		FreezeEntityPosition(GetPlayerPed(-1),false) --paralyse le joueur
        SetEntityCoords(GetPlayerPed(-1), 323.839,-209.899,54.086, 1, 0, 0, 1)-- TP la voiture a cet entroit
    elseif playerRed then
    	FreezeEntityPosition(GetPlayerPed(-1),false) --paralyse le joueur
        SetEntityCoords(GetPlayerPed(-1), -1113.139,-309.137,37.661, 1, 0, 0, 1)-- TP la voiture a cet entroit
    end

end)

RegisterNetEvent('bf:blueTeam')
AddEventHandler('bf:blueTeam', function()
 	playerBlue = true
 	playerRed = false
 	SetPlayerTeam(PlayerId(),  1)
end)

RegisterNetEvent('bf:redTeam')
AddEventHandler('bf:redTeam', function()
 	playerRed = true
 	playerBlue = false
 	SetPlayerTeam(PlayerId(),  2)
end)

RegisterNetEvent('bf:majScore')
AddEventHandler('bf:majScore', function(redL, blueL)
 	blueLive = blueL
	redLive = redL
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
		DrawRect(0.486, 0.0159999999999999, 0.035, 0.0229999999999999, re1, ge1, be1, 150)
		DrawRect(0.45, 0.0159999999999999, 0.035, 0.0229999999999999, re2, ge2, be2, 150)
		DrawRect(0.522, 0.0159999999999999, 0.035, 0.0229999999999999, re3, ge3, be3, 150)
		DrawRect(0.459, 0.0399999999999999, 0.053, 0.0229999999999999, 255, 0, 0, 150)
		DrawRect(0.513, 0.0399999999999999, 0.053, 0.0229999999999999, 0, 0, 255, 150)
		DrawAdvancedText(0.545, 0.0229999999999995, 0.005, 0.0028, 0.275, "Zone1", 255, 255, 255, 255, 0, 0)
		DrawAdvancedText(0.581, 0.0229999999999995, 0.005, 0.0028, 0.275, "Zone2", 255, 255, 255, 255, 0, 0)
		DrawAdvancedText(0.618, 0.0229999999999995, 0.005, 0.0028, 0.275, "Zone3", 255, 255, 255, 255, 0, 0)
		DrawAdvancedText(0.555, 0.0449999999999996, 0.005, 0.0028, 0.32, ""..redLive.."", 255, 255, 255, 255, 0, 0)
		DrawAdvancedText(0.608, 0.0449999999999996, 0.005, 0.0028, 0.32, ""..blueLive.."", 255, 255, 255, 255, 0, 0)
	end
end)

function selectStartPoint()
	Wait(100)
    SetModelAsNoLongerNeeded(model)
	Citizen.InvokeNative(0x9614299DCB53E54B, Citizen.PointerValueIntInitialized(classShow))
    ShowSkin(num)
    RemoveAllPedWeapons(classShow, true)
	local weaHash2 = GetHashKey(secondWeaponList[num])
	GiveWeaponToPed(classShow, weaHash2, 1000, 0, false) -- mitralleuse
	SetCurrentPedWeapon(classShow,  weaHash2,  true)
	return
end

function setStartPoint()
	if spawnPlace == 1 then
    	if GetPlayerTeam(PlayerId()) == 2 then
    		if capZone1 == 2 then
        		place4 = place1
        		selectStartPoint()
        		placeR = place1
        	end
        end
        if GetPlayerTeam(PlayerId()) == 1 then
		    if capZone1 == 1 then
        		place4 = place1
        		selectStartPoint()
        		placeB = place1
		    end
		end
	end
	if spawnPlace == 2 then
		if GetPlayerTeam(PlayerId()) == 2 then
    		if capZone2 == 2 then
        		place4 = place2
        		selectStartPoint()
        		placeR = place2
        	end
        end
        if GetPlayerTeam(PlayerId()) == 1 then
		    if capZone2 == 1 then
        		place4 = place2
        		selectStartPoint()
        		placeB = place2
        	end
	    end
	end
	if spawnPlace == 3 then
		if GetPlayerTeam(PlayerId()) == 2 then
			if capZone3 == 2 then
        		place4 = place3
        		selectStartPoint()
        		placeR = place3
        	end
	    end
	    if GetPlayerTeam(PlayerId()) == 1 then
	    	if capZone3 == 1 then
        		place4 = place3
        		selectStartPoint()
        		placeB = place3
        	end
	    end
	end

	if spawnPlace == 4 then
		place4 = place0
		selectStartPoint()
	end
end

RegisterNetEvent('bf:selectClass')
AddEventHandler('bf:selectClass', function()
    fpv = false
    ready = false
    Wait(500)
    ShowSkin(num)
    SetEntityHealth(GetPlayerPed(-1), 200)
    
    while true do
        Citizen.Wait(0)
        if not ready then
        	if playerRed then
	        	if num == 1 then
	        		DrawAdvancedText(0.5, 0.104, 0.005, 0.0028, 1.963, "Assault", 180, 0, 0, 255, 2, 0)
	        	elseif num == 2 then
	        		DrawAdvancedText(0.5, 0.104, 0.005, 0.0028, 1.963, "Ingernieur", 180, 0, 0, 255, 2, 0)
	        	elseif num == 3 then
	        		DrawAdvancedText(0.5, 0.104, 0.005, 0.0028, 1.963, "Sniper", 180, 0, 0, 255, 2, 0)
	        	elseif num == 4 then
	        		DrawAdvancedText(0.5, 0.104, 0.005, 0.0028, 1.963, "Support", 180, 0, 0, 255, 2, 0)
	        	end
	        elseif playerBlue then
	        	if num == 1 then
	        		DrawAdvancedText(0.5, 0.104, 0.005, 0.0028, 1.963, "Assault", 0, 0, 180, 255, 2, 0)
	        	elseif num == 2 then
	        		DrawAdvancedText(0.5, 0.104, 0.005, 0.0028, 1.963, "Ingernieur", 0, 0, 180, 255, 2, 0)
	        	elseif num == 3 then
	        		DrawAdvancedText(0.5, 0.104, 0.005, 0.0028, 1.963, "Sniper", 0, 0, 180, 255, 2, 0)
	        	elseif num == 4 then
	        		DrawAdvancedText(0.5, 0.104, 0.005, 0.0028, 1.963, "Support", 0, 0, 180, 255, 2, 0)
	        	end
	        end

            --Choosing class
            if IsControlJustPressed(1,190) and num < 4 then --Fleche droite
            	SetModelAsNoLongerNeeded(model)
            	Citizen.InvokeNative(0x9614299DCB53E54B, Citizen.PointerValueIntInitialized(classShow))
                num = num + 1 
                ShowSkin(num)
                RemoveAllPedWeapons(classShow, true)
		    	local weaHash2 = GetHashKey(secondWeaponList[num])
		    	GiveWeaponToPed(classShow, weaHash2, 1000, 0, false) -- mitralleuse
		    	SetCurrentPedWeapon(classShow,  weaHash2,  true)
            end

            if IsControlJustPressed(1,189) and num > 1 then --Fleche gauche
            	SetModelAsNoLongerNeeded(model)
            	Citizen.InvokeNative(0x9614299DCB53E54B, Citizen.PointerValueIntInitialized(classShow))
                num = num - 1
                ShowSkin(num)
                RemoveAllPedWeapons(classShow, true)
		    	local weaHash2 = GetHashKey(secondWeaponList[num])
		    	GiveWeaponToPed(classShow, weaHash2, 1000, 0, false) -- mitralleuse
		    	SetCurrentPedWeapon(classShow,  weaHash2,  true)
            end


            --Changing point
            
            if IsControlJustPressed(1,187) and spawnPlace > 0 then --down
            	spawnPlace = spawnPlace - 1
            	setStartPoint()
            end
            if IsControlJustPressed(1,188) and spawnPlace < 4 then --up
            	spawnPlace = spawnPlace + 1
            	setStartPoint()
            end

            --Changing team
            if IsControlJustPressed(1,206) or IsControlJustPressed(1,205) then --RB or LB
            	TriggerServerEvent('bf:changeTeam')
            	selectStartPoint()
            end
            --Tant que rien n'est validé, afficher la voiture
            if IsControlJustPressed(1,201) then -- 201 correspond a "Valider" soit "Enter" ou "A" sur une manette
                Wait(500)
                fpv = true
                ready = true --passe le joueur en pret
                TriggerEvent('chatMessage', '', { 0, 0, 0 }, '^1 Client: Entrer Validé')
                Wait(500)
                Citizen.InvokeNative(0x9614299DCB53E54B, Citizen.PointerValueIntInitialized(classShow))
                SetEntityVisible(GetPlayerPed(-1),true) --le rend visible
                local randomplace = GetRandomIntInRange(-3,  3)
                if playerBlue then
			 		FreezeEntityPosition(GetPlayerPed(-1),false) --déparalyse le joueur
			        SetEntityCoords(GetPlayerPed(-1), placeB[1]+randomplace,placeB[2]+randomplace,placeB[3], 1, 0, 0, 1)-- TP le joueur a cet entroit
			    elseif playerRed then
			    	FreezeEntityPosition(GetPlayerPed(-1),false) --déparalyse le joueur
			        SetEntityCoords(GetPlayerPed(-1), placeR[1]+randomplace,placeR[2]+randomplace,placeR[3], 1, 0, 0, 1)-- TP le joueur a cet entroit
			    end
			    SetEntityMaxHealth(GetPlayerPed(-1), 200)
				SetEntityHealth(GetPlayerPed(-1), 200)
			    Wait(500)
			    RemoveAllPedWeapons(GetPlayerPed(-1), true)
			    local grenade1 = GetHashKey(grenades[1])
			    local grenade2 = GetHashKey(grenades[2])
			    local grenade3 = GetHashKey(grenades[3])
			    local grenade4 = GetHashKey(grenades[4])
			    if num == 1 then -- assault
			    	local weaHash1 = GetHashKey(firstWeaponList[1])
			    	local weaHash2 = GetHashKey(secondWeaponList[1])
			    	local weaHash3 = GetHashKey(firstWeaponList[6])
			    	GiveWeaponToPed(GetPlayerPed(-1), weaHash1, 1000, 0, false) -- pistolet
			    	GiveWeaponToPed(GetPlayerPed(-1), weaHash2, 1000, 0, false) -- mitralleuse
			    	GiveWeaponToPed(GetPlayerPed(-1), weaHash3, 1000, 0, false) -- couteau
			    	--test
			    	GiveWeaponToPed(GetPlayerPed(-1), grenade1, 2, 0, false) -- grenades
			    	GiveWeaponToPed(GetPlayerPed(-1), grenade2, 2, 0, false) -- grenades
			    	GiveWeaponToPed(GetPlayerPed(-1), grenade3, 2, 0, false) -- grenades
			    	GiveWeaponToPed(GetPlayerPed(-1), grenade4, 2, 0, false) -- grenades
			    	--test
			    	GiveWeaponComponentToPed(GetPlayerPed(-1),  weaHash2,  0x9D2FBF29) -- Scope
		    	elseif num == 2 then -- ingenieur
		    		local weaHash1 = GetHashKey(firstWeaponList[2])
			    	local weaHash2 = GetHashKey(secondWeaponList[2])
			    	local weaHash3 = GetHashKey(firstWeaponList[6])
		    		GiveWeaponToPed(GetPlayerPed(-1), weaHash1, 1000, 0, false) -- pistolet ++
			    	GiveWeaponToPed(GetPlayerPed(-1), weaHash2, 1000, 0, false) -- shotgun
			    	GiveWeaponToPed(GetPlayerPed(-1), weaHash3, 1000, 0, false) -- couteau
		    	elseif num == 3 then -- sinper
		    		local weaHash1 = GetHashKey(firstWeaponList[1])
			    	local weaHash2 = GetHashKey(secondWeaponList[3])
			    	local weaHash3 = GetHashKey(firstWeaponList[3])
			    	GiveWeaponToPed(GetPlayerPed(-1), weaHash1, 1000, 0, false) -- pistolet
		    		GiveWeaponToPed(GetPlayerPed(-1), weaHash2, 1000, 0, false) -- mine de proximité
			    	GiveWeaponToPed(GetPlayerPed(-1), weaHash3, 1000, 0, false) -- sniper
			    	GiveWeaponComponentToPed(GetPlayerPed(-1),  weaHash3,  0xBC54DA77) -- Better Scope
		    	elseif num == 4 then -- support
		    		local weaHash1 = GetHashKey(firstWeaponList[4])
			    	local weaHash2 = GetHashKey(secondWeaponList[4])
			    	local weaHash3 = GetHashKey(firstWeaponList[5])
			    	GiveWeaponToPed(GetPlayerPed(-1), weaHash1, 1000, 0, false) --Pistolet paralysant
		    		GiveWeaponToPed(GetPlayerPed(-1), weaHash2, 1000, 0, false) --RPG
			    	GiveWeaponToPed(GetPlayerPed(-1), weaHash3, 1000, 0, false) --C4
		    	end
		    	ready = true
            else
                FreezeEntityPosition(GetPlayerPed(-1), true) --paralyse le joueur
                SetEntityVisible(GetPlayerPed(-1), false) --le rend invisible
                SetEntityCoords(GetPlayerPed(-1), place4[1], place4[2], place4[3], 1, 0, 0, 1)-- TP le joueur sur le toit de la grande tour
            end
        else return end
    end
end)

--[[RegisterNetEvent('bf:playerModel')
AddEventHandler('bf:playerModel', function()
	skinName = blueSkin
	local model = GetHashKey(skinName)
	
	RequestModel(model)
	while not HasModelLoaded(model) do -- Wait for model to load
		RequestModel(model)
		Citizen.Wait(0)
	end
	
	SetPlayerModel(PlayerId(), model)
	SetModelAsNoLongerNeeded(model)
end)]]


RegisterNetEvent('bf:place1Col')
AddEventHandler('bf:place1Col', function(red1, green1, blue1)
	re1 = red1
	ge1 = green1
	be1 = blue1
	
end)

RegisterNetEvent('bf:place2Col')
AddEventHandler('bf:place2Col', function(red2, green2, blue2)
	re2 = red2
	ge2 = green2
	be2 = blue2
	
end)

RegisterNetEvent('bf:place3Col')
AddEventHandler('bf:place3Col', function(red3, green3, blue3)
	re3 = red3
	ge3 = green3
	be3 = blue3
	
end)

local sprBlip1 = 2
local sprBlip2 = 2
local sprBlip3 = 2

RegisterNetEvent('bf:placeCap')
AddEventHandler('bf:placeCap', function(placecap1, placecap2, placecap3, red1, green1, blue1, red2, green2, blue2, red3, green3, blue3, redL, blueL)
	place1 = chekPointBF[placecap1]
	place2 = chekPointBF[placecap2]
	place3 = chekPointBF[placecap3]
	placed = true
	TriggerEvent('chatMessage', '', { 0, 0, 0 }, '^1 Client: Points placés')

	blueLive = blueL
	redLive = redL

----Met en place les couleur des zones a capturer
	re1 = red1
	ge1 = green1
	be1 = blue1
	re2 = red2
	ge2 = green2
	be2 = blue2
	re3 = red3
	ge3 = green3
	be3 = blue3

------ place les blips sur la map
	SetBlipCoords(capBlip1, place1[1], place1[2], place1[3])
	SetBlipSprite(capBlip1, 2)
	SetBlipColour(capBlip1, 0)
	Wait(200)
	capBlip1 = AddBlipForCoord(place1[1], place1[2], place1[3])
	local sprBlip1 = 58
	SetBlipSprite(capBlip1, sprBlip1)
    SetBlipColour(capBlip1, blipColor1)
    SetBlipAsShortRange(capBlip1, false)

	SetBlipCoords(capBip2, place2[1], place2[2], place2[3])
	SetBlipSprite(capBlip2, 2)
	SetBlipColour(capBlip2, 0)
	Wait(200)
	capBlip2 = AddBlipForCoord(place2[1], place2[2], place2[3])
	local sprBlip2 = 58
	SetBlipSprite(capBlip2, sprBlip2)
    SetBlipColour(capBlip2, blipColor2)
    SetBlipAsShortRange(capBlip2, false)

    SetBlipCoords(capBlip3, place3[1], place3[2], place3[3])
    SetBlipSprite(capBlip3, 2)
    SetBlipColour(capBlip3, 0)
	Wait(200)
	capBlip3 = AddBlipForCoord(place3[1], place3[2], place3[3])
	local sprBlip3 = 58
	SetBlipSprite(capBlip3, sprBlip3)
    SetBlipColour(capBlip3, blipColor3)
    SetBlipAsShortRange(capBlip3, false)

end)

--send an info to the server that the player actually shoot
Citizen.CreateThread( function()
    while true do
        Wait(0)
        if IsPedShooting(GetPlayerPed(-1)) then
        	local shotPos = GetEntityCoords(GetPlayerPed(-1),  true)
            TriggerServerEvent('bf:gunshotInProgressPos', shotPos.x, shotPos.y, shotPos.z)
            Wait(3000)
        end
    end
end)

--show a blip where the player have shooted
RegisterNetEvent('bf:gunshotPlace')
AddEventHandler('bf:gunshotPlace', function(gx, gy, gz)
    local transG = 255
    local thiefBlip = AddBlipForCoord(gx, gy, gz)
    SetBlipSprite(thiefBlip,  373)
    SetBlipColour(thiefBlip,  1)
    SetBlipAlpha(thiefBlip,  transG)
    SetBlipScale(thiefBlip,  0.5)
    SetBlipAsShortRange(thiefBlip,  1)
    Wait(500)
    while transG ~= 0 do
        Wait(10)
        transG = transG - 1
        SetBlipAlpha(thiefBlip,  transG)
    end
    if transG == 0 then
        return end
end)


local function DrawPlayerName(n, r, g, b)
    SetTextFont( 0 )
    SetTextProportional(0)
    SetTextScale( 0.3000, 0.3000 )
    N_0x4e096588b13ffeca(0)
    SetTextColour( r, g, b, 255 )
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(5, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry( "STRING" )
    AddTextComponentString( n )
    DrawText( 0.5, 0.5 )
end


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
	    for i = 0, 31 do
			local gamerTagId = Citizen.InvokeNative(0xBFEFE3321A3F5015, GetPlayerPed(i), GetPlayerName(i), false, false, "", 0 ) --tostring(GetPlayerName(GetPlayerPed(i)))
	    	if GetPlayerTeam(PlayerId()) == 1 then
	    		if GetPlayerTeam(i) == 1 then
					SetPedAsEnemy(GetPlayerPed(i),  false)
					if IsEntityVisible(GetPlayerPed(i)) then
						Citizen.InvokeNative(0x63BB75ABEDC1F6A0, gamerTagId, 0, true) --Active gamerTagId
				    	Citizen.InvokeNative(0x613ED644950626AE, gamerTagId, 0, 1)
				    end
				    if IsPlayerFreeAimingAtEntity(PlayerId(),  GetPlayerPed(i)) or IsPlayerFreeAimingAtEntity(PlayerId(), GetVehiclePedIsIn(GetPlayerPed(i),  false) ) then
				    	local plyLive = tostring( GetEntityHealth(GetPlayerPed(i)) )
				    	DrawPlayerName(GetPlayerName(i).." Live: "..plyLive, 0, 0, 255) 
				    end
					--SetPedRelationshipGroupHash(GetPlayerPed(i), GetHashKey("PLAYER"))
				end
				if GetPlayerTeam(i) == 2 then
					SetPedAsEnemy(GetPlayerPed(i),  true)
					if IsPlayerFreeAimingAtEntity(PlayerId(),  GetPlayerPed(i)) or IsPlayerFreeAimingAtEntity(PlayerId(), GetVehiclePedIsIn(GetPlayerPed(i),  false) ) then
				    	DrawPlayerName(GetPlayerName(i), 0, 0, 255)
					end
					--SetPedRelationshipGroupHash(GetPlayerPed(i), GetHashKey("HATES_PLAYER"))
				end
			elseif GetPlayerTeam(PlayerId()) == 2 then
	    		if GetPlayerTeam(i) == 2 then
					SetPedAsEnemy(GetPlayerPed(i),  false)
					if IsEntityVisible(GetPlayerPed(i)) then
						Citizen.InvokeNative(0x63BB75ABEDC1F6A0, gamerTagId, 0, true) --Active gamerTagId
				    	Citizen.InvokeNative(0x613ED644950626AE, gamerTagId, 0, 1)
				    end
				    if IsPlayerFreeAimingAtEntity(PlayerId(),  GetPlayerPed(i)) or IsPlayerFreeAimingAtEntity(PlayerId(), GetVehiclePedIsIn(GetPlayerPed(i),  false) ) then
				    	local plyLive = tostring( GetEntityHealth(GetPlayerPed(i)) )
				    	DrawPlayerName(GetPlayerName(i).." Live: "..plyLive, 0, 0, 255) 
				    end
					--SetPedRelationshipGroupHash(GetPlayerPed(i), GetHashKey("PLAYER"))
				end
				if GetPlayerTeam(i) == 1 then
					SetPedAsEnemy(GetPlayerPed(i),  true)
					if IsPlayerFreeAimingAtEntity(PlayerId(),  GetPlayerPed(i)) or IsPlayerFreeAimingAtEntity(PlayerId(), GetVehiclePedIsIn(GetPlayerPed(i),  false) ) then
				    	DrawPlayerName(GetPlayerName(i), 255, 0, 0)
					end
					--SetPedRelationshipGroupHash(GetPlayerPed(i), GetHashKey("HATES_PLAYER"))
				end
			end
		end
	end
end)


--set color of blip on map for team who capture them
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if re1 == 255 and be1 == 0 then
			SetBlipColour(capBlip1, 1)
			capZone1 = 2
			--blipColor1 = 1
		elseif re1 ~= 255 and be1 ~= 255 then
			SetBlipColour(capBlip1, 0)
			capZone1 = 0
			--blipColor1 = 0
		elseif be1 == 255 and re1 == 0 then
			SetBlipColour(capBlip1, 3)
			capZone1 = 1
			--blipColor1 = 3
		end
		if re2 == 255 and be2 == 0 then
			SetBlipColour(capBlip2, 1)
			capZone2 = 2
			--blipColor2 = 1
		elseif re2 ~= 255 and be2 ~= 255 then
			SetBlipColour(capBlip2, 0)
			capZone2 = 0
			--blipColor2 = 0
		elseif be2 == 255 and re2 == 0 then
			SetBlipColour(capBlip2, 3)
			capZone2 = 1
			--blipColor2 = 3
		end
		if re3 == 255 and be3 == 0 then
			SetBlipColour(capBlip3, 1)
			capZone3 = 2
			--blipColor3 = 1
		elseif re3 ~= 255 and be3 ~= 255 then
			SetBlipColour(capBlip3, 0)
			capZone3 = 0
			--blipColor3 = 0
		elseif be3 == 255 and re3 == 0 then
			SetBlipColour(capBlip3, 3)
			capZone3 = 1
			--blipColor3 = 3
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		--Draw the name of the player at the center of the screen
	    for i = 0, 31 do
	    	if IsEntityVisible(GetPlayerPed(i)) then
	    		local gamerTagId = Citizen.InvokeNative(0xBFEFE3321A3F5015, GetPlayerPed(i), GetPlayerName(i), false, false, "", 0 ) --tostring(GetPlayerName(GetPlayerPed(i)))
	    		if IsPlayerFreeAimingAtEntity(PlayerId(),  GetPlayerPed(i)) or IsPlayerFreeAimingAtEntity(PlayerId(), GetVehiclePedIsIn(GetPlayerPed(i),  false) ) then
--[[	    			if GetPlayerTeam(i) ~= GetPlayerTeam(-1) then
	    				SetCanAttackFriendly(GetPlayerPed(-1), true, false)
	    			elseif GetPlayerTeam(i) == GetPlayerTeam(-1) then
	    				SetCanAttackFriendly(GetPlayerPed(-1), false, true)
	    			end]]
			    	if GetPlayerTeam(i) == 1 then
			    		
			    	elseif GetPlayerTeam(i) == 2 then
			    		DrawPlayerName(GetPlayerName(i), 255, 0, 0)
			    	end
			    else
			    	Citizen.InvokeNative(0x63BB75ABEDC1F6A0, gamerTagId, 0, false) --Unactive gamerTagId
			    end
		    end
	    end
	    --If player dead call a plyDead on server
		if IsPedFatallyInjured(GetPlayerPed(-1)) then
			Wait(3000)
			TriggerServerEvent('bf:plyDead')
		end
		--If a player go inside a car, the camera go TPS mode if not, go FPS mode
		if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
			fpv = false
		elseif not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
			if ready then
				fpv = true
			end
		end
		--Put wantedlevel to 0 everytime
		SetEveryoneIgnorePlayer(GetPlayerPed(-1),  true)
		SetPoliceIgnorePlayer(GetPlayerPed(-1),  true)
		if GetPlayerWantedLevel(PlayerId()) ~= 0 then
			SetPlayerWantedLevel(PlayerId(), 0, false) -- Met le niveau de recherche à 5
	        SetPlayerWantedLevelNow(PlayerId(), false) -- Applique le niveau de recherche maintenant
	    end
	    --Draw marker on zone to capture
        if placed then
        	DrawMarker(1, place1[1], place1[2], place1[3]-2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 20.0, 20.0, 500.0, re1, ge1, be1, 70, 0, 0, 2, 0, 0, 0, 0)
			DrawMarker(1, place2[1], place2[2], place2[3]-2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 20.0, 20.0, 500.0, re2, ge2, be2, 70, 0, 0, 2, 0, 0, 0, 0)
			DrawMarker(1, place3[1], place3[2], place3[3]-2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 20.0, 20.0, 500.0, re3, ge3, be3, 70, 0, 0, 2, 0, 0, 0, 0)
		end
		--FPS or not FPS
		if fpv then
			SetFollowPedCamViewMode(4) --FPS
		elseif not fpv then
			SetFollowPedCamViewMode(0) --TPS
		end
	end
end)



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		--Draw marker on zone to capture
		if placed then
			local lPlyCoords = GetEntityCoords(GetPlayerPed(-1), true)
			if IsEntityVisible(GetPlayerPed(-1)) then
				if GetDistanceBetweenCoords(lPlyCoords.x, lPlyCoords.y, lPlyCoords.z,  place1[1],  place1[2],  place1[3],  true) < 10.0 then
					Wait(100)
					TriggerServerEvent('bf:place1Cap')
				end
				if GetDistanceBetweenCoords(lPlyCoords.x, lPlyCoords.y, lPlyCoords.z,  place2[1],  place2[2],  place2[3],  true) < 10.0 then
					Wait(100)
					TriggerServerEvent('bf:place2Cap')
				end
				if GetDistanceBetweenCoords(lPlyCoords.x, lPlyCoords.y, lPlyCoords.z,  place3[1],  place3[2],  place3[3],  true) < 10.0 then
					Wait(100)
					TriggerServerEvent('bf:place3Cap')
				end
	        end
	    end
        --Work in progress -> TP in car
        if IsPedGettingIntoAVehicle(GetPlayerPed(-1)) or IsPedTryingToEnterALockedVehicle(GetPlayerPed(-1)) then
			local enterVeh = GetVehiclePedIsTryingToEnter(GetPlayerPed(1))
			if IsVehicleSeatFree(enterVeh, -1) then
				TaskWarpPedIntoVehicle(GetPlayerPed(1), enterVeh, -1)
				SetVehicleEngineOn(enterVeh, true, true)
			else
				TaskWarpPedIntoVehicle(GetPlayerPed(1), enterVeh, -2)
			end
		end
    end
end)