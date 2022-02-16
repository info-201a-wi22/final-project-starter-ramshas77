# for naomi's chart - the number of times certain keywords appear in posts. 

library(dplyr)
library(stringr)


adhd_data <- read.csv("C:/Users/platy/Documents/Info201_code/ADHD.csv")

max_comments <- max(adhd_data$num_comments, na.rm = TRUE)

top_101 <- adhd_data %>%
  select(title, selftext, num_comments) %>%
  filter(num_comments > 421)

find_word <- top_101 %>%
  filter(str_detect(.$selftext, ""))

variable <- nrow(find_word)

# been searching all data based on keywords, medication appears ~12600 times, help appears ~12000 times, diagnose appears ~9000 times, focus appears ~6000 times, adhd appears ~6700 times

# after searching only the top 101 posts with the most comments, 
# help appears 20 times
# medication appears 16 times
# focus appears 16 times
# hard appears 15 times
# struggle appears 14 times
# forget appears 12 times
# adhd appears 11 times
# sleep appears 11 times
# doctor appears 10 times
# diagnose appears 9 times
# plan appears 9 times
# symptoms appears 7 times
# 
