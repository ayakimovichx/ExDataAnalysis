## 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
## variable, which of these four sources have seen decreases in emissions from 1999–2008 
## for Baltimore City? Which have seen increases in emissions from 1999–2008? 
## Use the ggplot2 plotting system to make a plot answer this question.

# read source data
NEI <- readRDS("./data_temp/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./data_temp/exdata_data_NEI_data/Source_Classification_Code.rds")

# plot3
library(dplyr)
data3<- NEI %>%
  filter(fips=="24510") %>%
  group_by(year=as.factor(year), type) %>%
  summarise(Total.Emissions=sum(Emissions))
library(ggplot2)
theme_set(theme_grey(base_size = 10)) 
image3<-qplot(x=year, y=Total.Emissions, data=data3, facets=.~type, geom="point", colour=type,
              main="Emissions in Baltimore by type, 1999-2008", xlab="Year", ylab=expression(paste('PM', ''[2.5], ', tons')))
ggsave(file="plot3.png", plot=image3, dpi=75, width=200, height=80, units="mm")
