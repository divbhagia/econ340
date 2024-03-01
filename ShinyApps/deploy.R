library(rsconnect)
setwd('/Users/dbhagia/Dropbox (CSU Fullerton)/Teaching/Econ340/ShinyApps/CLT')

# test
#library(shiny)
#runApp()

# Deploy app
rsconnect::setAccountInfo(name='dbhagia', 
                          token='AB02606704BBF945488D292897BE10C9', 
                          secret='F+jJP6z8llOTeofwKbaFSBSvnoE+53xwnRS0U28g')
library(rsconnect)
deployApp()

