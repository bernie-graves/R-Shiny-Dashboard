library(shinydashboard)
# check out ggplot2

dashboardPage(
  skin = "green",
  dashboardHeader(title = "Basic dashboard",
                  titleWidth = 350, 
                  
        # sample Headers top right corner
        dropdownMenu(type = "messages",
                     messageItem(
                       from = "Sales Dept",
                       message = "Sales are steady this month."
                     ),
                     messageItem(
                       from = "New User",
                       message = "How do I register?",
                       icon = icon("question"),
                       time = "13:45"
                     ),
                     messageItem(
                       from = "Support",
                       message = "The new server is ready.",
                       icon = icon("life-ring"),
                       time = "2014-12-01"
                     )),
        dropdownMenu(type = "notifications",
                     notificationItem(
                       text = "5 new users today",
                       icon("users")
                     ),
                     notificationItem(
                       text = "12 items delivered",
                       icon("truck"),
                       status = "success"
                     ),
                     notificationItem(
                       text = "Server load at 86%",
                       icon = icon("exclamation-triangle"),
                       status = "warning"
                     )
        ),
         dropdownMenu(type = "tasks", badgeStatus = "success",
                      taskItem(value = 90, color = "green",
                               "Documentation"
                      ),
                      taskItem(value = 17, color = "aqua",
                               "Project X"
                      ),
                      taskItem(value = 75, color = "yellow",
                               "Server deployment"
                      ),
                      taskItem(value = 80, color = "red",
                               "Overall project"
                      )
         )
  ),
  dashboardSidebar(
    width = 350,
    sidebarMenu(
      
      # Dashboard tab
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      
      # Widgets tab
      menuItem("Widgets", icon = icon("th"), tabName = "widgets",
               badgeLabel = "new", badgeColor = "green"),
      
      # Source code tab
      menuItem("Source code", icon = icon("file-code-o"), 
               href = "https://github.com/rstudio/shinydashboard/"),
      
      # Search bar COULD BE HELPFUL!
      sidebarSearchForm(textId = "searchText", buttonId = "searchButton",
                        label = "Search...")
      )
    ),
  dashboardBody(
    
    # Dashboard page content
    tabItems(
      tabItem(tabName = "dashboard",
              h2("Dashboard tab content"),
              
              # Boxes need to be put in a row (or column)
              fluidRow(
                
                # sample Histogram
                box(
                  title = "Histogram", status = "primary", solidHeader = TRUE,
                  collapsible = TRUE,
                  plotOutput("plot1", height = 250)
                ),
                
                # sample ggplot
                box(
                  title = "ggplot", status = "primary", solidHeader = TRUE,
                  collapsible = TRUE,
                  plotOutput("plot2", click = "plot_click"),
                  verbatimTextOutput("info")
                ),
                
                # sample Slider
                box(
                  title = "Inputs", status = "warning", solidHeader = TRUE,
                  "Box content here", br(), "More box content",
                  sliderInput("slider", "Number of observations:", 1, 100, 50),
                  textInput("text", "Text input:")
                ),
                
                # sample 2 Tab box
                tabBox(
                  title = "First tabBox",
                  # The id lets us use input$tabset1 on the server to find the current tab
                  id = "tabset1", height = "250px",
                  tabPanel("Tab1", "First tab content"),
                  tabPanel("Tab2", "Tab content 2")
                ),
                
                # sample 3 Tab box, NO Title
                tabBox(
                  side = "right", height = "250px",
                  selected = "Tab3",
                  tabPanel("Tab1", "Tab content 1"),
                  tabPanel("Tab2", "Tab content 2"),
                  tabPanel("Tab3", "Note that when side=right, the tab order is reversed.")
                )
              ),
              fluidRow(
                
                # sample Tab STATUS box
                tabBox(
                  # Title can include an icon
                  title = tagList(shiny::icon("gear"), "tabBox status"),
                  tabPanel("Tab1",
                           "Currently selected tab from first box:",
                           verbatimTextOutput("tabset1Selected")
                  ),
                  tabPanel("Tab2", "Tab content 2")
                )
              )
      ),

      # Widgets page content (BLANK FOR NOW)
      tabItem(tabName = "widgets",
              h2("Widgets tab content")
      )
    ),
  ),
)