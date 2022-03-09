# server function for report page and interactive chart 1

server <- function(input, output) {
  term <- c('help', 'medication', 'focus', 'hard', 'struggle', 'forget',
            'adhd', 'sleep', 'doctor', 'diagnose', 'plan', 'symptoms'
  )
  
  frequency <- c(20, 16, 16, 15, 14, 12, 
                 11, 11, 10, 9, 9, 7
  )
  
  term_frequencies <- data.frame(term, frequency)
  
  output$chart1 <- renderPlotly({
    term_df <- term_frequencies %>% filter(term == input$term1 |
                                                    term == input$term2 |
                                                    term == input$term3 |
                                                    term == input$term4 |
                                                    term == input$term5 |
                                                    term == input$term6)
    
    plotly_chart1 <- ggplot(term_df) + geom_col(mapping = aes(x = term, y = frequency))
  })
}
