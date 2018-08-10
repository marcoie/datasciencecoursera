 #checking and creating data from downloads
if(!file.exists("./ddata")) {dir.create("./ddata")} #setting the space
# fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
# download.file(fileUrl,destfile = "./ddata/restaurants.csv",method = "curl")
# restData <- read.csv("./ddata/restaurants.csv")
# table(restData$zipCode %in% c("21212"))
# colSums(is.na(restData))
# restData[restData$zipCode %in% c("21212"),]
# restData$zipGroups = cut(restData$zipCode,breaks=quantile(restData$zipCode))

fileurl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileurl,destfile = "./ddata/cameras.csv",method = "curl")
cameraData <- read.csv("./ddata/cameras.csv")
names(cameraData)
tolower(names(cameraData))
names(cameraData) <- tolower(names(cameraData))
