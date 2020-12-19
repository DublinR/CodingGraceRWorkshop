`geom_boxplot`
========================================================



```r
library(ggplot2)
p <- ggplot(mtcars, aes(factor(cyl), mpg))

p + geom_boxplot()
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1.png) 

### Using Quickplot

```r
qplot(factor(cyl), mpg, data = mtcars, geom = "boxplot")
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 

### `jitter` and `coord_flip`

```r
p + geom_boxplot() + geom_jitter()
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-31.png) 

```r
p + geom_boxplot() + coord_flip()
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-32.png) 

```r
# Quickplot Variant
qplot(factor(cyl), mpg, data = mtcars, geom = "boxplot") + coord_flip()
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-33.png) 

### Notched Boxplots

```r
p + geom_boxplot(notch = TRUE)
```

```
## notch went outside hinges. Try setting notch=FALSE.
## notch went outside hinges. Try setting notch=FALSE.
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-41.png) 

```r
p + geom_boxplot(notch = TRUE, notchwidth = 0.3)
```

```
## notch went outside hinges. Try setting notch=FALSE.
## notch went outside hinges. Try setting notch=FALSE.
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-42.png) 

```r

p + geom_boxplot(outlier.colour = "green", outlier.size = 3)
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-43.png) 

### Adding aesthetic mappings
Note that boxplots are automatically dodged when any aesthetic is
a factor.

```r

p + geom_boxplot(aes(fill = cyl))
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-51.png) 

```r
p + geom_boxplot(aes(fill = factor(cyl)))
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-52.png) 

```r
p + geom_boxplot(aes(fill = factor(vs)))
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-53.png) 

```r
p + geom_boxplot(aes(fill = factor(am)))
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-54.png) 


### Set aesthetics to fixed value

```r
p + geom_boxplot(fill = "grey80", colour = "#3366FF")
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-61.png) 

```r
qplot(factor(cyl), mpg, data = mtcars, geom = "boxplot", colour = I("#3366FF"))
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-62.png) 

```r

# Scales vs. coordinate transforms ------- Scale transformations occur
# before the boxplot statistics are computed.  Coordinate transformations
# occur afterwards.  Observe the effect on the number of outliers.
library(plyr)  # to access round_any
m <- ggplot(movies, aes(y = votes, x = rating, group = round_any(rating, 0.5)))
m + geom_boxplot()
```

```
## Warning: position_dodge requires constant width: output may be incorrect
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-63.png) 

```r
m + geom_boxplot() + scale_y_log10()
```

```
## Warning: position_dodge requires constant width: output may be incorrect
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-64.png) 

```r
m + geom_boxplot() + coord_trans(y = "log10")
```

```
## Warning: position_dodge requires constant width: output may be incorrect
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-65.png) 

```r
m + geom_boxplot() + scale_y_log10() + coord_trans(y = "log10")
```

```
## Warning: position_dodge requires constant width: output may be incorrect
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-66.png) 

```r

# Boxplots with continuous x: Use the group aesthetic to group observations
# in boxplots
qplot(year, budget, data = movies, geom = "boxplot")
```

```
## Warning: Removed 53573 rows containing non-finite values (stat_boxplot).
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-67.png) 

```r
qplot(year, budget, data = movies, geom = "boxplot", group = round_any(year, 
    10, floor))
```

```
## Warning: Removed 53573 rows containing non-finite values (stat_boxplot).
## Warning: position_dodge requires constant width: output may be incorrect
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-68.png) 

```r

# Using precomputed statistics generate sample data
abc <- adply(matrix(rnorm(100), ncol = 5), 2, quantile, c(0, 0.25, 0.5, 0.75, 
    1))
b <- ggplot(abc, aes(x = X1, ymin = `0%`, lower = `25%`, middle = `50%`, upper = `75%`, 
    ymax = `100%`))
b + geom_boxplot(stat = "identity")
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-69.png) 

```r
b + geom_boxplot(stat = "identity") + coord_flip()
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-610.png) 

```r
b + geom_boxplot(aes(fill = X1), stat = "identity")
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-611.png) 


