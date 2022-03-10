function disableDefaultChat(message, messageType)
    cancelEvent()
end

addEventHandler ("onPlayerChat", getRootElement(), disableDefaultChat)