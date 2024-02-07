# Logo abaixo, há um exercício da função "OGanalyzer". Essa função é útil em biologia de sistemas para analisar a composição de COGs em diferentes genomas, 
#identificar COGs específicos de uma espécie, comparar a distribuição de COGs entre diferentes condições e estudar a evolução de COGs ao longo do tempo. 
# Ela é bem útil em uma análise posteior da criação das redes e útil no estudo em diferentes linhagens celulares, doenças, espécies e afins




load("cogdata.RData")
cogdata<-cogdata[1:10000,]


# 1) Faca uma funcao "OGanalyzer" que receberá como argumento o dataframe cogdata.
# A funcao devera calcular, para cada especie, quantas proteinas ha em cada "orthologous_group".
# A saida devera ser um data.frame de tres colunas: 
# (1) o codigo da especie, (2) o orthologous_group (3) o numero de proteinas daquela especie contida no respectivo "orthologous_group ".
# Lembre-se que para cada especie ha diversos "orthologous_group", cada um com diversas proteinas.

# O resultado sera um dataframe de 5933 linhas e 3 colunas.
# As tres primeiras linhas serao as seguintes:

#     ssp orthologous_group protein
# 1 100226           COG0001       2
# 2 100226           COG0002       1
# 3 100226           COG0003       3




# Função para analisar dados de COGs

OGanalyzer <- function(cogdata) {
  
  # Criando uma cópia do dataframe original
  cogdata_teste <- cogdata[,]
  
  # 1° PASSO: Extrair o nome da proteína
  
  # Retirando os pontos do final do nome da proteína
  cogdata_teste$protein <- sub("\\..*", "", cogdata_teste$protein)
  
  # Criando uma nova coluna com o nome da proteína sem o "COG"
  cogdata_teste$Proteina_Nome <- sub(".*\\.", "", cogdata_teste$protein)
  
  # Excluindo a coluna "protein_annotation"
  cogdata_teste <- subset(cogdata_teste, select = -protein_annotation)
  
  # 2° PASSO: Inicializar um dataframe vazio para armazenar os resultados
  Ganalyzer_dataframe <- data.frame()
  
  # 3° PASSO: Ordenar a segunda coluna e verificar as repetições do código da proteína
  for (i in unique(cogdata_teste$protein)) {
    
    # Selecionando as linhas que correspondem à proteína atual
    LOOP <- cogdata_teste[cogdata_teste$protein == i, ]
    
    # Calculando o número de proteínas em cada "orthologous_group" para a espécie atual
    LOOP2 <- tapply(LOOP$protein, LOOP$orthologous_group, FUN = length)
    
    # 4° PASSO: Criar um dataframe com os resultados da espécie
    dfespecies <- data.frame(
      ssp = i,
      orthologous_group = names(LOOP2),
      protein = as.vector(LOOP2)
    )
    
    # 5° PASSO: Adicionar o dataframe da proteína aos resultados
    Ganalyzer_dataframe <- rbind(Ganalyzer_dataframe, dfespecies)
  }
  
  # Removendo os nomes das linhas do dataframe final
  # row.names(Ganalyzer_dataframe) <- NULL
  
  # Retornando o dataframe com os resultados
  return(Ganalyzer_dataframe)
}



# Teste da função
OGanalyzer(cogdata)

#visualização do data.frame  
cogdata_count <- OGanalyzer(cogdata) 


table(cogdata_teste$orthologous_group) #verificando a quantidade de cada homologo
table(cogdata_teste$protein) #verificando a quantidade de cada proteina




# Opção 2: Usando funções vetoriais e `aggregate`



# 1. Extraindo a espécie e o nome da proteína

# Separando o nome da proteína e a espécie usando `strsplit`
cogdata$ssp <- sapply(strsplit(as.character(cogdata$protein), "\\."), "[", 1)
cogdata$protein_name <- sapply(strsplit(as.character(cogdata$protein), "\\."), "[", 2)

# 2. Contando o número de proteínas por "orthologous_group" e espécie

# Usando `aggregate` para calcular o número de proteínas em cada "orthologous_group" para cada espécie
a <- with(cogdata, aggregate(
  list(protein = protein_name), # Lista com a variável a ser resumida
  list(orthologous_group = orthologous_group, ssp = ssp), # Lista com as variáveis de agrupamento
  length # Função de agregação: contar o número de proteínas
))

# 3. Resultados

# O dataframe `a` contém os resultados da análise, com as colunas:
#   * orthologous_group: O grupo ortolog
#   * ssp: A espécie
#   * protein: O número de proteínas no grupo ortolog para a espécie

# Imprimindo os resultados
print(a)


    


  







