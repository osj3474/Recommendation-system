load("example.RData")
View(tr)

colSums(is.na(tr))
rowSums(is.na(tr))

library(dplyr)
trr <- tr %>%
  filter(!rowSums(is.na(tr)) >40) 
View(trr)
rowSums(is.na(trr))



test <- tr[-which(rowSums(is.na(tr)) > 40),]
rowSums(is.na(test))


load("example.RData")
View(tr)
colSums(is.na(tr))
rowSums(is.na(tr))

library(dplyr)
trr <- tr %>%
  filter(!rowSums(is.na(tr)) > 40)
rowSums(is.na(trr))

trrr <- tr[-which(rowSums(is.na(tr))>40),]
rowSums(is.na(trrr))
