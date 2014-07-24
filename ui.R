# Starting from http://shiny.rstudio.com/gallery/basic-datatable.html
# also taking elements from http://shiny.rstudio.com/gallery/datatables-demo.html

.libPaths("K:/Dropbox/Dropbox/R/library")
library(shiny)

data <- read.csv("mini.assets.csv")


# Define the overall UI
shinyUI(
  fluidPage(
    titlePanel("Basic DataTable"),
    
    # Create a new Row in the UI for selectInputs
    fluidRow(
      column(4, 
             selectInput("filetype", 
                         "File type:", 
                         c("All", 
                           unique(as.character(data$Prod_Type))))
      ),
      column(4, 
             selectInput("product", 
                         "Information type:", 
                         c("All", 
                           unique(as.character(data$Prod))))
      )
              
    ),
    # Create a new row for the table.
    fluidRow(
      tabsetPanel(
        id = 'dataset',
        tabPanel('Country-level', dataTableOutput('table1')),
        tabPanel('Regional', dataTableOutput('table2')),
        tabPanel('Global', dataTableOutput('table3'))
      )
    )    
  )  
)