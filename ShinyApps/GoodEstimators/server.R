library(shiny)

# Define server logic
server <- function(input, output) {

  observeEvent(input$drawSample, {
    # Input parameters
    mu <- input$trueMean
    sigma <- input$stdDev
    maxSize <- input$maxSampleSize
    
    # Consistency: Plot sample means for increasing sample sizes
    sample_sizes <- seq(10, maxSize, by = 10)
    sample_means <- sapply(sample_sizes, function(n) {
      mean(rnorm(n, mean = mu, sd = sigma))
    })
    
    output$plotConsistency <- renderPlot({
      plot(sample_sizes, sample_means, type = 'l', col = 'blue',
           xlab = "Sample Size", ylab = "Sample Mean",
           main = "Demonstration of Consistency")
      abline(h = mu, col = 'red', lwd = 2)
    })
    
    # Unbiasedness: Show distribution of estimates from repeated samples
    num_samples <- 1000
    estimates <- replicate(num_samples, mean(rnorm(maxSize, mean = mu, sd = sigma)))
    
    output$plotUnbiasedness <- renderPlot({
      hist(estimates, probability = TRUE, main = "Demonstration of Unbiasedness",
           xlab = "Sample Mean", xlim = c(mu - 3*sigma, mu + 3*sigma), breaks = 30)
      abline(v = mu, col = 'red', lwd = 2)
    })
  })
}