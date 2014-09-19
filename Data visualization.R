# SK 29/08/2014

# Macroecology & Community Ecology, University of Copenhagen
# Introduction to R exercise



#################################################

# 1. DATA VISUALIZATION EXAMPLES

################################################

# FOR HELP: http://www.statmethods.net/graphs/index.html
# R Graphics gallery: http://addictedtor.free.fr/graphiques/

# the command below will produce a few example plots so you
# can see what R is capable of.
# (notice on the command screen you need to press Enter to move to the next plot)
demo(graphics)

rm(list=ls())
par(mfcol=c(1,1))




#################################################

# 2. UNIVARIATE DATA

################################################

# Read in the example dataset: MacroalgaeGenusRichness.csv.
# These data tell you the genus richness of macroalgae (seaweed!) and 
# the value of some environmental variables at 354 sites.
# The extent of the dataset is global.
# These data were used for Keith et al. 2014. Global Ecology & Biogeography 23:517-529.
# and are free to download on Figshare ()
mgr <- read.csv("MacroalgaeGenusRichness.csv")
# We have created an object called "mgr" that holds the data

# have a look at the first few rows so you know what the dataset looks like
head(mgr)
# there are many more rows than you see here, type the next command to see how many
nrow(mgr) 

# for now, we will just focus on genus richness column
# We can create a vector with these data only
gr <- mgr$GenusRich

# view the first 20 elements (species)
head(gr,20)
# how many species ranges are included in this object?
length(gr)


# draw a HISTOGRAM of a single variable
hist(gr)
# specify number of breaks
hist(gr,breaks=20)
# add a min and max value for the x axis
hist(gr,breaks=20,xlim=c(0,500))
# add main title and x axis label
hist(gr,breaks=20,xlim=c(0,500),main="Macroalgae Richness",xlab="Genus richness")
# change the colour
hist(gr,breaks=20,xlim=c(0,500),main="Macroalgae Richness",xlab="Genus richness",col=3)


# Reproduce as a DENSITY plot
# This gives you a smoothed line

# First, calculate the density
d <- density(gr,bw="nrd")
# then plot the result
plot(d,xlim=c(0,600),col=2,main="Density Genus Richness",xlab="Genus richness")
# now get density of another variable
# (here we have just added 1000 to each value in AOO)
d2 <- density(gr+100,bw="nrd")
# plot lines on top of existing plot
lines(d2)

# BOXPLOTS
# plot one variable as a boxplot.
# Boxplots show the median (middle line), 1st & 3rd quartiles (box)
boxplot(mgr$SST.MEAN)
# now plot three variables side by side. Select the columns from the dataframe with [row,column]
boxplot(mgr[,9:11])
# add a notch - it looks nicer!
boxplot(mgr[,9:11],notch=TRUE)


############################################################
#######               FOR YOUR REPORT 1               ######
#######                    START                      ######
############################################################

## TRY PLOTTING SOME HISTORGRAMS OF OTHER VARIABLES IN THE DATASET
## You can use the "hist" function below - remove the hashtag and replace the dots with a column name
## build up a nice plot by inserting extra arguments as we did above.

colnames(mgr)  # this will tell you what the columns are called

# hist(mgr$....)

## COPY AND PASTE AN EXAMPLE HISTOGRAM INTO YOUR REPORT
## DISCUSS WHAT IT SHOWS

############################################################
#######               FOR YOUR REPORT 1               ######
#######                     END                       ######
############################################################





#################################################

# 3. BIVARIATE DATA

################################################

# plot data points by latitude and longitude
plot(mgr$Long,mgr$Lat)  
# think about what this plot looks like...



############################################################
#######               FOR YOUR REPORT 2               ######
#######                    START                      ######
############################################################

# How does genus richness vary with latitude?
colnames(mgr)  # this will tell you what the columns are called
# Does it fit the classic latitudinal gradient pattern?

## COPY AND PASTE THIS PLOT INTO YOUR REPORT AND DESCRIBE

############################################################
#######               FOR YOUR REPORT 2               ######
#######                     END                       ######
############################################################



# produce some scatterplots of the relationship between
# (a) genus richness and one environmental variable
# (b) between two environmental variables

colnames(mgr)

# Here's an example for (a)
plot(mgr$GenusRich,mgr$SST.MEAN,pch=4,col="red")
# you can replace "SST.MEAN" with the name of an alternative column 
# to plot a different variable against richness

# Here's an example for (b)
plot(mgr$SST.MAX,mgr$SST.MIN,pch=1,col="blue")
# you can replace "SST.MAX" and/or "SST.MIN" with the name of an alternative column 
# to plot a different variable against richness

# Have a look at how the environmental variables in this dataset are related to each other

# Plot multiple panels in the same window
# The following code will set up a 2 x 2 plot
par(mfcol=c(2,2))
plot(mgr$SST.MAX,mgr$SST.MIN,pch=1,col="blue")
plot(mgr$SST.MAX,mgr$SST.MEAN,pch=1,col="black")
plot(mgr$SST.MAX,mgr$PAR,pch=1,col="red")
plot(mgr$SST.MAX,mgr$SALINITY,pch=1,col="dark green")



############################################################
#######               FOR YOUR REPORT 3               ######
#######                    START                      ######
############################################################

## PLOT SOME SCATTERPLOTS OF OTHER VARIABLE COMBINATIONS IN THE DATASET
## build up a nice plot by inserting extra arguments as we did above.
## Many of the arguments in hist can also be used for plot.

colnames(mgr)  # this will tell you what the columns are called

## COPY AND PASTE INTERESTING SCATTERPLOTS INTO YOUR REPORT
## AND DISCUSS THEM

############################################################
#######               FOR YOUR REPORT 3               ######
#######                     END                       ######
############################################################





