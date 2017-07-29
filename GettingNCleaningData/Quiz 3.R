#Week 3
#Q1
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "US2006_microdata_survey.csv")
survey_data <- read.csv("US2006_microdata_survey.csv")
vectorlogico <- with(survey_data, survey_data$ACR == 3 & survey_data$AGS ==6)
which(vectorlogico)
#Q2
library(jpeg)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg",destfile = "Fjeff.jpg")
jpegdata <- readJPEG("Fjeff.jpg",native=TRUE)
quantile(x = jpegdata, probs = seq(0, 1, 0.1))

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "FGDP.csv")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile = "FEDSTATS.csv")
FGDP = read.csv("FGDP.csv", skip = 4, stringsAsFactors = FALSE)
FGDP.f <- filter(FGDP,as.integer(X.1) <= 190)
FEDSTATS = read.csv("FEDSTATS.csv")
resultado <- merge(FGDP, FEDSTATS, by.x = "X", by.y = "CountryCode")
FGDP.a <- arrange(FGDP.f, desc(as.integer(X.1)))
#Deal with the commas... on a number
#str_trim from stringr was the chice and then gsub
FGDP.m <- mutate(FGDP,X.1 = as.integer(X.1), X.4 = as.double(gsub(",","",gsub(" ","",X.4))))

#find averages
resultado2 <- merge(FGDP.m, FEDSTATS, by.x = "X", by.y = "CountryCode")
rankingadat <-  tbl_df(resultado2)
rankd <- group_by(rankingadat, Income.Group)
summarize(rankd, avgrnk = mean(X.1, na.rm = TRUE))
seleccion <- select(rankingadat, X, X.1, X.3, X.4, Income.Group)
quantile(seleccion$X.1,probs = seq(0,1,0.2), na.rm = TRUE)
#0%   20%   40%   60%   80%  100% 
#    1.0  38.6  76.2 113.8 152.4 190.0 
filtrado <- filter(seleccion, X.1 <= 38)
filtrado <- group_by(filtrado, Income.Group)
summarize(filtrado, co = n())
