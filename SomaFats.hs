--  Crie uma função "somaFats :: Int -> Int" que recebe um inteiro e deve retornar a soma dos fatoriais de 0 até n.

--Soma dos Fatoriais
somaFats :: Int -> Int
somaFats 0 = 1
somaFats n = fatorial(n) + somaFats(n-1)

--Fatorial
fatorial :: Int -> Int
fatorial 0 = 1
fatorial 1 = 1
fatorial n = n * fatorial (n - 1)
