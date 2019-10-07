#' The knapsack problem: Greedy approximation algorithm.
#'
#' The knapsack problem is a discrete optimization problem where we have a knapsack that can take a 
#' limited weight W and we want to fill this knapsack with a number of items i = 1,...,n, each with 
#' a weight w(i) and a value v(i). The goal is to find the knapsack with the largest value of the 
#' elements added to the knapsack.
#' 
#' \code{greedy_knapsack} uses the Greedy approximation algorithm.
#'  
#' @param x an object of class data.frame with two variables v (values) and w (weights).
#' @param W numeric scalar object that represents the knapsack size.
#'
#' @return  \code{greedy_knapsack} returns a list with two elements: 
#' 
#' (i) the elements added to the knapsack and 
#' 
#' (ii) the maximum knapsack value.
#'
#' @examples
#' greedy_knapsack(x = knapsack_objects[1:8,], W = 3500)
#' greedy_knapsack(x = knapsack_objects[1:12,], W = 3500)
#' greedy_knapsack(x = knapsack_objects[1:8,], W = 2000)
#' greedy_knapsack(x = knapsack_objects[1:12,], W = 2000)
#' 
#' @references \url{https://en.wikipedia.org/wiki/Knapsack_problem#Greedy_approximation_algorithm}
#'
#' @export
#'


# Data
set.seed(42)
n <- 2000
knapsack_objects <-
  data.frame(
    w=sample(1:4000, size = n, replace = TRUE),
    v=runif(n = n, 0, 10000)
  )

# Function
greedy_knapsack <- function(x, W){
  
}
