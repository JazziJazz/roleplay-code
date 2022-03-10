-- [[ Variável que armazena a posição de spawn do jogador. ]]
local spawnX, spawnY, spawnZ = 1742.8642, -1863.2099, 13.5753

-- [[ Abaixo estão as frases pré-configuradas para cada dia da semana. ]]
local days = {
    ["Monday"] = {
        [1] = "E a frase do dia é: “Minha mãe sempre me dizia: Se você não consegue encontrar algo para viver, melhor você encontrar alguma coisa para morrer.” — Tupac Shakur.\n ",
        [2] = "E a frase do dia é: “Amo como ama o amor. Não conheço nenhuma outra razão para amar senão amar. Que queres que te diga, além de que te amo, se o que quero dizer-te é que te amo?” — Fernando Pessoa.\n ",
        [3] = "E a frase do dia é: “O campo da derrota não está povoado de fracassos, mas de homens que tombaram antes de vencer.” — Abraham Lincoln.\n "
    },

    ["Tuesday"] = { 
        [1] = "E a frase do dia é: “O céu não está em cima, ou embaixo, ou à direita, ou à esquerda; está no centro do peito do homem que tem fé.” — Salvador Dalí.\n ",
        [2] = "E a frase do dia é: “É melhor calar-se e deixar que as pessoas pensem que você é um idiota do quer falar e acabar com a dúvida.” — Abraham Lincoln.\n ",
        [3] = "E a frase do dia é: “Tenho duas armas para lutar contra o desespero, a tristeza e até a morte: o riso a cavalo e o galope do sonho. É com isso que enfrento essa dura e fascinante tarefa de viver.” — Ariano Suassuna.\n "
    },

    ["Wednesday"] = {
        [1] = "E a frase do dia é: “Não se pode separar paz de liberdade porque ninguém consegue estar em paz a menos que tenha sua liberdade.” — Malcom X.\n ",
        [2] = "E a frase do dia é: “Saio da vida para entrar na história” — Getúlio Vargas.\n ",
        [3] = "E a frase do dia é: “Não se nasce mulher, torna-se mulher” — Simone de Beauvoir.\n"
    },

    ["Thursday"] = {
        [1] = "E a frase do dia é: “Pensamos demasiadamente e sentimos muito pouco. Necessitamos mais de humildade que de máquinas. Mais de bondade e ternura que de inteligência. Sem isso, a vida se tornará violenta e tudo se perderá.” — Chaplin.\n ",
        [2] = "E a frase do dia é: “Eu tenho um sonho, de que meus quatro filhos viverão um dia em uma nação onde não serão julgados pela cor de sua pele, mas pelo teor de seu caráter” — Martin Luther King.\n ",
        [3] = "E a frase do dia é: “Às vezes Jesus se disfarça de mendigo para testar a bondade dos homens.” — Ariano Suassuna.\n"
    },

    ["Friday"] = { 
        [1] = "E a frase do dia é: “Não ganhe o mundo e perca sua alma; sabedoria é melhor que prata e ouro.” — Bob Marley.\n ",
        [2] = "E a frase do dia é: “Os pobres nada tem a perder a não ser seus grilhões. Eles tem um mundo a ganhar. Pobres do mundo, uni-vos!” — Karl Marx e Friedrich Engels.\n ",
        [3] = "E a frase do dia é: “Apesar de tudo eu ainda acredito na bondade humana” — Anne Frank.\n"
    },

    ["Saturday"] = {
        [1] = "E a frase do dia é: “A verdadeira medida de um homem não se vê na forma como se comporta em momentos de conforto e conveniência, mas em como se mantém em tempos de controvérsia e desafio.” — Martin Luther King.\n ",
        [2] = "E a frase do dia é: “Nada é permanente, exceto a mudança” — Heráclito.\n ",
        [3] = "E a frase do dia é: “Eu vos dou um novo mandamento: amai-vos uns aos outros” — Evangelho de João.\n"
    },

    ["Sunday"] = {
        [1] = "E a frase do dia é: “A pressa é a inimiga da vitória. O fraco não tem espaço e o covarde morre sem tentar.” — Racionais MC's.\n ",
        [2] = "E a frase do dia é: “Às vezes, quando você inova, você comete erros. É melhor admiti-los rapidamente, e seguir em frente para melhorar suas outras inovações.” — Steve Jobs.\n",
        [3] = "E a frase do dia é: “A terra provê o suficiente para as necessidades de cada um, mas não para a ganância dos homens.” — Mahatma Gandhi.\n"
    }
}

function onEnterServer()
    --[[ Bloco de código que spawna jogador e posiciona a câmera nele. ]]
    spawnPlayer(source, spawnX, spawnY, spawnZ)
    fadeCamera(source, true)
    setCameraTarget(source, source)

    setPlayerNametagColor(source, 255, 255, 255)

    --[[ Bloco de código que envia mensagem ao jogador. ]]
    outputChatBox(os.date("Bem-vindo ao Golden Coast Roleplay. Por favor, acesse o fórum de maneira constante e fique sempre por dentro das novidades. Lembre-se de sempre seguir as regras do servidor para evitar o bloqueio temporário ou permanente de sua conta."), source)
    outputChatBox(os.date("O horário aproximado é %Hh%M do dia %d de %B de %Y.\n"), source)

    --[[ Abaixo é a verificação do dia da semana, um laço de repetição executa a verficação. ]]
    local random = math.random(1, 3)

    for k, v in pairs(days) do
        if os.date("%A") == tostring(k) then
            if v[random] == nil then
                return v
            end

            outputChatBox(tostring(v[random]))
        end
    end
end

addEventHandler("onPlayerJoin", getRootElement(), onEnterServer)