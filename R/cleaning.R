#After removing multiple lines/new line characters from the text column

data = read.csv("master_raw.csv", header = T, sep = ',')

library(stringi)
library(stringr)
library(tm)
library(wordcloud)

data$modtext <- data$text
data$modtext = as.character(data$modtext)
#convert data to UTF
data$modtext<- iconv(data$modtext, "UTF-8", "UTF-8", sub="")
data$modtext = iconv(data$modtext, "latin1", "ASCII", sub="")
data$modtext<- iconv(data$modtext, "ASCII", "UTF-8", sub="")

#add columns
data$rt <-str_match(data$modtext,"RT @[a-z,A-Z]*: ") #add column for RT
data$rt <-str_match(data$modtext,"RT @[a-z,A-Z].*: ") #add column for RT
data$hasrt<-!(is.na(data$rt)) #if rt value is NA, then this will add a column hasrt - T/F 

data$hastag <- str_extract_all(data$modtext, "#\\S+")#add column for hastag
data$urlist<-str_extract_all(data$modtext,"https://t.co/[a-z,A-Z,0-9]{8}") #save these urls in a new column
data$numurls<-rapply(data$urlist,length) #to get no. of urls for all rows recursively in a new col.

#remove quotes, chatacter(0), c()
data$hastag <- gsub("^c\\(|\\)$", "", data$hastag)
data$urlist <- gsub("^c\\(|\\)$", "", data$urlist)
data$hastag <- gsub("\"","", data$hastag)
data$urlist <- gsub("\"","", data$urlist)
data$hastag[data$hastag=="character(0)"] <- NA_character_
data$urlist[data$urlist=="character(0)"] <- NA_character_
data$hastag[data$hastag=="character(0"] <- NA_character_
data$urlist[data$urlist=="character(0"] <- NA_character_

##CleanTweets() - Takes the junk out of a vector of
# tweet texts
CleanTweets<-function(tweets)
{
  # Remove redundant spaces
  tweets <- str_replace_all(tweets,"  "," ")
  tweets = gsub("&amp", "", tweets)
  tweets = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", tweets)
  tweets = gsub("@\\w+", "", tweets)
  tweets = gsub("[[:punct:]]", "", tweets)
  tweets = gsub("[[:digit:]]", "", tweets)
  tweets = gsub("http\\w+", "", tweets)
  tweets = gsub("[ \t]{2,}", "", tweets)
  tweets = gsub("^\\s+|\\s+$", "", tweets)
  # Get rid of URLs
  tweets <- str_replace_all(tweets,"https://t.co/[a-z,A-Z,0-9]{10}","")
  # Take out retweet header, there is only one
  tweets <- str_replace(tweets,"RT @[a-z,A-Z]*: ","")
  tweets <- str_replace(tweets,"RT @[a-z,A-Z].*: ","")
  tweets <- str_replace(tweets,"@[a-z,A-Z]*: ","")
  tweets <- str_replace(tweets,"@[a-z,A-Z].*: ","")
  # Get rid of hashtags
  tweets <- str_replace_all(tweets,"#[a-z,A-Z]*","")
  tweets <- str_replace_all(tweets,"#[a-z,A-Z].*","")
  tweets <- str_replace_all(tweets,"#\\s+","")
  tweets <- str_replace_all(tweets,"#.\\s","")
  # Get rid of references to other screennames
  tweets <- str_replace_all(tweets,"@[a-z,A-Z]*","")
  tweets <- str_replace_all(tweets,"@[a-z,A-Z].*","")
  return(tweets)
}

#let's get rid of the redundants spaces, urls, RTs, #s, screennames 
data$cleantext<-CleanTweets(data$modtext)

data$cleantext<- iconv(data$cleantext, "UTF-8", "UTF-8", sub="")
data$cleantext = iconv(data$cleantext, "latin1", "ASCII", sub="")
data$cleantext<- iconv(data$cleantext, "ASCII", "UTF-8", sub="")

library(dplyr)
data$cleantext <- as.character(data$cleantext)
data$cleantext <- str_to_lower(data$cleantext)

data$textlen <-str_length(data$cleantext) #column modtext length, no. of characters in modtext
data$wordCount<-(str_count(data$cleantext," ") + 1) # word count
data$longtext<-(data$textlen>140) #which tweets are long

df = unique(data)
df = data[!duplicated(data),]

df2 = subset(df, !duplicated(text))
df2 = df[!duplicated(df$text), ]

write.table(data, file = 'clean_data_all.csv', row.names = FALSE, sep = ',', na = 'NA')
write.table(df, file = 'clean_unique_record.csv', row.names = FALSE, sep = ',', na = 'NA')
write.table(df2, file = 'clean_unique_tweet.csv', row.names = FALSE, sep = ',', na = 'NA')
