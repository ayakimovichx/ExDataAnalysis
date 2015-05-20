## 6. Compare emissions from motor vehicle sources in Baltimore City with emissions from 
## motor vehicle sources in Los Angeles County, California (fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?

# read source data
NEI <- readRDS("./data_temp/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./data_temp/exdata_data_NEI_data/Source_Classification_Code.rds")

# plot
library(dplyr)
data6<-NEI %>%
  filter((type == "ON-ROAD" & fips == "24510") | (type == "ON-ROAD" & fips == "06037"))  %>%
  group_by(year, fips) %>%
  summarise(Total.Emissions=sum(Emissions)) %>%
  mutate(geo=ifelse(fips=="24510", "Baltimore City",
                     "Los Angeles County"))
data6$year<-as.factor(data6$year)

library(ggplot2) 
image6<-ggplot(data=data6, aes(x=year, y=Total.Emissions))+ geom_bar(aes(fill = year),stat = "identity") + guides(fill = F) + ggtitle('Total Emissions of Motor Vehicle Sources') + ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position = 'none') + facet_grid(. ~ geo) + geom_text(aes(label = round(Total.Emissions, 0), size = 1, hjust = 0.5, vjust = -1))
ggsave(file="plot6.png", plot=image6, dpi=75, width=200, height=80, units="mm")
