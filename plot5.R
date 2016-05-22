# Author: Tejaswi Redkar
###############################################################################

#Start clean by deleting all the environment variables
#rm(list=ls(all=TRUE)) 
# Set the working directory to where the R file is and where the download and output files will be located.

#Load the routine that was created to download the data
source("downloaddata.R")
#QUESTION5
#How have emissions from motor vehicle sources changed from 1999?2008 in Baltimore City? 

motor1 = source_classification[grep("[Mm]obile|[Vv]ehicles", EI.Sector), SCC]
motor2 = x_data[SCC %in% motor1, sum(Emissions), by = c("year", "fips")][fips == "24510"]
setnames(motor2, c("year", "fips", "Emissions"))

png("charts/plot5.png", width = 480, height = 480)
g = ggplot(motor2, aes(year, Emissions))
g + geom_point(color = "black") + geom_line(color = "red") + labs(x = "Year") + 
  labs(y = expression("Total Emissions of PM"[2.5])) + 
  labs(title = "Total Emissions from Motor Vehicle Sources in Baltimore City")
dev.off()