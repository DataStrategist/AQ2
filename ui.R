# Starting from http://shiny.rstudio.com/gallery/basic-datatable.html
# also taking elements from http://shiny.rstudio.com/gallery/datatables-demo.html

.libPaths("K:/Dropbox/Dropbox/R/library")
library(shiny)

data <- read.csv("mini.assets.csv")
topiks <- c("All", "Topic.GCPE", "Topic.WR", "Topic.WU", "Topic.Irr",
            "Topic.Prosp")

# Define the overall UI
shinyUI(pageWithSidebar(
  headerPanel('Asset selector'),
  sidebarPanel(    # Create a new Row in the UI for selectInputs
  
    selectInput("country", h3("Country:"), 
                c("All", unique(as.character(data$file_c)))
    ),
    radioButtons("Topic", label = h3("Topic:"),
                 choices = topiks 
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