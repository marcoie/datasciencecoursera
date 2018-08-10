# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips=="06037").
# Which city has seen greater changes over time in motor vehicle emissions?

#Prepare Libraries
if (!require(dplyr)) install.packages('dplyr')
library(dplyr)
if (!require(ggplot2)) install.packages('ggplot2')
library(ggplot2)

#Read te Data, 5 vars on PM25 data and 15 feature per SC should give 20 columns
#From SCC classification EI.Sector with "Vehicles" represent motor vehicles and PM25 data with fips = 24510 are the Baltimore measurements
PM25 <- readRDS("summarySCC_PM25.rds")
SCC  <- mutate(readRDS("Source_Classification_Code.rds"), SCC = as.character(SCC))
PM25 <- inner_join(PM25,SCC,by="SCC")
motorv2 <- filter(PM25, (fips == "24510" | fips == "06037" )& grepl("Vehicles",EI.Sector))
motorv2 <- motorv2 %>% group_by(year,fips) %>% summarise(Total = sum(Emissions)) %>% mutate(fips = if_else(fips=="06037","Los Angeles County","Baltimore City"))

#Set Margins
plot6 <- ggplot(data = motorv2, mapping = aes(x = as.character(year), y = Total, fill = fips)) + 
    geom_col(position = "dodge") +  
    labs( x = "Measurment Year", y = "Total PM2.5 Tons", title ="PM2.5 for Motor Vehicles by Year", subtitle = "Baltimore City vs Los Angeles County", caption = "EPA National Emissions Inventory web site") + 
    scale_y_continuous(labels = scales::comma) + 
    labs(fill="Location")
print(plot6)
ggsave("plot6.png", device="png", width = 11, height = 8, dpi = "screen")
