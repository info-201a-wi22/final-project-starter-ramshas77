# server function for report page and interactive chart 1

server <- function(input, output) {
  output$chart1 <- renderPlotly({
    term <- c('help', 'medication', 'focus', 'hard', 'struggle', 'forget',
              'adhd', 'sleep', 'doctor', 'diagnose', 'plan', 'symptoms'
    )
    
    frequency <- c(20, 16, 16, 15, 14, 12, 
                   11, 11, 10, 9, 9, 7
    )
    
    term_frequencies <- data.frame(term, frequency)
    term_frequencies <- term_frequencies %>% filter(term == input$term1 |
                                                    term == input$term2 |
                                                    term == input$term3 |
                                                    term == input$term4 |
                                                    term == input$term5)
    
    plotly_chart1 <- plot_ly(
      data = term_frequencies,
      x = term,
      y = frequency,
      name = "Term Frequencies",
      type = "bar"
    )
  })
}
