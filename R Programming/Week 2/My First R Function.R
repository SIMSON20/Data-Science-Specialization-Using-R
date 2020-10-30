add2 <- function(x, y){
  x+y
}

add2(2, 7)


above10 <- function(x){
  use <- x >10
  x[use]
}

above10(c(1, 12, 7, 20,35))

above <- function(x, n=10) {
  use <- x > n
  x[use]
}

above(1:20, 12)

above(1:30)

columnmean <- function(y, removeNA=TRUE){
  nc <- ncol(y)
  means <- numeric(nc)
  for (i in 1:nc){
    means[i] <- mean(y[, i], na.rm = removeNA)
  }
  means
}

columnmean(airquality)


# optimization optim nlm optimize

