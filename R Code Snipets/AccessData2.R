## MySQL
ucsDb <- dbConnect( MySQL(),user="genome", host="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucsDb,"show databases;");dbDisconnect(ucsDb);
hg19 <- dbConnect(MySQL(),user="genome",db="hg19",host="genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)
dbListFields(hg19,"affyU133Plus2")
dbGetQuery(hg19,"select count(*) from affyU133Plus2")
affyData <- dbReadTable(hg19,"affyU133Plus2")
query <- dbSendQuery(hg19,"select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query);quantile(affyMis$misMatches)
affyMisMall <- fetch(query, n=10)
dbClearResult(query)
dbDisconnect(hg19)

#HDF5 - Hierarchical Data Format
created = h5createFile("example.h5")
created = h5createGroup("example.5","foo")
created = h5createGroup("example.h5","baa")
created = h5createGroup("example.h5","foo/foobaa")
h5ls("example.h5")
A = matrix(1:10,nr=5,nc=2)
h5write(A,"example.h5","foo/A")
B = array(seq(0.1,2.0,by=0.1),dim=c(5,2,2))
attr(B,"scale") <- "liter"
h5write(B,"example.h5","foo/foobaa/B")
h5ls("example.h5")
df = data.frame(1L:5L,seq(0,1,length.out = 5),c("ab","cde","fghi","a","s"),stringsAsFactors = FALSE)
h5write(df,"example.h5","df")

## From WENB
con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
htmlCode = readlines(con)
#using XML
library(XML)
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en" 
html <- htmlTreeParse(url, useInternalNodes = TRUE)
xpathSApply(html,"//title",xmlValue)
xpathSApply()

#using HTML
library(httr)
html2 = GET(url)
content2 = content(html2,as="text")
parsedHtml = htmlParse(content2,asText = TRUE)
xpathSApply(parsedHtml,"//title",xmlValue)

#Handlers and autentication (and web scrapping) ...
pg2 = GET("http://httpbin.org/basic-auth/user/passwd",authenticate("user","passwd"))
pg2
names(pg2)

google = handle("http://google.com")
pg1 = GET(handle = google,path = "/")

