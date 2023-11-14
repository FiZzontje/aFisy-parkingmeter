------------------------------------------
-- ON SCRIPT START
------------------------------------------
print("Script by ^2Fisy")
QBCore = exports['qb-core']:GetCoreObject()

------------------------------------------
-- EVENTS
------------------------------------------

RegisterNetEvent('afisy-parkingmeter:client:payParking', function()
    local pos = GetEntityCoords(PlayerPedId())
    TriggerEvent('animations:client:EmoteCommandStart', {"parkingmeter"})
    QBCore.Functions.Progressbar("drilling", "You make a payment...", 3000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStop')
        QBCore.Functions.TriggerCallback('afisy-parkingmeter:server:checkParking', function(isPaid)
            if isPaid then
                QBCore.Functions.Notify('Parking is already paid!', 'error', 5000)
            else
                TriggerServerEvent('afisy-parkingmeter:server:payParking', pos)
            end
        end, pos)
    end, function()
        TriggerEvent('animations:client:EmoteCommandStop')
        QBCore.Functions.Notify('Canceled!', 'error', 5000)
    end)
end)

RegisterNetEvent('afisy-parkingmeter:client:checkParking', function()
    local pos = GetEntityCoords(PlayerPedId())
    TriggerEvent('animations:client:EmoteCommandStart', {"parkingmeter"})
    QBCore.Functions.Progressbar("drilling", "Checks Parking...", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStop')
        QBCore.Functions.TriggerCallback('afisy-parkingmeter:server:checkParking', function(isPaid)
            if isPaid then
                QBCore.Functions.Notify('Parking is paid!', 'success', 5000)
            else
                QBCore.Functions.Notify('Parking is not paid!', 'error', 5000)
            end
        end, pos)
    end, function()
        TriggerEvent('animations:client:EmoteCommandStop')
        QBCore.Functions.Notify('Canceled!', 'error', 5000)
    end)
end)
