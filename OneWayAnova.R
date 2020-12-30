# The results obtained in an investigation into the stability of a fluorescent re-agent stored 
# under three different conditions. 
# The values for the fluorescence signals are:

#################################################################################
y1 = c(23, 23, 20, 21)      # group 1
y2 = c(27, 29, 25, 23, 24)  # group 2
y3 = c(24, 26, 24)          # group 3

y = c(y1, y2, y3)           # combining the data

group = c(1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3) 
#################################################################################

#Alternative Approach – Useful for larger data sets 
#group = c(rep(1,4),rep(2,5),rep(3,3))

group = factor(group) 

# construct data as a data frame
flordata = data.frame(y,group)

#################################################################################

# carry out the ANOVA procedure
model = aov(y ~ group, flordata) 
summary(model)


#################################################################################
