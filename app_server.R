adhd_data <- read.csv("testValues.csv")
library(dplyr)
library(shiny)
library(plotly)
library(stringr)
library(ggplot2)

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
  term <- c('help', 'medication', 'focus', 'hard', 'struggle', 'forget',
            'adhd', 'sleep', 'doctor', 'diagnose', 'plan', 'symptoms'
  )
  
  frequency <- c(20, 16, 16, 15, 14, 12, 
                 11, 11, 10, 9, 9, 7
  )
  
  term_frequencies <- data.frame(term, frequency)
  # term_list <- c(input$term1, input$term2, input$term3, input$term4, input$term5)
  
  output$chart1 <- renderPlotly({
    updated_df <- term_frequencies %>% filter(term == input$term1 |
                                                term == input$term2 |
                                                term == input$term3 |
                                                term == input$term4 |
                                                term == input$term5) 
    plotly_chart1 <-
      ggplot(updated_df) + geom_col(mapping = aes(x = term, y=frequency))
    
    
  })
  
  output$chart_2 <- renderPlotly({
    
    # sample_data <- sample_n(adhd_data, 10000)
    
    find_term_dh <- adhd_data %>% filter(
      str_count(body, "help") >= 1 &
        str_count(body, input$search1) >= 1
    )
    
    variable_dh <- nrow(find_term_dh)
    
    
    find_term_ph <- adhd_data %>% filter(
      str_count(body, "help") >= 1 &
        str_count(body, input$search2) >= 1
    )
    
    variable_ph <- nrow(find_term_ph)
    
    
    find_term_th <- adhd_data %>% filter(
      str_count(body, "help") >= 1 &
        str_count(body, input$search3) >= 1
    )
    
    variable_th <- nrow(find_term_th)
    
    terms <- c("term 1/help", "term 2 /help", "term3 /help")
    frequency <- c(variable_dh, variable_ph, variable_th)
    
    term_freq <- data.frame(terms, frequency)
    
    terms_graph <- ggplot(term_freq, aes(terms, frequency)) + 
      geom_point(position = "stack", stat = "identity", shape = 18, color = "blue") +
      ggtitle("Frequency of Combined Terms", subtitle = "from the first 10000 values of the data set") 
    
    
    plotly_chart2 <- plot_ly(
      x = terms,
      y = frequency,
      name = 'Frequency of Combined Terms',
      type = 'scatter') %>% 
      layout(xaxis = list(title = "Term Combinations"), 
             yaxis = list(title = "Term Frequencies" ))
    
  }
  
  
  )
  
}