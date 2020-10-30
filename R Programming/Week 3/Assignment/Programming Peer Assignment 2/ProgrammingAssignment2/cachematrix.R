## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  ## Takes as input a matrix and define a set of functions 
  ## for storing in cache the matrix, its inverse; and for
  ## returning these two objects.
  
  ## Return a list of functions permitting to store in cache a
  ## matrix, its inverse and to return the given objects.
  inv <- NULL
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(inverseMatrix) inv <<- inverseMatrix
  getinv <- function() inv
  list(set = set, get = get, 
       setinv = setinv,
       getinv = getinv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Takes as input a matrix and check if its inverse
        ## exists in cache before to compute it 
  
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinv()
        if (!isnull(inv)){
          message("getting cached data")
          return(inv)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinv(inv)
        inv
}
