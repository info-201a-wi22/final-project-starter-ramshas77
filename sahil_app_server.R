

library(stringr)
library(dplyr)
library(shiny)
library(readr)


server <- function(input, output) {
  
output$chart_2 <- renderPlotly({
  
 adhd_data <- read_csv("ADHD.csv")
  sample_data <- sample_n(adhd_data, 10000)
  
  find_term_dh <- sample_data %>% 
    filter(str_count(title, "doctor|help") == 2)
  
  variable_dh <- nrow(find_term_dh)
  
  
  find_term_ph <- sample_data %>% 
    filter(str_count(title, "parent|help") == 2)
  
  variable_ph <- nrow(find_term_ph)
  
  
  find_term_th <- sample_data %>% 
    filter(str_count(title, "teacher|help") == 2)
  
  variable_th <- nrow(find_term_th)
  
  terms <- c("doctor/help", "parent/help", "teacher/help")
  frequency <- c(variable_dh, variable_ph, variable_th)
  
 term_freq <- data.frame(terms, frequency)
  
  terms_graph <- ggplot(term_freq, aes(terms, frequency)) + 
   geom_point(position = "stack", stat = "identity", shape = 18, color = "blue") +
    ggtitle("Frequency of Combined Terms", subtitle = "from the first 10000 values of the data set") 
  
  output$find_term_dh <- reactive({input$find_term_dh})
  
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