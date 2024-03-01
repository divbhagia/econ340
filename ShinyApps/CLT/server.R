library(shiny)
library(ggplot2)

function(input, output) {
  # Reactive expression to generate population data based on selected distribution
  populationData <- reactive({
    switch(input$distribution,
           "Normal" = rnorm(100000, mean = 0, sd = 10),
           "Uniform" = runif(100000, min = -1, max = 1),
           "Exponential" = rexp(100000, rate = 0.1))
  })
  
  # Generate and display population plot
  output$popPlot <- renderPlot({
    ggplot(data.frame(value = populationData()), aes(x = value)) +
      geom_histogram(bins = 32, fill = "firebrick", color = "black", alpha=0.1) +
      labs(title = paste("Population Distribution:", input$distribution),
           x = "Value",
           y = "Frequency") +
      theme_classic() 
  })
  
  # Generate and display distribution plot of sample means
  output$distPlot <- renderPlot({
    req(input$goButton)  # Ensure plot is generated only after button is clicked
    sample_means <- replicate(input$num_samples, {
      mean(sample(populationData(), size = input$sample_size, replace = TRUE))
    })
    #smean = mean(sample_means)
    #svar = var(sample_means)
    ggplot(data.frame(sampleMean = sample_means), aes(x = sampleMean)) +
      geom_histogram(aes(y = ..density..), bins = 30, fill = "yellow", color = "black", alpha=0.1) +
            labs(title = "Distribution of Sample Means",
           x = "Sample Mean",
           y = "Frequency") + theme_classic()
  })
}