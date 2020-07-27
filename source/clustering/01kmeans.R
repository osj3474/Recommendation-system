
library(ggplot2)
library(tidyr)
library(dplyr)

# set.seed(2018)
synth.data <- data.frame(x1 =c(rnorm(20, 3, 1), rnorm(20,0,1), rnorm(20,5,1)), 
                         x2 =c(rnorm(20, 0, 1), rnorm(20,4,1), rnorm(20,5,1)))
synth.data
ndata <- nrow(synth.data)
ndim <- ncol(synth.data)

synth.data %>%
  ggplot(aes(x =x1, y=x2)) +
  geom_point(shape =1) +
  theme_bw()

u_dist<-function(u, v){
  sqrt(sum((u -v) **2))
}

k <-3
cents <-data.frame(cl =1:k)
cents <-cbind(cents, synth.data[sample(1:60, k),])

synth.data$cl <- factor(rep(1, ndata), levels =1:k)
synth.data %>% ggplot(aes(x =x1, y=x2, col =as.factor(cl))) +
  geom_point(shape =1) +
  theme_bw() +
  geom_point(data =cents, shape =4, col ='red')


############################ Questions ###############################
set.seed(NULL)

k <-3
cents <-data.frame(cl =1:k)
cents <-cbind(cents, synth.data[sample(1:60, k),])

k1 <- apply(synth.data[,1:2], 1, function(x){u_dist(x, cents[1,2:3])})
k2 <- apply(synth.data[,1:2], 1, function(x){u_dist(x, cents[2,2:3])})
k3 <- apply(synth.data[,1:2], 1, function(x){u_dist(x, cents[3,2:3])})

a <- rbind(k1,k2)
a <- rbind(a,k3)

synth.data[,3] <- apply(a, 2, which.min)

as.factor(synth.data$cl)

cents <- synth.data %>%
  group_by(cl) %>%
  summarise(x1=mean(x1), 
            x2=mean(x2))

synth.data %>% ggplot(aes(x =x1, y=x2, col =as.factor(cl))) +
  geom_point(shape =1) +
  theme_bw() +
  geom_point(data =cents, shape =4, col ='red')



