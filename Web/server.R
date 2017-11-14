
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(radarchart)
shinyServer(function(input, output) {

  output$distPlot <- renderPlot({

    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')

  })
  
  output$radarChart <- renderPlot({
    counts <- table(mtcars$gear)
    barplot(counts, main = "Car Mpg", xlab="Gears", horiz=TRUE, names.arg = c("3 Gears","4 Gears", "5 Gears"))
  })

  output$playerChart <- renderChartJSRadar({
    scores <- data.frame("Label"=c("Communicator", "Data Wangler", "Programmer",
                                   "Technologist",  "Modeller", "Visualizer"),
                         "Rich" = c(9, 7, 4, 5, 3, 7),
                         "Andy" = c(7, 6, 6, 2, 6, 9),
                         "Aimee" = c(6, 5, 8, 4, 7, 6))
    
    chartJSRadar(scores, maxScale = 10, showToolTipLabel=TRUE)
    
  })
  

  
})
