local red1 = 255
local blue1 = 255
local green1 = 255

local red2 = 255
local blue2 = 255
local green2 = 255

local red3 = 255
local blue3 = 255
local green3 = 255

local place1 = 1
local place2 = 2
local place3 = 3

local placed = false
local fistTime = true

local place1RedCapured = false
local place2RedCapured = false
local place3RedCapured = false

local place1BlueCapured = false
local place2BlueCapured = false
local place3BlueCapured = false

local blueTeam = {}
local redTeam = {}

local blueLive = 10
local redLive = 10

function placeCapPoint()
	if fistTime then
		TriggerClientEvent('bf:placeVeh', source)
		fistTime = false
	end
	if not placed then
		placed = true
		red1 = 255
		blue1 = 255
		green1 = 255

		red2 = 255
		blue2 = 255
		green2 = 255

		red3 = 255
		blue3 = 255
		green3 = 255

		blueLive = 10 + (#blueTeam * 10)
		redLive = 10 + (#redTeam * 10)

		place1RedCapured = false
		place2RedCapured = false
		place3RedCapured = false

		place1BlueCapured = false
		place2BlueCapured = false
		place3BlueCapured = false

		place1 = math.random(19,43)
		place2 = math.random(19,43)
		place3 = math.random(19,43)

		if place1 == place2 or place1 == place3 then
			place1 = math.random(19,43)
		end
		if place2 == place3 then
			place2 = math.random(19,43)
		end

		print("Place1: "..place1)
		print("Place2: "..place2)
		print("Place3: "..place3)
		TriggerClientEvent('bf:placeCap', -1, place1, place2, place3, red1, green1, blue1, red2, green2, blue2, red3, green3, blue3, redLive, blueLive)
		print("Position Placée")
	end
end

RegisterServerEvent('bf:changeTeam')
AddEventHandler('bf:changeTeam', function()
	if redTeam[source] then
		redTeam[source] = nil
		redLive = redLive - 10 
		blueTeam[source] = true
		TriggerClientEvent('bf:blueTeam', source)
		blueLive = blueLive + 10
		TriggerClientEvent('bf:majScore', -1, redLive, blueLive)
	elseif blueTeam[source] then
		blueTeam[source] = nil
		blueLive = blueLive - 10
		redTeam[source] = true
		TriggerClientEvent('bf:redTeam', source)
		redLive = redLive + 10 
		TriggerClientEvent('bf:majScore', -1, redLive, blueLive)
	end
end)


RegisterServerEvent('bf:plyDead')
AddEventHandler('bf:plyDead', function()
	if redTeam[source] then
		redLive = redLive - 1
		TriggerClientEvent('bf:majScore', -1, redLive, blueLive)
		if redLive <= 0 then
			TriggerClientEvent('bf:spetator', source)
		elseif redLive > 0 then
			TriggerClientEvent('bf:selectClass', source)
		end
	end
	if blueTeam[source] then
		blueLive = blueLive - 1
		TriggerClientEvent('bf:majScore', -1, redLive, blueLive)
		if blueLive <= 0 then
			TriggerClientEvent('bf:spetator', source)
		elseif redLive > 0 then
			TriggerClientEvent('bf:selectClass', source)
		end
	end
end)

RegisterServerEvent('bf:firstJoin')
AddEventHandler('bf:firstJoin', function()
	if #blueTeam == #redTeam then
		if redTeam[source] then
			redTeam[source] = nil
		end
		if not blueTeam[source] then
			blueTeam[source] = true 
			blueLive = blueLive + 10
			TriggerClientEvent('chatMessage', source, '', { 0, 0, 0 }, "Serveur: Tu es dans l'équipe ^4 Bleu "..source )
			TriggerClientEvent('bf:blueTeam', source)
		end
	elseif #blueTeam ~= #redTeam then
		if blueTeam[source] then
			blueTeam[source] = nil
		end
		if not redTeam[source] then
			redTeam[source] = true
			redLive = redLive + 10 
			TriggerClientEvent('chatMessage', source, '', { 0, 0, 0 }, "Serveur: Tu es dans l'équipe ^1 Rouge" )
			TriggerClientEvent('bf:redTeam', source)
		end
	end
	if not placed then
		placeCapPoint()
		TriggerClientEvent('bf:selectClass', source)
	else
		TriggerClientEvent('bf:placeCap', -1, place1, place2, place3, red1, green1, blue1, red2, green2, blue2, red3, green3, blue3, redLive, blueLive)
		TriggerClientEvent('bf:selectClass', source)
	end
	print("firstJoin: ok")
	TriggerClientEvent('bf:majScore', -1, redLive, blueLive)
	
end)

RegisterServerEvent('bf:place1Cap')
AddEventHandler('bf:place1Cap', function()
	if blueTeam[source] then
		if blue1 ~= 255 then
			blue1 = blue1 + 1
			green1 = green1 + 1
		elseif blue1 == 255 then
			if red1 ~= 0 then
				red1 = red1 - 1
				green1 = green1 - 1
				place1RedCapured = false
				TriggerClientEvent('chatMessage', -1, '', { 0, 0, 0 }, "Serveur: Zone 1 Capture en cours ^4 Bleu" )
			else
				TriggerClientEvent('chatMessage', -1, '', { 0, 0, 0 }, "Serveur: Zone 1 Capturé par l'équipe ^4 Bleu" )
				place1BlueCapured = true
				TriggerClientEvent('bf:capBlip1Blue', -1)
			end
		end
	end
	if redTeam[source] then
		if red1 ~= 255 then
			red1 = red1 + 1
			green1 = green1 + 1
		elseif red1 == 255 then
			if blue1 ~= 0 then
				blue1 = blue1 - 1
				green1 = green1 - 1
				place1BlueCapured = false
				TriggerClientEvent('chatMessage', -1, '', { 0, 0, 0 }, "Serveur: Zone 1 Capture en cours ^1 Rouge" )
			else 
				TriggerClientEvent('chatMessage', -1, '', { 0, 0, 0 }, "Serveur: Zone 1 Capturé par l'équipe ^1 Rouge" )
				place1RedCapured = true
				TriggerClientEvent('bf:capBlip1Red', -1)
			end
		end
	end
	TriggerClientEvent('bf:place1Col', -1, red1, green1, blue1)
	if place1BlueCapured and place2BlueCapured and place3BlueCapured then
		TriggerClientEvent('chatMessage', -1, '', { 0, 0, 0 }, "Serveur: L'équipe ^4 Bleu a ^0 gagné!" )
		placed = false
		--Wait(5000)
		placeCapPoint()
		TriggerClientEvent('bf:selectClass', -1)

	elseif place1RedCapured and place2RedCapured and place3RedCapured then
		TriggerClientEvent('chatMessage', -1, '', { 0, 0, 0 }, "Serveur: L'équipe ^1 Rouge a ^0 gagné!" )
		placed = false
		--Wait(5000)
		placeCapPoint()
		TriggerClientEvent('bf:selectClass', -1)

	end
end)

RegisterServerEvent('bf:place2Cap')
AddEventHandler('bf:place2Cap', function()
	if blueTeam[source] then
		if blue2 ~= 255 then
			blue2 = blue2 + 1
			green2 = green2 + 1
		elseif blue2 == 255 then
			if red2 ~= 0 then
				red2 = red2 - 1
				green2 = green2 - 1
				place2RedCapured = false
				TriggerClientEvent('chatMessage', -1, '', { 0, 0, 0 }, "Serveur: Zone 2 Capture en cours ^4 Bleu" )
			else
				TriggerClientEvent('chatMessage', -1, '', { 0, 0, 0 }, "Serveur: Zone 2 Capturé par l'équipe ^4 Bleu" )
				place2BlueCapured = true
			end
		end
	end
	if redTeam[source] then
		if red2 ~= 255 then
			red2 = red2 + 1
			green2 = green2 + 1
		elseif red2 == 255 then
			if blue2 ~= 0 then
				blue2 = blue2 - 1
				green2 = green2 - 1
				place2BlueCapured = false
				TriggerClientEvent('chatMessage', -1, '', { 0, 0, 0 }, "Serveur: Zone 2 Capture en cours ^1 Rouge" )
			else 
				TriggerClientEvent('chatMessage', -1, '', { 0, 0, 0 }, "Serveur: Zone 2 Capturé par l'équipe ^1 Rouge" )
				place2RedCapured = true
			end
		end
	end
	TriggerClientEvent('bf:place2Col', -1, red2, green2, blue2)
	if place1BlueCapured and place2BlueCapured and place3BlueCapured then
		TriggerClientEvent('chatMessage', -1, '', { 0, 0, 0 }, "Serveur: L'équipe ^4 Bleu a ^0 gagné!" )
		placed = false
		--Wait(5000)
		placeCapPoint()
		TriggerClientEvent('bf:selectClass', -1)

	elseif place1RedCapured and place2RedCapured and place3RedCapured then
		TriggerClientEvent('chatMessage', -1, '', { 0, 0, 0 }, "Serveur: L'équipe ^1 Rouge a ^0 gagné!" )
		placed = false
		--Wait(5000)
		placeCapPoint()
		TriggerClientEvent('bf:selectClass', -1)

	end
end)

RegisterServerEvent('bf:place3Cap')
AddEventHandler('bf:place3Cap', function()
	if blueTeam[source] then
		if blue3 ~= 255 then
			blue3 = blue3 + 1
			green3 = green3 + 1
		elseif blue3 == 255 then
			if red3 ~= 0 then
				red3 = red3 - 1
				green3 = green3 - 1
				place3RedCapured = false
				TriggerClientEvent('chatMessage', -1, '', { 0, 0, 0 }, "Serveur: Zone 3 Capture en cours ^4 Bleu" )
			else
				TriggerClientEvent('chatMessage', -1, '', { 0, 0, 0 }, "Serveur: Zone 3 Capturé par l'équipe ^4 Bleu" )
				place3BlueCapured = true
			end
		end
	end
	if redTeam[source] then
		if red3 ~= 255 then
			red3 = red3 + 1
			green3 = green3 + 1
		elseif red3 == 255 then
			if blue3 ~= 0 then
				blue3 = blue3 - 1
				green3 = green3 - 1
				place3BlueCapured = false
				TriggerClientEvent('chatMessage', -1, '', { 0, 0, 0 }, "Serveur: Zone 3 Capture en cours ^1 Rouge" )
			else
				TriggerClientEvent('chatMessage', -1, '', { 0, 0, 0 }, "Serveur: Zone 3 Capturé par l'équipe ^1 Rouge" )
				place3RedCapured = true
			end
		end
	end
	TriggerClientEvent('bf:place3Col', -1, red3, green3, blue3)
	if place1BlueCapured and place2BlueCapured and place3BlueCapured then
		TriggerClientEvent('chatMessage', -1, '', { 0, 0, 0 }, "Serveur: L'équipe ^4 Bleu a ^0 gagné!" )
		placed = false
		--Wait(5000)
		placeCapPoint()
		TriggerClientEvent('bf:selectClass', -1)

	elseif place1RedCapured and place2RedCapured and place3RedCapured then
		TriggerClientEvent('chatMessage', -1, '', { 0, 0, 0 }, "Serveur: L'équipe ^1 Rouge a ^0 gagné!" )
		placed = false
		--Wait(5000)
		placeCapPoint()
		TriggerClientEvent('bf:selectClass', -1)

	end
end)

AddEventHandler('playerDropped', function()
	if blueTeam[source] then
		blueTeam[source] = nil
		blueLive = blueLive - 10 
	elseif redTeam[source] then
		redTeam[source] = nil
		redLive = redLive - 10 
	end
	TriggerClientEvent('bf:majScore', -1, redLive, blueLive)
end)

--Empeche simplement que trop de joueurs de connectent
AddEventHandler('playerConnecting', function(name, setReason)
	print('Connecting: ' .. name)

	if playerCount >= 24 then
		print('Full. :(')
		setReason('This server is full (past 24 players).')
		CancelEvent()
	end
end)

RegisterServerEvent('bf:gunshotInProgressPos')
AddEventHandler('bf:gunshotInProgressPos', function(gx, gy, gz)
	TriggerClientEvent('bf:gunshotPlace', -1, gx, gy, gz)
end)