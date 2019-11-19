# Store the values in a simple vector
w <- faithful$waiting
ggplot(NULL, aes(x=w)) + geom_density()

## A kernel density curve is an estimate of the population distribution, based on the sample
## data. The amount of smoothing depends on the kernel bandwidth: the larger the band‐
## width, the more smoothing there is. The bandwidth can be set with the adjust parameter, which 
## has a default value of 1.

ggplot(faithful, aes(x=waiting)) +
 geom_line(stat="density", adjust=.25, colour="red") +
 geom_line(stat="density") +
 geom_line(stat="density", adjust=2, colour="blue")
##################################################

ggplot(faithful, aes(x=waiting)) +
 geom_density(fill="blue", alpha=.2) +
 xlim(35, 105)

# This draws a blue polygon with geom_density(), then adds a line on top

ggplot(faithful, aes(x=waiting)) +
 geom_density(fill="blue", colour=NA, alpha=.2) +
 geom_line(stat="density") +
 xlim(35, 105)



ggplot(faithful, aes(x=waiting, y=..density..)) +
 geom_histogram(fill="cornsilk", colour="grey60", size=.2) +
 geom_density() +
 xlim(35, 105)

## Page 125
library(MASS) # For the data set
# Make a copy of the data
birthwt1 <- birthwt
# Convert smoke to a factor
birthwt1$smoke <- factor(birthwt1$smoke)
# Map smoke to colour


ggplot(birthwt1, aes(x=bwt, colour=smoke)) + geom_density()
# Map smoke to fill and make the fill semitransparent by setting alpha
ggplot(birthwt1, aes(x=bwt, fill=smoke)) + geom_density(alpha=.3)
