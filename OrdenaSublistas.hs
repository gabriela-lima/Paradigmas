--Utilizando uma linguagem funcional como Haskell, defina uma função que ordena uma lista de listas de
--acordo com o tamanho das sublistas, isto é, listas pequenas primeiro, e listas longas no final. Por exemplo:
-- > ordenaLista [[1,3,5],[5,3],[8],[2,9,54,32,3],[2,34,5]]
-- > [[8],[5,3],[1,3,5],[2,34,5],[2,9,54,32,3]]

--Recebe uma lista e devolve uma lista de tuplas com a sublista e o tamanho da sublista
tuplaLista [] = []
tuplaLista (x:xs) = ((x), length (x)): (tuplaLista (xs))

--Ordenacao por insercao
insercao [] = []
insercao (x:xs) = insereOrd x (insercao xs)
insereOrd x [] = [x]
insereOrd x (y:ys)
                    | (snd x) <= (snd y) = (x:y:ys)
                    | otherwise = y: (insereOrd x ys)

--Transforma uma lista de tupla em uma lista com o primeiro elemento da tupla
lista [] = []
lista (x:xs) = (fst(x)):(lista(xs))

--Funcao ordena lista
ordenaLista x = lista(insercao(tuplaLista x))
