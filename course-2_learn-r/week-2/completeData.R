complete <- function (directory, id=1:332){
  ## function that returns total number of complete rows

  FormattedCSVName <- function (i){
    csvnum <- as.character(i)
    csvname <- paste (csvnum, ".csv", sep = "")
    if (i < 10){
      csvname = paste("00", csvname, sep = "")
    }
    if (i >= 10 && i < 100){
      csvname = paste("0", csvname, sep = "")
    }
    return (paste(directory, "/", csvname, sep="") )
  }
 
  CountCompleteInCSV <- function (filename){
    rawCSVData = read.csv(filename)
    comp = complete.cases(rawCSVData)
    return ( sum(comp) )
  }
  
  
  fileList = do.call(rbind, lapply(id, FormattedCSVName))
  
  #x<-do.call(rbind, lapply(fileList, read.csv,  header = TRUE, sep=",", quote = "\"'") )
  nobs<-do.call(rbind,lapply(fileList, CountCompleteInCSV ) )
  
  completeValsInCSV = data.frame(id,nobs)
  return (completeValsInCSV) 
}

