# Objects And Attributes

1L

1/Inf

1/0

#Every object has: names, dimnames, dimensions, class, length, 
#other user-defined attributes or metadata. Attributes of an 
#object can be accessed usin te attributes() function.


# Vectors

# using the c() function

x <- c(0.5, 0.6)  ## numeric
x <- c(TRUE, FALSE) ## logical
x <- c(T, F) ## loical
x <- c("a", "b", "c") ## character
x <- 9:29 ## integer
x <- c(1+0i, 2+4i) ## complex

# Using the vector() function

x <- vector("numeric", length=10)

## When different objects are mixed in a vector, coercion occurs so tat every 
## element in the vector is of the same class 

y <- c(1.7, "a") ## character
y <- c(TRUE, 2) ## numeric
y <- c("a", TRUE) ## character

## Explicit coercion
### Objects can be explicitly coerced from one class to another using the as.* functions, 
### if available

x<- 0:6
class(x)
as.numeric(x)
as.logical(x)
as.character(x)

# Lists
## Lists are a special type of vector that can contain elements of different classes. Lists
## are a very important data type in R and you should get to know them well.

x <- list(1, "a", TRUE, 1+4i)
x

# Matrices 
## Matrices are vectors with a dimension attribute. The dimension attribute is 
## itself an integer vector of length 2 (nrow, ncol)

m <- matrix(nrow=2, ncol=3)
m

dim(m)

attributes(m)

## Matrices are created column-wise, so entries can be thought as starting in 
## the "upper left" corner and running  down the columns.

m <- matrix(1:6, nrow=2, ncol=3)
m

## Matrices can also be created directly from vectors by addin a dimension attribute

m <- 1:10
m

dim(m) <- c(2, 5)
m

## Matrices can be created by column-binding or row-binding with cbind() and rbind().

x <- 1:3
y <- 10:12

cbind(x, y)

rbind(x, y)


# Factors
## Factors are used to represent categorical data. They can be ordered or unordered.
## One can think of a factor as an integer vector where each integer has a label.
### Factors are treated specially by modeling functions like lm() and glm()
### Using factors with labels is better than using integers because factors are self-describing;
### having a variable that has values "Male" and "Female" is better than a variable that has 
### values 1 and 2.

x <- factor(c("yes", "yes", "no", "yes", "no"))
x
table(x)

unclass(x)
attr(x,  "levels")
?attr

### The order of the levels can be set using the levels argument to factor(). This can 
### be important in linear modeling because the first level is used as the baseline level.

x <- factor(c("yes", "yes", "no", "yes", "no"), 
            levels = c("yes", "no"))
x

# Missing values

### Missing values are denoted by NA or NaN for undefined mathematical operations.
# - is.na() is used to test objects if they are NA
# - is.nan() is used to test for NaN
# - NA values have a class also, so there are integer NA, character NA, etc.
# A NaN value is also NA but the converse is not true

x <- c(1, 2, NA, 10, 3)

is.na(x)

is.nan(x)

x <- c(1, 2, NaN, NA, 4)

is.na(x)

is.nan(x)

# Data Frames

### Data Frames are used to store tabular data

# - They are represented as a special type of list where every element of the list has to
# have the same length.

# - Each element of the list can be thought of as a column and the length of each element of 
# the list is the number of rows.

# - Unlike matrices, data frames can store different classes of objects in each 
# column (just like lists); matrices must have every element be the same class

# - Data frames also have a special attribute called row.names

# - Data frames are usually created by calling read.tables() or read.csv()

# - Can be converted to a matrix by calling data.matrix()

x <- data.frame(foo=1:4, bar=c(T, T, F, F))
x
nrow(x)
ncol(x)

# The Names Attribute

### R objects can also have names, which is very useful for writing readable code
### and self-describing objects.

### Vectors example 
x <- 1:3
names(x)

names(x) <- c("foo", "bar", "norf")

x
names(x)

### Lists can also ave names
x <- list(a=1, b=2, c=3)
x

### And matrices.

m  <- matrix(1:4, nrow=2, ncol=2)
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m

# Summary
# Data Types
# - atomic classes: numeric, loical, character, integer, complex
# - vectors, lists
# - factors
# - missing values
# - data frames
# - names

