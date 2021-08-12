library(shiny)
library(shinydashboard)
library(ggplot2)
require(scales)

# READ DATA
movie_attributes <- read.csv(file = 'Attributes_DataFrame.csv')

dashboardPage(
  
  skin = "green",
  dashboardHeader(title = "Earnings data for movies",
                  titleWidth = 350
                  ),

  dashboardSidebar(
    width = 350,
    sidebarMenu(
      
      # Dashboard tab
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      
      # Raw code tab
      menuItem("Raw code", tabName = "rawcode", icon = icon("file-code-o")),
      
      # Search bar COULD BE HELPFUL!
      sidebarSearchForm(textId = "searchText", buttonId = "searchButton",
                        label = "Search...")
      )
    ),
  
  dashboardBody(
# DASHBOARD page content
    tabItems(
      tabItem(tabName = "dashboard",
              h2("Movie Earnings analysis"),
              
              # Boxes need to be put in a row (or column)
              fluidRow(
                
                # Runtime vs density Histogram
                box(
                  plotOutput("plot1", height = 300),
                  title = "Runtime vs Density Histogram", status = "primary", solidHeader = TRUE
                ),
                
                # slider1
                box(
                  height = 375,
                  title = "Runtime Controls", status = "warning", solidHeader = TRUE,
                  #sliderInput("slider", "Budget in thousands of dollars:", 15, 356000, 180000),
                  #sliderInput("slider_bins", "Runtime in minutes:", 39, 252, 185),
                  sliderInput("slider_bins", "Number of Movies:", 1, 3400, 500),
                  sliderInput("slider", "Runtime:", 39, 252, 185)
                ),
                
                # Budget vs density Histogram
                box(
                  plotOutput("plot2", height = 300),
                  title = "Budget vs Density Histogram", status = "primary", solidHeader = TRUE
                ),
                
                #slider2
                box(
                  height = 375,
                  title = "Budget Controls", status = "warning", solidHeader = TRUE,
                  sliderInput("slider_bins2", "Number of Movies:", 1, 3400, 500),
                  sliderInput("slider2", "Budget:", 15, 356000, 1000)
                ),
                
                # budget vs revenue in billions scatterplot
                box(
                  plotOutput("plot3", height = 300),
                  title = "Budget vs Revenue in billions", status = "primary", solidHeader = TRUE
                ),
                
                # runtime vs budget scatterplot
                box(
                  plotOutput("plot4", height = 300),
                  title = "Runtime vs Budget", status = "primary", solidHeader = TRUE
                ),
                
                # Tab box
                tabBox(
                  title = "First tabBox",
                  # The id lets us use input$tabset1 on the server to find the current tab
                  id = "tabset1", height = "250px",
                  tabPanel("Tab1", "First tab content"),
                  tabPanel("Tab2", "Tab content 2")
                )
              )
      ),

# RAW CODE page content
      tabItem(tabName = "rawcode",
              h2("Raw Code"),
              downloadButton("downloadCsv", "Download as CSV"),
              tableOutput("contents")
      )
    ),
  ),
)
