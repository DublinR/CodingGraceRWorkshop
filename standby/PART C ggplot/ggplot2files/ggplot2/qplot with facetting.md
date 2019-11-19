qplot with facetting
========================================================



```r
library(ggplot2)

qplot(mpg, wt, data = mtcars, geom = "point")
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1.png) 


```r
table(mtcars$cyl, mtcars$gear)
```

```
##    
##      3  4  5
##   4  1  8  2
##   6  2  4  1
##   8 12  0  2
```


```r
# using facets (hint: bug in margins -> doesn't work)
qplot(mpg, wt, data = mtcars, facets = . ~ cyl, geom = "point")
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-31.png) 

```r
qplot(mpg, wt, data = mtcars, facets = gear ~ cyl, geom = "point")
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-32.png) 

```r
# facet_wrap / facet_grid
```


```r
# qplot(mpg, wt, data=mtcars, facets=~cyl, geom='point')
p.tmp <- ggplot(mtcars, aes(mpg, wt)) + geom_point()
```


```r
p.tmp + facet_wrap(~cyl)
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-51.png) 

```r
# qplot(mpg, wt, data=mtcars, facets=~cyl, geom='point')
p.tmp + facet_wrap(~cyl, ncol = 3)
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-52.png) 

```r
p.tmp + facet_grid(gear ~ cyl)
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-53.png) 

```r
p.tmp + facet_wrap(~cyl + gear)
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-54.png) 


```r
# controlling scales in facets (default: scales='fixed')
p.tmp + facet_wrap(~cyl, scales = "free")
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-61.png) 

```r
p.tmp + facet_wrap(~cyl, scales = "free_x")
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-62.png) 

```r
p.tmp + facet_wrap(~cyl, scales = "fixed")
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-63.png) 


```r
# contstraint on facet_grid (all rows,columns same scale)
p.tmp + facet_grid(gear ~ cyl, scales = "free_x")
```

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-71.png) 

```r
p.tmp + facet_grid(gear ~ cyl, scales = "free", space = "free")
```

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-72.png) 


