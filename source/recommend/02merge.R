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
  i <- i+2
}
