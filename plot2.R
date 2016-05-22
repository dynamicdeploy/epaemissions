# Author: Tejaswi Redkar
###############################################################################

#Start clean by deleting all the environment variables
#rm(list=ls(all=TRUE)) 
# Set the working directory to where the R file is and where the download and output files will be located.

#Load the routine that was created to download the data
source("downloaddata.R")
#QUESTION2
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == 24510) from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.

baltimore <- x_data[which(x_data$fips == "24510"), ]
baltimore2 <- with(baltimore, aggregate(Emissions, by = list(year), sum))
colnames(baltimore2) <- c("year", "Emissions")

png("charts/plot2.png", width = 480, height = 480)
plot(baltimore2$year, baltimore2$Emissions, type = "b", pch = 25, col = "red", 
     ylab = "Emissions", xlab = "Year", main = "Baltimore Emissions")
dev.off()


