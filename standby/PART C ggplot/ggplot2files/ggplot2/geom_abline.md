`geom_abline`
========================================================


```r
library(ggplot2)
```

```
## Error: package or namespace load failed for 'ggplot2'
```

```r
p <- qplot(wt, mpg, data = mtcars)
```

```
## Error: could not find function "qplot"
```

### Fixed slopes and intercepts

```r

p + geom_abline()  # Can't see it - outside the range of the data
```

```
## Error: object 'p' not found
```

```r
p + geom_abline(intercept = 20)
```

```
## Error: object 'p' not found
```

### Calculate slope and intercept of line of best fit


```r
coef(lm(mpg ~ wt, data = mtcars))
```

```
## (Intercept)          wt 
##      37.285      -5.344
```

```r
p + geom_abline(intercept = 37, slope = -5)
```

```
## Error: object 'p' not found
```

```r
p + geom_abline(intercept = 10, colour = "red", size = 2)
```

```
## Error: object 'p' not found
```




```r
# See ?stat_smooth for fitting smooth models to data
p + stat_smooth(method = "lm", se = FALSE)
```

```
## Error: object 'p' not found
```

### Slopes and intercepts as data


```r

p <- ggplot(mtcars, aes(x = wt, y = mpg), . ~ cyl) + geom_point()
```

```
## Error: could not find function "ggplot"
```

```r
df <- data.frame(a = rnorm(10, 25), b = rnorm(10, 0))
p + geom_abline(aes(intercept = a, slope = b), data = df)
```

```
## Error: object 'p' not found
```


### Slopes and intercepts from linear model

```r
library(plyr)
coefs <- ddply(mtcars, .(cyl), function(df) {
    m <- lm(mpg ~ wt, data = df)
    data.frame(a = coef(m)[1], b = coef(m)[2])
})
str(coefs)
```

```
## 'data.frame':	3 obs. of  3 variables:
##  $ cyl: num  4 6 8
##  $ a  : num  39.6 28.4 23.9
##  $ b  : num  -5.65 -2.78 -2.19
```

```r
p + geom_abline(data = coefs, aes(intercept = a, slope = b))
```

```
## Error: object 'p' not found
```




```r
# It's actually a bit easier to do this with stat_smooth
p + geom_smooth(aes(group = cyl), method = "lm")
```

```
## Error: object 'p' not found
```

```r
p + geom_smooth(aes(group = cyl), method = "lm", fullrange = TRUE)
```

```
## Error: object 'p' not found
```


### With coordinate transforms

```r

p + geom_abline(intercept = 37, slope = -5) + coord_flip()
```

```
## Error: object 'p' not found
```

```r
p + geom_abline(intercept = 37, slope = -5) + coord_polar()
```

```
## Error: object 'p' not found
```


