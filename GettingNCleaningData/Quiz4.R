fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileurl,destfile = "/Users/marcoie/Projects/WorkingArea/ddata/idaho.csv",method = "curl")
idahoData <- read.csv("/Users/marcoie/Projects/WorkingArea/ddata/idaho.csv")
names(idahoData)
tolower(names(idahoData))
names(idahoData) <- tolower(names(idahoData))
strsplit(names(idahoData),"wgtp") # search for 123 element

fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileurl,destfile = "/Users/marcoie/Projects/WorkingArea/ddata/gdp190.csv",method = "curl")
gdpData <- read.csv("/Users/marcoie/Projects/WorkingArea/ddata/gdp190.csv")
gdpData <- mutate(gdpData,X.4 = as.double(gsub(",","",gsub(" ","",X.4))))
mean(gdpData$X.4[1:190],na.rm=TRUE)

eduData <- read.csv("/Users/marcoie/Projects/WorkingArea/ddata/EDSTATS_Country.csv")
eduTBL <- as_tibble(eduData)

names(gdpTBL)[1] <- "CountryCode"
newTBL <- left_join(gdpTBL,eduTBL,by="CountryCode")
filter(newTBL, sum(grep("^Fiscal",newTBL$Special.Notes))>0) # filter multiple column
testTBL <- filter(newTBL, sum(grep("^Fiscal",Special.Notes))>0) 
testTBL <- newTBL %>% filter(grepl("^Fiscal",Special.Notes)) %>% filter(grepl("*June*",Special.Notes))


library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
df <- as.data.frame(sampleTimes)
df %>% filter(year(value)==2012)%>%filter(wday(value)==2)%>%count()
