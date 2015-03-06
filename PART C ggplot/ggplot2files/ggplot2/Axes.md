Axes
========================================================
- The x- and y-axes provide context for interpreting the displayed data. ggplot2 will display the axes with defaults that look good in most cases, but you might want to control, for example, the axis labels, the number and placement of tick marks, the tick mark labels, and so on.


```r
library(ggplot2)
```


### Changing Orientation (Boxplots)
- `coord_flip`


```r
# Basic Boxplots (with colour fills)
ggplot(PlantGrowth, aes(x = group, y = weight)) + geom_boxplot(fill = c("red", 
    "blue", "green"))
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-21.png) 

```r

# Changing Orientation
ggplot(PlantGrowth, aes(x = group, y = weight)) + geom_boxplot() + coord_flip()
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-22.png) 

#### `scale_x_discrete`

```r
ggplot(PlantGrowth, aes(x = group, y = weight)) + geom_boxplot() + coord_flip() + 
    scale_x_discrete(limits = rev(levels(PlantGrowth$group)))
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 

### Removing Ticks and axes

```r
p <- ggplot(PlantGrowth, aes(x = group, y = weight)) + geom_boxplot()
p
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 


```r
p + theme(axis.text.y = element_blank())
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 


- To remove the tick marks, use `theme(axis.ticks=element_blank())`. 
- This will remove the tick marks on both axes. (It's not possible to hide the tick marks on just one axis.)
- In this example, we'll hide all tick marks as well as the y tick labels 

```r
p + theme(axis.ticks = element_blank(), axis.text.y = element_blank())
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6.png) 

- To remove the tick marks, the labels, and the grid lines, set breaks to `NULL`. 

```r
p + scale_y_continuous(breaks = NULL)
```

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7.png) 

