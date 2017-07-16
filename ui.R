# ====
# ui.R
# ====
# This is the user-interface definition of the Shiny 
# MPG web application.  The interface renders the plots
# based on the user's selection of predictors to include.
# A refresh button allows the user to reset the variables.

library(shiny)
library(shinyjs)

jscode <- "shinyjs.refresh = function() { history.go(0); }"

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Motor Trend Cars MPG Predictors"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      useShinyjs(),
      extendShinyjs(text = jscode),
      checkboxInput("showModel2","Include Number of Cylinders",value=F),
      checkboxInput("showModel3","Include Engine Displacement",value=F),
      checkboxInput("showModel4","Include Horsepower",value=F),
      actionButton("refresh", "Refresh app")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("plot1"),
       textOutput("text1")
    )
  )
))
