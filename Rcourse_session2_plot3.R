#The R code to create this map is taken from https://datatricks.co.uk/creating-maps-in-r-2019

#Clear the memory
rm(list=ls())

#Run the install.packages only once (on the first time you run script)
# install.packages("maps")
# install.packages("mapdata")
# install.packages("maptools")
# install.packages("rgdal")
# install.packages("ggmap")
# install.packages("ggplot2")
# install.packages("rgeos")
# install.packages("broom")
# install.packages("plyr")

#Download some important packages
library(maps)
library(mapdata)
library(maptools)
library(rgdal)
library(ggmap)
library(ggplot2)
library(rgeos)
library(broom)
library(plyr)

#Set the working directory (this is the directory where your files for session 2 are stored):
setwd('C:/Work/Rcourse/Session2') 

#Load the shapefile - make sure you change the filepath to where you saved the shapefiles
shapefile <- readOGR(dsn="NUTS_Level_2__January_2018__Boundaries-shp", 
                     layer="NUTS_Level_2__January_2018__Boundaries")

#Reshape for ggplot2 using the Broom package
mapdata <- tidy(shapefile, region="nuts218nm") #This might take a few minutes

#Create some data to use in the heatmap - here we are creating a random "value" for each county (by id)
mydata <- data.frame(id=unique(mapdata$id), value=sample(c(0:100), length(unique(mapdata$id)), replace = TRUE))

#Join mydata with mapdata
df <- join(mapdata, mydata, by="id")

#Exporting the plot to a jpeg file:
file.name=paste("UK_heatmap_example.jpeg")
jpeg(file.name,width=1500, height=900)

#Create the heatmap using the ggplot2 package
gg <- ggplot() + geom_polygon(data = df, aes(x = long, y = lat, group = group, fill = value), color = "#FFFFFF", size = 0.25)
gg <- gg + scale_fill_gradient2(low = "blue", mid = "red", high = "yellow", na.value = "white")
gg <- gg + coord_fixed(1)
gg <- gg + theme_minimal()
gg <- gg + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), legend.position = 'none')
gg <- gg + theme(axis.title.x=element_blank(), axis.text.x = element_blank(), axis.ticks.x = element_blank())
gg <- gg + theme(axis.title.y=element_blank(), axis.text.y = element_blank(), axis.ticks.y = element_blank())
gg <- gg + theme(legend.position="right")
print(gg)
dev.off()