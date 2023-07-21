install.packages("rtweet")
install.packages("tidytext")
install.packages("dplyr")
install.packages("stringr")
require(devtools)
install_github("lchiffon/wordcloud2")

library(tidytext)
library(dplyr)
library(stringr)
library(rtweet)
library(wordcloud2)
library(tm)
library(SnowballC)
library(wordcloud)
library(ggplot2)

hmt = read.csv("../input_data/clean_unique_tweet.csv", header = T, sep = ',')

hmt$cleantext = as.character(hmt$cleantext)


#Unnest the words - code via Tidy Text
hmtTable <- hmt %>% 
  unnest_tokens(word, cleantext)

#remove stop words - aka typically very common words such as "the", "of" etc
data(stop_words)
hmtTable <- hmtTable %>%
  anti_join(stop_words)

#do a word count
hmtTable <- hmtTable %>%
  count(word, sort = TRUE) 
hmtTable 

#Remove other nonsense words
hmtTable <-hmtTable %>%
  filter(!word %in% c('alternative', 't.co', 'https', 'handmaidstale', "handmaid's", 'season', 'episode', 'de', 'handmaidsonhulu',  'tvtime', 
                      'watched', 'watching', 'watch', 'la', "it's", 'el', 'en', 'tv',
                      'je', 'ep', 'week', 'amp', 'rt', 'Rt', 'medicine', 'treatment', 'help', 'can','health', 'use', 'benefit', 'benefits', 'pain', 'healing', 'medicines', 'holistic', 'medical'))

wordcloud2(hmtTable, size=0.6)
