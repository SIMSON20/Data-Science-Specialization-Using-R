# Subsetting
### There are a number of operators that can be used to extract subsets of R objects.
# - [ always returns an object of the same class as the original; can be used to select more than 
# one element (there is one exception)
# - [[ is used to extract elements of a list or a data frame; it can only be used to extract a 
# single element and the class of the returned object will not necessarily be a list or data frame
# - $ is used to extract elements of a list or data frame  by name; semantics are similar to hat of [[.

x <- c("a", "b", "c", "c", "d", "a")
x[1]
x[2]
x[1:4]
x[x>"a"]
u <- x>"a"
u
x[u]

# Subting R Objects: Lists
x <- list(foo=1:4, bar=0.6)
x[1] # list
x[[1]] # sequence
x$bar
x[["bar"]]
x["bar"]

### Multiple elements [[ and $ aren't useful
x <- list(foo=1:4, bar=0.6, baz="hello")
x[c(1, 3)] 

### The [[ operator can be used with computed indices; $ can only be used with literal names.
x <- list(foo=1:4, bar=0.6, baz="hello")
name <- "foo"
x[[name]] ## computed index for 'foo'
x$name ## element 'name' doesn't exist
x$foo ## element 'foo' does exist

### Subsetting Nested Elements of a List

# Te [[ can take an integer sequence.

x <- list(a=list(10, 12, 14), b=c(3.14, 2.81))
x
x[[c(1,3)]]

x[[1]][[3]]

x[[c(2,1)]]

### Subsetting a matrix
## Matrices can be subseted in usual way with (i, j) type indices.
x <- matrix(1:6, 2, 3)
x[1, 2]
x[2, 1]

## Indices can also be missing
x[1,]
x[, 2]

## By default, when a single element of a matrix is retrieved, it is returned as a vector of length 1
## rather than a 1 x 1 matrix. This behavior can be turned off by setting drop = FALSE

x <- matrix(1:6, 2, 3)
x
x[1, 2]
x[1, 2, drop=FALSE]

## Similarly, subsetting a single column or a single row will guive you a vector, not a matrix (by default).
x[1,]
x[1, ,drop=FALSE]

## Subsetting: Partial Matching
x <- list(aardvark=1:5)
x
x$a
x[["a"]]
x[["a", exact=FALSE]]

## Removing NA Values

### A common task is to remove missing values(NAS).
x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
x[!bad]

## What if there are multiple things and you want to take the subset with no missing values?
x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x, y)
good
x[good]
y[good]

airquality[1:6, ]
good <- complete.cases(airquality)
airquality[good, ][1:6, ]

# Vectorized Operations
# Many operations in R are vectorized making code more eficient, conscise, and easier to read.
x <- 1:4; y<-6:9
x+y
x>2
x>=2
y==8
x*y
x/y

x <- c(4, "c", T) 
class(x)
