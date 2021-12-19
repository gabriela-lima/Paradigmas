{-Filamentos de DNA e RNA são compostos por seus nucleotoides. 

Os quatro nucleotoides do DNA são: adenina (A), citosina (C), guanina (G) e timina (T).

Os quatro nucleotoides do RNA são: adenina (A), citosina (C), guanina (G) e uracil (U).

Um filamento de DNA pode ser transcrito para um de RNA substituindo cada nucleotoide pelo seu complemento:

G -> C
C -> G
T -> A
A -> U
Assim, crie um programa em haskell que lê um arquivo "dna.txt" cujas linhas correspondem a filamentos de DNA. Em seguida, crie um novo arquivo "rna.txt" com as transcrições para RNA dos filamentos fornecidos no arquivo de entrada. Abaixo segue um exemplo.

Dado um arquivo "dna.txt" com o seguinte conteúdo:

ACGTGGTCTTAA

CGTA

Seu programa deve gerar um arquivo "rna.txt" com o seguinte conteúdo:

UGCACCAGAAUU

GCAU

Linhas em branco devem gerar linhas em branco no arquivo de saída. Caso existam caracteres inválidos nas linhas do arquivo de entrada, a linha correspondente no arquivo de saída deve informar uma mensagem de erro "Filamento de DNA inválido!". -}

manipulaArquivo = do 
                    a <- readFile "dna.txt" --Colocar o arquivo de texto no diretorio onde seu ghci se encontra
                    writeFile "rna.txt" (operaTexto a) -- O arquivo rna vai aparecer onde o seu ghci esta
                    
operaTexto [] = "" 
operaTexto (n:ns)   | n == 'G' = "C" ++ operaTexto(ns)
                    | n == 'C' = "G" ++ operaTexto(ns)
                    | n == 'T' = "A" ++ operaTexto(ns)
                    | n == 'A' = "U" ++ operaTexto(ns)
                    |  n == '\n' = "\n" ++ operaTexto(ns)
                    | otherwise = "Filamento de DNA invalido!\n"++ operaTexto(invalido(ns))

--Pula ate a proxima "quebra de linha" \n
invalido :: String -> String
invalido "" = ""
invalido (x:xs) | x == '\n' = (xs)
                | otherwise = invalido(xs)
