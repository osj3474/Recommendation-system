# kmeans
#original (kmeans)
test <- t(user_item)
test[is.na(test)] <- 0
test <- as.data.frame(test)
clusterKmeans <- kmeans(test, centers = 3, iter.max = 1000)
summary(clusterKmeans)
clusterKmeans$cluster

# pohang (kmeans)
df <- read.csv("pohang.csv")
m <- df[, -12]
m <- t(m)
m <- m[-1,]
colnames(m) <- paste("i", 1:ncol(m), sep='')
tt <- as.data.frame(m)
tt[,c(1:ncol(tt))] <- as.double(unlist(tt[,c(1:ncol(tt))]))
clusterKmeans <- kmeans(tt, centers = 3, iter.max = 1000)
clusterKmeans$cluster
# u1  u2  u3  u4  u5  u6  u7  u8  u9 u10 
# 2   1   3   2   1   3   1   2   1   3 

# pohang (NbClust)
# numKMeans <- NbClust(test, min.nc=2, max.nc=15, method="kmeans")
set.seed(1234)
km <- kmeans(tt, 3, nstart=25)
km$cluster
table(km$cluster)
# u1  u2  u3  u4  u5  u6  u7  u8  u9 u10 
# 3   2   2   3   3   2   2   3   3   1 


# hierarchical clustering
test <- t(user_item)
test[is.na(test)] <- 0
test <- as.data.frame(test)
d <- dist(test, method="euclidean") 
as.matrix(d)[1:4,]
pfit <- hclust(d, method="ward.D") 
test$user <- c(rownames(test))
#plot(pfit, hang=-10, cex=0.8)
plot(pfit, labels=test$user)

# hierarchical clustering
df <- read.csv("pohang.csv")
m <- df[, -12]
m <- t(m)
m <- m[-1,]
colnames(m) <- paste("i", 1:ncol(m), sep='')
tt <- as.data.frame(m)
tt[,c(1:ncol(tt))] <- as.double(unlist(tt[,c(1:ncol(tt))]))
d <- dist(tt, method="euclidean") 
pfit <- hclust(d, method="ward.D") 
tt$user <-c(rownames(tt))
plot(pfit, labels=tt$user)


# DBSCAN
library(fpc)
library(ggplot2)

db <- dbscan(data, eps = sqrt(10), MinPts = 4)


