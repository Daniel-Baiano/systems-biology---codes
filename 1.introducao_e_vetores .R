
######################################
##        Operacoes simples         ##
######################################

# Aritmetica basica
2+5         #adicao                     
5-2         #subtracao
2*5         #multiplicacao
8/2         #divisao
2^5         #exponenciacao

# Avaliacao logica
3==5	      #igual
3!=5	      #diferente
3>5	        #maior que
3<5	        #menor que
3>=5	      #maior ou igual
3<=5	      #menor ou igual


# Operacoes concatenadas
((2+5-3)*10)^4/7^4


######################################
##            Variaveis             ##
######################################

x<-1        # A seta "<-" representa o simbolo de atribuicao
x           # Ao escrever o nome do objeto, seu valor sera impresso

y<-"gol do gremio!"
y

#Os resultados da operacao podem ser salvos em objetos
x<- 2+5                                  
y=5-2
2*5->w
z<-8/2

(((x-y)*w)^z)/(x^z)


######################################
##             Funcoes              ##
######################################

# Chamadas pelo nome
sum(1,3,5)

# Podem receber argumentos
a<-rep("Aluno",times=3)
a


######################################
##              Ajuda               ##
######################################

help(sum)         #acessa a documentacao do R
?sd               
??plot


######################################
##    Diretorio de trabalho         ##
######################################

getwd()           #verifica o diretorio de trabalho
setwd()           #seta o dieorio de trabalho
list.files()      #lista os arquivos presentes no diretorio de trabalho
load()            #carrega um arquivo binario do diretorio para o ambiente
save()            #salva um arquivo no diretorio de trabalho

####################################################################################################

######################################
##             Vectors              ##
######################################

#funcao c() : concatenate
number<-c(1, 2, 3, 4, 5)
letter<-c("x", "y", "z", "w", "j")
logical<- c(TRUE, FALSE, FALSE, TRUE, FALSE)
seq<-1:10

# A classe da cada objeto pode ser acessada pela funcao class()

# EXp 1: aplique a cada um dos objetos acima a funcao class()

#funcao vector(): cria vetores
a<-vector(mode = "integer", length = 10) 
b<-vector("logical", 10)
c<-numeric(10)
d<-character(10)              #os vetores sao criados com valores padrao de cada classe

x<-1                          #numeros sao salvos como numeric
x<-1L                         #para explicitar integer, usa-se L

#hierarquia de classes
x<-c(1, 2, 3)                 #numeric
y<-c("1", "2", "3")           #character


x<-c(TRUE, FALSE, T)      #logical
y<-c("TRUE", "FALSE", "FALSE")#character

#Ex.2: verifique a classe de cada ojeto
a<-c(1, "a", TRUE)
b<-c(1, "a")
c<-c(1, T)
d<-c("a", T)

sum(logical)           #Podemos somar vetores logicos

#OBS. vetores comportam somente uma classe de elementos


#coercao de objetos usando funcoes do tipo as.algumacoisa()
x<-0:10
x
class(x)

a<-as.numeric(x)
a
class(a)

b<-as.character(x)
b
class(b)

c<-as.logical(x)
c
class(c)

#Ex.3: verifique se "x" e "a" sao iguais
#Ex.4: tente converter os vetores (a, b, c) em numeric
#Ex.5: crie um vetor de caracteres de "a" ate "d" e o converta em numerico

#vetores de NA
x<-c(1, 2, 3, NA)
y<-c("a", "b", "c", NA)

is.na(x)

w<-rep(NA, 10)
w
class(w)
z<-rep(NA_integer_, 10)
z
class(z)

a <- c(1, 3, NA, 7, 9)
sum(a)
sum(a, na.rm=TRUE)


#objetos possuem atributos: classe, tamanho, dimensoes, nemes, etc
x<-1:5
x
length(x)
dim(x)
attributes(x)
names(x)<-c("a", "b", "c", "d", "e")
x
attributes(x)


######################################
##              factor              ##
######################################

#fatores sao vetores categoricos, possuem o atributo level

x<-factor(c("s", "n", "n", "s", "s"))
z<-factor(c("alto", "baixo", "medio"))



######################################
##    Trabalhando com vetores       ##
######################################
##  Operacoes vetorizadas
x<-1:5
y<-6:10
x+y               #ocorre a soma dos valores de ambos os vetores

x*2               #podemos multiplicar um vetor por um numero
x**55

z<-c(x,y)
z+x
w<-1:3
w+x

l<-c(T, T, F, T, F, F)
l/2

## para acessar vetores, usamos [ ]
letter<-c("x", "y", "z", "w", "j")
letter[2]               #acessa o segundo elemento do vetor
letter[2:4]             #podemos usar sequencia de valores
letter[c(1, 4)]         #usamos a funcao c() para valores nao contiguos
letter[-2]              #usamos numeros negativos para excluir um ou mais valores
letter[c(-2, -5)]

idx<-c(1, 4)            #podemos criar indices numericos
letter[idx]

x<-1:10                 
x[x>7]                  #podemos usar "<", "==", ">=", etc.

letter[letter>"k"]      #tambem eh possivel para caracteres
letter[letter<"k"]
letter=="z"

#funcoes para identificar valores extremos
set.seed(1)
s<-sample(-1000:1000, 200)

which.max(s)            #procura a posicao do maior valor
max(s)                  #imprime o maior valor 
range(s)

s>0                     #cria um vetor logico
which(s>0)              #cria um vetor com as posicoes que satisfazem o comando

#Ex.1: quantos valores de s sao maiores que 0?
#Ex.2: faca um vetor contendo os valores de S maiores do que 0.

#funcoes de ordenamento
x<-c(3, 8, 2, 1, 5, 9, 7, 7, 3)
x      
sort(x)                 #ordena um vetor
sort(x, decreasing = T)
order(x)                #pega a ordem de cada elemento para torna-lo crescente
sample(x)               #randomiza
unique(x)               #elimina as replicatas
duplicated(x)           #logico

#Ex.3: quantos duplicados existem em x?



######################################
##             matrix               ##
######################################

#matrizes sao vetores com o atributo dimensao
x<-1:20
x
attributes(x)

m<-matrix(x, 4, 5)
m
attributes(m)          

dim(x)<-c(4,5)
x
identical(x, m)

#OBS.: como sao vetores, matrizes comportam somente uma classe de elementos
a<-1:5
b<--1:-5
c<-c(3, 6, 4, 9, 1)

m<-cbind(a, b, c)       #funcao cbind() concatena colunas
m1<-rbind(a, b, c)      #funcao rbind() concatena linhas

#Acesso a matrizes
m[1,3]                  #endereco das duas dimencoes [linha,coluna]
m[1, ]
m[2:3, ]
m[1,]<-NA
m

######################################
##              array               ##
######################################

ar<-array(1:200, c(5, 10, 4))    #vetores multidimensionais
ar
ar[,,1]                          #[linha, coluna, matrix]
