`geom_histograms`
========================================================


```r
library(ggplot2)
set.seed(5689)
movies <- movies[sample(nrow(movies), 1000), ]
# Simple examples
qplot(rating, data = movies, geom = "histogram")
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
```

```
## Warning: position_stack requires constant width: output may be incorrect
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-11.png) 

```r
qplot(rating, data = movies, weight = votes, geom = "histogram")
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
```

```
## Warning: position_stack requires constant width: output may be incorrect
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-12.png) 

```r
qplot(rating, data = movies, weight = votes, geom = "histogram", binwidth = 1)
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-13.png) 

```r
qplot(rating, data = movies, weight = votes, geom = "histogram", binwidth = 0.1)
```

```
## Warning: position_stack requires constant width: output may be incorrect
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-14.png) 


```r
# More complex
m <- ggplot(movies, aes(x = rating))
m + geom_histogram()
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
```

```
## Warning: position_stack requires constant width: output may be incorrect
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-21.png) 

```r
m + geom_histogram(aes(y = ..density..)) + geom_density()
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
```

```
## Warning: position_stack requires constant width: output may be incorrect
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-22.png) 


```r
m + geom_histogram(binwidth = 1)
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-31.png) 

```r
m + geom_histogram(binwidth = 0.5)
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-32.png) 

```r
m + geom_histogram(binwidth = 0.1)
```

```
## Warning: position_stack requires constant width: output may be incorrect
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-33.png) 


```r
# Add aesthetic mappings
m + geom_histogram(aes(weight = votes))
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
```

```
## Warning: position_stack requires constant width: output may be incorrect
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-41.png) 

```r
m + geom_histogram(aes(y = ..count..))
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
```

```
## Warning: position_stack requires constant width: output may be incorrect
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-42.png) 

```r
m + geom_histogram(aes(fill = ..count..))
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
```

```
## Warning: position_stack requires constant width: output may be incorrect
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-43.png) 


```r
# Change scales
m + geom_histogram(aes(fill = ..count..)) + scale_fill_gradient("Count", low = "green", 
    high = "red")
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
```

```
## Warning: position_stack requires constant width: output may be incorrect
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 

Often we don't want the height of the bar to represent the
count of observations, but the sum of some other variable.
For example, the following plot shows the number of movies
in each rating.

```r

qplot(rating, data = movies, geom = "bar", binwidth = 0.1)
```

```
## Warning: position_stack requires constant width: output may be incorrect
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6.png) 

If, however, we want to see the number of votes cast in each
category, we need to weight by the votes variable

```r
qplot(rating, data = movies, geom = "bar", binwidth = 0.1, weight = votes, ylab = "votes")
```

```
## Warning: position_stack requires constant width: output may be incorrect
```

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7.png) 


```r
m <- ggplot(movies, aes(x = votes))
```

### Transformed Scales
For transformed scales, binwidth applies to the transformed data.
The bins have constant width on the transformed scale.

```r
m + geom_histogram() + scale_x_log10()
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
```

![plot of chunk unnamed-chunk-9](figure/unnamed-chunk-91.png) 

```r
m + geom_histogram(binwidth = 1) + scale_x_log10()
```

![plot of chunk unnamed-chunk-9](figure/unnamed-chunk-92.png) 

```r
m + geom_histogram() + scale_x_sqrt()
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
```

![plot of chunk unnamed-chunk-9](figure/unnamed-chunk-93.png) 

```r
m + geom_histogram(binwidth = 10) + scale_x_sqrt()
```

![plot of chunk unnamed-chunk-9](figure/unnamed-chunk-94.png) 


```r
# For transformed coordinate systems, the binwidth applies to the raw data.
# The bins have constant width on the original scale.

# Using log scales does not work here, because the first bar is anchored at
# zero, and so when transformed becomes negative infinity.  This is not a
# problem when transforming the scales, because no observations have 0
# ratings.
```


```r
m + geom_histogram(origin = 0) + coord_trans(x = "log10")
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
```

![plot of chunk unnamed-chunk-11](figure/unnamed-chunk-111.png) 

```r
# Use origin = 0, to make sure we don't take sqrt of negative values
m + geom_histogram(origin = 0) + coord_trans(x = "sqrt")
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
```

![plot of chunk unnamed-chunk-11](figure/unnamed-chunk-112.png) 

```r
m + geom_histogram(origin = 0, binwidth = 1000) + coord_trans(x = "sqrt")
```

![plot of chunk unnamed-chunk-11](figure/unnamed-chunk-113.png) 

### Transforming the y axis.
You can also transform the y axis.  Remember that the base of the bars
has value 0, so log transformations are not appropriate

```r

m <- ggplot(movies, aes(x = rating))
m + geom_histogram(binwidth = 0.5) + scale_y_sqrt()
```

![plot of chunk unnamed-chunk-12](figure/unnamed-chunk-121.png) 

```r
m + geom_histogram(binwidth = 0.5) + scale_y_reverse()
```

```
## Warning: Stacking not well defined when ymin != 0
```

![plot of chunk unnamed-chunk-12](figure/unnamed-chunk-122.png) 

### Setting aesthetics to fixed value

```r

m + geom_histogram(colour = "darkgreen", fill = "white", binwidth = 0.5)
```

![plot of chunk unnamed-chunk-13](figure/unnamed-chunk-13.png) 


```r
# Use facets
m <- m + geom_histogram(binwidth = 0.5)
m + facet_grid(Action ~ Comedy)
```

![plot of chunk unnamed-chunk-14](figure/unnamed-chunk-14.png) 


```r
# Often more useful to use density on the y axis when facetting
m <- m + aes(y = ..density..)
m + facet_grid(Action ~ Comedy)
```

![plot of chunk unnamed-chunk-15](figure/unnamed-chunk-151.png) 

```r
m + facet_wrap(~mpaa)
```

![plot of chunk unnamed-chunk-15](figure/unnamed-chunk-152.png) 


```r
# Multiple histograms on the same graph see ?position, ?position_fill, etc
# for more details.
set.seed(6298)
diamonds_small <- diamonds[sample(nrow(diamonds), 1000), ]
ggplot(diamonds_small, aes(x = price)) + geom_bar()
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
```

![plot of chunk unnamed-chunk-16](figure/unnamed-chunk-161.png) 

```r
hist_cut <- ggplot(diamonds_small, aes(x = price, fill = cut))
hist_cut + geom_bar()  # defaults to stacking
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
```

![plot of chunk unnamed-chunk-16](figure/unnamed-chunk-162.png) 

```r
hist_cut + geom_bar(position = "fill")
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
```

![plot of chunk unnamed-chunk-16](figure/unnamed-chunk-163.png) 

```r
hist_cut + geom_bar(position = "dodge")
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
```

![plot of chunk unnamed-chunk-16](figure/unnamed-chunk-164.png) 


```r
# This is easy in ggplot2, but not visually effective.  It's better to use a
# frequency polygon or density plot.  Like this:
ggplot(diamonds_small, aes(price, ..density.., colour = cut)) + geom_freqpoly(binwidth = 1000)
```

![plot of chunk unnamed-chunk-17](figure/unnamed-chunk-171.png) 

```r
# Or this:
ggplot(diamonds_small, aes(price, colour = cut)) + geom_density()
```

![plot of chunk unnamed-chunk-17](figure/unnamed-chunk-172.png) 

```r
# Or if you want to be fancy, maybe even this:
ggplot(diamonds_small, aes(price, fill = cut)) + geom_density(alpha = 0.2)
```

![plot of chunk unnamed-chunk-17](figure/unnamed-chunk-173.png) 

```r
# Which looks better when the distributions are more distinct
ggplot(diamonds_small, aes(depth, fill = cut)) + geom_density(alpha = 0.2) + 
    xlim(55, 70)
```

```
## Warning: Removed 2 rows containing non-finite values (stat_density).
```

![plot of chunk unnamed-chunk-17](figure/unnamed-chunk-174.png) 


