Friedman Test
========================================================




```r
wb <- aggregate(warpbreaks$breaks, by = list(w = warpbreaks$wool, t = warpbreaks$tension), 
    FUN = mean)
wb
```

```
##   w t     x
## 1 A L 44.56
## 2 B L 28.22
## 3 A M 24.00
## 4 B M 28.78
## 5 A H 24.56
## 6 B H 18.78
```

```r
friedman.test(wb$x, wb$w, wb$t)
```

```
## 
## 	Friedman rank sum test
## 
## data:  wb$x, wb$w and wb$t
## Friedman chi-squared = 0.3333, df = 1, p-value = 0.5637
```

```r
friedman.test(x ~ w | t, data = wb)
```

```
## 
## 	Friedman rank sum test
## 
## data:  x and w and t
## Friedman chi-squared = 0.3333, df = 1, p-value = 0.5637
```


