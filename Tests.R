# Figure out how to do data filtering etc first, then do in shiny

data <- read.csv("mini.assets.csv")
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

topiks <- c("All", "Topic.GCPE", "Topic.WR", "Topic.WU", "Topic.Irr",
            "Topic.Prosp")
Topic <- c("Topic.WR")



  if("Topic.GCPE" == Topic)   {data <- data[data$Topic.GCPE==T,]}
  if("Topic.WR" == Topic)     {data <- data[data$Topic.WR==T,]}
  if("Topic.WU" == Topic)     {data <- data[data$Topic.WU==T,]}
  if("Topic.Irr" == Topic)    {data <- data[data$Topic.Irr==T,]}
  if("Topic.Prosp" == Topic)  {data <- data[data$Topic.Prosp==T,]}


data

colnames(data)

head(data$id)
levels(data$id)

a <- ""
a <- unlist(strsplit(a,","))

data <- c(
  data["Afghanistan" %in% unlist(strsplit(levels(data$off_c),",")),],
  data["Afghanistan" %in% unlist(strsplit(levels(data$off_r),",")),])


library(stringr)
a <- c("a","a,b","c")
str_detect(a,",")
a <- a[!str_detect(a,",")]

geog <- unique(c("All", 
                 unique(as.character(data$off_c)),
                 unique(as.character(data$off_r))
))
geog <- geog[!str_detect(geog,",")]
geog <- sort(geog)
geog <- geog[geog != ""]
geog <- geog[geog != "--"]
