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

B <- list_df_data[[2]]
colnames(B) <- c("title", 2)
merge_df <- merge(x=merge_df, y=B, by='title', all=TRUE)


B <- check_df(list_df_data, 2)
View(B)



