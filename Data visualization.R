# SK 29/08/2014

# Macroecology Course, University of Copenhagen
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




#################################################

# 2. UNIVARIATE DATA

################################################

load("Range size.RData")

# draw a HISTOGRAM of a single variable
hist(range.size)
# specify number of breaks
hist(range.size,breaks=20)
# add a min and max value for the x axis
hist(range.size,breaks=20,xlim=c(0,10000))
# add main title and x axis label
hist(range.size,breaks=20,xlim=c(0,10000),main="Area of occupancy",xlab="Range size")
# change the colour
hist(range.size,breaks=20,xlim=c(0,10000),main="Area of occupancy",xlab="Range size",col=3)

############################################################
####### SAVE A COPY OF THIS LAST PLOT FOR YOUR REPORT ######
############################################################

# reproduce as a DENSITY plot
# first, calculate the density
d <- density(range.size,bw="nrd")
# then plot the result
plot(d,xlim=c(0,10000),col=2,main="Density AOO",xlab="Range size")
# now get density of another variable
# (here we have just added 1000 to each value in AOO)
d2 <- density(range.size+1000,bw="nrd")
# plot lines on top of existing plot
lines(d2)



#################################################

# 3. BIVARIATE DATA

################################################

# read in the species abundance example data
# and have a look at it
sp <- read.csv("species abundance.csv")
head(sp)  # view first few rows of the dataframe
dim(sp)   # dimnesions of the datafrane (number of rows & columns)
colnames(sp)  # view column names
sp            # view full dataframe

# plot data points for one species - will plot them with x axis as the row order
plot(sp$SpeciesA)
plot(sp$SpeciesA,pch=4,col="red")
# add additional points on top of plot
points(sp$SpeciesC,pch=2,col="black")
points(sp$SpeciesD,pch=2,col="green")

# hmmm....where are SpeciesD? We know from looking at our dataframe there are more points
# check what the max value is for SpeciesD
max(sp$SpeciesD)

# ah ha! So the points are above the y axis limit. Try again, set y limits
plot(sp$SpeciesA,pch=4,col="red",ylim=c(0,80))
points(sp$SpeciesC,pch=2,col="black")
points(sp$SpeciesD,pch=2,col="green")

# add lines through the points to the plot 
lines(sp$SpeciesA,type="l",col="red")
lines(sp$SpeciesC,type="l",col="black")
lines(sp$SpeciesD,type="l",col="green")

############################################################
####### SAVE A COPY OF THIS LAST PLOT FOR YOUR REPORT ######
############################################################

# plot two species against each other - are the abundances correlated?
plot(sp$SpeciesA, sp$SpeciesB)

# draw multiple plots in the same window
windows()
par(mfcol=c(2,2))
plot(sp$SpeciesA,type="l")
plot(sp$SpeciesB,type="l")
plot(sp$SpeciesC,type="l")
plot(sp$SpeciesD,type="l")


# plot abundance at different points in time as a bar plot
barplot(sp$SpeciesA,xlab="time",ylab="abundance",main="Species A",names.arg=1:25)
# switch x axis names to vertical
barplot(sp$SpeciesA,xlab="time",ylab="abundance",main="Species A",names.arg=1:25,las=2)




#################################################

# 4. MULTIVARIATE DATA

################################################

# use on dataframe or matrix

# plot one variable as a boxplot.
# Boxplots show the median (middle line), 1st & 3rd quartiles (box), and the rest as points
boxplot(sp$Temp)
# now plot two variables side by side. Select the columns from the dataframe with [,]
boxplot(sp[,7:8])
# add a notch - it looks nicer!
boxplot(sp[,7:8],notch=TRUE)

# quicker than creating one plot then adding lines separately
# and avoids issues of x and y limits
matplot(sp[,2:5])
# difficult to see what's going on so now plot them as lines
# and add limits to the y axis
matplot(sp[,2:5],type="l",ylim=c(0,100))
# add a legend - here you are specifying where to put it,
# what each entry should be called, what line types and colours they are
legend("topleft",colnames(sp[,2:5]),lty=1:4,col=1:4)

############################################################
####### SAVE A COPY OF THIS LAST PLOT FOR YOUR REPORT ######
############################################################




