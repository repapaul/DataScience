library(tm)
library(wordcloud)
library(textmineR)
 
uia  <-VCorpus(DirSource("C:/Petrobras/TextMining/grupo1"), readerControl = list(language="pt_BR")) 
summary(uia)
ndocs <- length(uia)
minTermFreq <- ndocs * 0.01
maxTermFreq <- ndocs * .5
uia <- tm_map(uia, removeNumbers)
uia <- tm_map(uia, removePunctuation)
uia <- tm_map(uia , stripWhitespace)
uia <- tm_map(uia, tolower)
uia <- tm_map(uia, PlainTextDocument)
uia <- tm_map(uia, removeWords, stopwords("portuguese")) 
#uia <- tm_map(uia, stemDocument, language = "portuguese")

xDTM = DocumentTermMatrix(uia,
                         control = list(encoding = "UTF-8",
                                        stopwords = TRUE, 
                                        wordLengths=c(4, 15),
                                        removePunctuation = T,
                                        removeNumbers = T,
                                        bounds = list(global = c(minTermFreq, maxTermFreq))
                                       ))

xDTM <- removeSparseTerms(xDTM, 0.75)

xDTM <- xDTM[, names(head(sort(colSums(as.matrix(xDTM))), 400))]
xDTM <- xDTM[, names(sort(colSums(as.matrix(xDTM))))]
print(as.matrix(xDTM))

write.csv((as.matrix(xDTM)), "test.csv")
head(sort(as.matrix(xDTM)[1,], decreasing = TRUE), n=15)
xDTM.matrix = as.matrix(xDTM)
wordcloud(colnames(xDTM.matrix), xDTM.matrix[1, ], max.words = 20)

m  <- as.matrix(xDTM)
distMatrix <- dist(m, method="euclidean")
print(distMatrix)


groups <- hclust(distMatrix,method="ward.D")
plot(groups, cex=0.9, hang=1)
rect.hclust(groups, k=3)

xDTM
dim(xDTM)
inspect(xDTM)
Terms(xDTM)

dataset = as.matrix(xDTM)
v = sort(colSums(dataset),decreasing=TRUE)
myNames = names(v)
d = data.frame(word=myNames,freq=v)
wordcloud(d$word, colors=c(3,4),random.color=FALSE, d$freq, min.freq=100)



dd <- dist(scale(xDTM), method = "euclidean")
hc <- hclust(dd, method = "ward.D2")

summary(dd)
summary(hc)



