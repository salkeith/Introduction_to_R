# SK 29/08/2014

# Macroecology & Community Ecology, University of Copenhagen
# Introduction to R exercise



#################################################

# 1. USING R AS A CALCULATOR

################################################

# add numbers
2 + 2
# multiple numbers
2 * 2
# raise a number to a power
2 ^ 2
# add two numbers and then multiply them by 2
2 * ( 2 + 2 )



#################################################

# 2. CREATE NEW OBJECTS

################################################

# create vector, assign it to an object called "d"
d <- c(1,2,3,4,5,6)
# see what "d" contains
d

# create new object which has 1 added to every element of vector d
d2 <- d + 1
d2

# join the two vectors to create a dataframe with 2 columns
cbind(d,d2)
# or as two rows
rbind(d,d2)

# join the two vectors into a single vector called d3
d3 <- c(d,d2)

# rearrange d3 to create a matrix with 3 rows and 4 columns
matrix(d3,nrow=3,ncol=4)

# create vector that is a sequence
1:15
seq(from = 1 , to = 15 , by = 1)
seq(from = 3 , to = 15 , by = 2)

# create a vector that repeats 
rep(2,8)
rep(c(2,3),8)

# generate a vector of 10 random numbers between 0 and 1
runif(10,0,1)
 




#################################################

# 3. HOW TO READ IN DATA (the easiest way)

################################################

# ensure your working directory is set to the folder you want.
# check which directory it is set to now 
getwd()   # dont worry, brackets are supposed to be empty
# change it by either by going to file menu or using.... for example
setwd("D://R folder")

# you can output almost any spreadsheet or text file as a ".csv" file.
# this is a very useful format.
# read in the example csv file "species abundance.csv" with the following function.
d <- read.csv("MacroalgaeGenusRichness.csv")
# here we have named it "d" but you can assign it any name you want

# check it read in ok by looking at the first few rows
head(d)
# see more information about the data with the function below.
# this will tell you the class of each column
str(d)




######################################

# 4. VECTOR MANIPULATION

######################################

# create vector
d <- c(1,4,8,16,32,64,128,256)

# extract elements
d[6]
d[2:4]
d[c(2,4)]
length(d) # how many elements are in the vector?
d[length(d)] # so now I can ask for the last element

# change numbers into characters
dc <- as.character(d)
dc

# reverse order of vector
rev(d)

# combine these vectors into a dataframe
d2 <- d+1
d2
d3 <- cbind(d,d2)
d3
d4 <- rbind(d,d2)
d4




######################################

# 5. DATAFRAME MANIPULATION

######################################

### most of these commands work on matrix/array too

# add row names
rownames(d4) <- c("richness","abundance")
d4

# add column names
colnames(d3) <- c("richness","abundance")
d4

# transpose dataframe (i.e., switch rows and columns)
t(d4)

# get summary stats 
summary(d4) 
summary(t(d4))

# table produces a frequency table
d6 <- c(1,2,5,8,9,6,5,2,5,8,5,2,4,7,2,2,2,2)
table(d6)

# order by a certain column (in this example, add in another column so
# its easier to see whats going on, then order the ROWS by that 3rd column)
trait <- c(1,8,4,2,0,7,4,5)
d5 <- cbind(d3,trait)
d5[order(d5[,3]),]

# extract a subset of the dataframe
subset(d5, d5[,1] >10)

# Changing data class (i.e., the format of the data)
as.matrix(d5)





