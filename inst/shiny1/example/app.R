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

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Two Sample Boxplot"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("xvar1",
                        "Sample Size",
                        min = 1,
                        max = 50,
                        value = 30),
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
        x = rnorm(input$xvar1,input$xvar2,input$xvar3)
        y = rnorm(input$xvar1,input$yvar2,input$yvar3)
        pop = rep(c("x", "y"), c(input$xvar1, input$xvar1))
        df2 = data.frame(pop = pop,l=c(x, y))
        g =  ggplot(df2, aes(x = pop, y = l, fill = pop)) + geom_boxplot() +
            labs(title = "Boxplots for Non-Paired Data Sets", x = "Data Set",y = "Distribution")
      print(g)
      })
}

# Run the application
shinyApp(ui = ui, server = server)
