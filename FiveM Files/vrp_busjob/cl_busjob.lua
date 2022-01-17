local start = vector3(450.67,-582.23,28.5)

local drop = 0
local vehicleSpawncode = "bus"
local bannerForNotification = "busjob"

local drop1 = vector3(-105.04,-610.41,36.07)
local drop2 = vector3(-340.72,-647.68,32.02)
local drop3 = vector3(-571.82,-382.33,34.93)
local drop4 = vector3(-296.87,-265.33,31.96)
local drop5 = vector3(-34.64,-268.82,46.17)
local drop6 = vector3(84.33,-204.17,54.49)
local drop7 = vector3(308.76,-264.9,53.8)
local drop8 = vector3(204.81,-688.35,36.05)
local drop9 = vector3(363.94,-868.29,29.14)
local drop10 = vector3(466.72,-599.09,28.5)

Citizen.CreateThread(function()

    local vehicleHash = GetHashKey(vehicleSpawncode)
	RequestModel(vehicleHash)
	while not HasModelLoaded(vehicleHash) do
		Wait(0)
    end

    if not HasStreamedTextureDictLoaded(bannerForNotification) then
        RequestStreamedTextureDict(bannerForNotification, true)
    end

    local blip = AddBlipForCoord(start)
	SetBlipSprite(blip, 106)
	SetBlipScale(blip, 1.0)
	SetBlipColour(blip, 1)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Bus Driver")
	EndTextCommandSetBlipName(blip)

    while true do
        Citizen.Wait(0)

        if drop == 0 then
            DrawMarker(39, start+1 - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 255, 0, 60, true, false, 2, true)
            if isInArea(start, 2) then
                alert("Press ~INPUT_VEH_HORN~ To start Bus Driver job!")
                if IsControlJustPressed(0, 51) then
                    busjobvehicle = CreateVehicle(vehicleHash, start, 160.0, true, false)
                    SetPedIntoVehicle(GetPlayerPed(-1), busjobvehicle, -1)
                    PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
                    notify("~b~Shift Started!")
                    drop = 1
                end
            end
        end

        if drop == 1 then
            SetNewWaypoint(-105.04,-610.41)
            DrawMarker(2, drop1+1 - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 60 , true, false, 2, true)
            if isInArea(drop1, 15) then
                SetVehicleEngineOn(busjobvehicle, false, true, true)
                SetVehicleDoorOpen(busjobvehicle, 1, false, false)
                Wait(5000)
                SetVehicleEngineOn(busjobvehicle, true, true, true)
                SetVehicleDoorShut(busjobvehicle, 1, false)
                TriggerServerEvent("BusJob:Paycheck")
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
                drop = 2
            end
        end

        if drop == 2 then
            SetNewWaypoint(-340.72,-647.68)
            DrawMarker(2, drop2+1 - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 60 , true, false, 2, true)
            if isInArea(drop2, 15) then
                SetVehicleEngineOn(busjobvehicle, false, true, true)
                SetVehicleDoorOpen(busjobvehicle, 1, false, false)
                Wait(5000)
                SetVehicleEngineOn(busjobvehicle, true, true, true)
                SetVehicleDoorShut(busjobvehicle, 1, false)
                TriggerServerEvent("BusJob:Paycheck")
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
                drop = 3
            end
        end

        if drop == 3 then
            SetNewWaypoint(-571.82,-382.33)
            DrawMarker(2, drop3+1 - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 60 , true, false, 2, true)
            if isInArea(drop3, 15) then
                SetVehicleEngineOn(busjobvehicle, false, true, true)
                SetVehicleDoorOpen(busjobvehicle, 1, false, false)
                Wait(5000)
                SetVehicleEngineOn(busjobvehicle, true, true, true)
                SetVehicleDoorShut(busjobvehicle, 1, false)
                TriggerServerEvent("BusJob:Paycheck")
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
                drop = 4
            end
        end

        if drop == 4 then
            SetNewWaypoint(-296.87,-265.33)
            DrawMarker(2, drop4+1 - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 60 , true, false, 2, true)
            if isInArea(drop4, 15) then
                SetVehicleEngineOn(busjobvehicle, false, true, true)
                SetVehicleDoorOpen(busjobvehicle, 1, false, false)
                Wait(5000)
                SetVehicleEngineOn(busjobvehicle, true, true, true)
                SetVehicleDoorShut(busjobvehicle, 1, false)
                TriggerServerEvent("BusJob:Paycheck")
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
                drop = 5
            end
        end

        if drop == 5 then
            SetNewWaypoint(-34.64,-268.82)
            DrawMarker(2, drop5+1 - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 60 , true, false, 2, true)
            if isInArea(drop5, 15) then
                SetVehicleEngineOn(busjobvehicle, false, true, true)
                SetVehicleDoorOpen(busjobvehicle, 3, false, false)
                Wait(5000)
                SetVehicleEngineOn(busjobvehicle, true, true, true)
                SetVehicleDoorShut(busjobvehicle, 3, false)
                TriggerServerEvent("BusJob:Paycheck")
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
                drop = 6
            end
        end

        if drop == 6 then
            SetNewWaypoint(84.33,-204.17)
            DrawMarker(2, drop6+1 - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 60 , true, false, 2, true)
            if isInArea(drop6, 15) then
                SetVehicleEngineOn(busjobvehicle, false, true, true)
                SetVehicleDoorOpen(busjobvehicle, 3, false, false)
                Wait(5000)
                SetVehicleEngineOn(busjobvehicle, true, true, true)
                SetVehicleDoorShut(busjobvehicle, 3, false)
                TriggerServerEvent("BusJob:Paycheck")
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
                drop = 7
            end
        end

        if drop == 7 then
            SetNewWaypoint(308.76,-264.9)
            DrawMarker(2, drop7+1 - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 60 , true, false, 2, true)
            if isInArea(drop7, 15) then
                SetVehicleEngineOn(busjobvehicle, false, true, true)
                SetVehicleDoorOpen(busjobvehicle, 3, false, false)
                Wait(5000)
                SetVehicleEngineOn(busjobvehicle, true, true, true)
                SetVehicleDoorShut(busjobvehicle, 3, false)
                TriggerServerEvent("BusJob:Paycheck")
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
                drop = 8
            end
        end

        if drop == 8 then
            SetNewWaypoint(204.81,-688.35)
            DrawMarker(2, drop8+1 - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 60 , true, false, 2, true)
            if isInArea(drop8, 15) then
                SetVehicleEngineOn(busjobvehicle, false, true, true)
                SetVehicleDoorOpen(busjobvehicle, 3, false, false)
                Wait(5000)
                SetVehicleEngineOn(busjobvehicle, true, true, true)
                SetVehicleDoorShut(busjobvehicle, 3, false)
                TriggerServerEvent("BusJob:Paycheck")
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
                drop = 9
            end
        end

        if drop == 9 then
            SetNewWaypoint(363.94,-868.29)
            DrawMarker(2, drop9+1 - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 60 , true, false, 2, true)
            if isInArea(drop9, 15) then
                SetVehicleEngineOn(busjobvehicle, false, true, true)
                SetVehicleDoorOpen(busjobvehicle, 3, false, false)
                Wait(5000)
                SetVehicleEngineOn(busjobvehicle, true, true, true)
                SetVehicleDoorShut(busjobvehicle, 3, false)
                TriggerServerEvent("BusJob:Paycheck")
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
                drop = 10
            end
        end

        if drop == 10 then
            SetNewWaypoint(466.72,-599.09)
            DrawMarker(2, drop10+1 - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 60 , true, false, 2, true)
            if isInArea(drop10, 15) then
                SetVehicleEngineOn(busjobvehicle, false, true, true)
                SetVehicleDoorOpen(busjobvehicle, 3, false, false)
                Wait(5000)
                SetVehicleEngineOn(busjobvehicle, true, true, true)
                SetVehicleDoorShut(busjobvehicle, 3, false)
                TriggerServerEvent("BusJob:Paycheck")
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
                notify("~g~Your Shift has ended!~w~ You may get a car and go on with your day.")
                drop = 0
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if drop ~= 0 then
            local drop2 = drop - 1
            drawTxt(1.1, 1.44, 1.0, 1.0, 0.5, "~b~"..drop2.."/10 ~w~Stops Completed!", 255, 255, 255, 255)
        end
    end
end)

function isInArea(v, dis)
    if #(GetEntityCoords(PlayerPedId(-1)) - v) <= dis then  
        return true
    else 
        return false
    end
end

function notify(string)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(string)
    DrawNotification(true, false)
end

function alert(msg) 
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end

function drawTxt(x, y, width, height, scale, text, r, g, b, a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(255, 0, 0, 0, 255)
    SetTextEdge(255, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end