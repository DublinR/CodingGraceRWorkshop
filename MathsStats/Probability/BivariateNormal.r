
mu <- c(0,0)
sigma <- matrix(c(10,3,3,6),2,2)
rho <- sigma[1,2] / (sqrt(sigma[1,1] * sigma[2,2]))
var1 <- seq(-12,12,.7)
var2 <- var1
f <- matrix(0, length(var1), length(var1))



for( i in 1:length(var1)){
 for(j in 1:length(var1)){
 f[i,j] <- 1/(2 * pi * sqrt(sigma[1,1] * sigma[2,2] * (1-rho ^ 2)))*exp(-1 /
(2 * (1-rho ^ 2)) * ((var1[i] - mu[1]) ^ 2 / sigma[1,1] + (var2[j] - mu[2]) ^ 2 /
sigma[2,2]-2 * rho * ((var1[i] - mu[1]) * (var2[j] - mu[2])) / (sqrt(sigma[1,1]) *
sqrt(sigma[2,2]))))}}
 persp(var1, var2, f, xlab = "Variable 1", ylab = "Variable 2", zlab = "f(var1,
var2)", theta = 30, phi = 30, r = 50, d = 0.2, expand = 0.6, ltheta = 90, lphi =
180, nticks = 4)



contour(var1, var2, f, xlab = "Variable 1", ylab = "Variable 2", nlevels = 8,
drawlabels = F, xlim = c(-8,8), ylim = c(-8,8))

