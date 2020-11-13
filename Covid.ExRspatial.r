# R spacial view of points - instructions from DR DR
#download covid_agg.csv from our teaching site and build a folder called lab into C: 
# put the covid_agg.csv file into the folder lab

#first we practice again for sp and meuse

library(sp)    #quotes"sp" only to go out of R e grab e take back to our cave
data(meuse)

head(meuse)    #shows us first 6 lines of data

coordinates(meuse)= ~x+y #only to sp   it gave all data, not just from head function
#we see how scattered in space, 

#now we can see one of the elements in space, by 
#using spplot()  directly into sp package, rastor file, an image! a map with pixels(smallest unit)

# spplot(meuse,"colomn"), lets color of data points of elements
spplot(meuse,"zinc")
#title, main=Concentration of Zinc)
spplot(meuse,"zinc",main="Concentration of zinc") 

#main give me the ability to title my plot, do not forget ""

#see where zn is higher
#and color each subset of data, each element that have values in the columns
#we are equalizing,=, and then grouping with tilda alt 126 number pad only~
# setting the working directory: lab
# Windows
# setwd("C:/lab/")
# Mac users
# setwd("/Users/yourname/lab/")
# Linux users
setwd("~/lab")

covid <- read.table("covid_agg.csv", head=T)
head(covid)

attach(covid)
plot(country,cases)

# plot(covid$country,covid$cases)

plot(country, cases, las=0) # parallel labels
plot(country, cases, las=1) # horizontal labels
plot(country, cases, las=2) # perpendicular labels
plot(country, cases, las=3) # vertical labels

plot(country, cases, las=3, cex.axis=0.5)
plot(country, cases, las=3, cex.axis=0.7)

# ggplot2 package
install.packages("ggplot2")
library(ggplot2)  # require(ggplot2)
install.packages("ggplot2")

# If ggplot2 cannot be found by the software: install the devtools package and then install 
# install.packages("devtools")
# devtools::install_github("tidyverse/ggplot2")

# save the .RData under the menu File
# for Windows users: save as "yourprefferredname.RData"


# load the previously saved .RData

# setting the working directory: lab
# Windows
# setwd("C:/lab/")
# Mac users
# setwd("/Users/yourname/lab/")
# Linux users
setwd("~/lab")

load("spatial.RData")

ls()
# covid

install.packages("ggplot2")
library(ggplot2) #require(ggplot2)

data(mpg)
head(mpg)
# key components: data, aes, geometry
ggplot(mpg, aes(x=displ,y=hwy)) + geom_point()
ggplot(mpg, aes(x=displ,y=hwy)) + geom_line()
ggplot(mpg, aes(x=displ,y=hwy)) + geom_polygon()

head(covid)
ggplot(covid, aes(x=lon, y=lat, size=cases)) + geom_point()

# Mac Users: in case you receive a graphical error, assign the ggplot to an object:
# graph1 <- ggplot(covid, aes(x=lon, y=lat, size=cases)) + geom_point() e in seguito ho 
# and then plot by:
# plot(graphs_1) 
