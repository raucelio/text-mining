# Carrega o pacote tm
library(tm)
library(SnowballC)
library(wordcloud)

#Cria Corpus 
aux <- "C:/Users/raucelio.rccv/Desktop/tm/discurso"
docs <- Corpus(DirSource(aux))

#Analise lexical
toSpace <- content_transformer(function(x, pattern) { return (gsub(pattern, " ",
                                                                   x))})
docs <- tm_map(docs, toSpace, "-")
docs <- tm_map(docs, toSpace, ":")
docs <- tm_map(docs, toSpace, "'")
docs <- tm_map(docs, toSpace, "'")
docs <- tm_map(docs, toSpace, " -")

#Remove pontuacao - replace punctuation marks with " "
docs <- tm_map(docs, removePunctuation)
#Transform to minuscula
docs <- tm_map(docs,content_transformer(tolower))
#Remove digitos
docs <- tm_map(docs, removeNumbers)
#Remove stopwords

docs <- tm_map(docs, removeWords, stopwords("pt"))
# remove espacos
docs <- tm_map(docs, stripWhitespace)
#inspect output
#Need SnowballC library for stemming

#docs <- tm_map(docs,stemDocument)

#Create document-term matrix
dtm <- DocumentTermMatrix(docs)
freq <- colSums(as.matrix(dtm))
#dtmr <-DocumentTermMatrix(docs, control=list(wordLengths=c(4, 20),
#                                             bounds = list(global = c(3,27))))
#wordcloud

#setting the same seed each time ensures consistent look across clouds
set.seed(42)
wordcloud(names(freq),freq,min.freq=70,colors=brewer.pal(6,"Dark2"))
