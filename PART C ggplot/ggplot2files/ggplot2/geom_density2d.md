`geom_density2d` and `stat_density2d`
========================================================

### Preliminaries


```r
library(ggplot2)
library(MASS)
data(geyser)
head(geyser)
```

```
##   waiting duration
## 1      80    4.017
## 2      71    2.150
## 3      57    4.000
## 4      80    4.000
## 5      75    4.000
## 6      77    2.000
```




```r

m <- ggplot(geyser, aes(x = duration, y = waiting)) + geom_point() + xlim(0.5, 
    6) + ylim(40, 110)
m
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-21.png) 

```r
# Add contours
m + geom_density2d()
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-22.png) 




```r
dens <- kde2d(geyser$duration, geyser$waiting, n = 50, lims = c(0.5, 6, 40, 
    110))
densdf <- data.frame(expand.grid(duration = dens$x, waiting = dens$y), z = as.vector(dens$z))
head(densdf)
```

```
##   duration waiting         z
## 1   0.5000      40 1.125e-15
## 2   0.6122      40 3.268e-15
## 3   0.7245      40 8.743e-15
## 4   0.8367      40 2.154e-14
## 5   0.9490      40 4.890e-14
## 6   1.0612      40 1.023e-13
```

```r
m + geom_contour(aes(z = z), data = densdf)
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 




```r
m + geom_density2d() + scale_y_log10()
```

```
## Scale for 'y' is already present. Adding another scale for 'y', which will replace the existing scale.
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-41.png) 

```r
m + geom_density2d() + coord_trans(y = "log10")
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-42.png) 

```r

m + stat_density2d(aes(fill = ..level..), geom = "polygon")
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-43.png) 




```r
qplot(duration, waiting, data = geyser, geom = c("point", "density2d")) + xlim(0.5, 
    6) + ylim(40, 110)
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 


### Diamonds Data Set

If you map an aesthetic to a categorical variable, you will get a
set of contours for each value of that variable


```r
set.seed(4393)
dsmall <- diamonds[sample(nrow(diamonds), 1000), ]
qplot(x, y, data = dsmall, geom = "density2d", colour = cut)
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-61.png) 

```r
qplot(x, y, data = dsmall, geom = "density2d", linetype = cut)
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-62.png) 

```r
qplot(carat, price, data = dsmall, geom = "density2d", colour = cut)
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-63.png) 

```r
d <- ggplot(dsmall, aes(carat, price)) + xlim(1, 3)
d + geom_point() + geom_density2d()
```

```
## Warning: Removed 684 rows containing non-finite values (stat_density2d).
## Warning: Removed 684 rows containing missing values (geom_point).
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-64.png) 

If we turn contouring off, we can use use geoms like tiles:


```r
d + stat_density2d(geom = "tile", aes(fill = ..density..), contour = FALSE)
```

```
## Warning: Removed 684 rows containing non-finite values (stat_density2d).
```

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-71.png) 

```r
last_plot() + scale_fill_gradient(limits = c(1e-05, 8e-04))
```

```
## Warning: Removed 684 rows containing non-finite values (stat_density2d).
```

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-72.png) 


```r
# Or points:
d + stat_density2d(geom = "point", aes(size = ..density..), contour = FALSE)
```

```
## Warning: Removed 684 rows containing non-finite values (stat_density2d).
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8.png) 


