# Author: Tejaswi Redkar
###############################################################################

#Start clean by deleting all the environment variables
#rm(list=ls(all=TRUE)) 
# Set the working directory to where the R file is and where the download and output files will be located.

#Load the routine that was created to download the data
source("downloaddata.R")


#QUESTION1
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, 
#make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
#Upload a PNG file containing your plot addressing this question.

totalPMemission <- with(x_data, aggregate(Emissions, by = list(year), sum))

png("charts/plot1.png", width = 480, height = 480)
plot(totalPMemission, type = "b", pch = 25, col = "blue", ylab = "Emissions", xlab = "Year", main = "Annual Emissions")
dev.off()