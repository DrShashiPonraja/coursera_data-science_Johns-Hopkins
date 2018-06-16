set.seed(13435)
X <- data.frame('var1'=sample(1:5),'var2'=sample(6:10),var3=sample(11:15))
##some test code so I can wrap my head around lists / vectors / data frames and the other crazy formats this language uses
X
class(X[1][])
class(X$var1)

B<-X[sample(1:5),]
B$'var2'[c(1,3)] = NA
B

B[1:2,'var2']
B[1:2,c('var2','var3')]

B[(B$var1 <= 3 & B$var3 >11),]

B[(B$var2 > 8),]

##use the which command to get rid of the NAs
B[which(B$var2 > 8),]

sort(B$var1)

sort (B$var1, decreasing=TRUE)
## returns a series of integers
sort (B$var2, na.last=TRUE)

B[order(B$var1),]
## returns the whole data frame

B[order(B$var1,B$var3),]
## returns ordered by var1, then var3. kinda pointless in a data set where every value in the column is unique..


## can also use plyr, a library that looks like it might actually be legible...
library(plyr)
arrange (B, var1)

arrange (B, desc(var1))

B$var4 <- rnorm(5)
B
## add another column, label it var4


D<-cbind(X,myColumnName=rnorm(5))
D
## another way of adding another volumn