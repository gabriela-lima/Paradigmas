--Queremos descobrir quem são os servidores que recebem acima da média dos salários de outros servidores. Assim, crie uma função em Haskell que recebe uma lista de pares onde o primeiro elemento do par é uma string com o CPF do servidor e a segunda é um número real com o seu salário. Tal função deve retornar uma lista com os CPFs de servidores que recebem acima da média salarial de todos os servidores.

media :: [(a, Float)] -> Float
media lista = (soma lista)/(tamanho lista)

soma::[(a,Float)]->Float
soma [] = 0
soma lista = (snd (head lista))+(soma (tail lista))

tamanho :: [(a,Float)]-> Float
tamanho [] = 0
tamanho lista = 1+ (tamanho (tail lista))

servidores :: [(Int, Float)] ->[(Int, Float)]-> [Int]
servidores []  s = []
servidores a b | snd(head a) >= media(b) = [fst( head a)] ++ (servidores (tail a) b)
            |otherwise = (servidores (tail a) b)

--Chamar servidor como funcao principal Ex: servidor [(5,5),(8,9),(7,0)] = [5,8]
servidor a = servidores a a
