

```R
Section 4.3 The Binomial Distribution

There are four functions that can be used to generate the values associated with the binomial distribution. You can get a full list of them and their options using the help command:

> help(Binomial)

These commands work just like the commands for the normal distribution. The binomial distribution requires two extra parameters, the number of trials and the probability of success for a single trial. The commands follow the same kind of naming convention, and the names of the commands are dbinom, pbinom, qbinom, and rbinom.

A few examples are given below to show how to use the different commands. First we have the distribution function, dbinom:

> x <- seq(0,50,by=1)
> y <- dbinom(x,50,0.2)
> plot(x,y)
> y <- dbinom(x,50,0.6)
> plot(x,y)
> x <- seq(0,100,by=1)
> y <- dbinom(x,100,0.6)
> plot(x,y)
Next we have the cumulative probability distribution function:

> pbinom(24,50,0.5)
[1] 0.4438624
> pbinom(25,50,0.5)
[1] 0.5561376
> pbinom(25,51,0.5)
[1] 0.5
> pbinom(26,51,0.5)
[1] 0.610116
> pbinom(25,50,0.5)
[1] 0.5561376
> pbinom(25,50,0.25)
[1] 0.999962
> pbinom(25,500,0.25)
[1] 4.955658e-33
Next we have the inverse cumulative probability distribution function:

> qbinom(0.5,51,1/2)
[1] 25
> qbinom(0.25,51,1/2)
[1] 23
> pbinom(23,51,1/2)
[1] 0.2879247
> pbinom(22,51,1/2)
[1] 0.200531

Finally random numbers can be generated according to the binomial distribution:

> rbinom(5,100,.2) 
[1] 30 23 21 19 18
> rbinom(5,100,.7)
[1] 66 66 58 68 63
> 
```


```R
\textbf{Binomial Example: Sample Problem}

Suppose there are twelve multiple choice questions in an English class quiz. Each question has five possible answers, and only one of them is correct. Find the probability of having four or less correct answers if a student attempts to answer every question at random.\\

\textbf{Solution:}
Since only one out of five possible answers is correct, the probability of answering a question correctly by random is $1/5=0.2$. We can find the probability of having exactly 4 correct answers by random attempts as follows.(Blackboard. Correct Answer is 13.29\%)

```


```R
dbinom(4, size=12, prob=0.2)

```
