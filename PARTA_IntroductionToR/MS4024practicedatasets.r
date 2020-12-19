



## MS4024 Data Sets
Air Quality
Attitude
Austres
BJSales
BOD
Cars
Discoveries
Formaldehyde
Indometh
InsectSprays
JohnsonJohnson
Lake Huron
lh
LifeCycleSavings
Nile
Nottem
Orange
PlantGrowth
Puromycin
Quakes
Rivers
Stackloss
SunSpots
Theoph
Trees
UKgas
MS4024 Data Sets
 
Air Passengers
#12 year period
plot(AirPassengers)
Yr=seq(1:12)
 
M12 = seq(1:12)*12
M11 = M12-1
M5 =  M12 -7
 
ap.dec = AirPassengers[M12]
ap.nov = AirPassengers[M11]
ap.may = AirPassengers[M5] 
 
plot(ap.dec,type="l",ylim=c(0,600))
points(ap.may,type="l",col="red")
 
 
 
Air Quality
plot(airquality$Wind,airquality$Temp)
#Correlation
#Simple linear regression 
 
####################################################
#reduce the data set to exclude missing values (NAs)
#for the purposes of this project, make up some new data
 
X=c(5,10,25:27,32:37,39,42,43,45,46,52:61,65,72,75,83,84,102, 103,107,115,119,150)
Y=c(6,11,96:98)
airquality$Solar.R[Y] =c(150,175,200,250,300)
AQ1=airquality[-X,]
 



Attitude
#run correlation procedures
cor.test(attitude$complaints,attitude$learning)
cor.test(attitude$learning,attitude$critical)
#Select a DV and relevant IVs.
#Run MLR procedures accordingly
fit1 = lm(attitude$complaints ~ attitude$learning+attitude$critical)
 
summary(fit1)
 
# discuss the slope and intercept estimates.  what are the p-values?
# try other models
 
Austres
Ar2=austres[4:87]
Qtrs=seq(1:84)
length(Ar2)
plot(Ar2,Qtrs)
plot(austres)
plot(austres)
BJSales
#Time series data
 
plot(BJsales)
Time=seq(1:150)
 
fit1=lm(BJsales ~Time)            #Naive Analysis
 
abline(coef(fit1),col="red")
 
#Analyse residuals - check for normality.
resid(fit1)
 
 
#Analysis casewise differences
BS.diff = diff(BJsales)
 
#Are they normally distributed? 
shapiro.test(BS.diff)
 
 
BOD
 
# scatterplot
 
plot(BOD[,1],BOD[,2])
 
 
cor.test(BOD[,1],BOD[,2])
 
# any outliers?
 
fit1=lm( BOD[,2]~BOD[,1])
 
coef(fit1)
resid(fit1)
 
 
Cars
 
plot(cars$speed,cars$dist)
 
fit1= lm(cars$dist~ cars$speed)
 
#pick an outlier. re-run the analysis omitting this outlier to assess the influence of the outlier.
 
 
Discoveries
#Time series data
#Run normality tests  on the case-wise differences
 
hist(diff(discoveries))
 
#test the mean of differences is zero?
t.test(diff(discoveries))
Formaldehyde
# scatterplot
 
plot(Formaldehyde[,1],Formaldehyde[,2])
 
 
cor.test(Formaldehyde[,1],Formaldehyde[,2])
 
# any outliers?
 
fit1=lm( Formaldehyde[,2]~Formaldehyde[,1])
 
coef(fit1)
resid(fit1)
 
Indometh
###        6 Subjects measured at 11 times - split data set into 6
 
IM.1 =Indometh[1:11,]
IM.2=Indometh[12:22,]
IM.3=Indometh[ 23:33,]
IM.4=Indometh[34:44,]
IM.5=Indometh[45:55,]
IM.6=Indometh[56:66,]
 
plot(IM.3$time,IM.3$conc,type="b",col="blue",pch=14)
points(IM.4$time,IM.4$conc,type="b",col="red",pch=16)
#Subset  the data to present data after
IM.After =Indometh[Indometh$time>=2,]
 
#get summary statistics ofeach
# Are the case wise differences normally distributed?
diff(IM.4[,3])
qqnorm(diff(IM.4[,3]))
qqline(diff(IM.4[,3]))
shapiro.wilk(diff(IM.4$conc))
InsectSprays
?InsectSprays
 
# None of the methodologies are suitable in the first instances
# Lets split the data up into two halves and run a t- test
 
IS1=InsectSprays[1:36,1]    #first column
IS2=InsectSprays[37:72,1]    #first column
summary(IS1);summary(IS2)
t.test(IS1,IS2)
 
# Discuss the results of this t-test
 
 
JohnsonJohnson
plot(JohnsonJohnson)
 
#time series analysis over 21 years
 
#part 1
#get the casewise differences
 
diffJJ = diff(JohnsonJohnson)
 
summary(diffJJ)
 
###################
# split data set by quarter.
###################
Yr=seq(1:21)        # Index of year numbers
seq4=c(1:21)*4 
seq3=seq4-1
seq2=seq4-2
seq3=seq4-3
 
JJQ1=JohnsonJohnson[seq1]
JJQ2=JohnsonJohnson[seq2]
JJQ3=JohnsonJohnson[seq3]
JJQ4=JohnsonJohnson[seq4]
 
plot(Yr,JJQ1) 
 
Lake Huron
 
 
Lake Huron data
plot(LakeHuron)
diff(LakeHuron)
#Average difference ?
#T-test that the mean difference is zero?
t.test(diff(LakeHuron))                                 #Explain results.
# Are Differences Normally Distributed?
 
lh
hist(lh)
diff.lh=diff(lh)
mean(diff.lh)
fivenum(diff.lh)
 
#Test for Normality
 
hist(diff.lh)
shapiro.test(diff.lh)
qqnorm(diff.lh)
qqline(diff.lh)
 

######################################## 
## LifeCycleSavings
#pick a DV and run correlation and regression procedures with the IVs
 
cor.test(LifeCycleSavings$sr,LifeCycleSavings$dpi)
 
fit1 <- lm(sr ~ pop15 + pop75 + dpi + ddpi, data = LifeCycleSavings) 
 

######################################## 
## Nile
 
plot(Nile)
abline(h=mean(Nile),col="red")
diff(Nile)
#Average difference ?
hist(Nile)
t.test(Nile,mu=900)
#T-test that the mean difference is zero?
t.test(diff(Nile))                               #Explain results.
# Are Differences Normally Distributed?
 

Nottem
#20 year period
Yr=seq(1:20)
 
#split the data up into months
 
M12=seq(1:20)*12
M11=M12-1
M10=M12-2
 
#etc etc
 
nt.dec = nottem[M12]
nt.nov = nottem[M11]
nt.oct = nottem[M10] 
 
plot(Yr,nt.dec,type="l")
#fit a linear model

########################################
 
Orange
plot(Orange$age,Orange$circumference)
 
fit1 = lm(Orange$circumference ~ Orange$age)
 
resid(fit1)
 
#are the residuals normally distributed?
hist(resid(fit1))
 
 
#######################
# split the data into 5, one for each tree type
 
boxplot(Orange$circumference ~ Orange$Tree)
 
O1=Orange[1:7,]
O2=Orange[8:14,]
O3=Orange[15:21,]
O4=Orange[22:28,]
O5=Orange[29:35,] 
 

######################################## 
## PlantGrowth
 
boxplot(weight ~ group, data=PlantGrowth)
 
Plant1 = PlantGrowth[1:10,]
Plant2 = PlantGrowth[11:20,]
Plant3 = PlantGrowth[21:30,]
 
t.test(Plant1,Plant2)
 
 

########################################
# Precip
#regionalise the data set
PNW=c(16,50)
CA=c(17,18,19,20,21,22,27,28,29,30)
NE=c(2,10,11,24,25,26,51,52)
SE=c(1, 4,9,12:14,23)

########################################
# Puromycin
 
#split into two groups : treated and untreated
 
Pm.t = Puromycin[1:12,]
Pm.u = Puromycin[13:23,]
 
summary(Pm.t) ;names(Pm.t)
summary(Pm.u) ;names(Pm.u)
 
#regression model for both subgroups
 
 
lm(Pm.u$conc~Pm.u$rate)        
 
#perform suggest analyses on both groups
 

########################################


Quakes
#how many incidents were there?
 
par(mfrow=c(2,1))
boxplot(quakes$lat,horizontal=TRUE)
boxplot(quakes$long,horizontal=TRUE)


par(mfrow=c(1,1))
 
#estimate where the majority of quakes take place ( in terms of long. and lat.)
 
plot(quakes$long,quakes$lat) 
 
# which sectors are worst hit?
 
# Regression Analysis
# look at magnitude and number of stations specifically
Rivers
#exploratory data analysis
mean(rivers)
median(rivers)
boxplot(rivers)
 
 
 
Stackloss
 
# choose stackloss as DV
# choose other variables as IVs
# Run correlations and regression models
# try out MLR using two IVs
 
cor.test(stackloss$stack.loss,stackloss$Air.Flow)
 
 
SunSpots
#235 year period
Yr=seq(1:235)
 
#split the data up into months
 
M12=seq(1:235)*12
M11=M12-1
M10=M12-2
 
#etc etc
 
ss.dec = sunspots[M12]
ss.nov = sunspots[M11]
ss.oct = sunspots[M10] 
 
plot(Yr,ss.dec,type="l")
# fit a linear model as a naive analysis 
# check the residuals. Are they normal?
 
###################################

### Theoph
plot(Theoph$conc ,Theoph$Time)
#get parameters (slope,intercept, correlation, coefficient of determination)
 
# subset the data by subject 
 
Th.1 = Theoph[Theoph$Subject==1,]
names(Th.1)
summary(Th.1)
 
#compare the parameters of different subjects 
 
####################################### 
# Trees
# use Girth as a dependent variable
# use

########################################
UKgas
#UKgas
Q4=seq(1:27)*4
Q3=Q4-1; Q2=Q4-2;Q1=Q4-3
UKgas[Q1] ; UKgas[Q2];UKgas[Q3];UKgas[Q4]
plot(UKgas[Q2])
plot(UKgas[Q3])
plot(UKgas[Q4])
Year=seq(1:27)
# #     lm(UKgas[Qname]~Year)
Yrname=Year+1959; Yrname
plot(Yrname,UKgas[Q3],type="l")
Fit1=lm(UKgas[Q3]~Yrname)
abline(coef(Fit1),col="red")


 


 
 
 
 
