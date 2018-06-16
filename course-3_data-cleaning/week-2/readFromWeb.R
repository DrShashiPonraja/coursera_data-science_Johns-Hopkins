## multiple methods to scrape data

jeffLeekCitationURL<- 'https://scholar.google.com.au/citations?user=HI-I6C0AAAAJ&hl=en'
con <-url(jeffLeekCitationURL)

htmlCode <- readLines(con)

close(con)
htmlCode

library(XML)
install.packages('RCurl')
library(RCurl)
xdata<-getURL(jeffLeekCitationURL)
html<-htmlTreeParse(xdata, useInternalNodes=T)

z<-xpathSApply(html, "//title", xmlValue)
z
b<-xpathSApply(html, "//td[@class='gsc_a_c']", xmlValue)
b

install.packages('httr')
library(httr)
html2<-GET(jeffLeekCitationURL)
content2<- content(html2,as="text")
parsedHTML <- htmlParse(content2,asText=TRUE)
xpathSApply(html, '//title', xmlValue)
xpathSApply(html, "//td[@class='gsc_a_c']", xmlValue)

## authenticate with a user and password. don't get it
pg1 <- GET('httpbin.org/basic-auth/user/passwd', authenticate('user', 'passwd'))
pg1
