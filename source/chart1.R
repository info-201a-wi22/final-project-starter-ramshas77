# for naomi's chart - links keywords and the number of comments they have 

adhd_data <- read.csv("C:/Users/platy/Documents/Info201_code/ADHD.csv")

max_comments <- max(adhd_data$num_comments, na.rm = TRUE)

diagnose_comments <- adhd_data %>%
  select(title, selftext, num_comments) %>%
  filter(num_comments > 421)%>%
  filter(str_detect(.$title, "anxiety"))

diagnose <- nrow(diagnose_comments)

# been searching all data based on keywords, medication appears ~12600 times, help appears ~12000 times,
# diagnose appears ~9000 times, focus appears ~6000 times, adhd appears ~6700 times

# after searching only the top 101 posts with the most comments, medication appears once, help appears 4 times,
# diagnose appears once, focus appears 4 times, adhd appears twice