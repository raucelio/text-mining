
# ALUNOS: Elizoneide de Lima Tomaz Nóia - 18647910
#         Marcelo Alves Nóia - 18650937


# Manipulando strings em R, autor: Gaston sanchez

install.packages("stringr")

library(stringr)

# Capítulo 2.3: Criando Cadeias de Caracteres

# exemplo 1

char_vector <- character(5)
char_vector

# exemplo 2

# Verifique seu comprimento

example <- character(0)

example

length(example)

# adicionar primeiro elemento

example[1] <- "first"

example[1]

# Verifique o compriumento novamente

length(example)

example[4] <- "fourth"

length(example)

# Capítulo 2.3.1 Cadeia vazia

empty_str <- ""

empty_str

class(empty_str)

# Capítulo 2.3.2 Vetor de caracteres vazio

empty_chr <- character(0)

empty_chr

class(empty_chr)

# Comprimento de corda vazia

length(empty_str)

# Comprimento de vetor de caracter vazio

length(empty_chr)

##

string <- c('sun', 'sky', 'clouds')

string

string[0]

# Capítulo 2.3.3 Função c()

string <- c('sun', 'sky', 'clouds')

string

planets <- c("mercury", 'venus', "mars")

planets

# Capítulo 2.3.4 is.character() eas.character()

# defina dois objetos 'a' e 'b'

a <- "teste-me"

b <- 8 + 9

a
b

# Para testar se "a" e "b" são do tipo "caracter" use a função is.character()

is.character(a)

is.character(b)

# Da mesma forma, você também pode usar a função class()para obter
# a classe de um objeto

class(a)

class(b)

# Convertendo "b" como caracter

b <- as.character(b)

b

# Capítulo 2.4 Comportamento de objetos R com cadeias de caracteres

# vetor com números e caracteres

c(1:5, pi, "text")

# vetor como números, lógicos e caracteres

c(1:5, TRUE, pi, "text", FALSE)

# Matrizes com números e caracteres

rbind(1:5, letters[1:5])

# Quadro de dados (dataframe) com números e caracteres


df1 = data.frame(numbers=1:5, letters=letters[1:5])

df1

# examinar a estrutura do data frame (quadro de dados)

str(df1)

# Para desativar o data.frame()comportamento padrão de converter strings
# em fatores, use o argumento stringsAsFactors = FALSE

# Quadro de dados (dataframe) com números e caracteres


df2 <- data.frame(
  numbers = 1:5, 
  letters = letters[1:5], 
  stringsAsFactors = FALSE)

df2

# examinar a estrutura do data frame (quadro de dados)

str(df2)

# Listas: Com listas, você pode combinar qualquer tipo de objeto de dados.
# O tipo de dados em cada elemento da lista manterá seu modo correspondente.

# lista com elementos de modo diferente


list(1:5, letters[1:5], rnorm(5))

# Capitulo 2.5 - A função paste

# exemplo 1

PI <- paste("The life of", pi)

PI

# exemplo 2

IloveR <- paste("I", "love", "R", sep = "-")

IloveR

# exemplo 3: paste com objetos de diferentes comprimentos

paste("X", 1:5, sep = ".")

# exemplo 4: paste com e sem collapse

paste(1:3, c("!","?","+"), sep = '', collapse = "")


paste(1:3, c("!","?","+"), sep = '')

# exemplo 5: paste com valores omisso NA

evalue <- paste("the value of 'e' is", exp(1), NA)

evalue

# exemplo 6: collapse com a função past0

paste0("let's", "collapse", "all", "these", "words")


# Capítulo 3: Formatando texto e números

# Capítulo 3.3: Impressão genérica - função print() imprime no console R

# exemplo 1: string de texto

my_string <- "programming with data is fun"

print(my_string)

# exemplo 2: imprimir sem aspas

print(my_string, quote = FALSE)

# Capítulo 3.3.1: Quando usar print()

#exemplo:
 
for (i in 1:5) {
  print(i + 1)
}

# Capítulo 3.4: Concatene e imprima com cat() - imprime na tela ou em um arquivo

# exemplo 1: 

cat(my_string)

# exemplo 2: concatene e imprima

cat(my_string, "with R")

# exemplo 3:

cat(my_string, "with R", sep=" =) ")

# exemplo 4:

cat(1:10, sep = "-")

# exemplo 5:

cat(month.name[1:4], sep = " ")

# exemplo 6:

cat(month.name[1:4], sep = "-")

# exemplo 7:

cat(month.name[1:4], sep ="")

# exemplo 8: argumento fill

cat("Loooooooooong strings", "can be displayed", "in a nice format", 
    "by using the 'fill' argument", fill = 30)

# exemplo 9: cat com saída em um arquivo, use o argumento file

cat(my_string, "with R", file = "output.txt")

# Capítulo 3.5: Codificando strings com format()

# exemplo 1: uso padrão

format(13.7)

# exemplo 2:

format(13.12345678)

# exemplo 3: uso nsmall

format(13.7, nsmall = 3)

# exemplo 4: uso digits

format(c(6.0, 13.1), digits = 2)

# exemplo 5: uso digits e nsmall

format(c(6.0, 13.1), digits = 2, nsmall = 1)

# exemplo 6: justificar opções

format(c("A", "BB", "CCC"), width = 5, justify = "centre")

format(c("A", "BB", "CCC"), width = 5, justify = "left")

format(c("A", "BB", "CCC"), width = 5, justify = "right")

format(c("A", "BB", "CCC"), width = 5, justify = "none")


# exemplo 7: digits

format(1/1:5, digits = 2)


# exemplo 8: uso de 'digits', widths e justify

format(format(1/1:5, digits = 2), width = 6, justify = "c")

