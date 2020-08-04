library(recommenderlab) 
library(dplyr) 
library(tidyr)
library(tibble)
ratings.df <- read.csv('train_v2.csv')

rating_matrix <- ratings.df %>% select(-ID) %>% spread(movie, rating) %>%
  remove_rownames() %>%
  column_to_rownames(var = 'user')
rating_rrm <- as(as(rating_matrix, 'matrix'), 'realRatingMatrix') 
rating_rrm <- rating_rrm[rowCounts(rating_rrm) > 50,colCounts(rating_rrm) > 100] # normalization of rating matrix


recommenderRegistry$get_entries(dataType = "realRatingMatrix")

ubcf_model <- Recommender(rating_rrm, method = 'POPULAR') 
recom <- predict(ubcf_model, rating_rrm[1:2, ])
recom

as(recom, 'list')

recom <- predict(ubcf_model, rating_rrm[1:2, ], type = 'ratings') 
recom


as(recom, 'matrix')[,11:20]

e <- evaluationScheme(rating_rrm, method="split", train=0.8, given=10) 
r1 <- Recommender(getData(e, "train"), "UBCF")
r2 <- Recommender(getData(e, "train"), "IBCF")
p1 <- predict(r1, getData(e, "known"), type="ratings") p2 <- predict(r2, getData(e, "known"), type="ratings")
error <- rbind(
  calcPredictionAccuracy(p1, getData(e, "unknown")), calcPredictionAccuracy(p2, getData(e, "unknown"))
)
rownames(error) <- c("UBCF","IBCF")
error