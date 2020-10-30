# small function
myfunction <- function(){
  x <- rnorm(100)
  mean(x)
}


# second function

second <- function(x){
  x+rnorm(length(x))
}