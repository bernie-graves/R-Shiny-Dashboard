library(shinydashboard)

server <- function(input, output) {

# DASHBOARD TAB
# PLOTS (sample data, haven't changed to csv data yet) 

  # sample plot
  set.seed(122)
  histdata <- rnorm(500)

  # sample scatterplot
  output$plot2 <- renderPlot({
    plot(mtcars$wt, mtcars$mpg)
  })
  
  output$info <- renderText({
    paste0("x=", input$plot_click$x, "\ny=", input$plot_click$y)
  })
  
  # sample slider
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })

  
# CSV FILE TAB

  # displaying csv file in raw code tab
  output$contents <- renderTable({
    read.csv(file = 'Attributes_DataFrame.csv')
  })
  
  # connect csv file and download
  output$downloadCsv <- downloadHandler(
    filename = 'Attributes_DataFrame.csv',
    content = function(file) {
      write.csv(Attributes_DataFrame, file)
    }
  )

}