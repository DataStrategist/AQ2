# Starting from http://shiny.rstudio.com/gallery/basic-datatable.html
# also taking elements from http://shiny.rstudio.com/gallery/datatables-demo.html
# and random internet posts for details.

library(shiny)
library(shinyapps)
library(stringr)

data <- read.csv("mini.assets.csv")
topiks.text <- c("All", "General information", "Water Resources", 
            "Water Uses", "Irrigation", "Prospects")

# off_countries has a series of formats, get rid of lists, and 
## alphabetize.
geog <- c(unique(as.character(data$off_c)),
                     unique(as.character(data$off_r))
           )

geog <- geog[geog != "--"]
geog <- geog[!str_detect(geog,",")]
geog <- sort(geog)

geog <- c("All", geog)
geog <- geog[geog != ""]
geog <- unique(geog)

# Define the overall UI
shinyUI(pageWithSidebar(
  headerPanel('Asset selector (Proof of concept)'),
  sidebarPanel(
    style="min-width:300px;max-width:310px", 
  
    selectInput("country", h3("Country:"), geog
    ),
    radioButtons("topic", label = h3("Topic:"),
                 choices = topiks.text 
    ),
    selectInput("filetype", h3("File type:"), 
        c("All", unique(as.character(data$Prod_Type)))
    ),
    selectInput("product", h3("Information type:"), 
        c("All", unique(as.character(data$Prod)))
    )
  ),
  
  mainPanel(
    tabsetPanel(
      id = 'dataset',
      tabPanel('Country-level assets', dataTableOutput('table1')),
      tabPanel('Regional-level assets', dataTableOutput('table2')),
      tabPanel('Global assets', dataTableOutput('table3'))
    )
  )    
))