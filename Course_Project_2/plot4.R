## 4. Across the United States, how have emissions from coal combustion-related sources changed 
## from 1999–2008?

# read source data
NEI <- readRDS("./data_temp/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./data_temp/exdata_data_NEI_data/Source_Classification_Code.rds")

# plot
coal_indexes<-grep("Coal", SCC$Short.Name)
SCC_Coal<-SCC[coal_indexes,c(1,3)]
SCC_Coal_ID<-SCC_Coal[,1]
library(dplyr)
data4<-NEI %>%
  filter(SCC %in% SCC_Coal_ID) %>%
  group_by(year) %>%
  summarise(Total.Emissions=sum(Emissions))
library(ggplot2)
theme_set(theme_grey(base_size = 12)) 
image4<-qplot(x=year, y=Total.Emissions, data=data4, geom="line",
              main="Emissions from coal combustion-related sources, 1999-2008", xlab="Year", ylab="PM2.5 emissions, tons")
ggsave(file="plot4.png", plot=image4, dpi=75, width=200, height=80, units="mm")
