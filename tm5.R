# Carrega o pacote tm
library(tm)
#Cria Corpus 
docs <- Corpus(DirSource("C:/Users/raucelio.rccv/Desktop/tm/textos"))

#observar os documentos
inspect(docs)

#inspect a particular document
writeLines(as.character(docs[[30]]))

#Prepara os documentos
toSpace <- content_transformer(function(x, pattern) { return (gsub(pattern, " ", x))})
docs <- tm_map(docs, toSpace, "-")
docs <- tm_map(docs, toSpace, ":")
docs <- tm_map(docs, toSpace, "'")
docs <- tm_map(docs, toSpace, "'")
docs <- tm_map(docs, toSpace, " -")

#Observar um texto  especifico.
writeLines(as.character(docs[[30]]))

#retira pontua??o, substitui por " "
docs <- tm_map(docs, removePunctuation)

#passar tudo para minusculo
docs <- tm_map(docs,content_transformer(tolower))

#retirar digitos
docs <- tm_map(docs, removeNumbers)

#Remover palavras sem significado
docs <- tm_map(docs, removeWords, stopwords("english"))

# Remover espaços em branco
docs <- tm_map(docs, stripWhitespace)

#Observar um texto em especial
writeLines(as.character(docs[[30]]))

#Para reduzir os termos ao seu radical ? necess?rio a 
#biblioteca SnowballC

library(SnowballC)

#Redu??o dos termos ao seu radical
docs <- tm_map(docs,stemDocument)

#some clean up
docs <- tm_map(docs, content_transformer(gsub),
               pattern = "organiz", replacement = "organ")
docs <- tm_map(docs, content_transformer(gsub),
               pattern = "organis", replacement = "organ")
docs <- tm_map(docs, content_transformer(gsub),
               pattern = "andgovern", replacement = "govern")
docs <- tm_map(docs, content_transformer(gsub),
               pattern = "inenterpris", replacement = "enterpris")
docs <- tm_map(docs, content_transformer(gsub),
               pattern = "team-", replacement = "team")

#Observar as alteraçses em um documento especifico
writeLines(as.character(docs[[30]]))

#Criar a matriz de termos
dtm <- DocumentTermMatrix(docs)

#Verificar um segmento desta matriz
inspect(dtm[1:2,1000:1005])

#Obter a frequencia de cada termo

freq <- colSums(as.matrix(dtm))

#Quantidade de teroms
length(freq)

#Ordenar as palavras mais frequentes
ord <- order(freq,decreasing=TRUE)

#Verificar as palavras mais frequentes
freq[head(ord)]

#verificar as menos frequentes
freq[tail(ord)]

#remover as palavas mas frequentes e as menos frequentes
dtmr <-DocumentTermMatrix(docs, control=list(wordLengths=c(4, 20),
                                             bounds = list(global = c(3,27))))
freqr <- colSums(as.matrix(dtmr))

#O numero de palavras 

length(freqr)

# ordenar as palavras 

ordr <- order(freqr,decreasing=TRUE)
# inspecionar os termos mais frequentes
freqr[head(ordr)]

# inspecionar os termos menos frequentes
freqr[tail(ordr)]

#lista os temrmos mais frquentes
findFreqTerms(dtmr,lowfreq=80)

# #correlacoes
# findAssocs(dtmr,"project",0.6)
# findAssocs(dtmr,"enterprise",0.6)
# findAssocs(dtmr,"system",0.6)
#histograma

wf=data.frame(term=names(freqr),occurrences=freqr)
library(ggplot2)
p <- ggplot(subset(wf, freqr>100), aes(term, occurrences))
p <- p + geom_bar(stat="identity")
p <- p + theme(axis.text.x=element_text(angle=45, hjust=1))
p
#nuvem de palavras

library(wordcloud)

#definir a semente para fixar a forma da nuvem
set.seed(42)
#limitando o frequencia minima
wordcloud(names(freqr),freqr, min.freq=70)
#adicionando cores
wordcloud(names(freqr),freqr,min.freq=70,colors=brewer.pal(6,"Dark2"))