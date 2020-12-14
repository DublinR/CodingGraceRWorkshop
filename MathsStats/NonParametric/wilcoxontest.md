Wilcoxon Test
========================================================
- The `wilcox.test` command  can be used to perform one- and two-sample Wilcoxon tests on data.
- The two sample procedure is also known as 'Mann-Whitney' test. 

### One Sample Test


```r
x <- c(1.83, 0.5, 1.62, 2.48, 1.68, 1.88, 1.55, 3.06, 1.3)
median(x)
```

```
## [1] 1.68
```

```r
wilcox.test(x, mu = 1.6)
```

```
## 
## 	Wilcoxon signed rank test
## 
## data:  x
## V = 29, p-value = 0.4961
## alternative hypothesis: true location is not equal to 1.6
```

```r
wilcox.test(x, mu = 3, alternative = "greater")
```

```
## 
## 	Wilcoxon signed rank test
## 
## data:  x
## V = 1, p-value = 0.998
## alternative hypothesis: true location is greater than 3
```


### Paired sample test.
***Hollander & Wolfe (1973), 29f.***

Hamilton depression scale factor measurements in 9 patients with mixed anxiety and depression, taken at the first (x) and second (y) visit after initiation of a therapy (administration of a tranquilizer).

*Remark - location shift indicates a difference in medians.*


```r

x <- c(1.83, 0.5, 1.62, 2.48, 1.68, 1.88, 1.55, 3.06, 1.3)
y <- c(0.878, 0.647, 0.598, 2.05, 1.06, 1.29, 1.06, 3.14, 1.29)

wilcox.test(x, y, paired = TRUE, alternative = "greater")
```

```
## 
## 	Wilcoxon signed rank test
## 
## data:  x and y
## V = 40, p-value = 0.01953
## alternative hypothesis: true location shift is greater than 0
```

```r
wilcox.test(y - x, alternative = "less")  # The same.
```

```
## 
## 	Wilcoxon signed rank test
## 
## data:  y - x
## V = 5, p-value = 0.01953
## alternative hypothesis: true location is less than 0
```

```r

wilcox.test(y - x, alternative = "less", exact = FALSE, correct = FALSE)  # H&W large sample
```

```
## 
## 	Wilcoxon signed rank test
## 
## data:  y - x
## V = 5, p-value = 0.01908
## alternative hypothesis: true location is less than 0
```

```r
# approximation
```


### Two-sample test.
***Hollander & Wolfe (1973), 69f.***

Permeability constants of the human chorioamnion (a placental membrane) at term (x) and between 12 to 26 weeks gestational age (y).  The alternative of interest is greater permeability of the human chorioamnion for the term pregnancy.

Remark - location shift indicates a difference in medians


```r
x <- c(0.8, 0.83, 1.89, 1.04, 1.45, 1.38, 1.91, 1.64, 0.73, 1.46)
y <- c(1.15, 0.88, 0.9, 0.74, 1.21)
wilcox.test(x, y, alternative = "g")  # greater
```

```
## 
## 	Wilcoxon rank sum test
## 
## data:  x and y
## W = 35, p-value = 0.1272
## alternative hypothesis: true location shift is greater than 0
```

```r
wilcox.test(x, y, alternative = "greater", exact = FALSE, correct = FALSE)  # H&W large sample
```

```
## 
## 	Wilcoxon rank sum test
## 
## data:  x and y
## W = 35, p-value = 0.1103
## alternative hypothesis: true location shift is greater than 0
```

```r
# approximation

wilcox.test(rnorm(10), rnorm(10, 2), conf.int = TRUE)
```

```
## 
## 	Wilcoxon rank sum test
## 
## data:  rnorm(10) and rnorm(10, 2)
## W = 0, p-value = 1.083e-05
## alternative hypothesis: true location shift is not equal to 0
## 95 percent confidence interval:
##  -3.099 -1.509
## sample estimates:
## difference in location 
##                 -2.322
```

### Formula interface.
The formula interface is only applicable for the 2-sample tests. 

```r

boxplot(Ozone ~ Month, data = airquality, horizontal = TRUE, col = c("lightpink", 
    "lightblue", "lightgreen", "white", "hotpink"))
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 

```r

wilcox.test(Ozone ~ Month, data = airquality, subset = Month %in% c(5, 8))
```

```
## Warning: cannot compute exact p-value with ties
```

```
## 
## 	Wilcoxon rank sum test with continuity correction
## 
## data:  Ozone by Month
## W = 127.5, p-value = 0.0001208
## alternative hypothesis: true location shift is not equal to 0
```


