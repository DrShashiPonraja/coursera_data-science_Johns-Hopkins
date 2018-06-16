source ("http://bioconductor.org/biocLite.R")
biocLite('rhdf5')
library(rhdf5)
created = h5createFile('example.h5')
created

created = h5createGroup('example.h5','foo')
created = h5createGroup('example.h5','ba')
created = h5createGroup('example.h5','foo/dogfoo')

h5ls('example.h5')

A<-matrix(1:10, nr=5, nc=2)
A
h5write(A, 'example.h5', 'foo/A')

h5ls('example.h5')

seq(0.1, 2.0, by=0.1) # counts from 0.1 to 2.0 in increments of 0.1

B<-array(seq(0.1, 2.0, by=0.1),dim=c(5,2,2))
attr(B,'scale')<-'liter'  ##allows you to add meta data
h5write(B, 'example.h5', "foo/dogfoo/B")

df<- data.frame(1L:5L, seq(0,1, length.out=5), c("ab","cde", "fghi", 'a', 's'), stringsAsFactors = FALSE)
df
h5write(df,'example.h5', 'df')

h5ls('example.h5')

readA<- h5read ('example.h5', 'foo/A')
readB<- h5read ('example.h5', 'foo/dogfoo/B')
readdf<- h5read ('example.h5', 'df')

readA; readB; readdf
list (1:3)

h5write(seq(12,14,by=1),'example.h5','foo/A', index=list(1:3,1))
h5read('example.h5','foo/A')


h5close('example.h5')
