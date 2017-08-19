
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(
  verticalLayout(
    tags$head(HTML("<script type='text/javascript' src='js/main.js'></script>")),
    titlePanel("Chequeo de URLs"),
    splitLayout(cellWidths = c("25%", "75%"),
                textOutput("count"),
                plotOutput("distPlot")
    ),
    wellPanel(
      sliderInput("n", "Dias", 1, 30, value=1, step=1)
    )
  )
))
