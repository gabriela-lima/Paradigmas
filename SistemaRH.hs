--Em um sistema de RH uma pessoa é representada por nome, cpf e idade. Além disto, ela pode estar na categoria adulta (>18 anos) ou criança (<18 anos). Por último, um adulto pode estar associado a uma lista contendo seus filhos (os quais podem ser crianças ou adultos). Crie tipos algébricos para representar estas estruturas. Em seguida defina duas funções: 

--a) crie uma função "ehFilho::Pessoa -> Pessoa -> Bool" que recebe duas pessoas e retorna True caso a segunda seja filho(a) da primeira e False caso contrário.

--b) crie uma função "mostraPessoa::Pessoa -> String" que recebe uma pessoa e retorna uma String contendo todas as suas informações (nome, cpf, idade, informações dos filhos)



type Nome = String
type Cpf = Int
type Idade = Int

data Pessoa = Adulto Nome Cpf Idade [Pessoa] | Crianca Nome Cpf Idade deriving (Show, Eq)

--Ex de invocacao: ehFilho (Crianca "klop" 123 9) (Crianca "klop" 123 10)
ehFilho :: Pessoa -> Pessoa -> Bool
ehFilho (Adulto nome cpf idade f) pessoa    | (filter(== pessoa) f) == [] = False
                                            | otherwise = True
ehFilho (Crianca _ _ _ ) (_) = False

--Ex de invocacao: mostraPessoa (Adulto "klop" 123 9 [(Crianca "klop" 123 9)])
mostraPessoa :: Pessoa -> String
mostraPessoa (Adulto nome cpf idade f) = nome ++ " " ++ (show cpf) ++ " " ++ (show idade) ++ " Filhos: " ++ (mostraLista f) 
mostraPessoa (Crianca nome cpf idade) = nome ++ " " ++ (show cpf) ++ " " ++ (show idade)

mostraLista [] = ""
mostraLista (n:ns) = show(n) ++ mostraLista(ns)
