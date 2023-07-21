library(stringr)
library(modeest)
library(stringi)


summary(query$query)
query$query = as.character(query$query)
cleanQuery<-query$query
text2 = iconv(cleanQuery, "UTF-8", "UTF-8", sub = '')
text2 <- str_replace_all(text2," ","")

query$cleanQuery = text2


query$querylen <- str_length(query$cleanQuery) #length, no. of chracters
query$querywordCount<-(str_count(query$cleanQuery," ") + 1) # word count

results = character(0)
results = query$query
length(results)

# characters per query
chars_per_query = sapply(results, nchar)
summary(chars_per_query)

# split words
words_list = strsplit(results, " ")

# words per query
words_per_query = sapply(words_list, length)
summary(words_per_query)
# barplot
barplot(table(words_per_query), main="Distribution of words per query")

