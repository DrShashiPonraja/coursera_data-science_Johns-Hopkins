## finds a hospital in the state that meets a particular rank
## for a given outcome
## parameters: state, outcome, rank
## checks if the state  and the outcome are valid (ie is a US state, exist in the dataset)
## uses subset to filter hospitals within the state
## uses order to sort the hospital according to highest vs lowest
## returns the hospital that meets the rank requested
## if rank is best or worst, go with the top or the bottom of the list

source('validation.R')

rankhospital<-function(stateToTest, outcome, rankToFind = "best"){
  
  columnToSort<-getColumnOf30DayMortalityOutcome(outcome)
  if (columnToSort == FALSE){
    stop ('invalid outcome')
  }
  if (confirmValidUSState(stateToTest) == FALSE){
    stop('invalid state')
  }
  
  outcome_measures<-read.csv('hospital-data/outcome-of-care-measures.csv', header=TRUE,colClasses = 'character')
  

  
  hospitalsInState<-subset(outcome_measures, State == stateToTest)
  

  
  checkMortalityRate<-function(mortalityRate){
    return (is.numeric(mortalityRate))
  }
 
  hospitalsInOrder<-hospitalsInState[order(as.numeric(hospitalsInState[,columnToSort]),hospitalsInState[,2]),]
  ##hospitalsInOrder<-subset(hospitalsInOrder, (hospitalsInState[,columnToSort]) != 'Not Available')

  ##remove all hospitals who don't have valid numbers
  numberAvailable<-function(num){
    if (num == "Not Available"){
      return (FALSE)
    }
    return (TRUE)
  } 
  

  scanValidNumbers<-do.call(rbind, lapply(hospitalsInOrder[,columnToSort],numberAvailable))
  testedHospitalsInOrder<-cbind(hospitalsInOrder,scanValidNumbers)
  validHospitalsInOrder<-subset(testedHospitalsInOrder,scanValidNumbers==TRUE)

  rankInNumberForm<-rankToFind
  switch(rankToFind,
         "best" = rankInNumberForm <- 1,
         "worst" = rankInNumberForm <- nrow(validHospitalsInOrder)
  )
  
  return (validHospitalsInOrder[rankInNumberForm,2])
}
