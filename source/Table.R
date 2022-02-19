# This is going to be the PO2 aggregate table.  

adhd_data <- read.csv("../data/ADHD-comment.csv")
library(stringr)
library(dplyr)

display_table <- function(adhd_data) {
  test_values <- sample_n(adhd_data, 10000)
  table3 <- test_values %>% group_by(score) %>% 
    arrange(score) %>%
    summarize(recent_post_created_on = max(created_datetime))
  return(table3)
}

# most recent post with scores of X was made on ______
