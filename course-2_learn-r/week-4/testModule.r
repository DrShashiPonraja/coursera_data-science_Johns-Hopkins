outcome_measures<-read.csv('hospital-data/outcome-of-care-measures.csv', header=TRUE,colClasses = 'character')

head(outcome_measures)
outcome_measures[,7]

z<-data.frame(5,5,2)
z
rbind(z,data.frame(5,5,2))
z
z<-1:10
z
rbind(z,5)
z

isFive<-function(value){
  
  if (value == 5){
    return (TRUE)
  }
  return (FALSE)
  
}
isFive(5)
g<-lapply(z,isFive)
g


rightState<-function(hospitalRow,stateComparator){
  if (hospitalRow==stateComparator){
    return (TRUE)
  }else{
    return (FALSE)
  }
  
}

getRecordIfState<-function(hospitalRow,stateComparator){
  if (hospitalRow[7]==stateComparator){
    return (hospitalRow)
  }
}

ALlist<-do.call(rbind,lapply(outcome_measures,getRecordIfState,'AL'))
ALlist
outcome_measures[,7]
z<-do.call(rbind,lapply(outcome_measures[,7],rightState,'AL'))
z[101]
nrow(z)
vf<-cbind(outcome_measures,z)
vf
ncol(vf)
vf[,47]

lapply(vf[1:5,7],print)
vf[1:5,7]

gf<-subset(outcome_measures,"State" == "AL")
gf
outcome_measures$"State"
d<-subset(outcome_measures,"State" == 'AL', select = c("State"))
d
outcome_measures$"State"

a<-1:10
subset(a,a>5)
outcome_measures[,]
stateComparator<-"AL"
subset(outcome_measures[,],"State" == "TX")
colnames(outcome_measures)
z<-subset(outcome_measures,State == "AL")
bf<-z[order("City")]
bf
nrow(z)

colnames(vf)

subset(vf,z==TRUE)
tx<-subset(outcome_measures,State == 'TX')
nrow(tx)
ncol(tx)
tx[1,2]
tx[order(tx[23,])]
head(tx)
source('best.R')
z<-getColumnOf30DayMortalityOutcome("Pneumonia")
z
hosp<-best("MD","Pneumonia")
nrow(hosp)
hosp[1,2]
colnames(outcome_measures)
outcome_measures$'Hospital.Name'
outcome_measures[order(outcome_measures$'Hospital.Name'),2]
z<-rnorm(5,0,1)
g<-cbind(z,rnorm(5,0,1))
g
z
d<-g[order(z),]
d
vf


source('best.R')
outcome_to_ix<-"Pneumonia"
state_to_ix<-'MD'
z<-getColumnOf30DayMortalityOutcome(outcome_to_ix)
z
hosp<-best(state_to_ix,outcome_to_ix)
nrow(hosp)
hosp[,z]
hosp[1,2]
hosp
wanker<-function(){
  stop('you are a dick')
}
wanker()

US_States<-read.csv('hospital-data/50_us_states_all_data.csv', header=FALSE,colClasses = 'character')
US_States
z<-'al'
z
"AL" %in% US_States[,]
US_States[,3]
'AL' %in% US_States[,3]
confirmValidUSState('BB')

source('rankHospital.R')
z<-rankhospital("TX", "heart failure", rankToFind=4)
z[,2]
z<-rankhospital("MD", "heart attack", "worst")
z[,c(2,11)]
.I
outcome_measures$'State'[2]
is.numeric('Shashi')
is.numeric(z[,c(2,11)])
z

z[,2]
x<-function(tat){
  if (tat == "Not Available"){
    return (FALSE)
  }
  return (TRUE)
}

jar<-do.call(rbind, lapply(z[,11],x))
jar
xxx<-cbind(z,jar)
ncol(xxx)
colnames(xxx)
v<-subset(xxx,jar==TRUE)
v[,2]
source('rankAll.R')
z<-rankall('heart attack', 20)
nrow(z)
ncol(z)
z
getUSStateList()
