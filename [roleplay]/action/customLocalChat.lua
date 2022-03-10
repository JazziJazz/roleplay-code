local chatRange = 25


function isPlayerInRange(player, x, y, z, range) 
    local px, py, pz = getElementPosition(player)

    return ((x - px) ^ 2 + (y - py) ^ 2 + (z - pz) ^ 2) ^ 0.5 <= range
end


function onPlayerChat(message, messageType)
    if (messageType == 0) then
        cancelEvent()

        -- [[ Obtém a posição do jogador e também o seu nome. ]]
        local px, py, pz = getElementPosition(source)
        local playerName = getPlayerName(source) 

        for _, v in ipairs(getElementsByType("player")) do 
            if isPlayerInRange(v, px, py, pz, chatRange) then 
                outputChatBox("#E6E8FA" .. playerName .. " diz: #FFFFFF" .. message, v, 255, 255, 255, true)
            end
        end
    end
end
addEventHandler("onPlayerChat", getRootElement(), onPlayerChat)


function onPlayerYells(source, commandname, ...)
    local px, py, pz = getElementPosition(source)
    local playerName = getPlayerName(source) 
    local message = table.concat({...}, " ")

    if not isPlayerMuted(source) then
        if ... then
            for _, v in ipairs(getElementsByType("player")) do
                if isPlayerInRange(v, px, py, pz, (chatRange * 2)) then
                    outputChatBox("#E6E8FA" .. string.upper(playerName) .. " GRITA: #FFFFFF" .. string.upper(message) .. "!", v, 255, 255, 255, true) 
                end
            end
        end
    end
end
addCommandHandler("g", onPlayerYells); addCommandHandler("gritar", onPlayerYells)


function onPlayerQuietly(source, commandname, ...)
    local px, py, pz = getElementPosition(source)
    local playerName = getPlayerName(source) 
    local message = table.concat({...}, " ")

    if not isPlayerMuted(source) then
        if ... then
            for _, v in ipairs(getElementsByType("player")) do
                if isPlayerInRange(v, px, py, pz, (chatRange / 2)) then
                    outputChatBox("#E6E8FA" .. playerName .. " fala baixo: #FFFFFF" .. message, v, 255, 255, 255, true) 
                end
            end
        end
    end
end
addCommandHandler("b", onPlayerQuietly); addCommandHandler("baixo", onPlayerQuietly)


function onPlayerAction(source, commandname, ...)
    local px, py, pz = getElementPosition(source)
    local playerName = getPlayerName(source) 
    local message = table.concat({...}, " ")

    if not isPlayerMuted(source) then
        if ... then
            for _, v in ipairs(getElementsByType("player")) do
                if isPlayerInRange(v, px, py, pz, chatRange) then
                    outputChatBox("* " .. playerName .. " " .. message, v, 255, 140, 0, false)
                end
            end
        end
    end
end
addCommandHandler("m", onPlayerAction)


function onPlayerDescription(source, commandname, ...)
    local px, py, pz = getElementPosition(source)
    local playerName = getPlayerName(source) 
    local message = table.concat({...}, " ")

    if not isPlayerMuted(source) then
        if ... then
            for _, v in ipairs(getElementsByType("player")) do
                if isPlayerInRange(v, px, py, pz, chatRange) then
                    outputChatBox("* " .. message, v, 255, 140, 0, false)
                end
            end
        end
    end
end
addCommandHandler("do", onPlayerDescription)


function limparMeuChat(source, commandname)
    for _ = 1, 30 do
        outputChatBox (" ", source) 
    end 
    outputChatBox ("Você acaba de limpar o seu chat.", source)
end
addCommandHandler("limparmeuchat", limparMeuChat)
