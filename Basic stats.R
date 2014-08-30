# SK 03/04/2012

#####################################

# R USER GROUP - BASIC STATS

#####################################

# FOR HELP: http://www.statmethods.net/stats/index.html



#####################################

# read in data
sp <- read.csv("species abundance.csv")
sp



# T-test (paired)
t.test(sp[,1], sp[,5], paired=T)
t.test(sp[,1], sp[,3], paired=T)

# non-parametric version i.e. wilcoxon test
wilcox.test(sp[,1], sp[,5], paired=T)

# Kruskal-wallis test
# requires a grouping vector
group <- rep(c(1,2,3,4,5),5)
kruskal.test(sp$SpeciesD,group)

# Chi-squared test - needs to be in contingency table format
pa <- c(1,0,0,1,1,0,0,0,0,0,1,1,0,1,0,0,1,0,0,1,0,0,0,0,1,0,0,1)
pres.abs <- table(pa)
# test: are the proportions equal? check help so you always know
# you are getting the p value the right way around
chisq.test(pres.abs, correct=T)


#######################
# REGRESSION

# Correlation - two variables
cor.test(sp[,1], sp[,4], method="pearson")

############################################################
####### REPORT THE RESULT OF THIS TEST IN YOUR REPORT ######
############################################################

# Get a correlation matrix i.e. correlations of multiple variables
cor(sp, method="spearman")

# linear regression
fit <- lm(SpeciesC ~ Temp, data=sp)
summary(fit)
# the plot command below on an 'lm' object will give you lots of 
# diagnostic plots (for help: http://www.statmethods.net/stats/rdiagnostics.html)
plot(fit)

############################################################
####### REPORT THE RESULTS OF THIS TEST IN YOUR REPORT #####
############################################################

# multiple regression
fit2 <- lm(SpeciesC ~ Temp + Rainfall, data=sp)
summary(fit2)
plot(fit2)

# logistic regression
fitlogi <- glm(present ~ Temp + Rainfall, family = binomial(), data=sp)
summary(fitlogi)

# Lots of other possibilities with function 'glm'
# e.g., with different family types



#######################
# MULTIVARIATE

wood <- read.csv('woodland matrix.csv')
# check
wood[1:10,1:10]
# assign species names to row names rather than having them as a column
# this prevents them being treated as 'data'
rownames(wood) <- wood[,1]
wood <- wood[,-1]
wood[1:10,1:10]

# Non-Metric Multidimensional Scaling (NMMDS)
library(vegan)
# make sure the rows and columns are the right way around
woodt <- t(wood)
mds <- metaMDS(woodt, trymax=20)
plot(mds,display="sites")
