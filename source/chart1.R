# for naomi's chart - the number of times certain keywords appear in posts. 

library(dplyr)
library(stringr)
library(ggplot2)
library(plotly)

adhd_data <- read.csv("C:/Users/platy/Documents/Info201_code/ADHD.csv")

max_comments <- max(adhd_data$num_comments, na.rm = TRUE)

top_101 <- adhd_data %>%
  select(title, selftext, num_comments) %>%
  filter(num_comments > 421)

find_word <- top_101 %>%
  filter(str_detect(.$selftext, "today"))

variable <- nrow(find_word)

term <- c('help', 
          'medication', 
          'focus', 
          'hard', 
          'struggle', 
          'forget', 
          'adhd', 
          'sleep', 
          'doctor', 
          'diagnose', 
          'plan', 
          'symptoms'
          )

frequency <- c(20, 
               16, 
               16, 
               15, 
               14, 
               12, 
               11, 
               11, 
               10, 
               9, 
               9, 
               7
               )

term_frequencies <- data.frame(term, frequency) 

ggplot(data = term_frequencies) +
  geom_col( mapping = aes(x = term, y = frequency, fill = term))
