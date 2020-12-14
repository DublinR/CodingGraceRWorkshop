# Extreme Values in R

# Functions for extreme value theory, which may be divided into the following groups; 
# exploratory data analysis, block maxima, peaks over thresholds (univariate and bivariate), 
# point processes, gev/gpd distributions.

#############################################################################################


# Load up libraries to be used in analysis
library(evir)
library(evd)
library(MASS)
# Load up data
clms <- read.csv("C:\\R\\sanders.csv")
clms <- clms[,1] # Want data in vector form
# Plot histogram
truehist(clms, nbins=20, main="Histogram of Large Claims Data")
