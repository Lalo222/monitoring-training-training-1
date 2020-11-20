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

#plot concentration of Cu, we ploted Zn, now Cu
spplot(meuse,"copper",main="Concentration of copper")

# Exercise, see Cu and Zn in two panels, good, we can compare data

#tried to solve  spplotplot("copper","zinc")
#Error in spplotplot("copper", "zinc") :

#how to make the command to put the path

  #could not find function "spplotplot"  because I need to define my data meuse,c(

#ok, do thi,slmost I did not put the c!!!!  
spplot(meuse,c("copper","zinc"))

#now bubble function, we will make a bubble plot, not colors, we use bubbles

#we will have bubbles size based on their value size in the data, like 1400vs500, bubble size will vary...cool
bubble(meuse,"zinc")

#powerful visually, the dots give me info based on their size  nice

#my data has columns named incorrectly ask how to correct also can we use number of column and row rather than names

#do lead too  
bubble(meuse,"lead")

#we can see visually where we have highest concentrations, such as NE, central, SW, etc.
#change color for bubbles
bubble(meuse,"lead",col="red")

# GDAL to overlay data to see contrast and subtract values perhaps, in future we will use

#New file now my location for data
C:\Users\123fatto\Desktop\R code    


#downloaded Covid data
#install ggplot2 and recall with library

#install.packages("ggplot2")
#we will build the dataframe, var 1, 2, etc.

#ecological data frame airplanes, 
#biofuels as amount of fossil fuel to be reduced using biofuels

biofuels <-c(120, 200, 350, 570, 750)   #built this set cosi, n1, n2, n3 etc. and grouped array:use c  will be first column
#oxidative enzymes
oxidative <-c(1200, 1300, 21000, 34000, 50000)  #will be second column  biofuels    oxidative
#then type name of set to recall and make a frame with [1]

#function to build dataframe is data.frame

#data.frame  for biofuels,    oxidative
d <- data.frame(biofuels, oxidative)
#then d to call it up, so always function with name then use name to use it, 
#spaces don't matter here
#so far: > library(ggplot2)
> biofuels <-c(120, 200, 350, 570, 750)
> biofuels
[1] 120 200 350 570 750
> oxidative <-c(1200, 1300, 21000, 34000, 50000)
> oxidative
[1]  1200  1300 21000 34000 50000
> d <- data.frame(biofuels, oxidative)
> d
  biofuels oxidative
1      120      1200
2      200      1300
3      350     21000
4      570     34000
5      750     50000

#now plot data, use plot but here ggplot2 is ggplot

#ggplot(data = ,aes(),..,###=parent frame) -- aestetics..aes
ggplot(d, aes(x=biofuels, y=oxidative))  #this opens empty window ready,we have defined the parameters of the "room"
#explain to R we are adding an additional parent, geometry  + geom(choose type we want, point for scatter)
ggplot(d, aes(x=biofuels, y=oxidative)) + geom_point()

#gave a nice plot with labels for axis of how the values are related
#now change colors ggplot(d, aes(x=biofuels, y=oxidative)) + geom_point(size=5, col="red")
ggplot(d, aes(x=biofuels, y=oxidative)) + geom_point(size=5, col= "red")

#lines  use geom_line ...cool
ggplot(d, aes(x=biofuels, y=oxidative)) + geom_line(size=5, col="red")

#now points and lines geom_point + geom_line together
# could not change colors for both ggplot(d, aes(x=biofuels, y=oxidative)) + geom_point(size=5,col="red") + geom_line(size 7, col="blue")
ggplot(d, aes(x=biofuels, y=oxidative)) + geom_point(size=5, col="red")

#geom_polygon if we want

#setwd, for importing and exporting data so build new directory called lab

#set for windows, setwd("")
setwd(("C:\\Users\\123fatto\\Desktop\\R code\lab\))
#setwd("C:/lab/")
gives a +
#read command 
 setwd("C:\\Users\\123fatto\\Desktop\\R code\lab\)
#Error: '\l' is an unrecognized escape in character string starting ""C:\\Users\\123fatto\\Desktop\\R code\l"
> setwd("C:/lab/"
+ ("C:\\Users\\123fatto\\Desktop\\R code\)
Error: '\)' is an unrecognized escape in character string starting ""C:\\Users\\123fatto\\Desktop\\R code\)"
> source("C:\\Users\\123fatto\\Desktop\\R code\\covid_agg (1).csv")
Error in source("C:\\Users\\123fatto\\Desktop\\R code\\covid_agg (1).csv") : 
  C:\Users\123fatto\Desktop\R code\covid_agg (1).csv:1:5: unexpected symbol
1: cat country
        ^
> #still having problems with directory - name the data.frame also
   
   #source("C:\\lab\\covid_agg (1).csv")
   # cannot open file 'C:\lab\covid_agg (1).csv, header=TRUE': No such file or directory
> setwd("C:\\lab\\")
> covid <- read.table("C:\\lab\\covid_agg (1).csv, header=TRUE")
Error in file(file, "rt") : cannot open the connection
In addition: Warning message:
In file(file, "rt") :
  cannot open file 'C:\lab\covid_agg (1).csv, header=TRUE': No such file or directory
> covid <- read.table("C:\\lab\\covid_agg (1).csv, header=TRUE")
#so I need to go back and fix the working directory
   #GGPlot to library
   #will use meuse for now I think, can't load COVID data
   
   #got spatstat, so that's good, now we see x and y in the table, e to w is longiture, n/s latitude
   #names(covid)
   #ggplot2
   library(ggplot2)
   ggplot(covid, aes(x=lon, y=lat)) + geom_point()
   ggplot(covid,aes(x=lon,y=lat, size=jcases)) + geom_point()
   
   #makes scatter plot and concentration of cases, will use R for point patter analysis
   
   
   





 
