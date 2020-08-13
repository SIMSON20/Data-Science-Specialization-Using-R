# Installing packages from CRAN
install.packages("ggplot2")

# Installing multiple packages at one
install.packages(c("Rcmdr", "apple"))

# Installing packages from Bioconductor

source("https://bioconductor.org")

biocLite()

biocLite("GenomicFeatures")

# Installing packages from github

install.packages("devtools")

library("devtools")

#install_github("author/package")

# What packages are installed ?

installed.packages()
library()

# Updating packages 
old.packages()

update.packages()

#install.packages("packagename")

# Version of R used
version

sessionInfo()

# More details about how to use a function or a package

browseVignettes("ggplot2")

?devtools

browseVignettes("devtools")

install.packages("KernSmooth")

library(KernSmooth)
