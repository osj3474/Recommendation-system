library(recommenderlab)

class(user_item)
user_item <- as.matrix(user_item)
rating <- as(user_item, "realRatingMatrix")
getRatingMatrix(rating)
identical(as(rating, "matrix"), user_item)
rating_lst <- as(rating, "list")
rating_lst

r_m <- normalize(rating)
getRatingMatrix(r_m)
r_d <- denormalize(r_m)
getRatingMatrix(r_d)
image(rating, main = "Raw Ratings")
image(r_m, main = "Normalized Ratings")

r_b <- binarize(rating, minRating=4)  # binary case
binary <- as(r_b, "matrix")
# View(binary)