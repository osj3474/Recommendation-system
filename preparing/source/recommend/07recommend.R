df <- read.csv("pohang.csv")
m <- df[, -12]
m <- t(m)
m <- m[-1,]
colnames(m) <- paste("i", 1:ncol(m), sep='')
class(m)
View(tt)

tt <- as.data.frame(m)
tt[,c(1:ncol(tt))] <- as.double(unlist(tt[,c(1:ncol(tt))]))
str(tt)

tt[which(tt == 0, arr.ind = TRUE)] <- NA

###
library(recommenderlab) 
library(dplyr) 
library(tidyr)
library(tibble)

user_item_ratings <- as.matrix(tt)
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

