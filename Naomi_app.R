# The app function for all work done by Naomi: one interactive chart with five widgets and the report page.

library("shiny")
source("naomi_app_server.R")
source("naomi_app_ui.R")

shinyApp(ui = ui, server = server)