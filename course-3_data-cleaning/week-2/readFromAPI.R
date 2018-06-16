install.packages('ROAuth')
library(ROAuth)

myapp <- oauth_app('twitter', key="hfQA9T0DineGzwW2ZxS94Y7lp",secret="Cxc3Ygan3LxlTwwyGPcYH7RdlQCJGmbCwEf3aBJNl3hExjYlhc")
sig <- sign_oauth1.0(myapp, token="957156953230270464-EomSJt3kYc4PecMxf5nzHdtOs0wzib7", token_secret="SgTt9rgSd4Jl1NFJaP3ZLF6M98cqHVkqnNnzLiflBsMhy")

homeTL <- GET('https://api.twitter.com/1.1/statuses/home_timeline.json', sig)

library(jsonlite)

json1 <- content(homeTL)
json2 <- jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]


