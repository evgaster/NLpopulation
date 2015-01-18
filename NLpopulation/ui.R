shinyUI(
  pageWithSidebar(
    headerPanel("Population of the Netherlands"),
    
    sidebarPanel(
      dateInput("date", "Date", startview = "year")
    ),
    
    mainPanel(
      "The population of the Netherlands, since 1950, is shown in the graph below.",
      "The dots represent the population at January 1st of each year.",
      "The blue line shows a model for the relation between the year and the population.",
      "The shaded area around the line indicates the accuracy of the model",
      "(confidence interval 0.95).",
      p(),
      "To get an estimate of the population at some date",
      "just enter that date in the box on the left.",
      "The model is used to interpolate or extrapolate to the given date.",
      "For simplicity a linear relation is assumed.",
      p(),
      "At",
      strong(textOutput("date", inline = TRUE)),
      "(as indicated by the vertical black line)",
      "the population was/is approximatly",
      strong(textOutput("population", inline = TRUE)),
      "(as indicated by the horizontal black line).",
      
      plotOutput('populationGraph')
    )
  )
)
