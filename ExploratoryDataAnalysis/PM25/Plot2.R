if (!require(dplyr)) install.packages('dplyr')
library(dplyr)
#Read te Data for Baltimore City, Maryland 
PM25_Balt <- filter(readRDS("summarySCC_PM25.rds"),fips=="24510" )  %>% group_by(year) %>% summarise(Total = sum(Emissions))

Plot2 <- function(to = "png") {
    if (to == "png") { png("plot2.png",width=800,height=600,units="px")}
    par(mar=c(5,7,4,2))
    bp = barplot(PM25_Balt$Total, names.arg = PM25_Balt$year, ylab = "", xlab = "Years", yaxt = "n", main = "PM2.5 Emissions by Year in Baltimore City, Maryland")
    axis(2, seq(0, range(PM25_Balt$Total)[2], 1000),las=2, labels = sprintf("%.0f",seq(0, range(PM25_Balt$Total)[2], 1000)))
    mtext(side=2, line=4, "Total Emissions in Tons", cex=1.2)
    text(bp, 0, format(round(PM25_Balt$Total, 0),big.mark = ","),cex=1,pos=3) 
    box()
    if (to == "png") {dev.off()}
}

Plot2("")
Plot2("png")
