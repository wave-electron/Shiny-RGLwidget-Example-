# Must be executed BEFORE rgl is loaded on headless devices.
options(rgl.useNULL=TRUE)

library(shiny)
library(rgl)
library(rglwidget)

xPts <- runif(1000, 0, 1)
yPts <- runif(1000, 0, 1)
zPts <- runif(1000, 0, 1)

shinyServer(function(input, output) {
  
  # Expression that generates a rgl scene with a number of points corresponding
  # to the value currently set in the slider.
  output$rglPlot <- renderRglwidget({
    try(rgl.close())
    if (input$rescale) aspect3d(1,1,10) else aspect3d(1,1,1)
    points3d(xPts[1:input$pts],
             yPts[1:input$pts],
             zPts[1:input$pts], col = 'green')
    axes3d()
    rglwidget()
  })
})
