setwd("~/Documents/Learning/Data Science Specialization R/R Programming/Week 4/rprog_data_ProgAssignment3-data")


rankhospital <- function(state, outcome, num = "best") {
  library(Hmisc)
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  if(!(state %in% unique(data$State))){
    paste("Error in best(", state, "\\, ", outcome, ") : invalid state")
  } else if(!(outcome %in% c("heart attack", "heart failure", "pneumonia"))){
    paste("Error in best(", state, "\\, ", outcome, ") : invalid outcome")
  } else {
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
    string_root <- "Hospital.30.Day.Death..Mortality..Rates.from."
    out_list <- strsplit(outcome, " ")
    outcome_transf <- paste(sapply(out_list, capitalize), sep=".", collapse = ".")
    col_name <- paste(string_root, outcome_transf, sep="")
    use <- !is.na(data[col_name]) & !is.na(data$Hospital.Name)
    
    data <- data[use, ]
    
    state_data <- subset(data, State==state, )
    
    state_data[, 2] <- as.factor(state_data[, 2])
    
    state_data[[col_name]] <- gsub(",","",state_data[[col_name]])
    
    state_data[[col_name]] <- as.numeric(as.character(state_data[[col_name]]))
    
    
    outcom_sort_per_hsptl <- tapply(state_data[[col_name]], state_data$Hospital.Name, sort)
    
    outcom_sort_per_hsptl <- outcom_sort_per_hsptl[!is.na(outcom_sort_per_hsptl)]
    
    if(num >length(outcom_sort_per_hsptl)){
      return(NA)
    } else if (num == "best"){
      hospital = which.min(outcom_sort_per_hsptl)
    } else if (num=="worst"){
      hospital = which.max(outcom_sort_per_hsptl)
    } else {
      hospital = which(outcom_sort_per_hsptl==num)
    }
    outcom_sort_per_hsptl[hospital]
  }
}