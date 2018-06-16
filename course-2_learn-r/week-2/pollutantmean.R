

pollutantmean <- function (directory, pollutant, id = 1:332){


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
  
  fileList = do.call(rbind, lapply(id, FormattedCSVName))

  x<-do.call(rbind, lapply(fileList, read.csv,  header = TRUE, sep=",", quote = "\"'") )
             
  return(  (mean( x[,pollutant], na.rm=TRUE) )  )

}
