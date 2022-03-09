#This will be the app. I think the only thing required here is

source("sahil_app_ui.R")
source("sahil_app_server.R")

# Running the app
shinyApp(ui = ui, server = server)
