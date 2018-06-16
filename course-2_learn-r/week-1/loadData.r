setwd('/Users/shashiraja/desktop/Coursera Data Science Course/learn-r-week1')
data<-read.table('hw1_data.csv', fill=TRUE,header=TRUE,sep=",")
data
x<-complete.cases(data)
x
a<-data[x,][,]

v<-subset(a, Ozone>31)
b<-subset(v,Temp>90)
b
b["Solar.R"][,1]
mean(b["Solar.R"][,])
g<-subset(a,Month==6)
g
mean(g["Temp"][,])
g<-subset(a,Month==5)
max(g["Ozone"])
