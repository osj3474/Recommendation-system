data(iris)
iris <- as.matrix(iris[,1:4])

## find suitable eps parameter using a k-NN plot for k = dim + 1
## Look for the knee!
kNNdistplot(iris, k = 5)
abline(h=.5, col = "red", lty=2)

res <- dbscan(iris, eps = .5, minPts = 5)
res

pairs(iris, col = res$cluster + 1L)

## use precomputed frNN
fr <- frNN(iris, eps = .5)
dbscan(fr, minPts = 5)

## Example 2: use data from fpc
set.seed(665544)
n <- 100
x <- cbind(
  x = runif(10, 0, 10) + rnorm(n, sd = 0.2),
  y = runif(10, 0, 10) + rnorm(n, sd = 0.2)
)

res <- dbscan(x, eps = .3, minPts = 3)
res

## plot clusters and add noise (cluster 0) as crosses.
plot(x, col=res$cluster)
points(x[res$cluster==0,], pch = 3, col = "grey")

hullplot(x, res)

## predict cluster membership for new data points
## (Note: 0 means it is predicted as noise)
newdata <- x[1:5,] + rnorm(10, 0, .2)
predict(res, newdata, data = x)

## compare speed against fpc version (if microbenchmark is installed)
## Note: we use dbscan::dbscan to make sure that we do now run the
## implementation in fpc.
# }
# NOT RUN {
# if (requireNamespace("fpc", quietly = TRUE) &&
#     requireNamespace("microbenchmark", quietly = TRUE)) {
#   t_dbscan <- microbenchmark::microbenchmark(
#     dbscan::dbscan(x, .3, 3), times = 10, unit = "ms")
#   t_dbscan_linear <- microbenchmark::microbenchmark(
#     dbscan::dbscan(x, .3, 3, search = "linear"), times = 10, unit = "ms")
#   t_dbscan_dist <- microbenchmark::microbenchmark(
#     dbscan::dbscan(x, .3, 3, search = "dist"), times = 10, unit = "ms")
#   t_fpc <- microbenchmark::microbenchmark(
#     fpc::dbscan(x, .3, 3), times = 10, unit = "ms")
#   
#   r <- rbind(t_fpc, t_dbscan_dist, t_dbscan_linear, t_dbscan)
#   r
#   
#   boxplot(r,
#           names = c('fpc', 'dbscan (dist)', 'dbscan (linear)', 'dbscan (kdtree)'),
#           main = "Runtime comparison in ms")
#   
#   ## speedup of the kd-tree-based version compared to the fpc implementation
#   median(t_fpc$time) / median(t_dbscan$time)
# }
# # }
# # NOT RUN {
# ## Example 3: manually create a frNN object for dbscan (dbscan only needs ids and eps)
# nn <- structure(list(ids = list(c(2,3), c(1,3), c(1,2,3), c(3,5), c(4,5)), eps = 1),
#                 class =  c("NN", "frNN"))
# nn
# dbscan(nn, minPts = 2)

