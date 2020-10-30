# wd
setwd("~/Documents/Learning/Data Science Specialization R/R Programming/Week 2/Assinment/rprog_data_specdata")

# importing libraries
library(plyr) # Tools for Splitting, Applying and Combining Data
library(readr) # Read Rectangular Text Data

# Function pollutantmean
polluantmean <- function(directory, pollutant, id=1:332){
  ## 'directory' is a character vector of length 1
  ## indicating the location of the csv files
  ## 'pollutant' is a character vector of length 1 
  ## indicating the name of the pollutant for which
  ## we will calculate the mean; either "sulfate" or
  ## "nitrate"
  ## 'id' is an integer vector indicating the monitor
  ## ID numbers to be used
  ## Return the mean of the pollutant across all monitors 
  ## list in the 'id' vector (ignoring NA values)
  ## NOTE: The result won't be round!
  csv_files <- list.files(path=directory, pattern="*.csv", full.names = TRUE)
  data <- ldply(csv_files, read_csv)
  avg <- mean(data[[pollutant]][data$ID %in% id], na.rm = TRUE)
  avg
  
}
