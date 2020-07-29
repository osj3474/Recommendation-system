check_df <- function(df, i){
  df_type <- class(df[[i]])
  if (df_type[1] != "data.frame") {
    df[[2]] <- as.data.frame(df[[2]]) 
    df[[2]] <- t(df[[2]]) 
    df[[2]][,2] <- as.numeric(df[[2]][,2])
  }
  return (df[[i]])
}

A <- list_df_data[[1]]
colnames(A) <- c("title", 1)
merge_df <- A

i = 2
repeat{
  if(i>src_file_cnt-1) break
  B <- check_df(list_df_data,i)
  colnames(B) <- c("title", i)
  merge_df <- merge(x=merge_df, y=B, by='title', all=TRUE)
  i <- i+1
}

restaurant_lst <- as.vector(merge_df[,1])
restaurant_lst
user_item <- merge_df[,-1]
rownames(user_item) <- paste("i", 1:nrow(user_item), sep='')
colnames(user_item) <- paste("u", 1:ncol(user_item), sep='')

user_item <- user_item[which(rowSums(!is.na(user_item)) > 3),]
View(user_item)
