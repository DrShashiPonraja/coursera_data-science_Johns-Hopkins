##Question 1

if( !file.exists('./data') ){
  dir.create('./data')
}

fileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
download.file(fileURL,destfile = './data/acs.csv', method='curl')

acs<-read.csv('./data/acs.csv')
summary(acs)

( acs[(acs$ACR==3 & acs$AGS==6),] )

acs$agricultureLogical <- ((acs$ACR == 3) & (acs$AGS == 6))

which(acs$agricultureLogical)


## Question 2
fileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg'
download.file(fileURL,destfile = './data/myNameIsJeff.jpg', method='curl')
install.packages('jpeg')
library(jpeg)
z<-readJPEG('./data/myNameIsJeff.jpg', native=TRUE)
quantile(z, c(.3,.8))


## Question 3



fileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
download.file(fileURL,destfile = './data/IntlGDP.csv', method='curl')

fileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
download.file(fileURL,destfile = './data/IntlEduc.csv', method='curl')

IntlGDP <- read.csv('./data/IntlGDP.csv',skip=3, nrows=190)
IntlEduc <- read.csv('./data/IntlEduc.csv')

summary(IntlGDP)
summary(IntlEduc)

colnames(IntlGDP)
colnames(IntlEduc)
IntlGDP$X
IntlEduc$CountryCode
IntlGDPEduc<-merge(IntlGDP, IntlEduc, by.x ='X', by.y = 'CountryCode', all=TRUE)
colnames(IntlGDPEduc)
z<-IntlGDPEduc[order(IntlGDPEduc$"Ranking", decreasing = TRUE),,]
z$'X'

nrow(IntlGDP)
nrow(IntlEduc)

(commonCountries<-intersect(IntlGDP$X,IntlEduc$CountryCode))
length(commonCountries)
commonCountries

z$'Long.Name'[13]

highOECD <- IntlGDPEduc[IntlGDPEduc$'Income.Group' == "High income: OECD",]
highNonOECD <-IntlGDPEduc[IntlGDPEduc$'Income.Group' == "High income: nonOECD",]
nrow(highOECD)
nrow(highNonOECD)
mean((highOECD$'Ranking'))
mean(highNonOECD$'Ranking')
sum(is.na(highOECD$'Ranking'))
highOECD$'Ranking'
highNonOECD$'Ranking'
mean(highOECD$'Ranking', na.rm=TRUE)
mean(highNonOECD$'Ranking', na.rm=TRUE)


##Question 5

install.packages('Hmisc')
library(Hmisc)
IntlGDPEduc$GDPGroup <- cut2(IntlGDPEduc$'Ranking', g=5)
##IntlGDPEduc$GDPGroup2 < - cut(IntlGDPEduc$'Ranking', breaks= quantile(IntlGDPEduc$'Ranking',5))
IntlGDPEduc$'GDPGroup'
colnames(IntlGDPEduc)

table(IntlGDPEduc$'GDPGroup', IntlGDPEduc$'Income.Group')
