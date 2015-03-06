library(scatterplot3d)
## Try the postscript device or use highlight.3d = FALSE.
## example 1
z <- seq(-10, 10, 0.01)
x <- cos(z)
y <- sin(z)
scatterplot3d(x, y, z, highlight.3d=TRUE, col.axis="blue",
col.grid="lightblue", main="scatterplot3d - 1", pch=20)
## example 2
temp <- seq(-pi, 0, length = 50)
x <- c(rep(1, 50) %*% t(cos(temp)))
y <- c(cos(temp) %*% t(sin(temp)))
z <- c(sin(temp) %*% t(sin(temp)))
scatterplot3d(x, y, z, highlight.3d=TRUE,
col.axis="blue", col.grid="lightblue",
main="scatterplot3d - 2", pch=20)