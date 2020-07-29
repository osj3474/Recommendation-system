restaurant_lst <- as.vector(merge_df[,1])
restaurant_lst
user_item <- merge_df[,-1]
rownames(user_item) <- paste("i", 1:nrow(user_item), sep='')
colnames(user_item) <- paste("u", 1:ncol(user_item), sep='')

user_item <- user_item[which(rowSums(!is.na(user_item)) > 3),]
View(user_item)
