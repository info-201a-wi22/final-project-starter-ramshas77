# the work for Chart #1, finding how often certain keywords appear in the selftexts of the posts with the most comments

## To visualize the graph, load the data
adhd_data <- read.csv("../data/ADHD.csv")


## If these codes are for the graph, make sure they're inside of the function
# max_comments <- max(adhd_data$num_comments, na.rm = TRUE)

## this is the chart function. Everything should be within this function. 
display_chart1 <- function(adhd_data) {
  top_101 <- adhd_data %>%
    select(title, selftext, num_comments) %>%
    filter(num_comments > 421)
  
  find_word <- top_101 %>%
    filter(str_detect(.$selftext, "today"))
  variable <- nrow(find_word)
  term <- c('help', 'medication', 'focus', 'hard', 'struggle', 'forget', 'adhd', 
            'sleep', 'doctor', 'diagnose', 'plan', 'symptoms'
  )
  
  frequency <- c(20, 16, 16, 15, 14, 12, 11, 
                 11, 10, 9, 9, 7
  )
  
  term_frequencies <- data.frame(term, frequency) 
  
  terms_chart <- ggplot(data = term_frequencies) +
    geom_col( mapping = aes(x = term, y = frequency))
  
  return(terms_chart)
}

## To visualize the graph, run this code
display_chart1(adhd_data)
