library(recommenderlab) 
library(dplyr) 
library(tidyr)
library(tibble)

user_item_ratings <- as.matrix(user_item)
rating <- as(user_item_ratings, "realRatingMatrix")

#user_item_ratings_t <- t(as.matrix(user_item))
#rating_t <- as(user_item_ratings, "realRatingMatrix")

#recommenderRegistry$get_entries(dataType = "realRatingMatrix")
nrow(rating)
class(rating)

# Recommender(data, method)
r <- Recommender(rating[1:40], method = "IBCF")
r
names(getModel(r))
getModel(r)$description
recom <- predict(r, rating[41:43], n=15, type="topNList") 
# rating하면, user_item_ratings[which(rownames(user_item_ratings)=="i1212"),]
recom
as(recom, "list")
recom3 <- bestN(recom, n = 3)
recom3
as(recom3, "list")

# given에서 줄 것이 없다
e <- evaluationScheme(rating, method="split", train=0.8, given=3) 
newe <- evaluationScheme(rating_t, method="split", train=0.8, given=3) 
r1 <- Recommender(data=getData(newe, "train"), method="UBCF")

# names(getModel(r1))
# getModel(r1)$nn
# nrow(rating)
# nrow(as(getData(e, "train"), "matrix"))
# nrow(as(getData(e, "known"), "matrix"))


r2 <- Recommender(getData(e, "train"), "IBCF")
p1 <- predict(r1, newdata=getData(newe, "known"), type="ratings") 
p2 <- predict(r2, getData(e, "known"), type="ratings")
error <- rbind(
 calcPredictionAccuracy(p1, getData(e, "unknown")), calcPredictionAccuracy(p2, getData(e, "unknown"))
)
rownames(error) <- c("UBCF","IBCF")
error