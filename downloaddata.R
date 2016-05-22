# Author: Tejaswi Redkar
###############################################################################

#Start clean by deleting all the environment variables
rm(list=ls(all=TRUE)) 
# Set the working directory to where the R file is and where the download and output files will be located.
setwd("/Users/Tej/Documents/epaemissions")
library(plyr)
library(ggplot2)
library(data.table)
library(grid)
library(scales)
library(httr) 


fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
datadir <- "data"
if(!file.exists(datadir)){
  dir.create(datadir)
} 
charts <- "charts" 
if(!file.exists(charts)){
  dir.create(charts)
}
ziparchive <- paste(getwd(), "/data/exdata_data_NEI_data.zip", sep = "")
if(!file.exists(ziparchive)){
  download.file(fileurl, ziparchive, method="curl", mode="wb")
}
source_classification <- paste(getwd(), "/data/Source_Classification_Code.rds", sep = "")
if(!file.exists(source_classification)){
  unzip(ziparchive, list = FALSE, overwrite = FALSE, exdir = datadir)
}
summarySCC_PM25 <- paste(getwd(), "/data/summarySCC_PM25.rds", sep = "")
if(!file.exists(summarySCC_PM25)){
  unzip(ziparchive, list = FALSE, overwrite = FALSE, exdir = data)
}

source_classification <- readRDS("data/Source_Classification_Code.rds")
x_data <- readRDS("data/summarySCC_PM25.rds")

source_classification = data.table(source_classification)
x_data = data.table(x_data)
#print("Writing summary in downloaddata.R")
#str(x_data)