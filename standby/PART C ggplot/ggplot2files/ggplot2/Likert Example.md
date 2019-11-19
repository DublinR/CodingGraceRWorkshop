Likert 
========================================================


```r
library(ggplot2)
library(reshape2)
library(RColorBrewer)
library(likert)
```

```
## Loading required package: gridExtra
## Loading required package: grid
## Loading required package: xtable
```

```r

choices = c("Very low", "Low", "Rather low", "Neither low nor high", "Rather high", 
    "High", "Very high")
for (i in 1:ncol(items)) {
    items[, i] = factor(items[, i], levels = 1:7, labels = choices, ordered = TRUE)
}
```

```
## Error: object 'items' not found
```

```r
plot(likert(items), ordered = FALSE)
```

```
## Error: object 'items' not found
```


```r
# create summary table
table_summary = likert(items)
```

```
## Error: object 'items' not found
```

```r

# reshape results
results = melt(table_summary$results, id.vars = "Item")
```

```
## Error: object 'table_summary' not found
```

```r

# reorder results
results$Item = factor(results$Item, levels = c("LT", "ST", "SemTag", "SemTagContext"))
```

```
## Error: object 'results' not found
```

```r

# some defaults
ymin = 0
text.size = 3
```



```r
ggplot(results, aes(y = value, x = Item, group = Item)) + geom_bar(stat = "identity", 
    aes(fill = variable)) + ylim(c(-5, 105)) + coord_flip() + scale_fill_manual("Response", 
    values = brewer.pal(7, "RdYlGn"), breaks = levels(results$variable), labels = levels(results$variable)) + 
    geom_text(data = table_summary$summary, y = ymin, aes(x = Item, label = paste(round(low), 
        "%", sep = "")), size = text.size, hjust = 1) + geom_text(data = table_summary$summary, 
    y = 100, aes(x = Item, label = paste(round(high), "%", sep = "")), size = text.size, 
    hjust = -0.2) + ylab("Percentage") + xlab("")
```

```
## Error: object 'results' not found
```




