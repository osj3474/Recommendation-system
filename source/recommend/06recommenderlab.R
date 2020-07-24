library(recommenderlab) 
library(dplyr) 
library(tidyr)
library(tibble)

user_item_ratings <- as.matrix(user_item)
rating <- as(user_item_ratings, "realRatingMatrix")

recommenderRegistry$get_entries(dataType = "realRatingMatrix")
nrow(rating)
class(rating)

# Recommender(data, method)
r <- Recommender(rating[1:40], method = "IBCF")
r
names(getModel(r))
getModel(r)$description
recom <- predict(r, rating[41:43], n=15, type="topNList")
recom
t <- as(recom, "list")
recom3 <- bestN(recom, n = 3)
recom3
as(recom3, "list")

# given에서 줄 것이 없다
# e <- evaluationScheme(rating, method="split", train=0.8, given=10) 
# r1 <- Recommender(getData(e, "train"), "UBCF")
# r2 <- Recommender(getData(e, "train"), "IBCF")
# p1 <- predict(r1, getData(e, "known"), type="ratings") 
# p2 <- predict(r2, getData(e, "known"), type="ratings")
# error <- rbind(
#   calcPredictionAccuracy(p1, getData(e, "unknown")), calcPredictionAccuracy(p2, getData(e, "unknown"))
# )
# rownames(error) <- c("UBCF","IBCF")
# error