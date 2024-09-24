library(shiny)

# Sample data: 10 individuals with random values
data <- data.frame(
  Name = c("Aarav", "Bianca", "Carlos", "Diego", "Elena", 
         "Felix", "George", "Hong", "Ivan", "Jade"),
  GPA = round(runif(10, 2, 4), 2) 
)

# Define server logic
server <- function(input, output) {
  
  # Display the full dataset
  output$fullData <- renderTable({
    data
  })

  # Get mean of the full dataset
  output$fullMean <- renderText({
    paste("Mean:", mean(data$GPA))
  })

  # Reactive expression to store the sample, fixed size of 5
  sampledData <- eventReactive(input$sampleButton, {
    data[sample(nrow(data), 5), ]
  })
  
  # Output the sample as a table
  output$sampledData <- renderTable({
    sampledData()
  })
  
  # Calculate and output the mean of the sample
  output$sampleMean <- renderText({
    if (!is.null(sampledData())) {
      paste("Sample mean:", mean(sampledData()$GPA))
    }
  })
}