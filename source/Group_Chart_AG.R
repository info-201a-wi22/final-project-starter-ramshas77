# This is the second chart for our data

setwd("~/INFO-201code/group_ag_project/final-project-starter-ramshas77/data")


f <- file.choose("ADHD.csv")

adhd_data <- read.csv(f)

library(dplyr)
library(stringr)
library(data.table)
library(ggplot2)

sample_data <- sample_n(adhd_data, 10000)

find_term <- sample_data %>% 
  filter(str_detect(.$title, "desperate"))

variable <- nrow(find_term)

terms <- c("doctor", "parent", "teacher", "help", "desperate")
frequency <- c(143, 109, 13, 440, 9)

term_freq <- data.frame(terms, frequency)

terms_graph <- ggplot(term_freq, aes(terms, frequency))

terms_graph + geom_bar(stat = 'identity', width = 0.5, fill = 'red') +
  labs(title = "Bar Chart of Term Frequency",
       caption = "Source: First 10000 values of ADHD.csv") +
  theme(axis.text.x = element_text(angle = 450, vjust = 0.6))


