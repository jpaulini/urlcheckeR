
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(
  verticalLayout(
    titlePanel("Chequeo de URLs"),
    plotOutput("distPlot"),
    wellPanel(
      sliderInput("n", "Dias", 1, 30, value=1, step=1)
    )
  )
))
