#Prepare Libraries
if (!require(dplyr)) install.packages('dplyr')
library(dplyr)
if (!require(ggplot2)) install.packages('ggplot2')
library(ggplot2)

#Read te Data, 5 vars on PM25 data and 15 feature per SC should give 20 columns
#From SCC classification Level One identifues "COmbustion SOurces" and Level Three identifies "coal" related sources.
PM25 <- readRDS("summarySCC_PM25.rds")
SCC  <- mutate(readRDS("Source_Classification_Code.rds"), SCC = as.character(SCC))
PM25 <- inner_join(PM25,SCC,by="SCC")
coal <- filter(PM25, grepl(" Combustion",SCC.Level.One) & grepl(" Coal",SCC.Level.Three))
coal <- coal %>% group_by(year) %>% summarise(Total = sum(Emissions))

#Set Margins
plot4 <- ggplot(data = coal, mapping = aes(x = as.character(year), y = Total, fill = Total)) + 
    geom_col(position = "dodge") + 
    labs( x = "Measurment Year", y = "Total PM2.5 Tons", title ="PM2.5 of Coal + Combustion related sources", subtitle = "US Wide", caption = "EPA National Emissions Inventory web site") + 
    scale_y_continuous(labels = scales::comma)
print(plot4)
ggsave("plot4.png", device="png", width = 11, height = 8, dpi = "screen")
