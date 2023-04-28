#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(DSA5041PROJ2)

# Define UI for application that draws a histogram
ui <- fluidPage(

  # Application title
  titlePanel("Two Sample Boxplot"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      checkboxInput("paired", "Paired", FALSE),
      sliderInput("xvar2",
                  "Mean of x",
                  min = 1,
                  max = 20,
                  value = 10),
      sliderInput("xvar3",
                  "Standard Deviation of x",
                  min = 1,
                  max = 20,
                  value = 15),
      sliderInput("yvar2",
                  "Mean of y",
                  min = 1,
                  max = 20,
                  value = 8),
      sliderInput("yvar3",
                  "Standard Deviation of y",
                  min = 1,
                  max = 20,
                  value = 15)

    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("meanBoxplot")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  output$meanBoxplot <- renderPlot({
    if (input$paired == TRUE){
      x=rnorm(30,input$xvar2,input$xvar3)
      y = x + rnorm(30, 5 ,4)
    } else {
    x = rnorm(30,input$xvar2,input$xvar3)
    y = rnorm(30,input$yvar2,input$yvar3)
    }
    ans = myttest(x,y,0.05,input$paired)
    print(ans)
    plot(ans)

  })
}

# Run the application
shinyApp(ui = ui, server = server)
