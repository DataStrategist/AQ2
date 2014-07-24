# Figure out how to do data filtering etc first, then do in shiny

data <- read.csv("K:/Dropbox/Dropbox/WORK/AQ2/mini.assets.csv")
# Define assets that apply at global level
data.world <- data["World" == data[,"off_r"],]

# Define regional assets
data.regions <- data["World" != data[,"off_r"],]
data.regions <- data.regions["" != data.regions[,"off_r"],]
data.regions <- data.regions["--" != data.regions[,"off_r"],]

# Define country assets
data.countries<- data["" !=data.regions[,"off_c"],]


# Filter tests
c("All",   unique(as.character(data[,"Prod_Type",])))

data$Prod_Type
