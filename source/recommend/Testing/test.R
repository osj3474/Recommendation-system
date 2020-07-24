set.seed(1234)
r <- sample(rating, 1000)
r
rowCounts(r[1,])
t <- as(r[1,], "list")
t

rowMeans(r[1,])
hist(getRatings(r), breaks=100)
hist(getRatings(normalize(r)), breaks=100)
hist(getRatings(normalize(r, method="Z-score")), breaks=100)
hist(rowCounts(r), breaks=50)
hist(colMeans(r), breaks=20)


recommenderRegistry$get_entries(dataType = "realRatingMatrix")
r <- Recommender(rating[1:1000], method = "POPULAR")
r
names(getModel(r))
getModel(r)$topN
recom <- predict(r, rating[1001:1002], n=5)
recom
t <- as(recom, "list")
recom3 <- bestN(recom, n = 3)
recom3
as(recom3, "list")

recom <- predict(r, rating[1001:1002], type="ratings")
recom
as(recom, "matrix")[,1:10]
recom <- predict(r, rating[1001:1002], type="ratingMatrix")
recom
as(recom, "matrix")[,1:10]

e <- evaluationScheme(rating[1:1000], method="split", train=0.9,
                      given=1, goodRating=5)
e

r1 <- Recommender(getData(e, "train"), "UBCF")
r1

r2 <- Recommender(getData(e, "train"), "IBCF")
r2

p1 <- predict(r1, getData(e, "known"), type="ratings")
p1

p2 <- predict(r2, getData(e, "known"), type="ratings")
p2

error <- rbind(
  UBCF = calcPredictionAccuracy(p1, getData(e, "unknown")),
  IBCF = calcPredictionAccuracy(p2, getData(e, "unknown"))
)
error


scheme <- evaluationScheme(Jester5k[1:1000], method="cross", k=4, given=3,
                           goodRating=5)
scheme

results <- evaluate(scheme, method="POPULAR", type = "topNList",
                    n=c(1,3,5,10,15,20))
results

getConfusionMatrix(results)[[1]]
avg(results)
plot(results, annotate=TRUE)
plot(results, "prec/rec", annotate=TRUE)
