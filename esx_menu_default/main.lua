ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_menu_default:getcolor', function(source, cb)


		local _source = source
		local xPlayer = ESX.GetPlayerFromId(_source)
	
		local identifier = GetPlayerIdentifiers(_source)[1]
	
		local result = MySQL.Sync.fetchAll("SELECT * FROM custom_menu WHERE identifier = @identifier", {
		  ['@identifier'] = identifier
		})
	
		local user      = result[1]
		local colormenu     = user['color']
		local style = user['style']
		local colorselect = user['color2']
		cb(colormenu)
end)
