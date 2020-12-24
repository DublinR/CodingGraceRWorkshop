# Writing a simple function

# X to the power of some number
# Default power is 2.


powfunc = function(X,pow=2){
return(X^pow)
}

####################################

powfunc(4)
# answer [1] 16

powfunc(4,3)
# answer [1] 64

####################################

y.fun<-function (x)
 {
 y<-(log(x))^2-x*exp(-x^3)
 }
############################################################ 
root.fun<- function ()
 {      x<-seq(0.2,2,0.01)
         y<-y.fun(x)
         win.graph()
         plot(x,y,type="l")
         abline(h=0)
         r1 <- uniroot(y.fun,lower=0.2,upper=1)$root
         r2 <- uniroot(y.fun,lower=1,upper=2)$root
         cat("Roots : ", round(r1,4), "  ", round(r2,4),"\n")
 }
 root.fun()

