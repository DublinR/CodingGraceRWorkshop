Basic Plots
========================================================

### 1. Making a Basic Bar Graph

- X variable : categorical variable (Species variable in iris)
- Y variable : Some numeric variable 
- add `geom_bar`

```r
library(ggplot2)
ggplot(iris, aes(x = Species, y = Sepal.Width)) + geom_bar(stat = "identity")
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1.png) 


#### 1.1 Playing around with different geoms.


```r
# They may or may not be useful.

ggplot(iris, aes(x = Species, y = Sepal.Width)) + geom_point()
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


### 2. Fill
- By default, bar graphs use a very dark grey for the bars. To use a color fill, use `fill`.

- For the following example, we use a red fill and a black outline:


```r

ggplot(iris, aes(x = Species, y = Sepal.Width)) + geom_bar(stat = "identity", 
    fill = "red")
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 

- Also, by default, there is no outline around the fill. To add an outline, use `colour` (Doesn't work all the time). 

```r

ggplot(iris, aes(x = Species, y = Sepal.Width)) + geom_bar(stat = "identity", 
    colour = "black")
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 

