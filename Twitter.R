
install.packages("twitteR", type = "binary")

library(twitteR)

setup_twitter_oauth("8kHhRwm89Cz9htKxiNPJHHjUL","fyBZ3W08olRKDfZ4H5Wrr6oNDHQLvdHJa97j58zav9aGXoX7UQ","1059065273851019264-49c7JvprR6Ao1LYKcCeWB3w6ni3aS5","Y8N5BxpouqQZDMhXINHeKuPEgp51HPqX2b888VTC6b1Xo")

rdmTweets <- searchTwitter('StefaniniGlobal', n=5)

head(rdmTweets)

n <- length(rdmTweets)
rdmTweets[1:3]
df <- do.call("rbind", lapply(rdmTweets, as.data.frame))
dim(df)

# salva arquivo
write.csv(df, file = "SaidaTwitter.csv")


library(tm)
myCorpus <- Corpus(VectorSource(df$text))
myCorpus <- tm_map(myCorpus, tolower)
myCorpus <- tm_map(myCorpus, removePunctuation)
myCorpus <- tm_map(myCorpus, removeNumbers)
dictCorpus <- myCorpus
inspect(dictCorpus)


myCorpus <- tm_map(myCorpus, stemDocument)
inspect(myCorpus[1:5])

myCorpus <- tm_map(myCorpus, stemCompletion, dictionary=dictCorpus)
inspect(myCorpus[1:5])

myDtm <- TermDocumentMatrix(myCorpus, control = list(minWordLength = 1))
inspect(myDtm)
findFreqTerms(myDtm)
findFreqTerms(myDtm, lowfreq=3)

stefanini<-getUser('stefaniniglobal')
stefanini$getDescription()
stefanini$getFriends(n=5)
stefanini$getFavorites(n=5)


