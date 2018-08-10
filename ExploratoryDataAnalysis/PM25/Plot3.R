#Prepare Libraries
if (!require(dplyr)) install.packages('dplyr')
library(dplyr)
if (!require(ggplot2)) install.packages('ggplot2')
library(ggplot2)

#Read te Data for Baltimore City, Maryland 
PM25_Balt_byYear <- readRDS("summarySCC_PM25.rds")
PM25_Balt_byYear <- filter(PM25_Balt_byYear,fips=="24510" ) %>% 
                    group_by(year,type) %>% 
                    summarise(Total = sum(Emissions))
PM25_Balt_byYear$type <- factor(PM25_Balt_byYear$type, levels = c("POINT","NONPOINT", "ON-ROAD", "NON-ROAD"))

#Prepare Plot, force set to screen ouput device and also...
# "print" plot 3 [ggplot2 usually don't plot when sourcing] [https://yihui.name/en/2017/06/top-level-r-expressions/]
plot3 <- ggplot(data = PM25_Balt_byYear, mapping = aes(x = as.character(year), y = Total, fill = type)) + 
    geom_col(position = "dodge") + 
    facet_grid( ~ type) +   
    labs( x = "Measurment Year", y = "Tptal PM2.5 Tons", title ="PM2.5 per Yaer and Type", subtitle = "Baltimore City", caption = "EPA National Emissions Inventory web site")
print(plot3)
ggsave("plot3.png", device="png", width = 11, height = 8, dpi = "screen")
