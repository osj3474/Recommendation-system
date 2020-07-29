library(recommenderlab)
library(dplyr) 
library(tidyr)
library(tibble)

class(user_item)
user_item <- as.matrix(user_item)
rating <- as(user_item, "realRatingMatrix")
getRatingMatrix(rating)
identical(as(rating, "matrix"), user_item)
rating_lst <- as(rating, "list")
rating_lst

r_m <- normalize(rating)
getRatingMatrix(r_m)
r_d <- denormalize(r_m)
getRatingMatrix(r_d)
image(rating, main = "Raw Ratings")
image(r_m, main = "Normalized Ratings")

r_b <- binarize(rating, minRating=4)  # binary case
binary <- as(r_b, "matrix")
View(binary)


user_item_ratings <- as.matrix(user_item)
rating <- as(user_item_ratings, "realRatingMatrix")

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



### 직접!
df <- read.csv("hungry_eun_tae.csv")
#View(df)
df_t <- t(df)
df_t <- df_t[-1,]
#View(df_t)
colnames(df_t) <- paste("i", 1:ncol(df_t), sep='')

df_t <- as.data.frame(df_t)
str(df_t)
df_t[,c(1:ncol(df_t))] <- as.double(unlist(df_t[,c(1:ncol(df_t))]))
df_t[which(df_t == 0, arr.ind = TRUE)] <- NA
str(df_t)


user_item_ratings <- as.matrix(df_t)
rating <- as(user_item_ratings, "realRatingMatrix")

recommenderRegistry$get_entries(dataType = "realRatingMatrix")
nrow(rating)
class(rating)

# Recommender(data, method)
r <- Recommender(rating[1:9], method = "UBCF")
r
names(getModel(r))
getModel(r)$description
recom <- predict(r, rating[10], n=5, type="topNList")
recom
t <- as(recom, "list")
recom3 <- bestN(recom, n = 3)
recom3
as(recom3, "list")

