library(shiny)
library(ggplot2)

# Define UI
fluidPage(
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
      titlePanel("Central Limit Theorem"),
      sidebarLayout(
        sidebarPanel(
          selectInput("distribution", "Population Distribution:",
                      choices = c("Normal", "Uniform", "Exponential")),
          sliderInput("sample_size", "Sample Size:", 0, 500, 10, step=10),
          numericInput("num_samples", "Number of Samples:", 5000, min = 1, max = 10000),
          actionButton("goButton", "Generate Samples")
        ),
        mainPanel(
          plotOutput("popPlot", height = "30rem", width = "120%"),
          plotOutput("distPlot", height = "30rem", width = "120%")
        )
      )
  )
)

