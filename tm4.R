# Carrega o pacote tm
library(tm)
library(SnowballC)
library(wordcloud)

##Cria um conjunto de texto 

aux <-  readLines("posse.txt", encoding="UTF-8")
aux <- aux [aux != "" ]
docs <- VCorpus(VectorSource(aux))


docs <- Corpus(DirSource("C:/Users/raucelio.rccv/Desktop/tm/discurso",
                         mode = "text",
                         encoding = "UTF-8")
               )

##Analise lexical

# retira pontuacao

toSpace <- content_transformer(function(x, pattern) { return (gsub(pattern, " ", x))})
docs <- tm_map(docs, toSpace, "-")
docs <- tm_map(docs, toSpace, ":")
docs <- tm_map(docs, toSpace, "'")
docs <- tm_map(docs, toSpace, "'")
docs <- tm_map(docs, toSpace, " -")

#Remove pontuacao - replace punctuation marks with " "
docs <- tm_map(docs, removePunctuation)

#Transforma para minuscula
docs <- tm_map(docs,content_transformer(tolower))

#Remove os digitos
docs <- tm_map(docs, removeNumbers)

#Remove stopwords
docs <- tm_map(docs, removeWords, stopwords("pt"))

# remove espacos
docs <- tm_map(docs, stripWhitespace)


## Verificação dos resultados

# reduzindo as palavras ao seu radical
docs <- tm_map(docs,stemDocument,language="portuguese")

#Criando a matrixz documento termo document-term matrix
dtm1 <- DocumentTermMatrix(docs)

freq <- colSums(as.matrix(dtm))


#nuvem de palavras

#setting the same seed each time ensures consistent look across clouds
set.seed(42)
wordcloud(names(z),z,min.freq=3,colors=brewer.pal(6,"Dark2"))

