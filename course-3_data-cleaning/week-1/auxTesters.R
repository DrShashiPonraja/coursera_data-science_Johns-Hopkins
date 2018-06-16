source('auxiliary.R')
dd<-function(lengthOfTime= 100000){
  x <- 1:lengthOfTime
  for (i in seq_along(x))  x[i] <- x[i]+1
}

g<-testRunTime10(dd,lengthOfTime=10000000)
d<-testRunTime10(dd,lengthOfTime=1000000)
z<-rbind(g,d)

z
