# wd
setwd("~/Documents/Learning/Data Science Specialization R/R Programming/Week 2/Assinment/rprog_data_specdata")

# importing libraries
library(plyr) # Tools for Splitting, Applying and Combining Data
library(readr) # Read Rectangular Text Data

complete <- function(directory, id=1:332){
  ## 'directory' is a character vector of length 1 indicating 
  ## the location of the CSV files
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id  nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete case
  csv_files <- list.files(path=directory, pattern="*.csv", full.names = TRUE)
  data <- ldply(csv_files, read_csv)
  ids <- id
  ids_missingless <- data$ID[!is.na(data$nitrate) & !is.na(data$sulfate)]
  nobs <-list()
  i <- 1
  while (i <= length(ids)){
    nobs[[i]]  <- length(ids_missingless[ids_missingless==ids[i]])
    i <- i + 1
  } 
  
  result <- cbind(ids, nobs)
  result <- data.frame(result)
  result
  }