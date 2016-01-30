
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Shiny RGLWidget!"),
  
  # Sidebar with a slider input for number of points
  sidebarPanel(
    checkboxInput("rescale", "Rescale"),
    sliderInput("pts", 
                "Number of points:", 
                min = 10, 
                max = 1000, 
                value = 250),
    HTML("<hr />"),
    helpText(HTML("Created using <a href = \"https://cran.r-project.org/web/packages/rglwidget\">RGLWidget</a>."))
  ),
  
  # Show the generated 3d scatterplot
  mainPanel(
    rglwidgetOutput("rglPlot")
  )
))
