FormattedCSVName <- function (i){
  csvnum <- as.character(i)
  csvname <- paste (csvnum, ".csv", sep = "")
  if (i < 10){
    csvname = paste("00", csvname, sep = "")
  }
  if (i >= 10 && i < 100){
    csvname = paste("0", csvname, sep = "")
  }
  return (csvname)
}