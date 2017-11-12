
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(fmsb)
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

  output$playerChart <- renderPlot({
    # Create data: note in High school for Jonathan:
    data=as.data.frame(matrix( sample( 1:100 , 6, replace=T) , ncol=6))
    colnames(data)=c("Sprint" , "Shot Power" , "Heading" , "Dribbling", "Crossing", "Passing")
    
    # To use the fmsb package, I have to add 2 lines to the dataframe: the max and min of each topic to show on the plot!
    data=rbind(rep(100,4) , rep(0,6) , data)
    
    # The default radar chart proposed by the library:
    radarchart(data
               , axistype=1 , 
               
               #custom polygon
               pcol=rgb(0.2,0.5,0.5,0.9) , pfcol=rgb(0.2,0.5,0.5,0.5) , plwd=4 , 
               
               #custom the grid
               cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,20,5), cglwd=0.8,
               
               #custom labels
               vlcex=0.8 )
  })
})
