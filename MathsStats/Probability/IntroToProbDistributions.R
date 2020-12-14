# Probability distributions
# Poisson distribution
# Binomial distribution
# Normal distribution

#################################################
# Probability density function
# Probability of a realisation that does not exceed a certain value.


#################################################
# Discrete Random Variables
# pbinom(k ,n,p)

# Given a sample size of 10. where the probability of success is 0.3
# Compute the probability of exactly five successes

dbinom (4,size=10, prob =0.3)

#################################################
# Poisson Distribution
#  - Poisson Mean : lambda
#  - Expected number of occurences per unit period

#################################################

# Continuous Random Variables
# - Exponential Distribution
# - Uniform Distribution
# - Standard Normal (Z) Distribution
# - Normal Distribution

#################################################
# Random Number Generation 
rnorm (n=10)




################################################
#Complements for discrete and continuous RVs
pnorm(1.5)
pnorm(1.5,lower=FALSE)

pbinom(0:5,size=5,prob=0.2)
1-pbinom(0:5,size=5,prob=0.2)

dbinom(0:5,size=5,prob=0.2)

pbinom(0:5,size=5,prob=0.2)

pbinom(0:5,size=5,prob=0.2,lower=FALSE)
