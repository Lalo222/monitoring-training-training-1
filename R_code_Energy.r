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

#January 18,2021   Energy  today pdf pictures Amazon

library(raster)
library(RStoolbox)

#Now set wd again, as usual

setwd("C:/lab/")
#Now download data and how to handle it in R
#From other day if we have more than 1 layer we must use not rastor function but brick from the other day with Copern.
defor1 <- brick("defor1_.jpg")  worked but if a png use this #defor1_.png if errors come out: defor1_.png

#see notes on bands and bits, 2^number of bits for possible number of shades, colors
#We have 3 bands today  1st is NIR,  2nd band is Red, 3rd band is blue we put and stretch, see data below
##class      : RasterBrick 
dimensions : 478, 714, 341292, 3  (nrow, ncol, ncell, nlayers)
resolution : 1, 1  (x, y)
extent     : 0, 714, 0, 478  (xmin, xmax, ymin, ymax)
crs        : NA 
# source     : C:/lab/defor1_.jpg 
# names      : defor1_.1, defor1_.2, defor1_.3 
# min values :         0,         0,         0 
# max values :       255,       255,       255    #bands

now set bands   #plotRGB(defor1, 1, 2, 3, stretch="Lin")   #but here before we had r, b, g etc. but we do not need to
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")  #or if we prefer to list bands, 
#So I can interchange which bands reflect which NIR, R, etc. by interchanging the bands identity number as below 
plotRGB(defor1, r=2, g=1, b=3, stretch="Lin")
plotRGB(defor1, r=3, g=2, b=1, stretch="Lin")  try for fun....while he is on call with Elam

#played and changed all to 3, and got gray scale,
plotRGB(defor1, r=3, g=2, b=1, stretch="Lin") #cool

#now defor2 
defor2 <- brick("defor2_.jpg")
defor2
#now plot
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
#I have the same image always with par function
#Call from Duccio and it was a silly error
#defor1 <- brick("defor2_.jpg")   HERE I SEE THAT I WROTE 2 FOR EACH BRICK, MUST WATCH FOR THIS SEE DEFOR2 DEFOR2
# defor2 <- brick("defor2_.jpg")
> defor2
defor1 <- brick("defor1_.jpg")
defor2 <- brick("defor2_.jpg")
#Good got it

#So we will now subrtract NIR - R and see notes in notebook for class
dvi1 <- defor1$defor1_.1 - defor1$defor1_.2
plot(dvi1)
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1, col=cl)

#now number 2
dvi2 <- defor2$defor2_.1 - defor2$defor2_.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi2, col=cl)

#Here we subtract a pixel area in both images and then we compare them on one screen
#Now name these maps

par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI before cut")
plot(dvi2, col=cl, main="DVI after cut")

#DVI before cut and after cut
#difdvi difference in DV1 - DVI2 is called DVI
dev.off()
plot(difdvi)
 difdvi <- dvi1 -dvi2
> cldif <- colorRampPalette(c('blue','white','red'))(100) 
> plot(difdvi, col=cldif)
cldif <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cldif, main="amount of energy lost!")
 
#We see a map very similar to number 2 on Virtuale, but this map shows us the amts lost of biomass for real, like a control of our value colors

#Now Powerful histogram that shows for real data
hist(difdvi, col="red")

#But here high values represent loss of biomass, or NIR-R, NIR is biomass and when this delta rises because NIR decreases in DVI since NIR-R, NIR decreases
#250-10=240 lots of energy as biomass or later 50-40=10, 

#Now all maps together, first two RGB
par(mfrow=c(3,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
plot(dvi1, col=cl, main="biomass before cut")
plot(dvi2, col=cl, main="biomass after cut")
plot(difdvi, col=cldif, main="amount of energy lost!")

#cuts titles, but GGplot does not
#very nice it works  now add histogram as well
hist(difdvi,col="red")
#great maps and comparison of all this data
#I need to know how to change file extension for use in various R libraries

















