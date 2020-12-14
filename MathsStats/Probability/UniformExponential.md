

```R
options(digits=4)
library(magrittr)

```


```R
###The Uniform Distribution

In the last class, we had a look at the continuous uniform distribution. It is very useful in constructing simulations. Briefly we will look at some relevant \texttt{R} function.
The distribution has two parameters: i.e \texttt{min} and \texttt{max}. (Here chosen as 5 and 10 respectively)




```


    Error in parse(text = x, srcfile = src): <text>:3:4: unexpected symbol
    2: 
    3: In the
          ^
    Traceback:




```R
# Generate Four Random Number
runif(4, min=5,max=10)




```


<ol class="list-inline">
	<li>5.42456695926376</li>
	<li>9.17427441338077</li>
	<li>9.62588066933677</li>
	<li>5.32787869917229</li>
</ol>




```R
# Compute Density
print (dunif(4:11,min=5,max=10) )


#Compute distribution of
print (punif(4:11,min=5,max=10))
```

    [1] 0.0 0.2 0.2 0.2 0.2 0.2 0.2 0.0
    [1] 0.0 0.0 0.2 0.4 0.6 0.8 1.0 1.0


### Exponential Distribution: Cumulative density function

The cumulative distribution function (CDF) of an exponential distribution is

$$
F(x;\lambda) = \begin{cases}
1-e^{-\lambda x}, &amp; x \ge 0, \\
0, &amp; x &lt; 0.
\end{cases}$$

The CDF can be written as the probability of the lifetime being less than some value $x$.

$$ P(X \leq x) = 1-e^{-\lambda x} $$




### Exponential Distribution: Expected Value and Variance

The expected value of an exponential random variable $X$ is:

                  
$$ E[X] = \frac{1}{\lambda}$$
The variance of an exponential random variable $X$ is:

$$ V[X] = \frac{1}{\lambda^2}$$

###Exponential Distribution: Example

Assume that the length of a phone call in minutes is an exponential random variable $X$ with parameter
$\lambda = 1/10$. If someone arrives at a phone booth just before you arrive, find the probability that you
will have to wait 


\begin{itemize}
\item[(a)] less than 5 minutes,
\item[(b)] between 5 and 10 minutes.
\end{itemize}
Use the ``R`` code on the following slide to help answer these questions.





```R
###Exponential Distribution: Example}

dexp(0:10,rate=0.10)



```


<ol class="list-inline">
	<li>0.1</li>
	<li>0.0904837418035959</li>
	<li>0.0818730753077982</li>
	<li>0.0740818220681718</li>
	<li>0.0670320046035639</li>
	<li>0.0606530659712633</li>
	<li>0.0548811636094026</li>
	<li>0.049658530379141</li>
	<li>0.0449328964117222</li>
	<li>0.0406569659740599</li>
	<li>0.0367879441171442</li>
</ol>




```R
pexp(0:10,rate=0.10) %>% round(4)
```


<ol class="list-inline">
	<li>0</li>
	<li>0.0952</li>
	<li>0.1813</li>
	<li>0.2592</li>
	<li>0.3297</li>
	<li>0.3935</li>
	<li>0.4512</li>
	<li>0.5034</li>
	<li>0.5507</li>
	<li>0.5934</li>
	<li>0.6321</li>
</ol>




```R
### Exponential Distribution: Example

As it is CDF values that we are interested in, we use the output from the ``pexp()`` commands.


[(a)] $P(X \leq 5)$ = 0.39346934
[(b)] $P(5 \leq X \leq 10)$ \\ = $P( X \leq 10) - P( X \leq 5)$ \\ = 0.63212056- 0.39346934 \\ = 0.2386512 \\= 23.84 $\$

```


    Error in parse(text = x, srcfile = src): <text>:3:4: unexpected symbol
    2: 
    3: As it
          ^
    Traceback:




```R
\subsection{Exponential Distribution: Example}
\begin{verbatim}
> dexp(0:10,rate=0.10)
 [1] 0.10000000 0.09048374 0.08187308 0.07408182 0.06703200 0.06065307
 [7] 0.05488116 0.04965853 0.04493290 0.04065697 0.03678794
>
> pexp(0:10,rate=0.10)
 [1] 0.00000000 0.09516258 0.18126925 0.25918178 0.32967995 0.39346934
 [7] 0.45118836 0.50341470 0.55067104 0.59343034 0.63212056
\end{verbatim}
```


    Error in parse(text = x, srcfile = src): <text>:1:1: unexpected input
    1: \
        ^
    Traceback:




```R

\subsection{Exponential Distribution: Example}

As it is CDF values that we are interested in, we use the output from the \texttt{pexp()} commands.

\begin{itemize}
\item[(a)] $P(X \leq 5)$ = 0.39346934
\item[(b)] $P(5 \leq X \leq 10)$ \\ = $P( X \leq 10) - P( X \leq 5)$ \\ = 0.63212056- 0.39346934 \\ = 0.2386512 \\= 23.84 $\$
\end{itemize}



```


### Exponential Distribution: Example
Assume that the length of a phone call in minutes is an exponential random variable $X$ with parameter
$\lambda = 1/10$. If someone arrives at a phone booth just before you arrive, find the probability that you
will have to wait 

* [(a)] less than 5 minutes,
* [(b)] between 5 and 10 minutes.





### Exponential Distribution: Example




```R
dexp(0:10,rate=0.10)
```


<ol class="list-inline">
	<li>0.1</li>
	<li>0.0904837418035959</li>
	<li>0.0818730753077982</li>
	<li>0.0740818220681718</li>
	<li>0.0670320046035639</li>
	<li>0.0606530659712633</li>
	<li>0.0548811636094026</li>
	<li>0.049658530379141</li>
	<li>0.0449328964117222</li>
	<li>0.0406569659740599</li>
	<li>0.0367879441171442</li>
</ol>




```R
pexp(0:10,rate=0.10)
```


<ol class="list-inline">
	<li>0</li>
	<li>0.0951625819640404</li>
	<li>0.181269246922018</li>
	<li>0.259181779318282</li>
	<li>0.329679953964361</li>
	<li>0.393469340287367</li>
	<li>0.451188363905974</li>
	<li>0.50341469620859</li>
	<li>0.550671035882778</li>
	<li>0.593430340259401</li>
	<li>0.632120558828558</li>
</ol>




### Exponential Distribution: Example

* [(a)] $P(X \leq 5)$ = 0.39346934
* [(b)] $P(5 \leq X \leq 10)$ \\ = $P( X \leq 10) - P( X \leq 5)$ \\ = 0.6321- 0.3934 \\ = 0.2386 \\= 23.86 $\$

#### Alternative approach for part (b)
$$ P(5 \leq X \leq 10)  = P( X \geq 5) - P( X \geq 10) = e^{-0.5} - e^{-1} =0.6065 - 0.3678 = 0.2386 = 23.86 \%$$

