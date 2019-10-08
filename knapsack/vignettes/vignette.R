## ---- message=FALSE, warning=FALSE---------------------------------------
# You may need to install and load this package first: install.packages("devtools")
library(devtools)

# devtools::install_github("laurajuliamelis/Lab6",subdir="knapsack")
library(knapsack)

## ----include=FALSE-------------------------------------------------------
# We need this package to measure the time that it takes to evaluate the functions.
#install.packages("microbenchmark")
library(microbenchmark)

# We need this package for the profiling.
# install.packages("profvis")
library(profvis)

## ------------------------------------------------------------------------
set.seed(42)
n <- 2000
knapsack_objects <- data.frame( w=sample(1:4000, size = n, replace = TRUE),
                                v=runif(n = n, 0, 10000))

## ------------------------------------------------------------------------
brute_force_knapsack(x = knapsack_objects[1:8,], W = 3500)

## ------------------------------------------------------------------------
microbenchmark(brute_force_knapsack(x = knapsack_objects[1:16,], W = 3500), times = 5)

## ------------------------------------------------------------------------
knapsack_dynamic(x = knapsack_objects[1:8,], W = 3500)

## ------------------------------------------------------------------------
microbenchmark(knapsack_dynamic(x = knapsack_objects[1:500,], W = 3500), times = 5)

## ------------------------------------------------------------------------
greedy_knapsack(x = knapsack_objects[1:8,], W = 3500)

## ------------------------------------------------------------------------
set.seed(42)
n <- 1000000
knapsack_objects <- data.frame( w=sample(1:4000, size = n, replace = TRUE),
                                v=runif(n = n, 0, 10000))

microbenchmark(greedy_knapsack(x = knapsack_objects[1:1000000,], W = 3500), times = 5)

## ------------------------------------------------------------------------
profvis(brute_force_knapsack(x = knapsack_objects[1:16,], W = 3500))

## ------------------------------------------------------------------------
profvis(knapsack_dynamic(x = knapsack_objects[1:500,], W = 3500))

## ------------------------------------------------------------------------
profvis(greedy_knapsack(x = knapsack_objects[1:1000000,], W = 3500))

## ------------------------------------------------------------------------
microbenchmark(brute_force_knapsack(x = knapsack_objects[1:16,], W = 3500), times = 5)

## ------------------------------------------------------------------------
microbenchmark(brute_force_knapsack(x = knapsack_objects[1:16,], W = 3500, parallel = TRUE), times = 5)

## ------------------------------------------------------------------------
microbenchmark(brute_force_knapsack(x = knapsack_objects[1:20,], W = 3500), times = 1)

## ------------------------------------------------------------------------
microbenchmark(brute_force_knapsack(x = knapsack_objects[1:20,], W = 3500, parallel = TRUE), times = 1)

