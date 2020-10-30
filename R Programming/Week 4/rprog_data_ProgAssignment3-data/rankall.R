# clering the environment
rm(list=ls())
# wd
setwd("~/Documents/Learning/Data Science Specialization R/R Programming/Week 4/rprog_data_ProgAssignment3-data")

# reading data

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

## Explorin te data
# looking at the head, number of rows, columns and their names

head(outcome)

nrow(outcome)

ncol(outcome)

names(outcome)

## 1 Plot the 30-day mortality rates for heart attack

# converting to numeric the 30-day death rates from heart attack column
outcome[, 11] <- as.numeric(outcome[, 11])

# plotting the data
hist(outcome[, 11], xlab = "Number of hospitals", main = "Histogram of
     30-day death rates from heart attack", col=4)

## 2 Finding the best hospital in a state

source("best.R")

best("TX", "heart attack")

best("TX", "heart failure")

best("MD", "heart attack")

best("MD", "pneumonia")

best("BB", "heart attack")

best("NY", "hert attack")


## 3 Ranking hospitals by outcome in a state

