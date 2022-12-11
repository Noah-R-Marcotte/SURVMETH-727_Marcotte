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
  q = "Midterm OR Election OR Pennsylvania OR PA
  AND (Fetterman OR Oz)",
  n = 1000,
  include_rts = FALSE
)

OH_tweets_relig <- search_tweets(
  q = "Midterm OR Election OR Ohio 
  AND (Vance OR Ryan) 
  AND (God OR pray OR believe)",
  n = 1000,
  include_rts = FALSE
)

OH_tweets <- search_tweets(
  q = "Midterm OR Election OR Ohio 
  AND (Vance OR Ryan)",
  n = 1000,
  include_rts = FALSE
)

clean_tweets <- function(x) {
  x %>%
    # Remove URLs
    str_remove_all(" ?(f|ht)(tp)(s?)(://)(.*)[.|/](.*)") %>%
    # Remove mentions e.g. "@my_account"
    str_remove_all("@[[:alnum:]_]{4,}") %>%
    # Remove hashtags
    str_remove_all("#[[:alnum:]_]+") %>%
    # Replace "&" character reference with "and"
    str_replace_all("&amp;", "and") %>%
    # Remove puntucation, using a standard character class
    str_remove_all("[[:punct:]]") %>%
    # Remove "RT: " from beginning of retweets
    str_remove_all("^RT:? ") %>%
    # Replace any newline characters with a space
    str_replace_all("\\\n", " ") %>%
    # Make everything lowercase
    str_to_lower() %>%
    # Remove any trailing whitespace around the text
    str_trim("both")
}
remov_stopwords <- function(x){
  filter(!(word %in% stopwords()))
}


clean_PA_relig <- PA_tweets_relig$full_text %>% clean_tweets()
clean_PA_relig <- data.frame(clean_PA_relig)

clean_PA <- PA_tweets$full_text %>% clean_tweets()
clean_PA <- data.frame(clean_PA)

clean_OH <- OH_tweets$full_text %>% clean_tweets()
clean_OH <- data.frame(clean_OH)

most_common_words_PA <- clean_PA %>% 
  tidyr::separate_rows(clean_PA, sep = "\\s+") %>%
  group_by(clean_PA) %>% 
  count(clean_PA) %>%
  top_n(20, n) 

most_common_words_PA %>%
  arrange(desc(n))




sum(with(most_common_words_PA, n==1))

PA_Most_common <- as_tibble(most_common_words_PA)%>%
  arrange(n) %>%
  slice(-c(1:699)) %>%
  slice(-c(351:373))%>%
  slice(-c(194)) %>% 
  slice(-c(199:201)) %>% 
  slice(-c(265)) %>% 
  slice(-c(273)) %>% 
  slice(-c(275)) %>% 
  slice(-c(280)) %>% 
  slice(-c(284:286)) %>% 
  slice(-c(294)) %>% 
  slice(-c(297)) %>% 
  slice(-c(301)) %>% 
  slice(-c(314)) %>% 
  slice(-c(316)) %>% 
  slice(-c(318)) %>% 
  slice(-c(324:325)) %>% 
  slice(-c(328:329)) %>% 
  slice(-c(332:336)) %>% 
  slice(-c(338:339)) %>% 
  slice(-c(341:343)) %>%
  slice(-c(348))

PA_Twice_Words <- PA_Most_common %>%
  slice(-c(138:329)) %>%
  slice(-c(1:4))

PA_Three_Words <- PA_Most_common %>% 
  slice(-c(57:191))
    
PA_Most_common2 <- PA_Most_common %>% 
  slice(-c(1:195))

PA_interest_words <- PA_Most_common %>%
  arrange(desc(n)) %>%
  slice(-c(290:329)) %>%
  slice(-c(258:287)) %>%
  slice(-c(224:256)) %>%
  slice(-c(215:221)) %>% 
  slice(-c(125:212)) %>%
  slice(-c(110:123)) %>%
  slice(-c(101:108)) %>%
  slice(-c(80:99)) %>%
  slice(-c(1:78))

bar_PA <-ggplot(data=PA_interest_words, aes(x=clean_PA, y=n)) + 
  geom_bar()

barplot(PA_interest_words$n, PA_interest_words$clean_PA)

most_common_words_OH <- clean_OH %>% 
  tidyr::separate_rows(clean_OH, sep = "\\s+") %>%
  group_by(clean_OH) %>% 
  count(clean_OH) %>%
  top_n(20, n) 

sum(with(most_common_words_OH, n==1))

most_common_words_OH <- as_tibble(most_common_words_OH) %>%
  arrange(n) %>%
  slice(-c(1:502))

OH_interest_words <- most_common_words_OH %>%
  arrange(desc(n)) %>%
  slice(-c(280:284))%>% 
  slice(-c(275:276))%>% 
  slice(-c(162:272))%>% 
  slice(-c(144:160))%>% 
  slice(-c(137:141))%>% 
  slice(-c(135))%>% 
  slice(-c(133:124)) %>%
  slice(-c(89:122))%>% 
  slice(-c(1:87))
  
library(ggplot2)
bar_PA <-ggplot(data=PA_interest_words, aes(x=clean_PA)) + 
  geom_bar()
bar_PA+ coord_flip()

bar_OH <-ggplot(data=OH_interest_words, aes(x=clean_OH)) + 
  geom_bar()
bar_OH+ coord_flip()
                  
                  
                  





