library(cluster)
library(compareGroups)
library(HDclassif)
library(NbClust)
library(sparcl)

data(wine)
str(wine)

df <- as.data.frame(scale(wine[,-1]))

# stats 패키지에 있는 hclust()함수
# input:거리행렬, 군집화 방법

numComplete <- NbClust(df, distance="euclidean", min.nc=2, max.nc=6, method="complete", index="all")
dis <- dist(df, method="euclidean")
hc <- hclust(dis, method="complete")
plot(hc, hang=-1, labels=FALSE, main="test")
comp3 <- cutree(hc, 3)
ColorDendrogram(hc, y=comp3, main="test")

hcWard <- hclust(dis, method="ward.D2")
plot(hcWard, labels=FALSE, main="Ward")
ward3 <- cutree(hcWard, 3)
table(ward3, wine$class)


#
numKMeans <- NbClust(df, min.nc=2, max.nc=15, method="kmeans")
set.seed(1234)
km <- kmeans(df, 3, nstart=25)
table(km$cluster)
