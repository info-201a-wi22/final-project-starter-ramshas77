# for naomi's chart - links keywords and the number of comments they have 

adhd_data <- read.csv("C:/Users/platy/Documents/Info201_code/ADHD.csv")

max_comments <- max(adhd_data$num_comments, na.rm = TRUE)

range_comments <- adhd_data$num_comments