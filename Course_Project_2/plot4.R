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
  group_by(year=as.factor(year)) %>%
  summarise(Total.Emissions=sum(Emissions))
library(ggplot2)
image4<-ggplot(data=data4, aes(x=year, y=Total.Emissions)) +
  geom_line(aes(group=1)) +
  geom_point(aes(size = 2)) +
  ggtitle(expression(paste('Total Emissions of PM', ''[2.5], ' from coal combustion-related sources'))) +
  ylab(expression(paste('PM', ''[2.5], ', tons'))) +
  xlab("Year") +
  theme(legend.position = 'none')
ggsave(file="plot4.png", plot=image4, dpi=75, width=200, height=80, units="mm")
