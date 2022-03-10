function getPosition(thePlayer)
    local x, y, z = getElementPosition(thePlayer)
    outputChatBox("Sua posição é de: " .. x .. ", " .. y .. ", " .. z .. ".")
end

addCommandHandler ("pos", getPosition)