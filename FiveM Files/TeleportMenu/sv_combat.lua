RegisterNetEvent("K9:sv_combatSetEntityAlpha")
AddEventHandler("K9:sv_combatSetEntityAlpha", function(value)
    local source = source
    local entity = GetPlayerPed(source)
    TriggerClientEvent("K9:cl_combatSetEntityAlpha", -1, entity, value)
end)