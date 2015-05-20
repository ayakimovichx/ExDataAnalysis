## 5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# read source data
NEI <- readRDS("./data_temp/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./data_temp/exdata_data_NEI_data/Source_Classification_Code.rds")

# plot
library(dplyr)
data5<-NEI %>%
  filter(type == "ON-ROAD" & fips == 24510) %>%
  group_by(year) %>%
  summarise(Total.Emissions=sum(Emissions))
library(ggplot2)
theme_set(theme_grey(base_size = 12)) 
image5<-qplot(x=year, y=Total.Emissions, data=data5, geom="line",
              main="Emissions from motor vehicle sources in Baltimore, 1999-2008", xlab="Year", ylab="PM2.5 emissions, tons")
ggsave(file="plot5.png", plot=image5, dpi=75, width=200, height=80, units="mm")
