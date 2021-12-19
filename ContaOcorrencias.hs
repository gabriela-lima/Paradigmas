{-Utilizando a linguagem funcional Haskell, defina uma função que recebe uma lista de listas de elementos de um tipo t (genérico) e retorna uma lista de tuplas-2 onde o primeiro elemento é um valor do tipo t que existe em pelo menos uma das sub-listas da entrada e o segundo é o número de ocorrências desse valor nas sub-listas.

Exemplos: contaOcorr ["haskell","eh","legal"] -> [('h',2),('a',2),('s',1),('k',1),('e',3),('l',4),('g',1)]

                  contaOcorr [[2,45,6,2,1],[7,7,4,3,2]] -> [(2,3),(45,1),(6,1),(1,1),(7,2),(4,1),(3,1)] -}


contaElemento _ [] = 0
contaElemento x l   | head l == x = 1 + contaElemento x (tail l) 
                    | otherwise = contaElemento x (tail l)

varreLista :: Eq a=>[a] -> [(a, Int)]
varreLista [] = []
varreLista x = ((head x), (contaElemento (head x) x)) : (varreLista (tail x))   

filtraTuplas:: Eq a=>[(a,Int)]->[(a,Int)]->[(a,Int)]
filtraTuplas [] x = []
filtraTuplas (x:xs) y | contem x y = filtraTuplas (xs) y
                      | otherwise = x:filtraTuplas (xs) (x:y)

contem :: Eq a => (a, Int) -> [(a, Int)] -> Bool
contem x [] = False
contem (x,y) z |(fst (head z)) == x = True
               | otherwise = contem (x,y) (tail z)

--Funcao principal. EX: contaOcorr ["bob","a","c"] = [('b',2),('o',1),('a',1),('c',1)]
contaOcorr l = filtraTuplas(varreLista(concat(l))) []
