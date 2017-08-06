url <- "https://functionsurlcheck.azurewebsites.net/api/HttpTriggerJSGetLastEvents?code=mxNHHLjCzKkvAeuFEpcP65tXt3aE8O1VrROEoAWuZgWEwE5KrR52nQ=="
httr::GET(url)
# Params:
# prevDays
# partition 
data <- fromJSON(url)
