#This will be the app

library(dplyr)
library(shiny)
library(plotly)
library(stringr)
library(ggplot2)
source("app_server.R")
source("app_ui.R")

shinyApp(ui = ui, server = server)