library(shiny)

# Load the ggplot2 package which provides
# the 'mpg' dataset.
library(ggplot2)

### Load data: ###
data <- read.csv("mini.assets.csv")

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Options for output:
  # id  year  year.update  Country.Asset  cont	
  # name_eng	name_esp	name_fra	
  # file_eng	file_esp	file_fra	file_other	file_c	file_r	
  # off_c	off_r	Main.product	Diss	Prod_Type	Prod	sub_n	River	
  # Topic.GCPE	Topic.WR	Topic.WU	Topic.Irr	Topic.Prosp	
  # Abstract_eng	Abstract_esp	Abstract_fra
  
  
  Output.columns <- c( "name_eng",  "Abstract_eng", 
                       "year", "year.update", "file_eng"
                    )
  
  output$table1 <- renderDataTable({  # COUNTRIES
    
    # Define country assets
    data.countries<- rbind(data["" == data[,"off_r"],], 
                          data["--" == data[,"off_r"],])
          
    ### Apply filtering  ###
    
    data <- data.countries
    
    if (input$country != "All"){
      data <- data[data$file_c == input$country,]
    }
    
    if (input$filetype != "All"){
        data <- data[data$Prod_Type == input$filetype,]
    }
    
    if (input$Topic != "All"){
      if("Topic.GCPE" == input$Topic)   {data <- data[data$Topic.GCPE==T,]}
      if("Topic.WR" == input$Topic)     {data <- data[data$Topic.WR==T,]}
      if("Topic.WU" == input$Topic)     {data <- data[data$Topic.WU==T,]}
      if("Topic.Irr" == input$Topic)    {data <- data[data$Topic.Irr==T,]}
      if("Topic.Prosp" == input$Topic)  {data <- data[data$Topic.Prosp==T,]}
    }
    
    ### do table  ###
    
    data[,Output.columns]
  })
  
  output$table2 <- renderDataTable({  # REGIONS
    
    # Define regional assets
    data.regions <- data["World" != data[,"off_r"],]
    data.regions <- data.regions["" != data.regions[,"off_r"],]
    data.regions <- data.regions["--" != data.regions[,"off_r"],]
    
    ### Apply filtering  ###
    
    data <- data.regions
    
    if (input$filetype != "All"){
      data <- data[data$Prod_Type == input$filetype,]
    }
    if (input$product != "All"){
      data <- data[data$Prod == input$product,]
    }
    
    ### do table  ###
    
    data[,Output.columns]
  })
  
  output$table3 <- renderDataTable({  # WORLD
    
    # Define global assets
    data.world <- data["World" == data[,"off_r"],]
    
    ### Apply filtering  ###
    
    data <- data.world
    
    if (input$filetype != "All"){
      data <- data[data$Prod_Type == input$filetype,]
    }
    if (input$product != "All"){
      data <- data[data$Prod == input$product,]
    }
    
    ### do table  ###
    
    data[,Output.columns]
  })
  
})