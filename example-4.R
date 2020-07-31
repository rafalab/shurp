### delaing with missing values: NA
x <- c(2, 3, 5, NA, 6)   
mean(x, na.rm = TRUE)
sd(x, na.rm = TRUE)
sum(x, na.rm = TRUE)

### indexes
x <- c(35, 3, 23, 5, 43, 23, 4)
y <- c("A", "B", "X","T", "Z", "J", "V")

## examples of using indexes
##first one
x[1]

## forth one
x[4]

## fifth and seventh
x[c(5,7)]

## if you order is a sequnce
x[2:4]

## who is older than 20?
x > 20

# indexes can also be logicals
y[x>20]

## use indexes to order
y[order(x)]


## using map_df
library(tidyverse)

ns <- c(10:1000)

s <- function(x) data.frame(n = x, sum = sum(1:x))

df <- map_df(ns, s)

qplot(n, sum, data = df)
my_df <- data.frame(names = c("bill", "ann", "jose"), grades = c("C","B","A"), id = 1:3)


