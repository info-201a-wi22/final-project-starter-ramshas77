adhd_data <- read.csv("data/testValues.csv")
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

    plotly_chart1 <- plot_ly(
      x = term,
      y = fequency,
      name = "Term Frequencies",
      type = "bar"
    )
  })
}

# https://plotly.com/r/table/
