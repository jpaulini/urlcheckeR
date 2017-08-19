
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library("jsonlite")

url <- "https://functionsurlcheck.azurewebsites.net/api/HttpTriggerJSGetLastEvents?code=mxNHHLjCzKkvAeuFEpcP65tXt3aE8O1VrROEoAWuZgWEwE5KrR52nQ=="
# Params:
# prevDays
# partition 

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({

    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$prevDays + 1)

    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')

  })
  output$count <- renderText({
    if(!is.na(input$prevDays))
      url <- paste0(url, "&prevDays=", input$prevDays)
    out <- fromJSON(url)
    out$result$count
  })

})
