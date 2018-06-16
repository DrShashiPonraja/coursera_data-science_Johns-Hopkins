if( !file.exists('./data') ){
  dir.create('./data')
}

fileURL <- 'https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD'
download.file(fileURL,destfile = './data/restaurants.csv', method='curl')

restData<-read.csv('./data/restaurants.csv')
head(restData,n=3)

summary(restData)
#does some generic statistics on the data

str(restData)
#info about the data frame structure

quantile(restData$councilDistrict, na.rm=TRUE)

quantile(restData$councilDistrict, probs=c(0.5,0.75,0.9),na.rm=TRUE)
## quantile functions

table(restData$zipCode,useNA = 'ifany')
## tallies the frequencies of each variable in the column
## useNA wil list all false values


neighborhood_restaurant_frequency<-data.frame(table(restData$neighborhood,useNA = 'ifany'))

neighborhood_restaurant_frequency[order(neighborhood_restaurant_frequency$Freq),]

data.frame(table(restData$councilDistrict,restData$zipCode))

sum(is.na(restData$councilDistrict))
##tallies total amount of NAs in council district
any(is.na(restData$councilDistrict))
## tallies whether any NAs exist, return true/false
all(restData$zipCode>0)
## checks if all values meet that condition
## ?? is there an easy way to tally all values above a certain value
## pretty sure there is, i wrote the code for one of the earlier things can't remember LOL
nrow(restData[(restData$councilDistrict > 5),])

colSums(is.na(restData) )
## quantifies all values in table that is NA or undefined
colSums(restData[,c('councilDistrict','zipCode')])
## adds everything up

all(colSums(is.na(restData))==0)

table(restData$zipCode %in% c('21212','21213'))
                 
data("UCBAdmissions")
DF <- as.data.frame(UCBAdmissions)
summary(DF)
ncol(DF)
DF

xt<-xtabs(Freq ~ Gender + Admit, data=DF)
xt
## I've got no idea how that works syntax-wise..but essentially it added up all the frequencies

rep(1:9, len=5)
rep(1:9, len=54)
rep(1:9, len= 13)
##1st variable is the sequence, variable length is how long it goes
##sequence continuously loops

(warpbreaks$replicate <- rep(1:9,len=54))
warpbreaks

xt<-xtabs(breaks ~., data=warpbreaks)
xt
ftable(xt)
## flat table. another piece of wizardry

fakeData <- rnorm(1e5)
object.size(fakeData)
print ( object.size(fakeData),units='MB' )
