#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008. 

if (!require(dplyr)) install.packages('dplyr')
library(dplyr)
#Read te Data and summarize it by Year
PM25Yearly <- readRDS("summarySCC_PM25.rds") %>% group_by(year) %>% summarise(Total = sum(Emissions))

Plot1 <- function(to = "png") {
    if (to == "png") { png("plot1.png",width=800,height=600,units="px")}
    par(mar=c(5,7,4,2))
    bp = barplot(PM25Yearly$Total, names.arg = PM25Yearly$year, ylab = "", xlab = "Years", yaxt = "n", main = "PM2.5 Emissions in the US")
    axis(2, seq(0, range(PM25Yearly$Total)[2], 1000000),las=2, labels = sprintf("%.0fK",seq(0, range(PM25Yearly$Total)[2], 1000000)/1000))
    mtext(side=2, line=4, "Total Emissions in Thousand Tons", cex=1.2)
    text(bp, 0, format(round(PM25Yearly$Total, 0),big.mark = ","),cex=1,pos=3) 
    box()
    if (to == "png") {dev.off()}
}
Plot1("")
Plot1("png")
