--[[ Finalidade única de remover o som ambiente de trocação de tiros em Los Santos. ]]

addEventHandler("onClientResourceStart", resourceRoot, function()
    setWorldSoundEnabled(0, 0, false, true)
    setWorldSoundEnabled(0, 29, false, true)
    setWorldSoundEnabled(0, 30, false, true)
    setWorldSoundEnabled (5, false)
end)