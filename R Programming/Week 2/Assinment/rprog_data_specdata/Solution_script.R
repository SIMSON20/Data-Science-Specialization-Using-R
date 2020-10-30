# wd
setwd("~/Documents/Learning/Data Science Specialization R/R Programming/Week 2/Assinment/rprog_data_specdata")

source("pollutantmean.R")

polluantmean("specdata", "nitrate")

source("complete.R")

library(plyr) # Tools for Splitting, Applying and Combining Data
library(readr) # Read Rectangular Text Data

complete("specdata", 1:10)

source("corr.R")

corr("specdata", 150)

cc <- complete("specdata", 54)
print(cc$nobs)

RNGversion("3.5.1")  
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])

cr <- corr("specdata")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))