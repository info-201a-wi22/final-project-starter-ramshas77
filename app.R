#This will be the app. I think the only thing required here is
library("shiny")
source("app_ui.R")
source("app_server.R")
source("app_ui.R")

shinyApp(ui = ui, server = server)