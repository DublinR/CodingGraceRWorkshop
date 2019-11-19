##################################################################
# Part 1 - A: load R packages

install.packages("ggplot2")

# PhD Thesis by Hadley Wickham under Prof. Dianne Cook and Prof. Heike Hofffman 
# Iowa State University 

###################################################################
# Part 1 - B
# Install Other packages

install.packages("ggfortify")
install.packages("GGally")
install.packages("WVplot")   # WinVector Plot

###################################################################
## 2. Load the R packages

library(GGally)
library(ggplot2)
library(WVplots)

###################################################################

## 3. ggplot2 scatterplot

   # Basic Syntax

ggplot(data=mtcars, aes(x = mpg, y = wt)) + geom_point()

   # ---------------------------------------------------- # 

   # Layers

p1 <- ggplot(data=mtcars, aes(x = mpg, y = wt)) 
p1

p2 <- p1 + geom_point()
p2

p3 <- p1 + stat_smooth()
p3

# ---------------------------------------------------- # 

# Enhancements
p3 + coord_flip()
p3 + ggtitle("my lovely scatter plot")

#--------------------------------------------------------#

# Relationship between variables
#  - vs : Categorical
#  - mpg : numeric
#  - factor : converts numeric to categorical

p1 <- ggplot(data=mtcars, aes(x = factor(vs) , y = mpg)) 
p1 + geom_boxplot()

#--------------------------------------------------------#

# see what this does
p1 + geom_boxplot() + coord_flip()


#--------------------------------------------------------#

## 3. ggplot2 histogram and density plot

p1 <- ggplot(data=mtcars, aes(x = mpg))

p1 + geom_histogram(binwidth=3)

p1 + geom_density(col="red")



