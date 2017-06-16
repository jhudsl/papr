#Grab all the packages that are needed. 
install.packages(c(
  "readr",
  "lubridate",
  "googlesheets",
  "rdrop2",
  "tidyr",
  "dplyr",
  "googleAuthR",
  "googleID",
  "shiny",
  "plotly"
))

#shinysense is not on CRAN yet. 
devtools::install_github("nstrayer/shinysense")
devtools::install_github("MarkEdmondson1234/googleID")

# Needs a file called google_api_info.R. 
# This file contains the following two lines: Just replace with your apis values. 
# options("googleAuthR.webapp.client_id" = "Client_id")
# options("googleAuthR.webapp.client_secret" = "Secret_id")

# Need to get a token for dropbox access
library(rdrop2)
token <- drop_auth()
#save it to the data directory
saveRDS(token, "data/papr-drop.rds")

#That's it, we're ready to go. 
#The google api requires a specific redirect url so you have to make sure your port matches this. 
# For instance my port in my test api is http://127.0.0.1:7739. Shiny randomizes the port on clicking "run app"
# So you have to run using the command
shiny::runApp(port = 7739) #or whatever your port is. 