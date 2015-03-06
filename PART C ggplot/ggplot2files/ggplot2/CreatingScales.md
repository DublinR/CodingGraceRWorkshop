Creating your own scales
========================================================

- The default shapes and colors may not be very appealing. 
- `scale_manual` expressions allow you to create your own discrete scale.
- Other shapes can be used with `scale_shape_manual()`, and other colours can be used with `scale_colour_brewer()` or `scale_colour_manual()`.



```r
library(ggplot2)
p <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) + 
    geom_point(size = 3)
levels(iris$Species)  # notice the order
```

```
## [1] "setosa"     "versicolor" "virginica"
```

```r
p + scale_colour_manual(values = c("red", "blue", "green"))
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-11.png) 

```r
p + scale_colour_manual(values = c(virginica = "darkred", versicolor = "orangered2", 
    setosa = "violetred"))
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-12.png) 

#### Digression on finding colours


```r
head(colours(), 12)  # first twelve colours
```

```
##  [1] "white"         "aliceblue"     "antiquewhite"  "antiquewhite1"
##  [5] "antiquewhite2" "antiquewhite3" "antiquewhite4" "aquamarine"   
##  [9] "aquamarine1"   "aquamarine2"   "aquamarine3"   "aquamarine4"
```

```r
length(colours())  # how many named colours?
```

```
## [1] 657
```

```r
grep("red", colours(), value = TRUE)
```

```
##  [1] "darkred"         "indianred"       "indianred1"     
##  [4] "indianred2"      "indianred3"      "indianred4"     
##  [7] "mediumvioletred" "orangered"       "orangered1"     
## [10] "orangered2"      "orangered3"      "orangered4"     
## [13] "palevioletred"   "palevioletred1"  "palevioletred2" 
## [16] "palevioletred3"  "palevioletred4"  "red"            
## [19] "red1"            "red2"            "red3"           
## [22] "red4"            "violetred"       "violetred1"     
## [25] "violetred2"      "violetred3"      "violetred4"
```




```r
p <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, shape = Species)) + 
    geom_point(size = 3)
p + scale_shape_manual(values = c(12, 16, 22))
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 

