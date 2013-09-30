 set.seed(1) 
 col1 <- c(rep('happy',9), rep('sad', 9)) 
 col2 <- rep(c(rep('alpha', 3), rep('beta', 3), rep('gamma', 3)),2) 
 dates <- as.Date(rep(c('2009-10-13', '2009-10-14', '2009-10-15'),6)) 
 score=rnorm(18, 10, 3) 
 df1<-data.frame(col1=col1, col2=col2, Date=dates, score=score) 

df1
########################################################################
aves = aggregate(df1$score, by=list(col1=df1$col1, col2=df1$col2), mean) 
aves

########################################################################
results = merge(df1, aves) 
results
