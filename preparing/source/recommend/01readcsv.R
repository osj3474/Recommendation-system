library(stringr)
library(dplyr)

src_dir <- c('/Users/osangjin/Desktop/past/Recommendation-system/data') 
src_file <- list.files(src_dir)
src_file_cnt <- length(src_file)
src_file_cnt

id_lst <- c()
for(i in 1:src_file_cnt) {
  file_name <- gsub(pattern=' ', replacement = '', paste(src_dir, '/', src_file[i]))
  user_id <- as.numeric(str_extract(src_file[i], '\\d+'))
  df <- read.csv(file_name)
  df_name <- paste('df',user_id, sep='')
  id_lst[i] <- user_id
  df <- df[, -1]
  assign(df_name, df)
}

list_df_data <- mget(ls(pattern = "^df\\d+"))
