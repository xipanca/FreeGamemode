local Tunnel = module('_core', 'libs/Tunnel')
local Proxy = module('_core', 'libs/Proxy')

API = Proxy.getInterface('API')
cAPI = Tunnel.getInterface('API')

RegisterServerEvent('_inventory:showInventory')
AddEventHandler('_inventory:showInventory', function()
    local _source = source
    local User = API.getUserFromSource(_source)
    User:viewInventory()
end)

RegisterServerEvent('_inventory:funcItem')
AddEventHandler('_inventory:funcItem', function(data)
    local _source = source
    local User = API.getUserFromSource(_source)
    local Inventory = User:getCharacter():getInventory()

    if data.Tipo == "useItem" then
        Inventory:useItem(_source, data.ItemName, data.Quantidade)
    elseif data.Tipo == "sendItem" then
        --Inventory:sendItem(data.ItemName, data.Quantidade)
    elseif data.Tipo == "dropItem" then
        --Inventory:dropItem(data.ItemName, data.Quantidade)
    end
end)