###
### representacao tabular
###


# nchar 

texto <- "Palavras amigas são doce como o mel ..."
nchar (texto)
texto <- c("banana", "laranja", "maça")
nchar (texto)

# tolower, toupper e casefolding

texto <- "Vai ter com a formiga, ó preguiçoso;"
tolower (texto)
toupper (texto)

texto <- "Vai ter com a formiga, ó preguiçoso;"
casefold (texto, upper=FALSE)
casefold (texto, upper=TRUE)

# nchar

texto <- "Bênçãos há sobre a cabeça do justo"
chartr("êáãç","eaac",texto)

# substr

texto <- c("um", "dois", "três")
substr(texto,2,2)
substr(texto,2,2) <- "#"
texto

# strplit

texto <- "Mulher virtuosa quem a achará? 
O seu valor muito excede ao de rubis."
strsplit(texto," ")

# strplit

texto <- "Mulher virtuosa quem a achará? 
O seu valor muito excede ao de rubis."
strsplit(texto," ")

# gsub

texto <- c("Melhor é a repreensão franca do que o amor encoberto.")
texto
gsub("[aeiou]","!",texto)
