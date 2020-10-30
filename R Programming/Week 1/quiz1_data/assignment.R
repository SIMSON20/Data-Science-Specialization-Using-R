setwd("~/Documents/Learning/Data Science Specialization R/R Programming/Week 1/quiz1_data")
data <- read.csv("hw1_data.csv")
head(data)
View(data)


length(data$Ozone[is.na(data$Ozone)])

mean(data$Ozone[!is.na(data$Ozone)])

oz <- data$Solar.R[((data$Ozone>31) &(data$Temp>90))]
mean(oz, na.rm = TRUE)

mean(data$Temp[data$Month==6], na.rm = TRUE)

os_may <- data$Ozone[data$Month==5]
max(os_may, na.rm = TRUE)

x <- c(4, TRUE)
class(x)

x <- list(2, "a", "b", TRUE)
class(x[[1]])

x <-1:9
x[x %in% 1:5]
