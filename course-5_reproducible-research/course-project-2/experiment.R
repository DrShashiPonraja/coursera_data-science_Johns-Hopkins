source('import_data.R')

colnames(storm_data)
levels(factor(storm_data$EVTYPE))

which

storm_data$FATALITIES

fatalities_by_eventType = aggregate(FATALITIES ~ EVTYPE, data = storm_data, FUN=sum)

fatalities_by_eventType[which(fatalities_by_eventType$FATALITIES == max(fatalities_by_eventType$FATALITIES)),]

ordered_fatalities_by_eventType = fatalities_by_eventType[order(-fatalities_by_eventType$FATALITIES),]
ordered_fatalities_by_eventType[1:5,]

injuries_by_eventType = aggregate(INJURIES ~ EVTYPE, data = storm_data, FUN = sum)
ordered_injuries_by_event_Type = injuries_by_eventType[order(-injuries_by_eventType$INJURIES),]
ordered_injuries_by_event_Type[1:5,]

levels(factor(storm_data$PROPDMGEXP))

exponenter = function(x){
  if ((x == 'h') || (x == 'H') ){
    return(2)
  }
  if ((x == 'm') || (x == 'M') ){
    return(6)
  }
  
  if ((x == 'K')){
    return(3)
  }
  if ((x == '') || (x == '-') || (x == '?') || (x == '+')){
    return(0)
  }
  return(x)
}
storm_data$PROPDMGEXP_cleaned = sapply(storm_data$PROPDMGEXP, exponenter)
storm_data$CROPDMGEXP_cleaned = sapply(storm_data$CROPDMGEXP, exponenter)
levels(factor(storm_data$PROPDMGEXP_cleaned))
levels(factor(storm_data$CROPDMGEXP_cleaned))

storm_data$Total_CROPDMG = storm_data$CROPDMG * 10 ^ storm_data$CROPDMGEXP_cleaned
storm_data$Total_PROPDMG = storm_data$PROPDMG * 10 ^ storm_data$PROPDMGEXP_cleaned


factor(storm_data$cleanedPROPDMGEXP)
class(storm_data$cleanedPROPDMGEXP[2])

range(storm_data$Total_PROPDMG)
Total_CROPDMG_by_eventType = aggregate(Total_CROPDMG ~ EVTYPE, storm_data, FUN = sum)
Total_PROPDMG_by_eventType = aggregate(Total_PROPDMG ~ EVTYPE, storm_data, FUN = sum)

ordered_Total_CROPDMG_by_eventType = Total_CROPDMG_by_eventType[order(-Total_CROPDMG_by_eventType$Total_CROPDMG),]
ordered_Total_CROPDMG_by_eventType[1:5,]


z= storm_data[which(storm_data$EVTYPE == ordered_injuries_by_event_Type[1:5,1]),]
ordered_injuries_by_event_Type[1:5,1]
levels(factor(z$EVTYPE))
library(lattice)
hist(z$INJURIES)
class(z$INJURIES)
z2 = z[which(z$INJURIES > 100),]
hist(z2$INJURIES)
range(z2$INJURIES)

ddt = ordered_fatalities_by_event_Type[1:5,]
table(ordered_injuries_by_eventType$INJURIES[1:5])
library(ggplot2)
ggplot(x = ddt$EVTYPE[1:5], y = ddt$INJURIES )+geom_bar()
hist(ddt$INJURIES[1:5])
plot(y = ddt$INJURIES[1:5], c(1:5), type="l")
levels(factor(ddt$EVTYPE[1:5]))
ddt$INJURIES

avg_injuries_by_eventType = aggregate(INJURIES ~ EVTYPE, data = storm_data, FUN = mean)
avg_ordered_injuries_by_event_Type = avg_injuries_by_eventType[order(-avg_injuries_by_eventType$INJURIES),]
avg_ordered_injuries_by_event_Type[1:5,]

plot(y = avg_ordered_injuries_by_event_Type$INJURIES[1:5],x=c(1,4,3,2,5))

barplot(avg_ordered_injuries_by_event_Type$INJURIES[1:5], names.arg = (levels(factors(avg_ordered_injuries_by_event_Type$EVTYPE[1:5])))
par(las=2)
barplot(avg_ordered_injuries_by_event_Type$INJURIES[1:5], space = rep(0.2,5),cex.names = 0.8,names.arg = levels(factor(avg_ordered_injuries_by_event_Type$EVTYPE[1:5])))
class(c(1:5))
