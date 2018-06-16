##Question 1

if( !file.exists('./data') ){
  dir.create('./data')
}

fileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
download.file(fileURL,destfile = './data/acsData.csv', method='curl')

acsData<-read.csv('./data/acsData.csv')

z<-strsplit(names(acsData), 'wgtp')
z[123]

##Question 2


fileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
download.file(fileURL,destfile = './data/GDPData.csv', method='curl')

GDPData<-read.csv('./data/GDPData.csv', skip=4, nrows=190)
names(GDPData)
GDPData$X
GDPData$X.4

GDPData$DollarNoComma <- as.numeric(gsub(",","",GDPData$X.4))
GDPData$DollarNoComma
mean(GDPData$DollarNoComma)

## Question 3

grep("^United",GDPData$X.3)
grep("^United",countryNames)
grep
GDPData$X.3[186]


##Question 4


fileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
download.file(fileURL,destfile = './data/IntlEduc.csv', method='curl')
IntlEduc <- read.csv('./data/IntlEduc.csv')

summary(GDPData)
summary(IntlEduc)

colnames(GDPData)
colnames(IntlEduc)
GDPData$X
IntlEduc$CountryCode
IntlGDPEduc<-merge(GDPData, IntlEduc, by.x ='X', by.y = 'CountryCode', all=TRUE)

names(IntlGDPEduc)

grepl('^Fiscal', IntlGDPEduc$Special.Notes)
IntlGDPEduc$FiscalListed <- grepl('^Fiscal', IntlGDPEduc$Special.Notes)
IntlGDPEduc$Special.Notes
names(IntlGDPEduc)

FiscalListed <- IntlGDPEduc[IntlGDPEduc$FiscalListed == TRUE,]

sum(grepl('June', FiscalListed$Special.Notes))

install.packages('quantmod')
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

z<-data.frame(sampleTimes)
sum(grepl('^2012', sampleTimes))
head(z)
z$day <- weekdays(as.Date(z$sampleTimes))
z$day

MondaySamples<-z[z$day == "Monday",]
MondaySamples
sum(grepl('^2012', MondaySamples$sampleTimes))
