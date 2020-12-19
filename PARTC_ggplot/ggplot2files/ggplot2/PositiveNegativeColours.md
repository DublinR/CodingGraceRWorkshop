Coloring Negative and Positive Bars Differently
========================================================

- You want to use different colors for negative and positive-valued bars.

- We'll use a subset of the climate data (from the ***gcookbook*** package)and create a new column called `pos`, which indicates
whether the value is positive or negative:

```r
library(ggplot2)
library(gcookbook)  # For the data set
csub <- subset(climate, Source == "Berkeley" & Year >= 1900)
csub$pos <- csub$Anomaly10y >= 0
head(csub, 12)
```

```
##       Source Year Anomaly1y Anomaly5y Anomaly10y Unc10y   pos
## 101 Berkeley 1900        NA        NA     -0.171  0.108 FALSE
## 102 Berkeley 1901        NA        NA     -0.162  0.109 FALSE
## 103 Berkeley 1902        NA        NA     -0.177  0.108 FALSE
## 104 Berkeley 1903        NA        NA     -0.199  0.104 FALSE
## 105 Berkeley 1904        NA        NA     -0.223  0.105 FALSE
## 106 Berkeley 1905        NA        NA     -0.241  0.107 FALSE
## 107 Berkeley 1906        NA        NA     -0.294  0.106 FALSE
## 108 Berkeley 1907        NA        NA     -0.312  0.105 FALSE
## 109 Berkeley 1908        NA        NA     -0.328  0.103 FALSE
## 110 Berkeley 1909        NA        NA     -0.281  0.101 FALSE
## 111 Berkeley 1910        NA        NA     -0.247  0.099 FALSE
## 112 Berkeley 1911        NA        NA     -0.243  0.097 FALSE
```

```r

table(csub$pos)
```

```
## 
## FALSE  TRUE 
##    47    58
```




```r
ggplot(csub, aes(x = Year, y = Anomaly10y, fill = pos)) + geom_bar(stat = "identity", 
    position = "identity")
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


- We can change the colors with `scale_fill_manual()` and remove the legend with `guide=FALSE`. 
- We'll also add a thin black outline around each of the bars by setting colour and specifying size, which is the thickness of the outline,
in millimeters:

```r
ggplot(csub, aes(x = Year, y = Anomaly10y, fill = pos)) + geom_bar(stat = "identity", 
    position = "identity", colour = "black") + scale_fill_manual(values = c("blue", 
    "red"))
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 




```r
ggplot(csub, aes(x = Year, y = Anomaly10y, fill = pos)) + geom_bar(stat = "identity", 
    position = "identity", colour = "black", size = 0.25) + scale_fill_manual(values = c("blue", 
    "red"))
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 



```r
ggplot(csub, aes(x = Year, y = Anomaly10y, fill = pos)) + geom_bar(stat = "identity", 
    position = "identity", colour = "black", size = 0.25) + scale_fill_manual(values = c("#CCEEFF", 
    "#FFDDDD"), guide = FALSE)
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 

