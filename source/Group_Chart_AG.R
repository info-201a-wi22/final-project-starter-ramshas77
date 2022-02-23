# This is the second chart for our data

#setwd("~/INFO-201code/group_ag_project/final-project-starter-ramshas77/data")


# adhd_data <- read.csv("../data/ADHD.csv")

library(dplyr)
library(stringr)
library(data.table)
library(ggplot2)

# sample_data <- sample_n(adhd_data, 10000)
# 
# find_term <- sample_data %>%
#   filter(str_detect(.$title, "medication"))
# variable <- nrow(find_term)
# 
# terms <- c("doctor", "parent", "teacher", "help", "desperate")
# frequency <- c(143, 109, 13, 440, 9)
# 
# term_freq <- data.frame(terms, frequency)
# 
# terms_graph <- ggplot(term_freq, aes(terms, frequency)) + 
#   geom_point(position = "stack", stat = "identity", shape = 18, color = "blue") +
#   ggtitle("Frequency of Terms" , subtitle = "from the first 10000 values of the data set") +
#   geom_point(color = "red")

display_chart2 <- function(adhd_data) {
    sample_data <- sample_n(adhd_data, 10000)
    
    find_term <- sample_data %>%
      filter(str_detect(.$title, "medication"))
    variable <- nrow(find_term)
    
    terms <- c("doctor", "parent", "teacher", "help", "desperate")
    frequency <- c(143, 109, 13, 440, 9)
    
    term_freq <- data.frame(terms, frequency)
    
    terms_graph <- ggplot(term_freq, aes(terms, frequency)) + 
      geom_point(position = "stack", stat = "identity", shape = 18, color = "blue") +
      ggtitle("Frequency of Terms" , subtitle = "from the first 10000 values of the data set") +
      geom_point(color = "red")
    return(terms_graph)
}

do find_term multiple times to retrun a number and then put that number into the "frequency" vector instead of harcoding. 