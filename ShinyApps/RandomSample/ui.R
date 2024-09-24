library(shiny)

# Define the user interface
ui <- fluidPage(
  tags$head(
    tags$link(href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap", rel="stylesheet"),
    tags$style(HTML("
      body {
        font-family: 'Roboto', sans-serif;
      }
      .container {
        max-width: 800px;
        margin: auto;
        padding: 20px;
      }
    "))
  ),
  div(class = "container",
    titlePanel("Mean from a Random Sample"),
    sidebarLayout(
      sidebarPanel(
        titlePanel("Population"),
        tags$hr(),
        tableOutput("fullData"),
        verbatimTextOutput("fullMean"),
        actionButton("sampleButton", "Take a Sample"),
      ),
      mainPanel(
        titlePanel("Sample"),
        tableOutput("sampledData"),
        verbatimTextOutput("sampleMean")
      )
    )
  )
)