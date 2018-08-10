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
motorv <- filter(PM25, fips == "24510" & grepl("Vehicles",EI.Sector))
motorv <- motorv %>% group_by(year) %>% summarise(Total = sum(Emissions))

#Set Margins
plot5 <- ggplot(data = motorv, mapping = aes(x = as.character(year), y = Total, fill = Total)) + 
    geom_col(position = "dodge") +  
    labs( x = "Measurment Year", y = "Total PM2.5 Tons", title ="PM2.5 for Motor Vehicles by Year", subtitle = "Baltimore City", caption = "EPA National Emissions Inventory web site") + 
    scale_y_continuous(labels = scales::comma) + labs(fill = "Total Tons")
print(plot5)
ggsave("plot5.png", device="png", width = 11, height = 8, dpi = "screen")
