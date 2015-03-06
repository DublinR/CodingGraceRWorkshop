Basic Plots 2
========================================================


```r
library(ggplot2)
```


### Plotting a Function
- To plot a function, use `stat_function()`. 
- It's also necessary to give `ggplot()` a dummy data frame so that
it will get the proper x range. 
- In this example we'll use `dnorm()`, which gives the density
of the normal distribution.


```r
# The data frame is only used for setting the range
p <- ggplot(data.frame(x = c(-3, 3)), aes(x = x))
p + stat_function(fun = dnorm)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 

#### User Defined Functions


```r
# Define a Sigmoid Function
myfun <- function(xvar) {
    1/(1 + exp(-xvar + 10))
}
ggplot(data.frame(x = c(0, 20)), aes(x = x)) + stat_function(fun = myfun)
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 

<hr>

### Shading a Subregion Under a Function Curve
Define a new wrapper function around your curve function, and replace out-of-range values with NA()

```r
# Return dnorm(x) for 0 < x < 2, and NA for all other x
dnorm_limit <- function(x) {
    y <- dnorm(x)
    y[x < 0 | x > 2] <- NA
    return(y)
}
# ggplot() with dummy data
p <- ggplot(data.frame(x = c(-3, 3)), aes(x = x)) + stat_function(fun = dnorm)
# Same plot as before.
```


```r
p + stat_function(fun = dnorm_limit, geom = "area", fill = "blue", alpha = 0.2)
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 


### Creating a Graph of an Empirical Cumulative Distribution Function


```r

library(gcookbook)  # For the data set
# ecdf of heightIn
ggplot(heightweight, aes(x = heightIn)) + stat_ecdf()
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-61.png) 

```r
# ecdf of ageYear
ggplot(heightweight, aes(x = ageYear)) + stat_ecdf()
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-62.png) 


### Network Graphs


```r
# May need to install first, with install.packages('igraph')
library(igraph)
# Specify edges for a directed graph
gd <- graph(c(1, 2, 2, 3, 2, 4, 1, 4, 5, 6, 4, 3, 5, 3, 2, 6))
plot(gd)
```

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-71.png) 

```r
# For an undirected graph
gu <- graph(c(1, 2, 2, 3, 2, 4, 1, 4, 5, 2, 5, 6, 3, 6), directed = FALSE)
# No labels
plot(gu, vertex.label = NA)
```

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-72.png) 


