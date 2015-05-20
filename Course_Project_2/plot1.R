## 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
## for each of the years 1999, 2002, 2005, and 2008.

# read source data
NEI <- readRDS("./data_temp/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./data_temp/exdata_data_NEI_data/Source_Classification_Code.rds")

# plot
data1<-aggregate(x=NEI[c("Emissions")], FUN=sum, by=list(year=NEI$year))
plot(x=data1$year, y=data1$Emissions, type="l", col="black", 
     main="Total emissions from PM2.5 in the US, 1999-2008", xlab="Year", 
     ylab="PM2.5 emissions, tons")
png(filename="plot1.png", width=480, height=480, units="px")
plot(x=data1$year, y=data1$Emissions, type="l", col="black", 
     main="Total emissions from PM2.5 in the US, 1999-2008", xlab="Year", 
     ylab="PM2.5 emissions, tons")
dev.off()
