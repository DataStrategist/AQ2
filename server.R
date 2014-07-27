library(shiny)

### Load data: ###
data <- read.csv("mini.assets.csv")
Output.columns <- c( "file_eng", "name_eng",  "Abstract_eng", 
                     "year", "year.update", "Prod_Type", "Prod"
)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Options for output:
  # id  year  year.update  Country.Asset  cont	
  # name_eng	name_esp	name_fra	
  # file_eng	file_esp	file_fra	file_other	file_c	file_r	
  # off_c	off_r	Main.product	Diss	Prod_Type	Prod	sub_n	River	
  # Topic.GCPE	Topic.WR	Topic.WU	Topic.Irr	Topic.Prosp	
  # Abstract_eng	Abstract_esp	Abstract_fra
  
  output$table1 <- renderDataTable({  # COUNTRIES
    
    ### Apply filtering  ###
    if (input$country != "All"){
      data <- rbind(data[input$country == data[, "off_r"], ],
                    data[input$country == data[, "off_c"], ]
      )
    }
    
    if (input$filetype != "All"){
      data <- data[data$Prod_Type == input$filetype,]
    }
    
    if (input$product != "All"){
      data <- data[data$Prod == input$product,]
    }
    
    if (input$topic != "All"){
      if("General information" == input$topic) {data <- data[data$Topic.GCPE==T,]}
      if("Water Resources"     == input$topic) {data <- data[data$Topic.WR==T,]}
      if("Water Uses"          == input$topic) {data <- data[data$Topic.WU==T,]}
      if("Irrigation"          == input$topic) {data <- data[data$Topic.Irr==T,]}
      if("Prospects"           == input$topic) {data <- data[data$Topic.Prosp==T,]}
    }
    
    # Define country assets
    data.countries<- rbind(data["" == data[,"file_r"],], 
                           data["--" == data[,"file_r"],])
    data <- data.countries 
    
    ### do table  ###
    
    data[,Output.columns]
  })
  
  output$table2 <- renderDataTable({  # REGIONS

    ### Apply filtering  ###
    if (input$country != "All"){
      data <- rbind(data[input$country == data[, "off_r"], ],
                    data[input$country == data[, "off_c"], ]
      )
    }
    
    if (input$filetype != "All"){
      data <- data[data$Prod_Type == input$filetype,]
    }
    
    if (input$product != "All"){
      data <- data[data$Prod == input$product,]
    }
    
    if (input$topic != "All"){
      if("General information" == input$topic) {data <- data[data$Topic.GCPE==T,]}
      if("Water Resources"     == input$topic) {data <- data[data$Topic.WR==T,]}
      if("Water Uses"          == input$topic) {data <- data[data$Topic.WU==T,]}
      if("Irrigation"          == input$topic) {data <- data[data$Topic.Irr==T,]}
      if("Prospects"           == input$topic) {data <- data[data$Topic.Prosp==T,]}
    }
    
    # Define regional assets
    data.regions <- data["World" != data[,"file_r"],]
    data.regions <- data.regions["" != data.regions[,"file_r"],]
    data.regions <- data.regions["--" != data.regions[,"file_r"],]
    
    data <- data.regions
        
    ### do table  ###
    
    data[,Output.columns]
  })
  
  output$table3 <- renderDataTable({  # WORLD
    
    ### Apply filtering  ###
    if (input$country != "All"){
      data <- rbind(data[input$country == data[, "off_r"], ],
                    data[input$country == data[, "off_c"], ]
      )
    }
    
    if (input$filetype != "All"){
      data <- data[data$Prod_Type == input$filetype,]
    }
    
    if (input$product != "All"){
      data <- data[data$Prod == input$product,]
    }
    
    if (input$topic != "All"){
      if("General information" == input$topic) {data <- data[data$Topic.GCPE==T,]}
      if("Water Resources"     == input$topic) {data <- data[data$Topic.WR==T,]}
      if("Water Uses"          == input$topic) {data <- data[data$Topic.WU==T,]}
      if("Irrigation"          == input$topic) {data <- data[data$Topic.Irr==T,]}
      if("Prospects"           == input$topic) {data <- data[data$Topic.Prosp==T,]}
    }
    
    # Define global assets
    data.world <- rbind(data["World" == data[,"file_r"],],
                        data["World" == data[,"file_c"],]
    )
    
    data <- data.world
    
    ### do table  ###
    
    data[,Output.columns]
  })
  
})

