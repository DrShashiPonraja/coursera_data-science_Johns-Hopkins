library (reshape2)
head (mtcars)

mtcars$carName<- rownames(mtcars)
carMelt <- melt(mtcars, id=c('carName','gear','cyl'), measure.vars = c('mpg','hp'))
tail(carMelt, n=3)
carMelt

## in short, there are variables that identify (hence ID), and variables that represent measurements 
## (think of the meta value tagging system used in wordpress)
## for some reason, this is the preferred format for handling data

cyldata <- dcast(carMelt, cyl ~ variable)
cyldata
## tallies the total number of measurements for all the variables, and then sorts them by cylinders

cyldata <- dcast(carMelt, cyl ~ variable, mean)
cyldata
## gets the average values of all the variables calculated against the cylinders

head (InsectSprays)
InsectSprays


tapply(InsectSprays$count, InsectSprays$spray, sum)
## tapply takes a vector of measurements, groups them by factors (parameter 2),
## then runs a function on that vector, and spits out the result

tapply(InsectSprays$count, InsectSprays$spray, mean)

class ( tapply(InsectSprays$count, InsectSprays$spray, rbind) )
## does the equivalent of split, but its in an array, rather than a list..

spIns <- ( split(InsectSprays$count, InsectSprays$spray) )
## splits your list according to factors

sprCount <- lapply(spIns, sum)
## takes each element of your list / vector / whatever, applies a function to it, returns a list
sprCount
z<-unlist(sprCount)
## takes a list, makes it a vector
class ( z )
z[1]
sprCount[1]
install.packages('plyr')
library(plyr)
ddply (InsectSprays,.(spray), summarize, sum=sum(count))
