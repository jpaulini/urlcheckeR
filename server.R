
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library("tidyverse")

url <- "https://functionsurlcheck.azurewebsites.net/api/HttpTriggerJSGetLastEvents?code=mxNHHLjCzKkvAeuFEpcP65tXt3aE8O1VrROEoAWuZgWEwE5KrR52nQ=="
# Params:
# prevDays
# partition 

shinyServer(function(input, output) {
  datasetInput <- reactive({
    #populate datasetInput with request from Azure repository
    if(!is.na(input$prevDays))
      url <- paste0(url, "&prevDays=", input$prevDays)
    return(fromJSON(url))  
  })

  output$distPlot <- renderPlot({
    tb <- tibble(
      URLs = datasetInput()$result$entities$URL$`_`,
      status = datasetInput()$result$entities$Status$`_`,
      datetime = ymd_hms(datasetInput()$result$entities$Timestamp$`_`) )
    
    tb %>% arrange(datetime) %>% ggplot(aes(datetime)) +
      geom_freqpoly(binwidth=3600)

  })
  output$count <- renderText({
    datasetInput()$result$count
  })
  
  output$dateFrom <- renderText({
    datasetInput()$query
  })

})
