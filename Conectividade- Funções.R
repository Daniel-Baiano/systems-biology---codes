# Arquivo com funções que envolvem conceitos de conectividade e vizinhança em biologia de sistemas.
# As funções já estão resolvidas e comentadas ao decorrer dos exemplos e podem ser adapatdas a sua necessidade.
# Nota-se que é necessário realizar o upload, da rede network.txt no repositório do github.

# Em biologia de sistemas, a conectividade se refere à interconexão entre diferentes componentes de um sistema biológico. Essa 
# interconexão pode ser física, química ou informacional e pode ocorrer entre diferentes níveis de
# organização, desde moléculas e células até órgãos e sistemas.

# Uma das características de uma rede é sua conectividade (também referida como grau de nó),
# sendo a conectividade total de uma rede definida por C = E / N (N - 1), onde E
# representa o número de conectores e N o número total de nós, (by Verli, Hugo, 2014).
# Para mais detalhes sobre Biologia de sistemas, busque no seu navegador o repositório LUME da UFRGS: https://lume.ufrgs.br/
# e busque o título: Bioinformática : da biologia à flexibilidade molecular -  Hugo Verli.



# Importação do arquivo network.txt para o R e crie um data.frame com nome "network".

readLines("network.txt", n = 10)
network <- read.table(file = "network.txt", header = T, sep = "\t")

# Mantendo somente as informações das colunas $node1, $node2 e $combined_score.

network <- network[,c("node1", "node2", "combined_score")]

# Somente as ligacoes com score acima de 0.700
network <- network[network$combined_score > 0.7, ]

#Identificação de quantos e quais sao os nós da rede.

#verificando as repetições antes - salvando na variável
frequencia_NO1=table(network$node1)
frequencia_NO2=table(network$node2)

#imprimindo a quantidade de repetições - frequência
print(frequencia_NO1)
print(frequencia_NO2)

#Imprimindo os nomes das repetições, desse modo ordena pelo nome sem repetir
print(names(frequencia_NO1))
print(names(frequencia_NO2))



#Nós totais

NOS_TOTAIS= unique(c(network$node1, network$node2))

NOS_TOTAIS

# A funcao "K()" que calcula a conectividade de um determinado no da rede.
# A função deve conter o argumento "symbol" e o argumento "network"

#Se sabe que deve usar a soma da frequencia dos nós
#Além disso, fazer uma função genérica.


# Função para calcular a conectividade de um símbolo em uma rede
K <- function(symbol, network) {
  
  # **Encontra as linhas da rede onde o símbolo está presente**
  # Se o símbolo for igual a algum valor nas colunas node1 ou node2
  no_conectado <- network[network$node1 == symbol | network$node2 == symbol, ]
  
  # **Quantidade de conexões do símbolo na coluna node1**
  print("Quantidade de conexões do símbolo na coluna node1:")
  solo_coluna1 <- sum(no_conectado$node1 == symbol)
  print(solo_coluna1)
  
  # **Quantidade de conexões do símbolo na coluna node2**
  print("Quantidade de conexões do símbolo na coluna node2:")
  solo_coluna2 <- sum(no_conectado$node2 == symbol)
  print(solo_coluna2)
  
  # **Conectividade total do símbolo**
  print("Conectividade total do símbolo:")
  conexão <- sum(no_conectado$node1 == symbol) + sum(no_conectado$node2 == symbol)
  
  # **Retorna a conectividade**
  return(conexão)
}


#Exemplo
  
# Ao rodar a linha abaixo, a resposta devera ser 16

K("NGF", network)  






# A funcao "vizinhos()" para encontrar os vizinhos de um no na rede ----------------


# Função para encontrar os vizinhos de um nó em uma rede
vizinhos <- function(symbol, network){
  
  # Cria uma coluna "conexoes" que concatena os nós conectados
  network$conexoes <- paste(network$node1, network$node2)
  
  # Encontra as linhas que contêm o símbolo desejado
  link <- grep(symbol, network$conexoes)
  
  # Extrai os vizinhos do símbolo
  viz <- network$conexoes[link]
  
  # Remove o símbolo das strings
  viz <- gsub(symbol, "", viz)
  
  # Remove os espaços em branco das strings
  viz <- gsub(" ", "", viz)
  
  # Imprime os vizinhos
  print(viz)
}


# Ao rodar a linha abaixo sua funcao deve retornar o resultado:

vizinhos("BAD", network) 

# [1] "PPP3R1"  "BCL2L1"  "AKT3"    "PRKAR1B" "BID"     "PPP3CB"  "CASP3"   "AKT2"    "PRKACG"  "PRKAR2A"
# [11] "PPP3CA"  "AKT1"    "BCL2"    "NGF"     "PRKAR2B" "PRKACA"  "PRKACB"  "PPP3CC"  "BAX"




# A função "Knetwork()" encontra a conectividade media da rede:

# Passos que podem te auxiliar na  montagem do código:
#1º Passo: pegar todos os nós da rede
#2º Passo: não pegar os nós repetidos
#o que é conectividde de cada no?
#3º Passo: Calcular a conectidade de cada um dos nós.
#4º Passo: Calcular a conectidade media.



# Função para calcular a Knetwork de uma rede:
Knetwork <- function(network){
  
  # Cria uma coluna com todas as conexões (node1,node2)
  network$conexoes <- paste(network$node1,network$node2)
  
  # Quantidade de conexões
  conexoes <- length(network$conexoes)
  
  # Cria um vetor com todos os nós da rede (sem duplicatas)
  nodes_total <- c(rbind(network$node1, network$node2))
  quantidade_nos <- sum(!duplicated(nodes_total))
  
  # Calcula a Knetwork (2 * conexões / número de nós)
  media <- 2*conexoes/quantidade_nos
  
  # Imprime o resultado
  print(media)
  
}


#Exemplo de chamado código

Knetwork(network)    ##Ao rodar essa linha, a resposta devera ser  11.6319
  
 
