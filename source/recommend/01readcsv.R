library(stringr)
library(dplyr)

src_dir <- c('/Users/osangjin/Desktop/past/Recommendation-system/data') 
src_file <- list.files(src_dir) # list
src_file_cnt <- length(src_file)
src_file_cnt

lst <- list()

for(i in 1:src_file_cnt) {
  file_name <- gsub(pattern=' ', replacement = '', paste(src_dir, '/', src_file[1]))
  user_id <- as.numeric(str_extract(src_file[i], '\\d'))
  df <- read.csv(file_name)
  df_name <- paste('df',user_id, sep='')
  lst <- append(user_id, lst)
  df <- df[, -1]
  assign(df_name, df)
}

