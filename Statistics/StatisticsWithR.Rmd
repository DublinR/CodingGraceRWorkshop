# Statistical functions with R 
# - Summary statistics
# - Graphical procedures
# - Inference procedures
# - Other functions
#################################################################

x <- c(4,2,6,2,6,1,7,14,12,8,3)

#################################################################

# Simple statistical functions
#
# measures of centrality
# - mean(),median()

mean(x)
median(x)

#################################################################

# Measures of variability
# - commands sd(), mad(), IQR()
# - range() returns a vector containing the minimum and maximum of all the given arguments. 
# - IQR() computes interquartile range of the x values.
# - quantiles

# -var, cov and cor compute the variance of x and the covariance or correlation of x and y if these are vectors. If x and y are matrices then the covariances (or correlations) between the columns of x and the columns of y are computed.
# -cov2cor scales a covariance matrix into the corresponding correlation matrix efficiently. 

#################################################################
# Pearson's Chi-squared Test for Count Data
# chisq.test performs chi-squared contingency table tests and goodness-of-fit tests.

#################################################################
# boxplots

boxplot(x)
boxplot(x,horizontal=TRUE)
#################################################################


# Special mathematical functions related to the beta and gamma functions.
# Usage
a<-3
b<-4
beta(a, b)
lbeta(a, b)


#################################################################
x<-4
gamma(x)
lgamma(x)
psigamma(x, deriv = 0)
digamma(x)
trigamma(x)
#################################################################

n<-5
k<-2
choose(n, k)
lchoose(n, k)
factorial(x)
lfactorial(x)


 
