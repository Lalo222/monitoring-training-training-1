#R_code_Energy.r
#His student in the Rcran for Rasterdiv

#Install Rasterdiv 
#We see data from Copernicus, NDVI
install.packages("rasterdiv)
library(rasterdiv)
library(raster)
library(rasterVis)  #All good
#but I got the order wrong and did not recall the library(raster) in order and data was not found,
#Duccio straightened it out and all good, it was the order of install and library!!!

#Map has blue background and he left unassigned, NA so we can change 253-255 to be revised

copNDVI <- reclassify(copNDVI, cbind(253:255, NA))
plot(copNDVI)

#Green are highest biomass areas our range is 0-252, 

#Now we can draw a line of different NDVI values with rasterVis
library(rasterVis)

#We can take the average of each map for the one pixel from many years.  Now we plot with
levelplot(copNDVI)
#It works and made great purple and tan plot and waves on edges shows us the averages through the line of pixels

#Play with the colors now in plot, colorramp again, but he does not seem to need to recall the original plot, interesting
#I see the plot is designated by levelplot or plot and therefore we are choosing which plot to use

clymin <- colorRampPalette(c('yellow','red','blue'))(100)  #here we change original plot
plot(copNDVI, col=clymin)
#Nice I like these colors, are we seeing the NIR-R for absorbance and reflectance?? Ask Monday seeing min instead of max, highest is in blue
#we decide which is in medium and eye not seeing max but min or med where we want

clymed <- colorRampPalette(c('red','yellow','blue'))(100)
plot(copNDVI, col=clymed)       #Notice clymed!!!, control point,  col=clymin!!!, he interchanges the yellow and blue 
#Make sure to always read the legend for color definition
clymax <- colorRampPalette(c('blue','red','yellow'))(100)  
plot(copNDVI, col=clymax)    #yellow the highest biomass, but still highest energy so I like it, like the sun, purple is the dark so less energy, so
#yellow in medium not so good

#now put all together  with par, puts graphs beside eachother
par(mfrow=c(1,2))
clymed <- colorRampPalette(c('red','yellow','blue'))(100) 
plot(copNDVI, col=clymed)

#cool, I had to remember to do dev.off() to start new graphic, but got it   #solved problem alone, yay, 
#but I contrasted the two that were inverses, I can go back and do the blue representing the max biomass also

#Now how to zoom, now we must do dev.off() again, he calls it crop

ext <- c(0,20,35,55)    #these are coord in xmin xmax y min and ymax of areas we wish to see more closely
copNDVI_Italy <- crop(copNDVI, ext)
plot(copNDVI_Italy, col=clymax

#Really cool and useful!!!
#Done  

















