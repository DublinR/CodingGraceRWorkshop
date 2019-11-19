## Page 267 Correlation Matrix
## Page 271 Plotting a Function
## Page 274 Network Graphs
## Page 281 Heat Maps
## Page 283 3d Scatterplots
## Page 291 Dendrograms
## Page 294 Vector Fields
## Page 302 Mosaic Plot


########################### Page 281

p + geom_tile() +
 scale_x_continuous(breaks = seq(1940, 1976, by = 4)) +
 scale_y_reverse() +
 scale_fill_gradient2(midpoint=50, mid="grey70", limits=c(0,100))



############################ Page 282

# You may need to install first, with install.packages("rgl")
library(rgl)
plot3d(mtcars$wt, mtcars$disp, mtcars$mpg, type="s", size=0.75, lit=FALSE)



# Function to interleave the elements of two vectors
interleave <- function(v1, v2) as.vector(rbind(v1,v2))
# Plot the points
plot3d(mtcars$wt, mtcars$disp, mtcars$mpg,
 xlab="Weight", ylab="Displacement", zlab="MPG",
 size=.75, type="s", lit=FALSE)
# Add the segments
segments3d(interleave(mtcars$wt, mtcars$wt),
 interleave(mtcars$disp, mtcars$disp),
 interleave(mtcars$mpg, min(mtcars$mpg)),
 alpha=0.4, col="blue")

############################## Page 284
# Make plot without axis ticks or labels
plot3d(mtcars$wt, mtcars$disp, mtcars$mpg,
 xlab = "", ylab = "", zlab = "",
 axes = FALSE,
 size=.75, type="s", lit=FALSE)
segments3d(interleave(mtcars$wt, mtcars$wt),
 interleave(mtcars$disp, mtcars$disp),
 interleave(mtcars$mpg, min(mtcars$mpg)),
 alpha = 0.4, col = "blue")
# Draw the box.
rgl.bbox(color="grey50", # grey60 surface and black text
 emission="grey50", # emission color is grey50
 xlen=0, ylen=0, zlen=0) # Don't add tick marks
# Set default color of future objects to black

############################## Page 292

## Dendrogram Page 292

library(gcookbook) # For the data set
# Get data from year 2009
c2 <- subset(countries, Year==2009)
# Drop rows that have any NA values
c2 <- c2[complete.cases(c2), ]
# Pick out a random 25 countries
# (Set random seed to make this repeatable)
set.seed(201)
c2 <- c2[sample(1:nrow(c2), 25), ]

rgl.material(color="black")

############################## Page 298

# Get USA map data
usa <- map_data("usa")
# Map speed to colour, and set go from "grey80" to "darkred"
ggplot(islicesub, aes(x=x, y=y)) +
 geom_segment(aes(xend = x+vx/50, yend = y+vy/50, colour = speed),
 arrow = arrow(length = unit(0.1,"cm")), size = 0.6) +
 scale_colour_continuous(low="grey80", high="darkred") +
 geom_path(aes(x=long, y=lat, group=group), data=usa) +
 coord_cartesian(xlim = range(islicesub$x), ylim = range(islicesub$y))



############################## Page 299

# Keep 1 out of every 5 values in x and y, and 1 in 2 values in z
keepx <- every_n(unique(isabel$x), by=5)
keepy <- every_n(unique(isabel$y), by=5)
keepz <- every_n(unique(isabel$z), by=2)
isub <- subset(isabel, x %in% keepx & y %in% keepy & z %in% keepz)
ggplot(isub, aes(x=x, y=y)) +
 geom_segment(aes(xend = x+vx/50, yend = y+vy/50, colour = speed),
 arrow = arrow(length = unit(0.1,"cm")), size = 0.5) +
 scale_colour_continuous(low="grey80", high="darkred") +
 facet_wrap( ~ z)
