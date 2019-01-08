###
### Exercicio
###

texto <- c("Amor é fogo que arde sem se ver
           
           Amor é fogo que arde sem se ver;
           É ferida que dói e não se sente;
           É um contentamento descontente;
           É dor que desatina sem doer;
           
           É um não querer mais que bem querer;
           É solitário andar por entre a gente;
           É nunca contentar-se de contente;
           É cuidar que se ganha em se perder;
           
           É querer estar preso por vontade;
           É servir a quem vence, o vencedor;
           É ter com quem nos mata lealdade.
           
           Mas como causar pode seu favor
           Nos corações humanos amizade,
           Se tão contrário a si é o mesmo Amor?")

# Quantas palavras tem esse texto?
nchar(texto)

# converta todo o texto para minuscula. 
# Use a função cat para conferir as alteraçoes
aux <- tolower(texto)
cat(aux)

# Substitua todos do caracteres acentudos
# pelo correspondentes sem acênto.

aux <- chartr("áãéíõó","aaeioo",aux)
cat(aux)

# Substitua a pontuação por espaço
aux <- chartr(";"," ",aux)
aux <- chartr("-"," ",aux)
aux <- chartr("."," ",aux)
aux <- chartr("?"," ",aux)
aux <- chartr(";"," ",aux)
aux <- chartr("\n"," ",aux)
aux <- chartr(","," ",aux)
cat(aux)

# Separe o texto em palavras
aux2 <- unlist(strsplit(aux," "))

# Retire os objetos iguais a espaço
idx <- (aux2 != "" & aux2 != "\n")
aux2 <- aux2[idx]
aux2

# Qual a palavra mais frequente.

x <- sort(table(aux2),decreasing=T)
palavras <- data.frame (x, stringsAsFactors=F)
names(palavras) <- c("termo", "qtd")

# Qual a palavra com mais caracters.
