

############## Page 152

library(gcookbook) # For the data set

p <- ggplot(heightweight, aes(x=ageYear, y=heightIn, colour=sex)) + geom_point()

# Add horizontal and vertical lines

p + geom_hline(yintercept=60) + geom_vline(xintercept=14)

# Add angled line

p + geom_abline(intercept=37.4, slope=1.75)


############## Page 155/156

library(gcookbook) # For the data set

p <- ggplot(subset(climate, Source=="Berkeley"), aes(x=Year, y=Anomaly10y)) + geom_line()

p + annotate("rect", xmin=1950, xmax=1980, ymin=-1, ymax=1, alpha=.1, fill="blue")

############## Page 159

#Adding Error Bars

library(gcookbook) # For the data set
# Take a subset of the cabbage_exp data for this example
ce <- subset(cabbage_exp, Cultivar == "c39")

# With a bar graph
ggplot(ce, aes(x=Date, y=Weight)) +
 geom_bar(fill="white", colour="black") +
 geom_errorbar(aes(ymin=Weight-se, ymax=Weight+se), width=.2)

# With a line graph
ggplot(ce, aes(x=Date, y=Weight)) +
 geom_line(aes(group=1)) +
 geom_point(size=4) +
 geom_errorbar(aes(ymin=Weight-se, ymax=Weight+se), width=.2)



# Put mdeaths time series data into a data frame
md <- data.frame(deaths = as.numeric(mdeaths), month = as.numeric(cycle(mdeaths)))

#########################

## 8.16. Making a Circular Graph 

# Calculate average number of deaths in each month

library(plyr) # For the ddply() function
md <- ddply(md, "month", summarise, deaths = mean(deaths))
md

#########################

# Make the base plot
p <- ggplot(md, aes(x=month, y=deaths)) + geom_line() + scale_x_continuous(breaks=1:12)

# With coord_polar
p + coord_polar()



######################## Page 203
# Connect the lines by adding a value for 0 that is the same as 12

mdx <- md[md$month==12, ]
mdx$month <- 0
mdnew <- rbind(mdx, md)

# Make the same plot as before, but with the new data, by using %+%
p %+% mdnew + coord_polar() + ylim(0, max(md$deaths))


####################### Page 208


# Convert WWWusage time-series object to data frame
www <- data.frame(minute = as.numeric(time(WWWusage)),
 users = as.numeric(WWWusage))
# Define a formatter function - converts time in minutes to a string
timeHM_formatter <- function(x) {
 h <- floor(x/60)
 m <- floor(x %% 60)
 lab <- sprintf("%d:%02d", h, m) # Format the strings as HH:MM
 return(lab)
}
# Default x axis
ggplot(www, aes(x=minute, y=users)) + geom_line()
# With formatted times
ggplot(www, aes(x=minute, y=users)) + geom_line() +
 scale_x_continuous(name="time", breaks=seq(0, 100, by=10),
 labels=timeHM_formatter)
 
############### Page 253

library(gcookbook) # For the data set
# These both have the same effect
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
 geom_bar(colour="black", position="dodge")
ggplot(cabbage_exp, aes(x=Date, y=Weight)) +
 geom_bar(aes(fill=Cultivar), colour="black", position="dodge")
# These both have the same effect
ggplot(mtcars, aes(x=wt, y=mpg, colour=cyl)) + geom_point()
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point(aes(colour=cyl))



############### Page 268

# Here is an example of how to make a correlation matrix with colored 
# squares and black labels, rotated 45 degrees along the

corrplot(mcor, method="shade", shade.col=NA, tl.col="black", tl.srt=45)



# Generate a lighter palette
col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))
corrplot(mcor, method="shade", shade.col=NA, tl.col="black", tl.srt=45,
 col=col(200), addCoef.col="black", addcolorlabel="no", order="AOE")

############## Page 271

# Return dnorm(x) for 0 < x < 2, and NA for all other x
dnorm_limit <- function(x) {
 y <- dnorm(x)
 y[x < 0 | x > 2] <- NA
 return(y)
}
# ggplot() with dummy data

p <- ggplot(data.frame(x=c(-3, 3)), aes(x=x))
p + stat_function(fun=dnorm_limit, geom="area", fill="blue", alpha=0.2) +
 stat_function(fun=dnorm)


############## Page 274

## You want to create a network graph.
## Use the igraph package. To create a graph, pass a vector containing pairs of items to
## graph(), then plot the resulting object (Figure 13-7):
##  May need to install first, with install.packages("igraph")

library(igraph)

# Specify edges for a directed graph
gd <- graph(c(1,2, 2,3, 2,4, 1,4, 5,5, 3,6))
plot(gd)
# For an undirected graph
gu <- graph(c(1,2, 2,3, 2,4, 1,4, 5,5, 3,6), directed=FALSE)
# No labels
plot(gu, vertex.label=NA)
