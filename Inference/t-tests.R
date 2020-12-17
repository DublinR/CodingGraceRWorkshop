# R code to demonstrate implementation of various t-test procedure
# 1) One sample t-test
# 2) Two Indepedent sample t-test (equal variance assumed)
# 3) Two Independent sample t-test (equal variance not assumed)
# 4) Test for equality of variance for two samples
# 5) Paired t-test procedure
################################################

# Part 1:  One-sample t-test

X <- c(100,100,102,104,105,109,110,110)

t.test(X,mu=100, conf.level = 0.99)

################################################

# Testing Equality of Variance

Y <- c(120,112,103,114,111,107,113,99)
var.test(X,Y)

################################################
