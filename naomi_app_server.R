# server function for report page and interactive chart 1

server <- function(input, output) {
  output$chart1 <- renderPlotly({
    term <- c('help', 'medication', 'focus', 'hard', 'struggle', 'forget',
              'adhd', 'sleep', 'doctor', 'diagnose', 'plan', 'symptoms'
    )
    
    frequency <- c(20, 16, 16, 15, 14, 12, 
                   11, 11, 10, 9, 9, 7
    )
    
    term_list <- c(input$term1, input$term2, input$term3, input$term4, input$term5)
    
    plotly_chart1 <- plot_ly(
      x = term_list,
      y = frequency,
      name = "Term Frequencies",
      type = "bar"
    )
  })
}
