##Register an application with the Github API here https://github.com/settings/applications. 
##Access the API to get information on your instructors repositories (hint: this is the url you want "https://api.github.com/users/jtleek/repos"). 
##Use this data to find the time that the datasharing repo was created. What time was it created?
##
##This tutorial may be useful (https://github.com/hadley/httr/blob/master/demo/oauth2-github.r). 
##You may also need to run the code in the base R package and not R studio.

library(ROAuth)
install.packages('RCurl')
library(RCurl)
library(XML)

myapp <- oauth_app('github', key="7baa729db663163abc67",secret="64febcbb8ba999ce0148893bd2a53b0b8e6a8627")

personal_access_token <- '1336db7183b5b961753323b945b5c91b5055bb22'

sig <- sign_oauth1.0(myapp, token=personal_access_token)

LeekRepoInfo <- GET('https://api.github.com/repos/jtleek/datasharing', sig)

LeekRepoInfo

library(jsonlite)

json1 <- content(LeekRepoInfo)
json2 <- jsonlite::fromJSON(toJSON(json1))

## 1336db7183b5b961753323b945b5c91b5055bb22
json2$created_at

## I don't understand why I needed to make a github api for this - it was readily available online?

##Question 2 and 3
## had to install mysql 
## A temporary password is generated for root@localhost: <;-i=+cb6vrI


install.packages('sqldf')
detach("package:RMySQL", unload=TRUE)
library(sqldf)

acs<-read.csv('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv')
z<-sqldf("select pwgtp1 from acs where AGEP < 50")
nrow(z)
nrow(acs)

##Question 3

sqldf("select distinct AGEP from acs")

## Question 4
## How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page:
  
##  http://biostat.jhsph.edu/~jleek/contact.html

## (Hint: the nchar() function in R may be helpful)


con <-url('http://biostat.jhsph.edu/~jleek/contact.html')
  
htmlCode <- readLines(con)
  
close(con)
htmlCode
nchar(htmlCode[10])
nchar(htmlCode[20])
nchar(htmlCode[30])
nchar(htmlCode[100])

## question 5
## Read this data set into R and report the sum of the numbers in the fourth of the nine columns.
##
## https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for
##
## Original source of the data: http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for

con <-url('https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for')

htmlCode <- readLines(con)

close(con)
htmlCode

##z<-read.table('https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for', skip=6)
htmlCode[4]
install.packages('reshape')
library(reshape)
tess <- strsplit(htmlCode[5:7],'    ')
tess
colsplit(tess)

length(tess[1])
class(tess)
as.data.frame(tess)


##correct solution, uses 'fixed width format'. Probably should've read the question first XD
z<-read.fwf('https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for', widths=c(10, 9, 4, 9, 4, 9, 4, 9, 4), skip=4)
sum(z[4])


