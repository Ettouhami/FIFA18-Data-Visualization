
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(radarchart)
library(leaflet)
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
  


  output$value <- renderPrint({ 
    if(input$radio == 1){1}
    else if(input$radio == 2){2}
    
    })
  
  

  output$playerChart <- renderChartJSRadar({
    label <- c("Free Kick",
    "Acceleration",
    "Aggression",
    "Agility",
    "Balance",
    "Ball Control",
    "Dribbling",
    "Finishing")
    
    higuain <- c(62,
                 78,
                 50,
                 75,
                 69,
                 85,
                 84,
                 91
    )
    
    kroos <- c(84,
              60,
              60,
              71,
              69,
              89,
              79,
              76
    )
    
    hazard <- c(79,
               93,
               54,
               93,
               91,
               92,
               93,
               83
    )
    
    ramos <- c(67,
               75,
               84,
               79,
               60,
               84,
               61,
               60
    )
    
    lewandowski <- c(84,
                     79,
                     80,
                     78,
                     80,
                     89,
                     85,
                     91
    )
    
    suarez <- c(84,
                     88,
                     78,
                     86,
                     60,
                     91,
                     86,
                     94
    )
    
    ronaldo <- c(76,
                 89,
                 63,
                 89,
                 63,
                 93,
                 91,
                 94
    )
    
    messi <- c(90,
               92,
               48,
               90,
               95,
               95,
               97,
               95
    )
    
    neymar <- c(84,
                94,
                56,
                96,
                82,
                95,
                96,
                89
    )
    
    
    scores <- data.frame("Label"=label,
                         "Eden Hazard" = hazard,
                         "Cristiano Ronaldo" = ronaldo,
                         "Neymar" = neymar,
                         "Lionel Messi" = messi,
                         "Luis Suarez" = suarez,
                         "Robert Lewandowski" = lewandowski, 
                         "Sergio Ramos" = ramos,
                         "Gonzalo Higuain" = higuain,
                         "Toni Kroos" = kroos)
    
    chartJSRadar(scores, maxScale = 100, showToolTipLabel=TRUE)
    
  })
  
  
 output$map <- renderLeaflet({
   Location <- c("Atlanta ","Los Angeles","Chicago","New York","Dallas","Baltimore","Phoenix","Charlotte","Houston","San Antonio", "Seattle" )
   
   #### Latitude and Longitude values for each of the above location
   Lat <- c(33.74401,33.82377,41.78798,40.767309,32.88153,39.148492,33.45444,35.2406,29.935842,29.44838,47.714965 )
   Lon <- c(-84.56032,-118.2668,-87.7738,-73.978308,-96.64601,-76.796211,-112.32401,-81.04028,-95.398436,-98.39908,-122.127166 )
   df <- data.frame(Location, Lat,Lon)
   leaflet()%>%
     addTiles()%>%
     setView(lng=-90, lat=45, zoom=2)%>%
     addMarkers(as.vector(df[1:11,"Lon"]),as.vector(df[1:11,"Lat"]))
 })
  
})
