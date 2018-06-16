## finds the best hospital in the state for a given outcome
## parameters: state, outcome
## checks if the state  and the outcome are valid (ie is a US state, exist in the dataset)
## uses subset to filter hospitals within the state
## uses order to sort the hospital according to highest vs lowest
## returns the highest scoring hospital

source('validation.R')

best<-function(stateToTest, outcome){
  
  columnToSort<-getColumnOf30DayMortalityOutcome(outcome)
  if (columnToSort == FALSE){
    stop ('invalid outcome')
  }
  if (confirmValidUSState(stateToTest) == FALSE){
    stop('invalid state')
  }
  
  outcome_measures<-read.csv('hospital-data/outcome-of-care-measures.csv', header=TRUE,colClasses = 'character')
  
  hospitalsInState<-subset(outcome_measures, State == stateToTest)
  
  
  hospitalsInOrder<-hospitalsInState[order(as.numeric(hospitalsInState[,columnToSort],hospitalsInState[,2])),]
  
  return (hospitalsInOrder[1,2])
}

