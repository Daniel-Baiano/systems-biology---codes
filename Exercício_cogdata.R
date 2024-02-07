# Logo abaixo, há um exercício da função "OGanalyzer". Essa função é útil em biologia de sistemas 
#para analisar a composição de COGs em diferentes genomas, identificar COGs específicos de uma espécie,
# comparar a distribuição de COGs entre diferentes condições e estudar a evolução de COGs ao longo do tempo. 
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





# Teste da função
OGanalyzer(cogdata)

#visualização do data.frame  
cogdata_count <- OGanalyzer(cogdata) 







    


  







