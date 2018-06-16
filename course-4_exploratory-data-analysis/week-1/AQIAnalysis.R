AQIData<-read.csv('./data/annual_aqi_by_county_2017.csv', header=TRUE)
head(AQIData)
nrow(AQIData)
ncol(AQIData)

quantile(AQIData$Days.PM2.5)
boxplot(AQIData$Days.PM2.5 ~ AQIData$State)
abline(h = 12)
hist(AQIData$Days.PM2.5)
rug(AQIData$Days.PM2.5)

