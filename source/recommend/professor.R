library(dplyr)
library(stringr)
mylst <- list_df_data
mymergedf <- bind_rows(mylst, .id="user")

mymergedf$title <- as.factor(str_trim(mymergedf$title))

id <- as.data.frame(c(1:nrow(mymergedf)))
df <- cbind(id, mymergedf)
myuseritem <- spread(df, user, score)

summary(levels(myuseritem$title))
ncol(myuseritem)

df_1 <- data.frame(x = 1:3, y = 1:3)
df_2 <- data.frame(x = 4:6, y = 4:6)
df_3 <- data.frame(x = 7:9, z = 7:9)

test_lst <- list(grp_1 = df_1, grp_2 = df_2, grp_3 = df_3)
a <- bind_rows(test_lst, .id="group_id")
a

test <- read.csv("test.csv")
test
nrow(a)
