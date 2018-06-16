source('auxiliary.R')
## question 1
## The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
##
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
##
## and load the data into R. The code book, describing the variable names is here:
  
##  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf

## How many properties are worth $1,000,000 or more?

if (!file.exists('data')){
  dir.create('data')
}
## get housing data
fileUrl<-'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
download.file(fileUrl, destfile = 'data/IdahoHouseData.csv', method='curl')

## get the Code book
fileUrl<-'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf'
download.file(fileUrl, destfile = 'data/AmericanCommSurveyCodeBook.pdf')

list.files('data')

## at this point, I manually read the code book in pdf format, and found that the VAL column
## listed house prices based on price ranges, with 24 corresponding to the >$1,000,000 price range

IdahoHouseData <- read.csv('data/IdahoHouseData.csv', sep=",", header=TRUE)
nrow(subset(IdahoHouseData, VAL == 24))

## question 2
## Use the data you loaded from Question 1. 
## Consider the variable FES in the code book. Which of the "tidy data" principles does this variable violate?

## Reviewed code book manually, and it stores both male and female occupation status / presence.
## Multiple variables in one column = not tidy!

## question 3
## Download the Excel spreadsheet on Natural Gas Aquisition Program here:
##  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx
## Read rows 18-23 and columns 7-15 into R and assign the result to a variable called dat
## What is the value of: sum(dat$Zip*dat$Ext,na.rm=T)

fileUrl<-'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx'
download.file(fileUrl, destfile = 'data/NaturalGasAcquisition.xlsx')

## tried using xlsx, but java was being a b****
## used openxlsx instead cuz why not
library(openxlsx)

rowIndex<-18:23
colIndex<-7:15
dat<-read.xlsx('data/NaturalGasAcquisition.xlsx', cols=colIndex, rows=rowIndex)
sum(dat$Zip*dat$Ext,na.rm=T)

## Question 4
## Read the XML data on Baltimore restaurants from here:
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml
## How many restaurants have zipcode 21231?

library(XML)
fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml'
download.file(fileUrl, destfile = 'data/BaltimoreRestaurants.xml')

BaltimoreRestaurantData<-xmlTreeParse('data/BaltimoreRestaurants.xml', useInternal=TRUE)
rootNode<-xmlRoot(BaltimoreRestaurantData)
ZipList<-xpathApply(rootNode,"//row/zipcode",xmlValue)
checkZipCode<-function(testZipCode, correctZipCode = 21231){
  if (testZipCode == correctZipCode){
    return (TRUE)
  }
  return (FALSE)
}

RestaurantsIn21231<-sapply(ZipList,checkZipCode, 21231)
length(which(RestaurantsIn21231))


## The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
##  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv
## using the fread() command load the data into an R object DT
## The following are ways to calculate the average value of variable pwgtp15
## broken down by sex
## which delivers the fastest user time?

library (data.table)
fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv'
download.file(fileUrl, destfile = 'data/IdahoHouseData2.csv')
DT <- fread('data/IdahoHouseData2.csv')

##doesn't work
rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]

##gives invalid answer
mean(DT$pwgtp15,by=DT$SEX)

## test each piece of code 400 times, and see which one comes out on top

option1<-function(DT){
  (mean(DT[DT$SEX==1,]$pwgtp15))
  (mean(DT[DT$SEX==2,]$pwgtp15))
}

option2<-function(DT){
  mean(DT$pwgtp15,by=DT$SEX)
}

option3<-function(DT){
  rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
}

option4<-function(DT){
  sapply(split(DT$pwgtp15,DT$SEX),mean)
}

option5<-function(DT){
  tapply(DT$pwgtp15,DT$SEX,mean) 
}
option6<-function(DT){
  DT[,mean(pwgtp15),by=SEX]
}
option1(DT)
option2(DT)#rubbish answer
option3(DT)#syntax error
option4(DT)
option5(DT)
option6(DT)

testRunTime400(option1, DT)
testRunTime400(option2, DT)
testRunTime400(option3, DT)
testRunTime400(option4, DT)
testRunTime400(option5, DT)
testRunTime400(option6, DT)

  system.time({
    looper<-1:1000
    for (i in seq_along(looper)){
      mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
    }
  })

  system.time({
    sapply(split(DT$pwgtp15,DT$SEX),mean)
  })
  

  
  system.time({
    DT[,mean(pwgtp15),by=SEX]
  })

  system.time({
    tapply(DT$pwgtp15,DT$SEX,mean)
  })
  


