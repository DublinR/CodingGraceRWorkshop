Annotating Plots
========================================================

### 1. Adding text to plots
 - The `annotate()` function can be used to add any type of geometric object. In this case,
we used `geom="text"`.
- location for text must be specified

```r
# Load package
library(ggplot2)
# Scatterplot
p <- ggplot(faithful, aes(x = eruptions, y = waiting)) + geom_point()

# Add annotations
p + annotate("text", x = 3, y = 48, label = "Group 1") + annotate("text", x = 4.5, 
    y = 66, label = "Group 2")
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1.png) 


#### 1.1 Additional Arguments
- family : serif, mono (monospace)
- fontface : plain (1), bold (2), italic (3), bold and italic (4)
- colour
- size


```r
p + annotate("text", x = 3, y = 48, label = "Group 1", family = "serif", fontface = "italic", 
    colour = "darkred", size = 4) + annotate("text", x = 4.5, y = 66, label = "Group 2", 
    family = "mono", fontface = "bold", colour = "darkgreen", size = 4)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 



```r
p <- ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point()
p + annotate("text", x = 4, y = 25, label = "Some text")
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-31.png) 

```r
p + annotate("text", x = 2:5, y = 25, label = "Some text")
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-32.png) 

### 2. Adding a Rectangle
- can apply alpha transparency (a value from 0 to 1)

```r
p + annotate("rect", xmin = 3, xmax = 4.2, ymin = 12, ymax = 21, alpha = 0.2)
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 


### 3. Adding a Line Segment
- can adjust width with additional argument `lwd`, and line type `lty`.

```r
p + annotate("segment", x = 2.5, xend = 4, y = 15, yend = 25, colour = "green")
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 


### 4. Add Mathematical Expressions

Using Mathematical Expressions

```r
# Simple Bell Curve plot
p <- ggplot(data.frame(x = c(-3, 3)), aes(x = x)) + stat_function(fun = dnorm)
p + annotate("text", x = 2, y = 0.3, parse = TRUE, label = "frac(1, sqrt(2 * pi)) * e ^ {-x^2 / 2}")
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6.png) 



```r
p + annotate("text", x = 0, y = 0.05, parse = TRUE, size = 4, label = "'Function: ' * y==frac(1, sqrt(2*pi)) * e^{-x^2/2}")
```

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7.png) 




