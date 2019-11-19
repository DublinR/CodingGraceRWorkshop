## Page 46/47
ggplot(tophit, aes(x=avg, y=name)) +
 geom_segment(aes(yend=name), xend=0, colour="grey50") +
 geom_point(size=3, aes(colour=lg)) +
 scale_colour_brewer(palette="Set1", limits=c("NL","AL")) +
 theme_bw() +
 theme(panel.grid.major.y = element_blank(), # No horizontal grid lines
 legend.position=c(1, 0.55), # Put legend inside plot area
 legend.justification=c(1, 0.5))


ggplot(tophit, aes(x=avg, y=name)) +
 geom_segment(aes(yend=name), xend=0, colour="grey50") +
 geom_point(size=3, aes(colour=lg)) +
 theme_bw() +
 theme(panel.grid.major.y = element_blank()) +
 facet_grid(lg ~ ., scales="free_y", space="free_y")


##########################################

# Load plyr so we can use ddply() to create the example data set
library(plyr)
# Summarize the ToothGrowth data
tg <- ddply(ToothGrowth, c("supp", "dose"), summarise, length=mean(len))
# Map supp to colour
ggplot(tg, aes(x=dose, y=length, colour=supp)) + geom_line()
# Map supp to linetype
ggplot(tg, aes(x=dose, y=length, linetype=supp)) + geom_line()

## Page 55

ggplot(tg, aes(x=dose, y=length, shape=supp)) + geom_line() +
 geom_point(size=4) # Make the points a little larger
ggplot(tg, aes(x=dose, y=length, fill=supp)) + geom_line() +
 geom_point(size=4, shape=21) # Also use a point with a color fill




## Page 58

# Load plyr so we can use ddply() to create the example data set
library(plyr)
# Summarize the ToothGrowth data
tg <- ddply(ToothGrowth, c("supp", "dose"), summarise, length=mean(len))


## Page 59

# If both lines have the same properties, you need to specify a variable to
# use for grouping
ggplot(tg, aes(x=dose, y=length, group=supp)) +
 geom_line(colour="darkgreen", size=1.5)
# Since supp is mapped to colour, it will automatically be used for grouping
ggplot(tg, aes(x=dose, y=length, colour=supp)) +
 geom_line(linetype="dashed") +
 geom_point(shape=22, size=3, fill="white")
ggplot(tg, aes(x=dose, y=length, colour=supp)) +
 geom_line() +
 scale_colour_brewer(palette="Set1")


ggplot(BOD, aes(x=Time, y=demand)) +
 geom_line() +
 geom_point(size=4, shape=22, colour="darkred", fill="pink")
