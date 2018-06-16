fileURL = 'https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2'
if (!file.exists('./data/NOAA_Storm_Data_decompressed.csv')){
  download.file(fileURL, destfile = "./data/NOAA_Storm_Data.csv.bz2", method="curl")
  storm_data = read.csv('./data/NOAA_Storm_Data.csv.bz2') 
  write.csv(storm_data,'./data/NOAA_Storm_Data_decompressed.csv')
}else{
  storm_data = read.csv('./data/NOAA_Storm_Data_decompressed.csv')
}
