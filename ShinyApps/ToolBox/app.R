library(shiny)
library(htmltools)

# Define UI
ui <- fluidPage(
  titlePanel("Calculus Quiz App"),
  tags$head(
    tags$script(src = "https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-MML-AM_CHTML")
  ),
  sidebarLayout(
    sidebarPanel(
      # Introduction and rules for differentiation
      h3("Understanding Derivatives"),
      HTML("For a function \\( y = f(x) \\), the derivative, denoted by \\( \\frac{dy}{dx} \\) or \\( f'(x) \\), captures how the value of the function changes in response to a small change in \\( x \\). The derivative captures the slope of the tangent line to the function at a point."),
      h4("Rules for Differentiation"),
      HTML("- <b>Constant Function Rule</b>: If \\( f(x) = a \\) (where \\( a \\) is a constant), then \\( f'(x) = 0 \\)."),
      HTML("- <b>Power Function Rule</b>: If \\( f(x) = ax^b \\) (where \\( a \\) and \\( b \\) are constants), then \\( f'(x) = abx^{b-1} \\). This rule also covers the case of \\( f(x) = ax \\) where \\( b = 1 \\), so \\( f'(x) = a \\)."),
      h4("Example:"),
      HTML("The derivative of \\( f(x) = 3x^2 \\) is \\( 6x \\)."),
      
      h3("Quiz Question"),
      p("What is the derivative of 10 + 10?"),
      radioButtons("q1", label = NULL,
                   choices = list("20" = "20", "30" = "30", "40" = "40"),
                   selected = NULL),
      actionButton("submit", "Submit Answer")
    ),
    mainPanel(
      textOutput("result")
    )
  )
)

# Define server logic
server <- function(input, output) {
  observeEvent(input$submit, {
    correct <- "20"  # Correct answer
    userAnswer <- input$q1
    
    if (userAnswer == correct) {
      output$result <- renderText("Correct!")
    } else {
      output$result <- renderText("Incorrect, try again.")
    }
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
