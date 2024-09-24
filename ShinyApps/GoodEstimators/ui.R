library(shiny)

# Define the user interface
ui <- fluidPage(
  titlePanel("Consistency vs. Unbiasedness"),
  sidebarLayout(
    sidebarPanel(
      numericInput("trueMean", "True Mean", 50),
      numericInput("stdDev", "Standard Deviation", 10),
      numericInput("maxSampleSize", "Maximum Sample Size", 100),
      actionButton("drawSample", "Draw Sample"),
      tags$hr(),
      tags$h4("Visualization of Estimates")
    ),
    mainPanel(
      plotOutput("plotConsistency"),
      plotOutput("plotUnbiasedness")
    )
  )
)