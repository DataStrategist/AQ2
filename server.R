library(shiny)

# Load the ggplot2 package which provides
# the 'mpg' dataset.
library(ggplot2)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  output$table <- renderDataTable({
    
  # Load data:
    data <- read.csv("mini.assets.csv")
    # Define assets that apply at global level
    data.world <- data["World" == data[,"off_r"],]
    
    # Define regional assets
    data.regions <- data["World" != data[,"off_r"],]
    data.regions <- data.regions["" != data.regions[,"off_r"],]
    data.regions <- data.regions["--" != data.regions[,"off_r"],]
    
    # Define country assets
    data.countries<- data["" !=data.regions[,"off_c"],]
    
  # Apply filtering  
    if (input$filetype != "All"){
      data <- data[data$Prod_Type == input$filetype,]
    }
    if (input$product != "All"){
      data <- data[data$Prod == input$product,]
    }
# Options for output:
# id  year  year.update	Country.Asset	cont	
# name_eng	name_esp	name_fra	
# file_eng	file_esp	file_fra	file_other	file_c	file_r	
# off_c	off_r	Main.product	Diss	Prod_Type	Prod	sub_n	River	
# Topic.GCPE	Topic.WR	Topic.WU	Topic.Irr	Topic.Prosp	
# Abstract_eng	Abstract_esp	Abstract_fra

    data[,c("year","year.update", "name_eng",  "file_eng"
    )]
  })
  
})