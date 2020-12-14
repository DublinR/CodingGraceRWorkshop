###################################################
# Segment 1A-1

# Preceding line with the symbol ’#’ makes it a comment in R
# The following line produce a single value of the standard normal cumulative
# function. It is the value corresponding to the first value in the table

pnorm(-3.4)

#[1] 0.0003369293
#Then the first row of the table

z=seq(-3.4,-3.31,by=0.01)
pnorm(z)

# [1] 0.0003369293 0.0003494631 0.0003624291 0.0003758409 0.0003897124
# [6] 0.0004040578 0.0004188919 0.0004342299 0.0004500872 0.0004664799
# And all values from the table

z=seq(-3.4,3.4,by=0.01)
pnorm(z)


###################################################
# Segment 1A-2


#Plotting the density function of the standard normal variable
z=seq(-3,3,by=0.01)
plot(z,dnorm(z),type=’l’,col="red",lwd=4)

#Plotting the cumulative distribution function (that one from the table)
plot(z,pnorm(z),type=’l’,col="red",lwd=4)

#And plotting them one at the top of the other
par(mfrow=c(2, 1))
plot(z,dnorm(z),type=’l’,col="red",lwd=4)
plot(z,pnorm(z),type=’l’,col="red",lwd=4)

#Side by side
par(mfrow=c(1, 2))
plot(z,dnorm(z),type=’l’,col="red",lwd=4)
plot(z,pnorm(z),type=’l’,col="red",lwd=4)
# Preceding line with the symbol ’#’ makes it a comment in R
# The following line produce a single value of the standard normal cumulative
# function. It is the value corresponding to the first value in the table

pnorm(-3.4)

#[1] 0.0003369293
#Then the first row of the table

z=seq(-3.4,-3.31,by=0.01)
pnorm(z)

# [1] 0.0003369293 0.0003494631 0.0003624291 0.0003758409 0.0003897124
# [6] 0.0004040578 0.0004188919 0.0004342299 0.0004500872 0.0004664799
# And all values from the table

z=seq(-3.4,3.4,by=0.01)
pnorm(z)





#Plotting the density function of the standard normal variable
z=seq(-3,3,by=0.01)
plot(z,dnorm(z),type=’l’,col="red",lwd=4)

#Plotting the cumulative distribution function (that one from the table)
plot(z,pnorm(z),type=’l’,col="red",lwd=4)

#And plotting them one at the top of the other
par(mfrow=c(2, 1))
plot(z,dnorm(z),type=’l’,col="red",lwd=4)
plot(z,pnorm(z),type=’l’,col="red",lwd=4)

#Side by side
par(mfrow=c(1, 2))
plot(z,dnorm(z),type=’l’,col="red",lwd=4)
plot(z,pnorm(z),type=’l’,col="red",lwd=4)
