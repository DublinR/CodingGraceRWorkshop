`geom_jitter`
========================================================
This geom is for points, jittered to reduce overplotting.

### un-jittered plot

```r
library(ggplot2)
p <- ggplot(mpg, aes(displ, hwy))
p + geom_point()
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1.png) 

#### Jittering added to plot

```r

p + geom_point(position = "jitter")
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 

### Add aesthetic mappings

```r

p + geom_jitter(aes(colour = cyl))
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 

### Varying parameters

```r

p + geom_jitter(position = position_jitter(width = 0.5))
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-41.png) 

```r
p + geom_jitter(position = position_jitter(height = 0.5))
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-42.png) 

### Using `qplot`

```r

qplot(displ, hwy, data = mpg, geom = "jitter")
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-51.png) 

```r
qplot(class, hwy, data = mpg, geom = "jitter")
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-52.png) 

```r
qplot(class, hwy, data = mpg, geom = c("boxplot", "jitter"))
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-53.png) 

```r
qplot(class, hwy, data = mpg, geom = c("jitter", "boxplot"))
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-54.png) 

###  `position_jitter` 
This is used to adjust amount of jittering.

```r
table(mtcars$am, mtcars$vs)
```

```
##    
##      0  1
##   0 12  7
##   1  6  7
```

```r
qplot(am, vs, data = mtcars)  #not informative
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6.png) 

Default amount of jittering will generally be too much for
small datasets:

```r
qplot(am, vs, data = mtcars, position = "jitter")
```

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7.png) 

Control the amount as follows

```r
qplot(am, vs, data = mtcars, position = position_jitter(w = 0.1, h = 0.1))
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8.png) 

```r
# Much Better
```


The default works better for large datasets, where it will
take up as much space as a boxplot or a bar

```r
qplot(class, hwy, data = mpg, geom = c("boxplot", "jitter"))
```

![plot of chunk unnamed-chunk-9](figure/unnamed-chunk-9.png) 


### `position_jitter`with ggplot


```r

ggplot(mtcars, aes(x = am, y = vs)) + geom_point(position = "jitter")
```

![plot of chunk unnamed-chunk-10](figure/unnamed-chunk-101.png) 

```r
ggplot(mtcars, aes(x = am, y = vs)) + geom_point(position = position_jitter(w = 0.1, 
    h = 0.1))
```

![plot of chunk unnamed-chunk-10](figure/unnamed-chunk-102.png) 



