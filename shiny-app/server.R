library(shiny)
library(shinydashboard)
library(ggplot2)
require(scales)

movie_attributes <- read.csv(file = 'Attributes_DataFrame.csv')

server <- function(input, output) {

# DASHBOARD TAB
  # so far: I've only figured out how to do static + slider histogram/plots
  # still working on: making 2 variable axes plots and dropdown user input/dynamic plots

# runtime vs density histogram/slider
  output$plot1 <- renderPlot({
    movie_runtime <- as.data.frame(movie_attributes$Runtime[39:input$slider])
    ggplot(data = movie_runtime) + aes(x = movie_runtime[,1], y = ..density..) + 
      geom_histogram(color="lightgreen", bins=input$slider_bins) + 
      scale_x_continuous("Runtime (minutes)", c(39,50,75,100,125,150,175,200,225,252)) +
      scale_y_continuous(labels = percent) +
      theme_bw() + 
      theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
      labs(title="Histogram", x = "runtime", y = "percent")
  })

# budget vs desnity histogram/slider
  output$plot2 <- renderPlot({
    movie_budget <- as.data.frame(movie_attributes$Budget[15:input$slider2])
    ggplot(data = movie_budget) + aes(x = movie_budget[,1], y = ..density..) + 
      geom_histogram(color="lightblue", bins=input$slider_bins2) +
      scale_x_continuous("Budget (thousands of dollars)", c(15,100,1000,5000,100000,200000,300000,356000)) +
      scale_y_continuous(labels = percent) +
      theme_bw() + 
      theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
      labs(title="Histogram", x = "budget", y = "percent")
    
  })
  
  # runtime vs budget scatterplot
  output$plot4 <- renderPlot({
    plot(movie_attributes$Runtime, movie_attributes$Budget,
         xlab = "Runtime (minutes)", ylab = "Budget (thousands of dollars)")
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