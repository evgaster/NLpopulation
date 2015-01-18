# Data obtained from the Netherlands "Centraal Bureau voor de Statistiek" 
# at http://opendata.cbs.nl/dataportaal/portal.html#_la=nl&tableId=37296ned&_theme=73
# Downloaded the "Dataset voor grafische weergave", on 2015-01-17.
#
# My interpretation of the metadata is that the numbers are from
# the beginning of the year represented in the attribute "Perioden".

d <- read.csv("37296ned_TypedDataSet.csv", sep = ";")
# Keep only what's needed.
d <- d[, c("Perioden", "TotaleBevolking_1")]
# Convert to a more usable type.
d$Perioden <- as.Date(sub("JJ00", "-01-01", d$Perioden))
# Internationalize.
names(d) <- c("date", "population")

# Fit a straight line through the data.
f <- lm(population ~ date, data = d)

# Prerequisites.
library(ggplot2)

shinyServer(
  function(input, output) {
    selectedDate <- reactive(as.Date(input$date, origin = "1970-01-01"))
    predictedPopulation <- reactive(predict(f, data.frame(date = selectedDate())))
    
    output$populationGraph <- renderPlot({
      ggplot(d, aes(x = date, y = population)) +
        geom_point() +
        geom_smooth(method = lm) +
        geom_vline(xintercept = as.numeric(input$date)) +
        geom_hline(yintercept = predictedPopulation())
    })
    
    output$date <- renderText(format(selectedDate()))
    output$population <-renderText(predictedPopulation())
  }
)
