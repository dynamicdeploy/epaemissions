# Author: Tejaswi Redkar
###############################################################################

#Start clean by deleting all the environment variables
#rm(list=ls(all=TRUE)) 
# Set the working directory to where the R file is and where the download and output files will be located.

#Load the routine that was created to download the data
source("downloaddata.R")

#QUESTION4
#Across the United States, how have emissions from coal combustion-related sources changed from 1999?2008?

coal1 = source_classification[grep("Coal", SCC.Level.Three), SCC]
coal2 = x_data[SCC %in% coal1, sum(Emissions), by = "year"]
setnames(coal2, c("year", "Emissions"))

png("charts/plot4.png", width = 480, height = 480)
g = ggplot(coal2, aes(year, Emissions))
g + geom_point(color = "black") + geom_line(color = "blue") + labs(x = "Year") + 
  labs(y = expression("Total Emissions of PM"[2.5])) + labs(title = "Emissions from Coal Combustion for the US")
dev.off()
