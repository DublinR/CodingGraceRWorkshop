Geoms - Frequency Polygons
========================================================




```r
library(ggplot2)
qplot(clarity, data = diamonds, geom = "freqpoly", group = cut, colour = cut, 
    position = "identity")
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-11.png) 

```r

qplot(clarity, data = diamonds, geom = "freqpoly", group = cut, colour = cut, 
    position = "stack")
```

```
## ymax not defined: adjusting position using y instead
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-12.png) 


You can also embed plots, for example:


```r
plot(cars)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


