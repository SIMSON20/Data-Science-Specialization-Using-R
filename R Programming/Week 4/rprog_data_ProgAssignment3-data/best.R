# wd
setwd("~/Documents/Learning/Data Science Specialization R/R Programming/Week 4/rprog_data_ProgAssignment3-data")

best <- function(state, outcome) {
  library(Hmisc)
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  if(!(state %in% unique(data$State))){
      paste("Error in best(", state, "\\, ", outcome, ") : invalid state")
  } else if(!(outcome %in% c("heart attack", "heart failure", "pneumonia"))){
      paste("Error in best(", state, "\\, ", outcome, ") : invalid outcome")
  } else{
      ## Return hospital name in that state with lowest 30-day death
      ## rate
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
      

      outcom_sum_per_hsptl <- tapply(state_data[[col_name]], state_data$Hospital.Name, min)

      hospital <- which.min(outcom_sum_per_hsptl)

      outcom_sum_per_hsptl[hospital]
  }
  
}