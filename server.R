# ========
# server.R
# ========
# 
# This is the server logic of the Shiny MPG web application. 
# Plots are produced by the server based on predictors the
# user selects.  


library(shiny)
library(shinyjs)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  observeEvent(input$refresh, {
    js$refresh();
  })
  
  # Use 1 default variable
  model1 <- lm(mpg ~ wt, data = mtcars)
  
  # Use 2 variables
  model2 <- lm(mpg ~ wt + cyl, data = mtcars)
  model3 <- lm(mpg ~ log(disp) + wt, data = mtcars)
  model4 <- lm(mpg ~ log(hp) + wt, data = mtcars)
  
  # Use 3 variables
  model5 <- lm(mpg ~ log(disp) + cyl + wt, data = mtcars)
  model6 <- lm(mpg ~ log(hp) + cyl + wt, data = mtcars)
  model7 <- lm(mpg ~ log(hp) + log(disp) + wt, data = mtcars)
  
  # Use 4 variables
  model8 <- lm(mpg ~ log(hp) + log(disp) + cyl + wt, data = mtcars)
  
  # Weight only
  model1pred <- reactive({
    output$text1 = renderText("model1 <- lm(mpg ~ wt, data = mtcars)")
    plot(mtcars$wt,mtcars$mpg, xlab = "Weight (1,000 lbs)",ylab = "MPG")
    abline(model1$coefficients[1],model1$coefficients[2])
    leg.txt <- c("weight")
    col.txt <- c("black")
    legend("top",legend = leg.txt, col=col.txt, bty = "n", pch = 1)
  })
  
  # Weight and Cylinders
  model2pred <- reactive({
    output$text1 = renderText("model2 <- lm(mpg ~ wt + cyl, data = mtcars)")
    plot(mtcars$cyl, mtcars$mpg, type = "n", xlab = "Weight and Cylinders",ylab = "MPG") 
    points(mtcars$wt, mtcars$mpg, col="black")
    points(mtcars$cyl, mtcars$mpg, col="blue")
    abline(model2$coefficients[1],model2$coefficients[2])
    leg.txt <- c("weight","cylinders")
    col.txt <- c("black","blue")
    legend("top",legend = leg.txt, col=col.txt, bty = "n", pch = 1)
  })
  
  # Weight and Displacement
  model3pred <- reactive({
    output$text1 = renderText("model3 <- lm(mpg ~ log(disp) + wt, data = mtcars)")
    plot(log(mtcars$disp),mtcars$mpg,type = "n", xlab = "Weight and Displacement",ylab = "MPG")
    points(mtcars$wt, mtcars$mpg, col="black")
    points(log(mtcars$disp), mtcars$mpg, col="blue")
    abline(model3$coefficients[1],model3$coefficients[2])
    leg.txt <- c("weight","displacement")
    col.txt <- c("black","blue")
    legend("top",legend = leg.txt, col=col.txt, bty = "n", pch = 1)
  })
  
  # Weight and Horsepower
  model4pred <- reactive({
    output$text1 = renderText("model4 <- lm(mpg ~ log(hp) + wt, data = mtcars)")
    plot(log(mtcars$hp), mtcars$mpg, type = "n", xlab = "Weight and Horsepower",ylab = "MPG")
    points(mtcars$wt, mtcars$mpg, col="black")
    points(log(mtcars$hp), mtcars$mpg, col="blue")
    abline(model4$coefficients[1],model4$coefficients[2])
    leg.txt <- c("weight","horsepower")
    col.txt <- c("black","blue")
    legend("topright",legend = leg.txt, col=col.txt, bty = "n", pch = 1)
  })
  
  # Weight/Cylinders/Displacement
  model5pred <- reactive({
    output$text1 = renderText("model5 <- lm(mpg ~ log(disp) + cyl + wt, data = mtcars)")
    plot(mtcars$cyl, mtcars$mpg, type = "n", xlab = "Weight/Cylinders/Displacement",ylab = "MPG")
    points(mtcars$wt, mtcars$mpg, col="black")
    points(mtcars$cyl, mtcars$mpg, col="blue")
    points(log(mtcars$disp), mtcars$mpg, col="red")
    abline(model5$coefficients[1],model5$coefficients[2])
    leg.txt <- c("weight","cylinders","displacement")
    col.txt <- c("black","blue","red")
    legend("top",legend = leg.txt, col=col.txt, bty = "n", pch = 1)
  })
  
  # Weight/Cylinders/Horsepower
  model6pred <- reactive({
    output$text1 = renderText("model6 <- lm(mpg ~ log(hp) + cyl + wt, data = mtcars)")
    #pred6 <- predict(model6, mtcars)
    plot(mtcars$cyl, mtcars$mpg, type = "n", xlab = "Weight/Cylinders/Horsepower",ylab = "MPG")
    points(mtcars$wt, mtcars$mpg, col="black")
    points(mtcars$cyl, mtcars$mpg, col="blue")
    points(log(mtcars$hp), mtcars$mpg, col="red")
    abline(model6$coefficients[1],model6$coefficients[2])
    leg.txt <- c("weight","cylinders","horsepower")
    col.txt <- c("black","blue","red")
    legend("top",legend = leg.txt, col=col.txt, bty = "n", pch = 1)
  })
  
  # Weight/Displacement/Horsepower
  model7pred <- reactive({
    output$text1 = renderText("model7 <- lm(mpg ~ log(hp) + log(disp) + wt, data = mtcars)")
    plot(mtcars$cyl, mtcars$mpg, type = "n", xlab = "Weight/Displacement/Horsepower",ylab = "MPG")
    points(mtcars$wt, mtcars$mpg, col="black")
    points(log(mtcars$disp), mtcars$mpg, col="blue")
    points(log(mtcars$hp), mtcars$mpg, col="red")
    abline(model7$coefficients[1],model7$coefficients[2])
    leg.txt <- c("weight","displacement","horsepower")
    col.txt <- c("black","blue","red")
    legend("top",legend = leg.txt, col=col.txt, bty = "n", pch = 1)
  })
  
  # Weight/Displacement/Horsepower/Cylinders
  model8pred <- reactive({
    output$text1 = renderText("model8 <- lm(mpg ~ log(hp) + log(disp) + cyl + wt, data = mtcars)")
    plot(mtcars$cyl, mtcars$mpg, type = "n", xlab = "Displacement/Horsepower/Cylinders/Weight",ylab = "MPG")
    points(mtcars$wt, mtcars$mpg, col="black")
    points(mtcars$cyl, mtcars$mpg, col="green")
    points(log(mtcars$disp), mtcars$mpg, col="blue")
    points(log(mtcars$hp), mtcars$mpg, col="red")
    abline(model8$coefficients[1],model8$coefficients[2])
    leg.txt <- c("weight","cylinders","displacement","horsepower")
    col.txt <- c("black","green","blue","red")
    legend("top",legend = leg.txt, col=col.txt, bty = "n", pch = 1)
  })
   
  output$plot1 <- renderPlot({
    
    if (!input$showModel2 & !input$showModel3 & !input$showModel4){
      model1pred()
    }
    
    # Add Cylinders
    if (input$showModel2){
      model2pred()
    }
    
    # Add Displacement
    if (input$showModel3){
      model3pred()
  
    }
    
    # Add Horsepower
    if (input$showModel4){
      model4pred()
    }
    
    # Add Cylinders and Displacement
    if (input$showModel2 & input$showModel3){
      model5pred()
    }

    # Add Cylinders and Horsepower
    if (input$showModel2 & input$showModel4){
      model6pred()
    }    
    
    # Add Displacement and Horsepower
    if (input$showModel3 & input$showModel4){
      model7pred()
    }        
    
    # Add Cylinders, Displacement and Horsepower
    if (input$showModel2 & input$showModel3 & input$showModel4){
      model8pred()
    }     
    
  })  # end renderPlot()
  
})  # end shinyServer()
