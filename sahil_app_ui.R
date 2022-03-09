# this will be our UI. 
# Ynow, the one that has the Fluidpage(), sidebarPanel(), etc stuff. 

setwd("~/INFO-201code/group_ag_project/final-project-starter-ramshas77/group_app")

library(shiny)
library(ggplot2)
library(plotly)
library(readr)
library(stringr)
source(file = "sahil_app_server.R")

# Sahil's Portion
# Interactive Chart 2
# Summary Takeaways

match_input <- sliderInput("slider1", label = h3("Slider"), min = 0, 
                           max = 100, value = 50)

chart_2 <- tabPanel(
  titlePanel("Chart 2"),
  plotlyOutput("chart_2"),
  p("This specific chart tracks the frequency of combined terms within the modified 
    data frame that we created called 'sample_data', which lists out the first 10000 
    posts from a reddit thread called 'ADHD'. I decided to sort the responses to view 
    how many times a specific outlet for care appeared ('doctor', 'parent', 'teacher'), alongside
    'help'. The primary reason that we decided to include these specific values of the chart 
    was to determine which resource that people in the thread were more inclined to reach out to, 
    or even ask questions about. From there, we're able to have a general grasp of how people with 
    ADHD and are struggling with with interact with resources of care. ")
  
  
)
  

summary_takeaways <- tabPanel(
  titlePanel("Summary Takeaways"),
  h3("Summary Takeaway #1"),
  p("One specific takeaway that we have had on our project is understanding concerns of the ADHD community 
    based on our first visualization -- we took the scores of several comments under a subreddit and were able
    to generalize the popularity and attitude towards specific keywords based on the score."),
  h3("Summary Takeaway #2"),
  p("Another specific takeaway that we had on our project is searching for key terms within the data set that 
  helped us understand which words were popular among the ADHD community. Our findings were that the terms 
    'help' and 'medication' appeared among the most in the data set. This helped us realize some of the specific 
    struggles that people are undergoing and how they are tied to those key terms."),
  h3("Summary Takeaway #3"),
  p("Finally, another specific takeaway from the project that we had was understanding how frequently a combination
    of terms appeared within the data set. For this specifically, we were able to combine key community resources such
    as 'doctor', 'teacher', and 'parent' with the term 'help. The primary reasoning behind this was to get a generalized
    understanding of which community resource appeared the most alongside with calls for 'help' and understand which
   resource was mentioned the most in the comment thread.")
  
)



ui <- navbarPage(
  "Analyzing Online ADHD communities",
  chart_2,
  summary_takeaways
)