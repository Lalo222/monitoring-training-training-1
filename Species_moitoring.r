#Today January 22, 2020  Last Class Species Monitoring

#data is in the file already today when we load

library(sdm)
#I had to load, wasn't there yet     # if any errors come out: install.packages("sdm")
library(raster)
library(rgdal)
file <- system.file("external/species.shp", package="sdm") 
species <- shapefile(file)
#all ok, no message so far just prompt line
#now
species
plot(species)

#see all crosses, we can change shape

plot(species, pch=17)

#Now we can show occurence and absence

species$Occurence  #this is cool and shows presence and absence and plot this in colors, 0,1
species$Occurrence
  [1] 1 0 1 1 1 0 0 1 1 1 1 1 1 0 1 1 0 1 1 0 0 1 0 1 1 0 1 0 1 0 1 0 1 1 1 1 0
 [38] 1 0 0 0 0 0 0 0 1 0 0 1 0 1 0 0 0 0 0 1 1 1 1 0 0 1 0 1 0 1 1 1 1 0 0 0 0
 [75] 0 1 0 0 1 0 1 0 1 1 1 0 0 1 1 0 0 1 1 1 1 0 0 0 0 0 0 0 1 1 1 0 0 1 1 0 0
[112] 0 1 0 0 1 1 1 1 1 0 0 0 1 1 0 0 1 1 1 1 1 0 0 0 1 0 0 1 1 0 1 0 1 0 0 1 1
[149] 0 0 1 0 0 1 1 0 0 0 0 1 1 1 0 0 0 0 1 0 0 1 0 1 0 0 0 0 1 0 1 0 1 0 1 0 0
[186] 0 0 1 1 0 1 0 1 1 0 1 0 0 0 0

#[] quantity of points  now we can look at just occurrence=1 presence
plot(species[species$Occurrence == 1,], col='blue', pch=17)
#worked fine
#Now we need to add points that were 0 and make red and add these in, occurrence with 0, or absence
#In reality the red and blue should add up to the same space as total, above as number of entries per point, saying yes or no present
points(species[species$Occurrence == 0,], col='red', pch=17
#worked well

#Now we are going to predictive function based on above data
#Need external path for data and pattern, meaning the rule to see the file, all files with asc extension, types, they are matrix extension, temp.asc
#can even be png, jpg files 

path <- system.file("external", package="sdm")
# list the predictors
lst <- list.files(path=path,pattern='asc$',full.names = T)
lst
#[1] "C:/Users/123fatto/Documents/R/win-library/4.0/sdm/external/elevation.asc"    
#[2] "C:/Users/123fatto/Documents/R/win-library/4.0/sdm/external/precipitation.asc"
#[3] "C:/Users/123fatto/Documents/R/win-library/4.0/sdm/external/temperature.asc"  
#[4] "C:/Users/123fatto/Documents/R/win-library/4.0/sdm/external/vegetation.asc"

#These are the predictors, Elevation, precip., temp., vege.  we will put in stack to save time, because listed in same pixel per page layer
preds <- stack(lst)    #we are stacking the predictors

#Now we can do it with color to make it more clear
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)
#Now we will use these parameters above as correlated with the true data of 0,1 to find a pattern of occurrence based on these indicators, t,a,p,v
    
plot(preds$elevation, col=cl)
points(species[species$Occurrence == 1,], col='blue', pch=17)

plot(preds$elevation, col=cl, main='elevation')
points(species[species$Occurrence == 1,], pch=17)
plot(species[species$Occurrence == 1,], col='blue', pch=17)
points(species[species$Occurrence == 0,], col='red', pch=17

#Nice we see the location of species based on these idicators,  #so not predictive but indicative from real data
#so we see that it enjoys high elevation and temp and precipitation etc. 
#do for vegetation, biomass and see it loves high biomass
plot(preds$vegetation, col=cl, main='vegetation')
points(species[species$Occurrence == 1,], pch=17)  #mine 71-77
points(species[species$Occurrence == 1,], pch=17)
plot(preds$elevation, col=cl, main='elevation')
 points(species[species$Occurrence == 1,], pch=17)
plot(preds$temperature, col=cl, main='temperature')
points(species[species$Occurrence == 1,], pch=17)
plot(preds$precipitation, col=cl, main='precipitation')
 points(species[species$Occurrence == 1,], pch=17)
 
 #problem with route, cannot find data, will work on it later if we don't find it
 #we will procede to predict
 datasdm <- sdmData(train=species, predictors=preds)
datasdm

 

# model
m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=datasdm, methods = "glm")

 # make the raster output layer
p1 <- predict(m1, newdata=preds)
plot(p1, col=cl)

#Worked fine after RECALL LIBRARY that was the problem.....see my screen info below
datasdm <- sdmData(train=species, predictors=preds)
Error in sdmData(train = species, predictors = preds) : 
  could not find function "sdmData"
> library(sdm)
sdm 1.0-89 (2020-04-22)
> datasdm <- sdmData(train=species, predictors=preds)
Loading required package: mgcv

#Now we can try to extrapolate a mathematical pattern

 #blue expects no presence, we see points falling in red and yellow and see parameters denoted by these colors


m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=datasdm, methods = "glm")
Loading required package: parallel
p1 <- predict(m1, newdata=preds)
 plot(p1, col=cl)
points(species[species$Occurrence == 1,], pch=17)

s1 <- stack(preds,p1)
plot(s1, col=cl)
#Here we see a color scale from blue to yellow for each variable and how a population might like it, respond to it.
#Here we have a prediction for a species in blue and high in yellow colors, so where we find red and yellow, high probability to
#find these guys.  It clearly responds negatively to elevation...maybe a frog!!! cute
