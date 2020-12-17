
install.packages('sf')
library(sf)

# install.packages(c("sf", "tidyverse", "devtools"))


devtools::install_github("tidyverse/ggplot2")

```{r}
(pt = st_point(c(2,4)))
```


(pt_bin = st_as_binary(pt))



st_as_sfc(list(pt_bin))[[1]]



st_dimension(pt)
st_intersects(pt, pt, sparse = FALSE)



package `sf` uses simple R structures to store geometries:



str(pt)
str(st_linestring(rbind(c(0,0), c(0,1), c(1,1))))
str(st_polygon(list(rbind(c(0,0), c(0,1), c(1,1), c(0,0)))))



