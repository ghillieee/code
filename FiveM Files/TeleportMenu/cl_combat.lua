local prevVehicle = nil
local inRedzone = false

local timers = {
    health = 0,
    armour = 0,
    bus = 0,
    invincibility = 0,
}
local cooldowns = {
    health = 15,
    armour = 15,
    bus = 60,
    invincibility = 10
}

local weapons = {
    [1] = {
        name = "AP Pistol",
        id = "weapon_appistol",
        description = "Spawn in an ~r~AP Pistol"
    },
	[2] = {
        name = "SMG",
        id = "weapon_smg",
        description = "Spawn in a ~r~SMG"
    },
	[3] = {
        name = "Assault Rifle",
        id = "weapon_assaultrifle",
        description = "Spawn in a ~r~Assault Rifle"
    },
    [4] = {
        name = "Sniper Rifle",
        id = "weapon_sniperrifle",
        description = "Spawn in a ~r~Sniper Rifle"
    },
}

local vehicles = {
    [1] = {
        name = "Rebel TRX Widebody Concept",
        id = "godztrx",
    },
    [2] = {
        name = "Audi RS6",
        id = "rs62",
    },
    [3] = {
        name = "Merc CLS 53",
        id = "cls19",
    },
    [4] = {
        name = "Lamborghini SVJ 63",
        id = "svj63"
    },
    [5] = {
        name = "Salim Mav",
        id = "salimmav"
    },
    [6] = {
        name = "The Kart",
        id = "thekart"
    },
    [7] = {
        name = "Apolo Dirt Bike",
        id = "DirtBike"
    },
}

local locations = {
    [1] = {
        coords = vector3(3606.91,3731.44,29.69),
        heading = 145.44,
        name = "H Back Garage (Attack)",
	        },
    [2] = {
        coords = vector3(3562.18,3674.92,28.12),
        heading = 77.38,
        name = "H Back Garage (Defend)",
            },
    --[[[3] = {
        coords = vector3()
    }--]]
}
function notify(msg)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(msg)
    DrawNotification(true, false)
end

function setInvincibility()
    timers.invincibility = cooldowns.invincibility
end

RMenu.Add('combat', 'main', RageUI.CreateMenu("OPW Menu","",0,100))
RMenu:Get('combat', 'main'):SetSubtitle("Game OPTIONS")
--RMenu.Add('combat', 'weapons', RageUI.CreateSubMenu(RMenu:Get('combat','main'), "~b~Weapon Spawner~b~", "~b~Choose your weapon", nil, nil))
--RMenu.Add('combat', 'vehicles', RageUI.CreateSubMenu(RMenu:Get('combat','main'), "~b~Vehicle Spawner~b~", "~b~Select a vehicle", nil, nil))
RMenu.Add('combat', 'teleport', RageUI.CreateSubMenu(RMenu:Get('combat','main'), "~b~Teleporter~b~", "~b~Select a location to teleport to", nil, nil))
--RMenu.Add('combat', 'misc', RageUI.CreateSubMenu(RMenu:Get('combat','main'), "~b~Misc~b~", "~b~Select an option", nil, nil))

RageUI.CreateWhile(1.0, RMenu:Get('combat', 'main'), 311, function()
    RageUI.IsVisible(RMenu:Get('combat', 'main'), true, true, true, function()
        if not inRedzone then
            --[[RageUI.Button("Replenish Health", "Select to replenish your health", { }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    if timers.health <= 0 then
                        timers.health = cooldowns.health
                        SetEntityHealth(PlayerPedId(), 200)
                        notify("~g~Replenished your health")
                    else
                        notify(string.format("~r~You must wait another %ss before you can replenish your health again!", timers.health))
                    end
                end
            end, nil)

            RageUI.Button("Replenish Armour", "Select to replenish your armour", { }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    if timers.armour <= 0 then
                        timers.armour = cooldowns.armour
                        SetPedArmour(PlayerPedId(), 100)
                        notify("~g~Replenished your armour")
                    else
                        notify(string.format("~r~You must wait another %ss before you can replenish your armour again!", timers.armour))
                    end
                end
            end, nil)--]]

            RageUI.Button("Teleport Menu", "Select to open the teleport menu", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                if (Selected) then end
            end, RMenu:Get('combat','teleport'))

            RageUI.Button("~r~[Rebel Redzone]", nil, {}, true, function(Hovered, Active, Selected)
                if Selected then
                    SetEntityCoords(PlayerPedId(), 1583.29,6444.92,25.07)
                    notify("~r~Teleported To Rebel Redzone")
                end
            end)
            
            --[[RageUI.Button("Weapon Spawner", "Select to open the weapon spawner", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                if (Selected) then end
            end, RMenu:Get('combat','weapons'))

            RageUI.Button("Vehicle Spawner", "Select to open the vehicle spawner", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                if (Selected) then end
            end, RMenu:Get('combat','vehicles'))

            RageUI.Button("Misc Options", "Select to open the misc menu", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                if (Selected) then end
            end, RMenu:Get('combat','misc'))

            RageUI.Button("Clear Loadout", "Select to reset your loadout", { }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    RemoveAllPedWeapons(GetPlayerPed(-1), true)
                    notify("~g~Cleared your loadout, Removed all weapons!")
                end
            end, nil)--]]

            --[[RageUI.Button("~r~Suicide~r~", "~r~Select to kill yourself", { }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    SetEntityHealth(PlayerPedId(), 0)
                    notify("~r~Self RDM")
                end
            end, nil)--]]
        else
            RageUI.Separator("You cannot use this menu in this area!")
        end
    end, function()
    end)
    --[[RageUI.IsVisible(RMenu:Get('combat', 'weapons'),true,true,true,function()
        for name, values in ipairs(weapons) do
            RageUI.Button(tostring(values.name), string.format("%s", values.description),{ }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    GiveWeaponToPed(PlayerPedId(), GetHashKey(values.id), 9999, false, true)
                end
            end)
        end 
    end, function()
        ---Panels
    end)

    RageUI.IsVisible(RMenu:Get('combat', 'vehicles'),true,true,true,function()
        for name, values in ipairs(vehicles) do
            RageUI.Button(tostring(values.name), string.format("Select to spawn a %s", values.name),{ }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    if (values.name == "Bus" and timers.bus <= 0) or values.name ~= "Bus" then
                        if values.name == "Bus" then
                            timers.bus = cooldowns.bus
                        end
                        RequestModel(GetHashKey(values.id))
                        while not HasModelLoaded(GetHashKey(values.id)) do
                            Citizen.Wait(100)
                        end
                        local playerPed = PlayerPedId()
                        local pos = GetEntityCoords(playerPed)
                        local vehicle = CreateVehicle(GetHashKey(values.id), pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)
                        SetPedIntoVehicle(playerPed, vehicle, -1)
                        if prevVehicle ~= nil then
                            SetEntityAsMissionEntity(prevVehicle, true, true)
                            DeleteVehicle(prevVehicle)
                        end
                        prevVehicle = vehicle
                    else
                        notify(string.format("~r~You cannot spawn another bus for %ss",timers.bus))
                    end
                end
            end)
        end 
    end, function()
        ---Panels
    end)--]]

    RageUI.IsVisible(RMenu:Get('combat', 'teleport'),true,true,true,function()
        for name, values in ipairs(locations) do
            RageUI.Button(tostring(values.name), string.format("Select to teleport to %s", values.name),{ }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local playerPed = PlayerPedId()
                    setInvincibility()
                    SetEntityCoords(playerPed, values.coords.x, values.coords.y, values.coords.z, 0, 0, 0, false)
                    SetEntityHeading(playerPed, values.heading)
                end
            end)
        end 
    end, function()
        ---Panels
    end)
end)

Citizen.CreateThread(function()
    while true do
        -- decreasing timers
        for k,_ in pairs(timers) do
            timers[k] = timers[k]-1
        end
        -- checking of dist to redzone
        local pos = GetEntityCoords(PlayerPedId())
        dist = #(vector3(-227.3,-2622.93,6.05)-pos)
        if dist <= 140 then
            inRedzone = true
        else
            inRedzone = false
        end
        -- setting invincible
        if timers.invincibility > 0 then
            SetPlayerInvincibleKeepRagdollEnabled(PlayerId(), true)
            TriggerServerEvent("K9:sv_combatSetEntityAlpha", 190)
            SetEntityAlpha(GetPlayerPed(-1), 190)
        elseif timers.invincibility == 0 then
            SetPlayerInvincibleKeepRagdollEnabled(PlayerId(), false)
            TriggerServerEvent("K9:sv_combatSetEntityAlpha", 255)
            SetEntityAlpha(GetPlayerPed(-1), 255)
            HudWeaponWheelIgnoreControlInput(false)
        end
        Wait(1000)
    end
end)

Citizen.CreateThread(function()
    while true do
        while timers.invincibility > 0 do
            HudWeaponWheelIgnoreControlInput(true)
            Wait(0)
        end
        Wait(400)
    end
end)

RegisterNetEvent("K9:cl_combatSetEntityAlpha")
AddEventHandler("K9:cl_combatSetEntityAlpha", function(entity, value)
    SetEntityAlpha(entity, value)
end)