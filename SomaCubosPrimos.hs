--Escreva uma função em Haskell que recebe uma lista de inteiros positivos e retorna a soma dos cubos
--dos números primos que estão nesta lista. Ex: cuboPrimo [1,3,4,7,13,15,18] = 33 + 73 + 133 = 2567.

--Retorna a soma do numeros primos elevados ao cubo
somaCuboPrimos l = sum(map(\x -> x^3) (filter primo l))


-- Recebe um inteiro e retorna True se ele for primo e False se nao for
primo :: Int -> Bool
primo n = divisores n == [1,n]

-- Recebe um inteiro e devolve a lista de divisores desse inteiro
divisores :: Int -> [Int]
divisores n = [x | x <- [1..n], (mod n x) == 0]



elemc :: Eq a => ([a],[a]) -> Bool
elemc ([],[]) = False
elemc ((x:xs), [y]) = if x == y then True else elemc (xs, [y])
