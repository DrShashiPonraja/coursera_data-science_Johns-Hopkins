if( !file.exists('./data') ){
  dir.create('./data')
}

fileURL <- 'https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD'
download.file(fileURL,destfile = './data/restaurants.csv', method='curl')

restData<-read.csv('./data/restaurants.csv')

s1<-seq(1,10, by = 2)
s2<-seq(1,10, length = 3)
s1
s2
x<-c(1,2,3,44,55)
seq_along(x)
x

restData$nearMe <- restData$neighborhood %in% c("Roland Park", "Homeland")
restData[(restData$nearMe == TRUE),]
table(restData$nearMe)
## add a new column which meets some test value
restData$CouncilOver5 <- (restData$councilDistrict > 5)

restData[,c('councilDistrict','CouncilOver5')]
## identifies all restaurants where council district is over 5

restData$zipWrong<- ifelse(restData$zipCode < 0, TRUE, FALSE)
table (restData$zipWrong, restData$zipCode < 0)
## another test condition


restData$zipGroups<-cut(restData$zipCode, breaks= quantile(restData$zipCode))
table(restData$zipGroups)
table(restData$zipGroups, restData$zipCode)
## cuts the data up into quantile groups
install.packages('Hmisc')
library(Hmisc)
restData$zipGroups2 <- cut2(restData$zipCode, g=4)
table(restData$zipGroups2)
class(restData$zipGroups2)
## another way to cut by quantile
## notice that the variables given are quite different
## I think its because in cut2, the left interval is 'inclusive'
## in cut, the left interval is adjusted by .1%, so all extreme values are represented.

restData$zcf <- factor(restData$zipCode)
restData$zcf
class(restData$zcf)
## factors are like a unique index


library(plyr)
restData2 <- mutate(restData, zipGroupSwish = cut2(restData$zipCode, g=5))
table(restData2$zipGroupSwish)

## mutate makes a duplicate, and allows you to add another column in at the same time
