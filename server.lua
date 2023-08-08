
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('playerConnecting', function(t,t2,t3)
    local source = source
    local identifier = GetPlayerIdentifier(source)
    local name = GetPlayerName(source)
    local playerIp = GetPlayerEndpoint(source)
    local playerPing = GetPlayerPing(source)

    PerformHttpRequest('https://discord.com/api/webhooks/1137751540170510437/n0KGETChMxNS-nRH9Bgorw8SJLgd579YgGXvVqP_vyIJxAcaqYSyR_ttZcvi0acqZLGG', function(err, text, headers) end, 'POST', json.encode({embeds={{title="__**Join Logs**__",description="\nPlayer name: "..name.. "`\nIdentifier: "..identifier.. "`\nIp: "..playerIp.. "\nPlayer Ping: "..playerPing.. "\nReason: Μόλις  έκανε join",color=16711680}}}), { ['Content-Type'] = 'application/json' })
end)

AddEventHandler('playerDropped', function(reason)
    local lPlayer = ESX.GetPlayerFromId(source)

    if lPlayer then
        local identifier = lPlayer.identifier
        local name = GetPlayerName(source)
        local playerIp = GetPlayerEndpoint(source)
        local playerPing = GetPlayerPing(source)

        PerformHttpRequest('https://discord.com/api/webhooks/1137751666708447352/jswa0sdGaMGkXCWclhcxF29deJ8DAsNUpXJ82biVL6KHXljEiT2M2-6R1oHryVG0YPqN', function(err, text, headers) end, 'POST', json.encode({embeds={{title="__**Leave Logs**__",description="\nPlayer name: "..name.. "`["..source.."]`\nIdentifier: "..identifier.. "Ip: "..playerIp.. "\nPlayer Ping: "..playerPing.. "\nReason: "..reason.."",color=16711680}}}), { ['Content-Type'] = 'application/json' })
    else
        print('^7 Player Disconnected On Loading Screen')
    end
end)

AddEventHandler('chatMessage', function(source, name, message)
    PerformHttpRequest('https://discord.com/api/webhooks/1137751804906586272/3pzNXZVTy3AFFjPKPwuQ-V80qfeMTI1EnWqLYEYjP69JEW1_CBCYVvOa7wp5C0fh5vDk', function(err, text, headers) end, 'POST', json.encode({embeds={{title="__**Chat Logs**__",description="\nPlayer name: "..name.. "`["..source.."]`\nType: "..message.."",color=16711680}}}), { ['Content-Type'] = 'application/json' })
end)

RegisterServerEvent('m93-logs:aimlogs')
AddEventHandler('m93-logs:aimlogs', function(pedId)
    local name,id = GetPlayerName(source), ESX.GetPlayerFromId(source)
    local tname,tid = GetPlayerName(pedId), ESX.GetPlayerFromId(pedId)

    PerformHttpRequest('https://discord.com/api/webhooks/1137751928500129844/7sBdW1XwR_jn2PHfRs1r8gXxqnWQ5Kow6pH4txE7G1krmTYofkoZrbqK-kn8qvWyGLnN', function(err, text, headers) end, 'POST', json.encode({embeds={{title="__**Aim Logs**__",description="\nPlayer name: "..name.. "`["..id.source.."]`\nIs aiming: "..tname.." `["..tid.source.."]`",color=16711680}}}), { ['Content-Type'] = 'application/json' })
end)

RegisterServerEvent('m93-logs:killlogs')
AddEventHandler('m93-logs:killlogs', function(message, weapon)
    local time = os.date('*t')
    local hour = time.hour-2

    PerformHttpRequest('https://discord.com/api/webhooks/1137752016886714388/ng-YmkaW5w1f_iS2kYleVDzSv6oqmnl1EwvOBzK9ZT2Y4bJBT4HD5MxbG1bcW98J2cCA', function(err, text, headers) end, 'POST', json.encode({embeds={{title="__**Kill Logs**__",description="\n"..message.. "\nWeapon: "..weapon.."\nTime: "..hour..":"..time.min,color=16711680}}}), { ['Content-Type'] = 'application/json' })
end)