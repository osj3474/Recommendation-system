check_df <- function(df, i){
  df_type <- class(df[[i]])
  if (df_type[1] != "data.frame") {
    df[[2]] <- as.data.frame(df[[2]]) 
    df[[2]] <- t(df[[2]]) 
    df[[2]][,2] <- as.numeric(df[[2]][,2])
  }
  return (df[[i]])
}