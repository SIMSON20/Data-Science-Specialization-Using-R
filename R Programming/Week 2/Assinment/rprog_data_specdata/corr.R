# wd
setwd("~/Documents/Learning/Data Science Specialization R/R Programming/Week 2/Assinment/rprog_data_specdata")

corr <- function(directory, threshold=0){
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  csv_files <- list.files(path=directory, pattern="*.csv", full.names = TRUE)
  data <- ldply(csv_files, read_csv)
  
  completes <- complete(directory)
  valid_ids <- completes$id[completes$nobs>threshold]
  
  if(length(valid_ids)==0){
     result <- 0
  } else{
    result = vector()
    for(i in seq_along(valid_ids)){
      result[[i]] = cor(data$nitrate[data$ID==valid_ids[[i]]], 
                        data$sulfate[data$ID==valid_ids[[i]]], use = "complete.obs")
    }
  }
  result
}
