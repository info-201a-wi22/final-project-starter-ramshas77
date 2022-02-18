# This is going to be the PO2 aggregate table.  

adhd_data <- read.csv("../data/ADHD-comment.csv")
library(stringr)
library(dplyr)

test_values <- sample_n(adhd_data, 10000)

word_detect <- function(word) {
  a <- sum(str_detect(adhd_data$body, word))
  return(a)
} 

ocd <- word_detect("OCD")


table3 <- test_values %>% group_by(score) %>% summarize(recent_post_created_on = max(created_datetime))

# most recent post with scores of X was made on ______
