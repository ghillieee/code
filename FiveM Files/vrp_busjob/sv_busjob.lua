local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_busjob")

RegisterNetEvent("BusJob:Paycheck")
AddEventHandler("BusJob:Paycheck", function()
    local source = source
    local user_id = vRP.getUserId({source})
    vRP.giveMoney({user_id, 1250})
    vRPclient.notifyPicture(source, {"busjob",9,"Bus Job",false,"You have been paid £1250"})
end)
