library(shiny)
library(shinydashboard)
# check out ggplot2
library(ggplot2)

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
                # Histogram
                box(
                  title = "Histogram", status = "primary", solidHeader = TRUE,
                  plotOutput("plot1", height = 300)
                ),
                
                # scatter plot
                box(
                  title = "scatter plot", status = "primary", solidHeader = TRUE,
                  plotOutput("plot2", height = 300),
                ),
                
                # slider
                box(
                  title = "Movies", status = "warning", solidHeader = TRUE,
                  sliderInput("slider", "Runtime in minutes:", 60, 220, 20),
                  textInput("text", "Text input:")
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