`stat_ecdf'
========================================================
Empirical Cumulative Density Functions


```r
library(ggplot2)
```

```
## Error: package or namespace load failed for 'ggplot2'
```

```r
df <- data.frame(x = c(rnorm(100, 0, 3), rnorm(100, 0, 10)), g = gl(2, 100))
```


You can also embed plots, for example:


```r
qplot(rnorm(1000), stat = "ecdf", geom = "step")
```

```
## Error: could not find function "qplot"
```

```r



ggplot(df, aes(x, colour = g)) + stat_ecdf()
```

```
## Error: could not find function "ggplot"
```


