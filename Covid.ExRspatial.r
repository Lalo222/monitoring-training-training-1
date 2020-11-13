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

 
