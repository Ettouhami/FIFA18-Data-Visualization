
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(theme="bootstrap.min.css",
  includeCSS("style.css"),
  tags$h1("FIFA 18 Analytics"),
  tags$p("Created by Ansaf Ahmad & Mohammad Etouhammi"),
  
  tags$div(class="player-chart",plotOutput("playerChart",
    width = "100%", height = "85vh", click = NULL,
    dblclick = NULL, hover = NULL, hoverDelay = NULL,
    hoverDelayType = NULL, brush = NULL, clickId = NULL, hoverId = NULL,
    inline = FALSE
    )
  )

))
