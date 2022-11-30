install.packages("rtweet")
install.packages("tidytext")
install.packages("ggmap")
library(rtweet)
library(tidyverse)
library(tidytext)
library(ggmap)
install.packages("qdap")
library(qdap)

PA_tweets <- search_tweets(
  q = "Election OR Pennsylvania OR PA
  AND (Fetterman OR Oz) 
  AND (God OR pray OR believe)",
  n = 100
)

OH_tweets <- search_tweets(
  q = "Election OR Ohio 
  AND (Vance OR Ryan) 
  AND (God OR pray OR believe)",
  n = 100
)

frequent_terms = freq_terms(PA_tweets["text"], 30)
plot(frequent_terms)

