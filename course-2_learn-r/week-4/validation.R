## function to validate inputs

## takes outcome in a string format
## returns the column number containing 30 Day Mortality Data

getColumnOf30DayMortalityOutcome<-function(outcome){
  
  columnNumber<-FALSE
  switch(outcome,
         "heart attack" = columnNumber<-11,
         "heart failure" = columnNumber<-17,
         "pneumonia" = columnNumber<-23
  )
  return (columnNumber)
}

## takes a state as a 2 character string ie TX, AL
## checks against the CSV file to confirm there is a corresponding US state
## returns TRUE if found, FALSE if not listed

confirmValidUSState<-function(stateToTest){
  US_States<-read.csv('hospital-data/USPostalData.csv', header=TRUE,colClasses = 'character')
  return(stateToTest %in% US_States[,2])
}

getUSStateList<-function(){
  US_States<-read.csv('hospital-data/USPostalData.csv', header=TRUE,colClasses = 'character')
  return(US_States[order(US_States[,2]),,2])
}