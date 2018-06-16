if( !file.exists('./data') ){
  dir.create('./data')
}

fileURL <- 'https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD'
download.file(fileURL,destfile = './data/cameras.csv', method='curl')

cameraData<-read.csv('./data/cameras.csv')

colnames(cameraData)

names(cameraData)
cameraData
names(cameraData)<-tolower(names(cameraData))
cameraData
## change header to lower case
