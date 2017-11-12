
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(radarchart)

shinyUI(fluidPage(theme="bootstrap.min.css",
  includeCSS("style.css"),
  tags$h1("FIFA 18 Analytics"),
  tags$p("Created by Ansaf Ahmad & Mohammad Etouhami"),
  
  tags$div(class="player-chart", chartJSRadarOutput("playerChart", width = "100", height = "75"))

))
