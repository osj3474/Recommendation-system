m <- matrix(sample(c(as.numeric(0:5), NA), 50,
                   replace=TRUE, prob=c(rep(.4/6,6),.6)), ncol=10,
            dimnames=list(user=paste("u", 1:5, sep=""),
                          item=paste("i", 1:10, sep="")))
m

m <- as.matrix(m)
rating <- as(m, "realRatingMatrix")

recommenderRegistry$get_entries(dataType = "realRatingMatrix")
nrow(rating)
class(rating)

# Recommender(data, method)
r <- Recommender(rating[1:4], method = "UBCF")
r
names(getModel(r))
getModel(r)$description
recom <- predict(r, rating[5], n=15, type="topNList")
recom
t <- as(recom, "list")
recom3 <- bestN(recom, n = 3)
recom3
as(recom3, "list")

