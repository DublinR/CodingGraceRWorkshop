

The Poisson Probability Distribution
==================================================

* A Poisson random variable is the number of successes that result from a Poisson experiment.
* The probability distribution of a Poisson random variable is called a Poisson distribution.
* Very Important: This distribution describes the number of occurrences in a ***unit period (or space)***
* Very Important: The expected number of occurrences is $m$
    
* The expected number of occurrences is $m$.
* ``R`` refers to the mean number of occurrences as ``lambda`` rather than ``m``. 
    




* The probability that there will be $k$ occurrences in a unit time period is denoted $P(X=k)$, and is computed as below. 
* Remark: This is known as the probability density function. 
* The corresponding ``R`` command is ``dpois()``.
$$ P(X = k)=\frac{m^k e^{-m}}{k!} $$



*  Probability Density Function $P(X = k)$

*  For a given poisson mean $m$, which in ``R`` is specified as ``lambda`` 
*  ``dpois(k,lambda = ...)`` 

*  Cumulative Density Function $P(X \leq k)$

*  ``ppois(k,lambda = ...)``



From before: $P(X = 0)$ given than the mean number of occurrences is 2.


&gt; dpois(0,lambda=2)
[1] 0.1353353
&gt; dpois(1,lambda=2)
[1] 0.2706706
&gt; dpois(2,lambda=2)
[1] 0.2706706



Compute the cumulative distribution functions for the values $k=\{0,1,2\}$, given that the mean number of occurrences is 2

&gt; ppois(0,lambda=2)
[1] 0.1353353
&gt; ppois(1,lambda=2)
[1] 0.4060058
&gt; ppois(2,lambda=2)
[1] 0.6766764



Poisson Random Variables
==================================

Suppose that random variable X follows a Poisson distribution with rate parameter \texttt{\textbf{lambda}}. \\

If we increase the value of ``lambda``, which of the following is true?

### Exercise
* Generate 100 random numbers from the Poisson distribution - specifying a value for \texttt{lambda} (i.e. what the rate parameter is called when using \texttt{R}) .
* Compute the mean and variance for this set of numbers.
* Repeat the process a few times, each time increasing the value of lambda.




```R
#generate three data sets
X1 <- rpois(100, lambda= 4)
X2 <- rpois(100, lambda= 8)
X3 <- rpois(100, lambda= 18)

```


```R
#Now get the mean and variance for each data set
mean(X1);var(X1)
mean(X2);var(X2)
mean(X3);var(X3)
```


4.06



3.9559595959596



7.6



8.1010101010101



18.28



18.870303030303





* Probability Density Function $P(X = k)$

* For a given poisson mean $m$, which in ``R`` is specified as ``lambda`` 
* ``dpois(k,lambda = ...)`` 

* Cumulative Density Function $P(X \leq k)$

* ``ppois(k,lambda = ...)``





From before: $P(X = 0)$ given than the mean number of occurrences is 2.

\begin{verbatim``
&gt; dpois(0,lambda=2)
[1] 0.1353353
&gt; dpois(1,lambda=2)
[1] 0.2706706
&gt; dpois(2,lambda=2)
[1] 0.2706706
\end{verbatim``


Compute the cumulative distribution functions for the values $k=\{0,1,2\}$, given that the mean number of occurrences is 2


&gt; ppois(0,lambda=2)
[1] 0.1353353
&gt; ppois(1,lambda=2)
[1] 0.4060058
&gt; ppois(2,lambda=2)
[1] 0.6766764



```R

\begin{itemize}
\item Probability Density Function $P(X = k)$
\begin{itemize}
\item For a given poisson mean $m$, which in \texttt{R} is specified as \texttt{lambda} 
\item \texttt{dpois(k,lambda = ...)} 
\end{itemize}
\item Cumulative Density Function $P(X \leq k)$
\begin{itemize}
\item \texttt{ppois(k,lambda = ...)}
\end{itemize}
\end{itemize}


%\frametitle{Implementation using \texttt{R}}
From before: $P(X = 0)$ given than the mean number of occurrences is 2.

\begin{verbatim}
> dpois(0,lambda=2)
[1] 0.1353353
> dpois(1,lambda=2)
[1] 0.2706706
> dpois(2,lambda=2)
[1] 0.2706706
\end{verbatim}

%\frametitle{Implementation using \texttt{R}}
Compute the cumulative distribution functions for the values $k=\{0,1,2\}$, given that the mean number of occurrences is 2

\begin{verbatim}
> ppois(0,lambda=2)
[1] 0.1353353
> ppois(1,lambda=2)
[1] 0.4060058
> ppois(2,lambda=2)
[1] 0.6766764
\end{verbatim}

```


```R
%----------------------------------------------------------- %

\noindent \textbf{Exercise}
\begin{itemize}
\item Generate 100 random numbers from the Poisson distribution - specifying a value for \texttt{lambda} (i.e. what the rate parameter is called when using \texttt{R}) .
\item Compute the mean and variance for this set of numbers.
\item Repeat the process a few times, each time increasing the value of lambda.
\end{itemize}
\begin{framed}
\begin{verbatim}
#generate three data sets
X1 <- rpois(100, lambda= 4)
X2 <- rpois(100, lambda= 8)
X3 <- rpois(100, lambda= 18)
\end{verbatim}
\end{framed}

%----------------------------------------------- %

%\frametitle{Poisson Random Variables}
\begin{framed}
\begin{verbatim}
#Now get the mean and variance for each data set
mean(X1);var(X1)
mean(X2);var(X2)
mean(X3);var(X3)
\end{verbatim}
\end{framed}
```
