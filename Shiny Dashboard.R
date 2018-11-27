#install.packages("shinydashboard")
library(shinydashboard)


# Create an empty header
 header <- dashboardHeader()
# Create an empty sidebar
 sidebar <- dashboardSidebar()
# Create an empty body
 body <- dashboardBody()



# Create header with messages, notifications, task menus
header <- dashboardHeader(
  title = "New Title Header",
  dropdownMenu(
  type = "messages",
    messageItem(from = "Nasa Update", message = "You can view the International Space Station!", href = "https://spotthestation.nasa.gov/sightings/"),
    messageItem(from = "Senthil Update", message = "Second message", icon = icon("bar-chart"), time="22:00"),
    messageItem(from = "Sales Update", message = "Meeting at 11:00 on Tuesday", icon = icon("handshake-o"), time="03/27/2018")
  ),
  dropdownMenu(
    type = "notifications", notificationItem( text = "2 new tabs added to dashboard", icon = icon("dashboard"), status = "success"),
                            notificationItem( text = "Server is running at 85%", icon = icon("warning"))
  ),
  dropdownMenu(
    type = "tasks", taskItem( text = "Overall R Progress", color="green", value=90),
                    taskItem( text = "ShinyDahasboard course Progress", color="yellow", value=95)
  )
  
)

# Create header with notification menus
#header <- dashboardHeader(
#  title = "Title Header",
#  dropdownMenu(
#    type = "notifications",
#    notificationItem(
#      text = "You can view the International Space Station!"
#    )
#  )
#)

# Create header with task menus
#header <- dashboardHeader(
#  title = "Title Header",
#  dropdownMenu(
#    type = "tasks",
#    taskItem(
#      text = "You can view the International Space Station!",
#      value = 95
#    )
#  )
#)
#

#Create sidebar with menu item and tab
sidebar <- dashboardSidebar(
  sidebarMenu(
    sidebarSearchForm("searchText", "buttonSearch", "Search"),
    # Create two `menuItem()`s, "Dashboard" and "Inputs"
    menuItem("Dashboard", tabName = "dashboard"),
    #menuItem("Inputs", tabName = "inputs"),
    menuItem("Raw Data", tabName = "rawdata"),
    menuItem("Detailed Analysis", tabName = "analysis"),
      menuSubItem("Finance"), menuSubItem("Sales"),
    menuItem("Reports", tabName = "reports", badgeLabel = "New", badgeColor = "green")
  )
)


#Create body with the tab
# body <-	dashboardBody(
#   tabItems(
#     tabBox(
#       tabPanel(title = "Dashboard", sliderInput("i", "l", 1, 100, 25))
#       #tabPanel(title = "iiiiinputs")
#       # tabItem(tabName	=	"dashboard", tabPanel("Dashboard"), title("Dashboardddd")),
#       # tabItem(tabName	=	"inputs", tabPanel("Inputs"), title("iiiiinputs"))
#     )
#   )
# )

#Create tab boxes
 body <- dashboardBody(
   # Create a tabBox
   tabItems(
     tabItem(
       tabName = "dashboard",
       fluidRow(
        box(title="Histogram", status = "primary", solidHeader = 1, plotOutput("histogram")),
        box(title="Controls", status = "warning", solidHeader = 1, 
            sliderInput("bins", "Number of Breaks", 1, 100, 50), 
            textInput("text_input","Search Opportunities", value="123456" ) 
        )
     )))
 )
 
 
# Create the UI using the header, sidebar, and body
ui <- dashboardPage(header, sidebar, body)

server <- function(input, output) {}

shinyApp(ui, server)
