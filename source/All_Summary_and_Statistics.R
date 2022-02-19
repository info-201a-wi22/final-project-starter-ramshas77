# Our data includes four different datasets about ADHD posts on Reddit. The main dataset 
# that we will be using is called "ADHD" and stores all of the posts made on the Reddit thread "ADHD."
# This dataframe has 336066 rows and 8 columns.
# One column in this dataframe stores the number of comments each post in "ADHD" has.
# The post with the most comments -titled "/sigh"- has over 1.5 billion comments.

# Our five statistics!

# Statistic 1:
# What is the title of the post with the most comments and how many comments does it have?
library(dplyr)
library(stringr)
library(ggplot2)
library(plotly)

adhd_data <- read.csv("../data/ADHD.csv")
max_comments <- max(adhd_data$num_comments, na.rm = TRUE)
# 1505919691 comments
max_titles <- adhd_data[adhd_data$num_comments == max_comments, "title"]
# "/sigh"

# Statistic 2:
# How many times is ADHD mentioned in conjunction with the word "depression?"

word_detect <- function(word) {
  a <- sum(str_detect(adhd_data$body, word))
  return(a)
} 

depression_occurrence <- word_detect("depression")

#depression is mentioned 79340 times. 

# Statistic 3:
# How many times is ADHD mentioned in conjunction with the word "OCD?"

word_detect <- function(word) {
  a <- sum(str_detect(adhd_data$body, word))
  return(a)
} 

ocd_occurrence <- word_detect("OCD")
#ocd is mentioned 11832 times. 



# Statistic 4:
#How prevalent is the term 'medication' used across the data set?
find_term <- sample_data %>% 
  filter(str_detect(.$title, "medication"))

var1 <- nrow(find_term)

#The term medication is mentioned 430 times

# Statistic 5: 
#How often does the term 'guidance' come up in relation to ADHD?
find_term <- sample_data %>% 
  filter(str_detect(.$title, "guidance"))

var1 <- nrow(find_term)
# The term 'guidance' comes up 3 times in all of the data set