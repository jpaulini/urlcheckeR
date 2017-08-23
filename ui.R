
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(
  verticalLayout(
    tags$head(HTML("<meta http-equiv='refresh' content='60'>")),
    tags$head(HTML("<link rel='stylesheet' type='text/css' href='css/custom.css'>")),
    tags$head(HTML("<script type='text/javascript' src='js/ga.js'></script>")),
    tags$head(HTML("<script type='text/javascript' src='js/main.js'></script>")),
    titlePanel("Chequeo de URLs"),
    h4( textOutput("dateFrom")),
    splitLayout(cellWidths = c("25%", "75%"),
                textOutput("count"),
                plotOutput("distPlot")
    ),
    wellPanel(
      sliderInput("prevDays", "Dias", 1, 30, value=7, step=1)
    ),
    dataTableOutput('table')
  )
))
