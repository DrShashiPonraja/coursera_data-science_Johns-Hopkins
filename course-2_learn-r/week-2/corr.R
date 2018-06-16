
corr <-function(directory, threshold = 0){
 allCSVs = list.files(directory)
CorrelationData <- NULL
 
 for (filename in allCSVs){
   rawCSVData = read.csv(paste(directory, "/", filename,sep=""))
   comp = complete.cases(rawCSVData)
   CompleteDataInCSV = sum(comp)

   if (CompleteDataInCSV > threshold){

    corR = cor(x=rawCSVData['sulfate'], y = rawCSVData['nitrate'], use = 'na.or.complete')

    CorrelationData <- c (CorrelationData, corR)     
   }

 }
 

 
 return (CorrelationData)
}


