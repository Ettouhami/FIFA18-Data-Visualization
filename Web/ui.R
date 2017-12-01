
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(radarchart)
library(leaflet)

shinyUI(fluidPage(theme="bootstrap.min.css",
  includeCSS("style.css"),
  tags$h1("FIFA 18 Analytics"),
  tags$p("Created by Ansaf Ahmad & Mohammad Etouhami"),
  
  fluidRow(     
  chartJSRadarOutput("playerChart", width = "50", height = "25")
  ),
  
  
  
  radioButtons("radio", label = h3("Best Teams"),
               choices = list("Clubs" = 1, "National Teams" = 2), 
               selected = 1),
  hr(),
  fluidRow(column(3, verbatimTextOutput("value"))),
  
  
  leafletOutput("map",height="600")
))
