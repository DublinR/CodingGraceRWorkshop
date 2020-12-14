

```R
Section 4. Probability distributions
A probability distribution describes how the values of a random variable is distributed. For example, the collection of all possible outcomes of a sequence of coin tossing is known to follow the binomial distribution. Whereas the means of sufficiently large samples of a data population are known to resemble the normal distribution. Since the characteristics of these theoretical distributions are well understood, they can be used to make statistical inferences on the entire data population as a whole.

We looking at how to generate random numbers, we previous encountered the uniform and normal distribution. There are a large number of probability distributions available, but we only look at a few. 

•	The Normal Distribution
•	The t Distribution
•	The Binomial Distribution
•	The Chi-Squared Distribution

If you would like to know what distributions are available you can do a search using the command help.search("distribution").
Here we give details about the commands associated with the normal distribution and briefly mention the commands for other distributions. The functions for different distributions are very similar where the differences are noted below.



4.1 The Normal Distribution

There are four functions that can be used to generate the values associated with the normal distribution. You can get a full list of them and their options using the help command:

> help(Normal)
The first function we look at it dnorm. Given a set of values it returns the height of the probability distribution at each point. If you only give the points it assumes you want to use a mean of zero and standard deviation of one. 

There are options to use different values for the mean and standard deviation, though:

> dnorm(0)
[1] 0.3989423
> dnorm(0)*sqrt(2*pi)
[1] 1
> dnorm(0,mean=4)    
[1] 0.0001338302
> dnorm(0,mean=4,sd=10)
[1] 0.03682701
>v <- c(0,1,2)
> dnorm(v)
[1] 0.39894228 0.24197072 0.05399097
> x <- seq(-20,20,by=.1)
> y <- dnorm(x) 
> plot(x,y)
> y <- dnorm(x,mean=2.5,sd=0.1) 
> plot(x,y)

The second function we examine is pnorm. Given a number or a list it computes the probability that a normally distributed random number will be less than that number. 

This function also goes by the rather ominous title of the "Cumulative Distribution Function." It accepts the same options as dnorm:

> pnorm(0)
[1] 0.5
> pnorm(1)
[1] 0.8413447
> pnorm(0,mean=2)
[1] 0.02275013
> pnorm(0,mean=2,sd=3)
[1] 0.2524925
> v <- c(0,1,2)         
> pnorm(v)
[1] 0.5000000 0.8413447 0.9772499
> x <- seq(-20,20,by=.1)
> y <- pnorm(x) 
> plot(x,y)
> y <- pnorm(x,mean=3,sd=4) 
> plot(x,y)

```


```R



The next function we look at is qnorm which is the inverse of pnorm. The idea behind qnorm is that you give it a probability, and it returns the number whose cumulative distribution matches the probability. 

For example, if you have a normally distributed random variable with mean zero and standard deviation one, then if you give the function a probability it returns the associated Z-value:

> qnorm(0.5)
[1] 0
> qnorm(0.5,mean=1)
[1] 1
> qnorm(0.5,mean=1,sd=2)
[1] 1
> qnorm(0.5,mean=2,sd=2)
[1] 2
> qnorm(0.5,mean=2,sd=4)
[1] 2
> qnorm(0.25,mean=2,sd=2)
[1] 0.6510205
> qnorm(0.333)
[1] -0.4316442
> qnorm(0.333,sd=3)
[1] -1.294933
> qnorm(0.75,mean=5,sd=2)
[1] 6.34898
> v = c(0.1,0.3,0.75)
> qnorm(v)
[1] -1.2815516 -0.5244005  0.6744898
> x <- seq(0,1,by=.05)
> y <- qnorm(x)
> plot(x,y)
> y <- qnorm(x,mean=3,sd=2)
> plot(x,y)
> y <- qnorm(x,mean=3,sd=0.1)
> plot(x,y)




The last function we examine is the rnorm function which can generate random numbers whose distribution is normal. The argument that you give it is the number of random numbers that you want, and it has optional arguments to specify the mean and standard deviation:

> rnorm(4)
[1]  1.2387271 -0.2323259 -1.2003081 -1.6718483
> rnorm(4,mean=3)
[1] 2.633080 3.617486 2.038861 2.601933
> rnorm(4,mean=3,sd=3)
[1] 4.580556 2.974903 4.756097 6.395894
> rnorm(4,mean=3,sd=3)
[1]  3.000852  3.714180 10.032021  3.295667
> y <- rnorm(200)
> hist(y)
> y <- rnorm(200,mean=-2)
> hist(y)
> y <- rnorm(200,mean=-2,sd=4)
> hist(y)
> qqnorm(y)
> qqline(y)

Section 4.2 The t Distribution

There are four functions that can be used to generate the values associated with the t distribution. You can get a full list of them and their options using the help command:

> help(TDist)

These commands work just like the commands for the normal distribution. One difference is that the commands assume that the values are normalized to mean zero and standard deviation one, so you have to use a little algebra to use these functions in practice. The other difference is that you have to specify the number of degrees of freedom. The commands follow the same kind of naming convention, and the names of the commands are dt, pt, qt, and rt.

A few examples are given below to show how to use the different commands. First we have the distribution function, dt:

> x <- seq(-20,20,by=.5)
> y <- dt(x,df=10)
> plot(x,y)

Next we have the cumulative probability distribution function:

> pt(-3,df=10)
[1] 0.006671828
> pt(3,df=10)
[1] 0.9933282
> 1-pt(3,df=10)
[1] 0.006671828
> pt(3,df=20)
[1] 0.996462
> x = c(-3,-4,-2,-1)
> pt((mean(x)-2)/sd(x),df=20)
[1] 0.001165548
> pt((mean(x)-2)/sd(x),df=40)
[1] 0.000603064

Next we have the inverse cumulative probability distribution function:

> qt(0.05,df=10)
[1] -1.812461
> qt(0.95,df=10)
[1] 1.812461
> qt(0.05,df=20)
[1] -1.724718
> qt(0.95,df=20)
[1] 1.724718
>
> v <- c(0.005,.025,.05)
> qt(v,df=25)
[1] -2.787436 -2.059539 -1.708141

Finally random numbers can be generated according to the t distribution:

> rt(3,df=10)
[1] 0.9440930 2.1734365 0.6785262
> rt(3,df=20)
[1]  0.1043300 -1.4682198  0.0715013
> rt(3,df=20)
[1]  0.8023832 -0.4759780 -1.0546125





```
