library(recommenderlab) 
library(dplyr) 
library(tidyr)
library(tibble)
ratings.df <- read.csv('train_v2.csv')

rating_matrix <- ratings.df %>% select(-ID) %>% spread(movie, rating) %>%
  remove_rownames() %>%
  column_to_rownames(var = 'user')
rating_rrm <- as(as(rating_matrix, 'matrix'), 'realRatingMatrix') 

recommenderRegistry$get_entries(dataType = "realRatingMatrix")
r <- Recommender(rating_rrm[1:9], method = "POPULAR")
r
names(getModel(r))
getModel(r)$topN
recom <- predict(r, rating_rrm[10], n=5)
recom
t <- as(recom, "list")
recom3 <- bestN(recom, n = 3)
recom3
as(recom3, "list")

