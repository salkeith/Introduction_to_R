# SK 29/08/2014

# Macroecology & Community Ecology, University of Copenhagen
# Introduction to R exercise


#################################################
################################################

# EXERCISE 1. DATA MANIPULATION

################################################
################################################



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

# 2. CREATE NEW OBJECTS & MANIPULATE VECTORS

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

# join the two vectors into a single vector called d3
d3 <- c(d,d2)

# rearrange d3 to create a matrix with 3 rows and 4 columns
matrix(d3,nrow=3,ncol=4)

# generate a vector of 10 random numbers between 0 and 1
runif(10,0,1)
 
# Extract elements
d[6]
d[2:4]
d[c(2,4)]
length(d) # how many elements are in the vector?

# reverse order of vector
rev(d)



######################################

# 3. DATAFRAME MANIPULATION

######################################

### most of these commands work on matrix/array too

d4 <- cbind(d,d2)

# add column names
colnames(d4) <- c("richness","abundance")
d4

# get summary stats 
summary(d4) 

# extract a subset of the dataframe
subset(d4, d4[,2] >5)






