--Assuma que seu arquivo possui uma função "gols::(Int,String) -> Int" que mapeia os jogadores de um clube para a quantidade de gols que eles fizeram na temporada. A tupla de entrada é composta pelo número do jogador, os quais vão em ordem crescente de 1 a 11, e seu respectivo nome. Abaixo segue um exemplo, que pode ser utilizado:
--gols (1, "Navas") = 0
--gols (2, "Thiago Silva") = 0
--gols (3, "Kimpembe") = 0
--gols (4, "Kehrer") = 1
--gols (5, "Marquinhos") = 3
--gols (6, "Verratti") = 0
--gols (7, "Mbappé") = 18
--gols (8, "Paredes") = 0
--gols (9, "Icardi") = 12
--gols (10, "Neymar") = 13
--gols (11, "Di Maria") = 8
--Assim, baseado no que está especificado na função "gols", crie duas funções, uma que retornar o nome do artilheiro (o jogador que fez mais gols) nesta temporada e outra que retorna o total de gols do clube na temporada. 

--Recebida da propria questao
--Retorna o numero de gols
gols::(Int,String) -> Int
gols (1, "Navas") = 0
gols (2, "Thiago Silva") = 0
gols (3, "Kimpembe") = 0
gols (4, "Kehrer") = 1
gols (5, "Marquinhos") = 3
gols (6, "Verratti") = 0
gols (7, "Mbappé") = 18
gols (8, "Paredes") = 0
gols (9, "Icardi") = 12   
gols (10, "Neymar") = 13 
gols (11, "Di Maria") = 8


--Retorna o nome do jogador pelo numero de sua camisa
jogador::Int->String
jogador 1 = "Navas"
jogador 2 = "Thiago Silva"
jogador 3 = "Kimpembe"
jogador 4 = "Kehrer"
jogador 5 = "Marquinhos"
jogador 6 = "Verratti"
jogador 7 = "Mbappé"
jogador 8 = "Paredes"
jogador 9 = "Icardi"
jogador 10 = "Neymar"
jogador 11 = "Di Maria"

-- Mostra o artilheiro do time
artilheiro::String
artilheiro = contador 1 11 (1,jogador 1)

--Compara os gols entre dois jogadores
compara :: Int -> Int -> (Int, String)
compara x i
     | gols(x,jogador(x)) > gols(i,jogador(i)) = (x, (jogador x))
     | otherwise = (i, (jogador i))

--Contador usado para fazer a comparacao entre os jogadores
contador::Int -> Int -> (Int,String) -> String
contador atual total (numero, nome) | atual < total = contador(atual + 1) total (compara numero atual)
                                    | otherwise =  snd (compara numero atual)

--Soma de gols do time
somaTime :: Int -> Int
somaTime 1 = gols(1, jogador(1))
somaTime n =  gols(n, jogador(n)) + somaTime(n-1)

--Mostra a soma de gols do time
mostraSoma :: Int
mostraSoma = somaTime 11
