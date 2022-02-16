# for naomi's chart - the number of times certain keywords appear in posts. 

adhd_data <- read.csv("C:/Users/platy/Documents/Info201_code/ADHD.csv")

max_comments <- max(adhd_data$num_comments, na.rm = TRUE)

diagnose_comments <- adhd_data %>%
  select(title, selftext, num_comments) %>%
  filter(num_comments > 220)%>% # 421 gets top 101 posts, 299 gets top 300 posts, 220 gets top 650 poses
  filter(str_detect(.$title, "doctor"))

aaa <- nrow(diagnose_comments)

# been searching all data based on keywords, medication appears ~12600 times, help appears ~12000 times, diagnose appears ~9000 times, focus appears ~6000 times, adhd appears ~6700 times

# after searching only the top 101 posts with the most comments, medication appears once, help appears 4 times, diagnose appears once, focus appears 4 times, adhd appears twice
# after searching only the top 300 posts with the most comments, medication appears 8 times, help appears 7 times, diagnose appears 6 times, focus appears 6 times, adhd appears 11 times, doctor appears 3 times
# after searching only the top 650 posts with the most comments, medication appears 15 times, help appears 13 times, diagnose appears 13 times, focus appears 16 times, adhd appears 20 times, doctor appears 4 times

