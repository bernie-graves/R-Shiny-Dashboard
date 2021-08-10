library(shinydashboard)

server <- function(input, output) {
  
  # sample plot
  set.seed(122)
  histdata <- rnorm(500)
  
  # sample slider
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
  
  # sample ggplot
  output$plot2 <- renderPlot({
    plot(mtcars$wt, mtcars$mpg)
  })
  
  output$info <- renderText({
    paste0("x=", input$plot_click$x, "\ny=", input$plot_click$y)
  })
}
