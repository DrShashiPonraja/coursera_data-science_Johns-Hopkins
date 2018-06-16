## lecture code
## try the code myself

##

install.packages("RMySQL")
library(RMySQL)
ucscDb <- dbConnect(MySQL(), user="genome", host="genome-mysql.cse.ucsc.edu")

result <- dbGetQuery(ucscDb, 'show databases;'); dbDisconnect(ucscDb)
result

hg19<- dbConnect(MySQL(),user="genome", db="hg19", host="genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)
allTables[1:5]

dbListFields(hg19, 'affyU133Plus2') # list the column headers

# lists total records in the affyU133Plus2 table
dbGetQuery(hg19, 'select count(*) from affyU133Plus2')

##check for records in table  where mismatches between 1 and 3
## if it works correctly, the range in mismatch should only be 1-3

query<-dbSendQuery(hg19, 'select * from affyU133Plus2 where misMatches between 1 and 3') 
affyMis<- fetch(query)
quantile(affyMis$misMatches)
quantile(affyMis$misMatches, c(0.46, 0.48, 0.76, 0.77))

affyMisSmall <- fetch(query, n=10)

warnings()

##testing to see if i can order it. Yes I can!
quantile(affyMisSmall$misMatches)
query<-dbSendQuery(hg19, 'select * from affyU133Plus2 where misMatches between 1 and 3 order by misMatches DESC') 
affyMisOrdered<-fetch(query, n=10)
quantile(affyMisOrdered$misMatches)


dbClearResult(query)
dbDisconnect(hg19)
