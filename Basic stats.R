# SK 05/09/2014

#####################################

# R USER GROUP - BASIC STATS

#####################################

# FOR HELP: 
# Getting started with R: An Introduction for Biologists
# http://www.statmethods.net/stats/index.html



#####################################

# 1. READ IN THE EXAMPLE DATA

#####################################

# These data tell you the genus richness of macroalgae (seaweed!) and 
# the value of some environmental variables at 354 sites.
# The extent of the dataset is global.
# These data were used for Keith et al. 2014. Global Ecology & Biogeography 23:517-529.
# and are free to download on Figshare ()

ma.rich <- read.csv("MacroalgaeGenusRichness.csv")
ma.rich
# there is too much to see in one go!

# Just look at the top few rows so you can see what is in the columns
head(ma.rich)
nrow(ma.rich) # how many rows are in the dataframe?

# plot the points by longitude and latitude
# can you kind of see the outlines of some land masses?
plot(ma.rich$Lat,ma.rich$Long)

# To decide which statistics to use, we need to know if the richness normally distributed?
# Have a look at the data by plotting a histogram
hist(ma.rich$GenusRich)
# This shows us we have lots of sites with low richness and few with high richness

# So a square root transformation will help....
sqrt.rich <- sqrt(ma.rich$GenusRich)
hist(sqrt.rich)
# much better!
# a column already exists in the dataframe with square root of genus





#####################################

# 2. CORRELATION BETWEEN 2 VARIABLES

#####################################


# Correlation - two variables
# Is minimum sea surface temperature (SST) correlated with maximum SST?
cor.test(ma.rich$SST.MIN, ma.rich$SST.MAX, method="pearson")
# can you see the correlation if you plot these data?
plot(ma.rich$SST.MIN, ma.rich$SST.MAX)


############################################################
####### RECORD THE RESULT OF THIS TEST IN YOUR REPORT ######
############################################################


# Get a correlation matrix i.e. correlations of multiple variables
cor(ma.rich, method="spearman")
# produce one window with scatterplots of all columns against all other columns
pairs(ma.rich)
# you can see some clear correlations here! 
# Which variables are they? Do they make sense?




#####################################

# 3. LINEAR REGRESSION

#####################################


# linear regression
fit <- lm ( sqrtGenusRich ~ SST.MEAN , data = ma.rich )
summary(fit)
# the plot command below on an 'lm' object will give you lots of 
# diagnostic plots (for help: http://www.statmethods.net/stats/rdiagnostics.html)
par(mfcol=c(2,2))  # this sets up the window so you can create 4 plots in 1 window
plot(fit)


# multiple regressions include more than one predictor variable
# Does it improve the model if we also include phosphate?
fit2 <- lm ( sqrtGenusRich ~ SST.MEAN + PHOS, data = ma.rich )
summary(fit2)
plot(fit2)


############################################################
###### RECORD THE RESULTS OF THIS TEST IN YOUR REPORT ######
#### include adjusted-R2, p value, coefficient estimate ####
############################################################




