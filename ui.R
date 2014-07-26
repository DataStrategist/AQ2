# Starting from http://shiny.rstudio.com/gallery/basic-datatable.html
# also taking elements from http://shiny.rstudio.com/gallery/datatables-demo.html

.libPaths("K:/Dropbox/Dropbox/R/library")
library(shiny)
library(stringr)

data <- read.csv("mini.assets.csv")
topiks.text <- c("All", "General information", "Water Resources", 
            "Water Uses", "Irrigation", "Prospects")

# off_countries has a series of formats, get rid of lists, and 
## alphabetize.

geog <- c(unique(as.character(data$off_c)),
          unique(as.character(data$off_r))
)
geog <- geog[geog != ""]
geog <- geog[geog != "--"]
geog <- geog[geog != 9727]
geog <- geog[!str_detect(geog,",")]
geog <- sort(geog)
geog <- c("All", geog)

# Define the overall UI
shinyUI(pageWithSidebar(
  headerPanel('Asset selector proof of concept'),
  sidebarPanel(
    
    
    selectInput("country", h3("Country/Region:"), geog
                
    ),
    radioButtons("Topic", label = h3("Topic:"),
                 choices = topiks.text 
    ),
    selectInput("filetype", "File type:", 
        c("All", unique(as.character(data$Prod_Type)))
    ),
    selectInput("product", "Information type:", 
        c("All", unique(as.character(data$Prod)))
    )
  ),
  
  mainPanel(
    tabsetPanel(
      id = 'dataset',
      tabPanel('Country-level', dataTableOutput('table1')),
      tabPanel('Regional', dataTableOutput('table2')),
      tabPanel('Global', dataTableOutput('table3'))
    )
  )    
))