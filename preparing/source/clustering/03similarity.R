pearsonCor <- function(x, y){ 
  x_mean <- mean(x, na.rm = T) 
  y_mean <- mean(y, na.rm = T) 
  idx <- !is.na(x) & !is.na(y) 
  if(sum(idx) == 0) return(NA) 
  x_new <- x[idx]
  y_new <- y[idx]
  sum((x_new- x_mean) * (y_new-y_mean)) /
    sqrt( sum( (x_new - x_mean)**2) * sum( (y_new-y_mean) **2) )
}

u_dist<-function(u, v){
  sqrt(sum((u -v) **2))
}