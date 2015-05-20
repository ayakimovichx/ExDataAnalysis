## 5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# read source data
NEI <- readRDS("./data_temp/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./data_temp/exdata_data_NEI_data/Source_Classification_Code.rds")

# plot
library(dplyr)
data5<-NEI %>%
  filter(type == "ON-ROAD" & fips == 24510) %>%
  group_by(year=as.factor(year)) %>%
  summarise(Total.Emissions=sum(Emissions))
library(ggplot2)
image5<-ggplot(data=data5, aes(x=year, y=Total.Emissions)) +
  geom_line(aes(group=1)) +
  geom_point(aes(size = 2)) +
  ggtitle(expression(paste('Total Emissions of PM', ''[2.5], ' from motor vehicle sources in Baltimore City'))) +
  ylab(expression(paste('PM', ''[2.5], ', tons'))) +
  xlab("Year") +
  theme(legend.position = 'none')
ggsave(file="plot5.png", plot=image5, dpi=75, width=200, height=80, units="mm")
