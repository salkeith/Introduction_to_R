# SK 29/08/2014

# Macroecology & Community Ecology, University of Copenhagen
# Introduction to R exercise


#################################################
################################################

# EXERCISE 2. DATA VISUALIZATION

################################################
################################################



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
hist(gr,breaks=20,xlim=c(0,500),main="Macroalgae Richness",xlab="Genus richness",col="dark green")




#################################################

# 3. BIVARIATE DATA

################################################

# plot data points by latitude and longitude
plot(mgr$Long,mgr$Lat)  
# think about what this plot looks like...



############################################################
#######               FOR YOUR REPORT 1               ######
#######                    START                      ######
############################################################

# How does genus richness vary with latitude?
colnames(mgr)  # this will tell you what the columns are called
# Does it fit the classic latitudinal gradient pattern?

## COPY AND PASTE THIS PLOT INTO YOUR REPORT AND DESCRIBE

############################################################
#######               FOR YOUR REPORT 1               ######
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




############################################################
#######               FOR YOUR REPORT 2               ######
#######                    START                      ######
############################################################

## PLOT SOME SCATTERPLOTS OF OTHER VARIABLE COMBINATIONS IN THE DATASET
## build up a nice plot by inserting extra arguments as we did above.
## Many of the arguments in hist can also be used for plot.

colnames(mgr)  # this will tell you what the columns are called

## COPY AND PASTE INTERESTING SCATTERPLOTS INTO YOUR REPORT
## AND DISCUSS THEM

############################################################
#######               FOR YOUR REPORT 2               ######
#######                     END                       ######
############################################################





