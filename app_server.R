adhd_data <- read.csv("adhd.csv")
library(stringr)
library(dplyr)

display_table <- function(adhd_data) {
  
  
  
}

server <- function(input, output) {
  output$table <- renderPlotly({ 
    table3 <- adhd_data %>% group_by(score) %>%
      arrange(score) %>%
      summarize(recent_post_created_on = max(created_datetime)) %>% 
      filter(score > input$score[1], score < input$score[2])
    
    plotly_table <- plot_ly(
      type = 'table',
      columnwidth = c(100, 100),
      columnorder = c(0, 1),
      header = list(
        values = c("Score","Date"),
        align = c("center", "center"),
        line = list(width = 1, color = 'black'),
        fill = list(color = c("grey", "grey")),
        font = list(family = "Arial", size = 14, color = "white")
      ),
      cells = list(
        values = rbind(table3$score, table3$recent_post_created_on),
        align = c("center", "center"),
        line = list(color = "black", width = 1),
        font = list(family = "Arial", size = 12, color = c("black"))
      ))
  })
  
  output$chart1 <- renderPlotly({
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
    terms_chart <- ggplot(data = term_frequencies) +
      geom_col( mapping = aes(x = term, y = frequency))
    
    term_list <- c(input$term1, input$term2, input$term3, input$term4)
    
    plotly_chart1 <- plot_ly(
      x = term_list,
      y = frequency,
      name = "Term Frequencies",
      type = "bar"
    )
  })
  
  output$chart2 <- renderPlotly({
  
    sample_data <- sample_n(adhd_data, 10000)
  
    find_term_dh <- sample_data %>% 
      filter(str_count(title, 'doctor|help') == 2)
  
    variable_dh <- sample_data %>% 
      nrow(find_terms_dh)
  
    find_term_ph <- sample_data %>% 
      filter(str_count(title, 'parent|help') == 2)
  
    variable_ph <- nrow(find_term_ph)
  
    find_term_th <- sample_data %>% 
      filter(str_count(title, 'teacher|help') == 2)
  
    variable_th <- nrow(find_term_th)
  
    terms <- c("doctor/help", "parent/help", "teacher/help")
    frequency <- c(variable_dh, variable_ph, variable_th)
  
    term_freq <- data.frame(terms, frequency)
  
    terms_graph <- ggplot(term_freq, aes(terms, frequency)) + 
      geom_point(position = "stack", stat = "identity", shape = 18, color = "blue") +
      ggtitle("Frequency of Combined Terms" , subtitle = "from the first 10000 values of the data set") 
    
    plotly_chart2 <- plot_ly(
      x = terms,
      y = frequency,
      name = 'Frequency of Combined Terms',
      type = 'Point'
    )
  })
}