#' GET_votation
#'
#' \code{GET_votation} makes a GET request for data from the 
#' Swedish Parlament API, specifically for votations.
#' 
#' 
#' @param period a 
#' @param span b

#' @return 
#'
#' @examples
#' brute_force_knapsack(x = knapsack_objects[1:8,], W = 3500)
#' brute_force_knapsack(x = knapsack_objects[1:12,], W = 3500)
#' brute_force_knapsack(x = knapsack_objects[1:8,], W = 2000)
#' brute_force_knapsack(x = knapsack_objects[1:12,], W = 2000)
#' 
#' @references \url{http://data.riksdagen.se/}
#'
#' @importFrom xml2 read_xml
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
brute_force_knapsack <- function(x, W){
  combn <- 1:(2^nrow(x))
  bin <- matrix(NA, nrow=2^nrow(x), ncol=nrow(x))
  for(i in combn){
    bin[i,]<- as.integer(head(intToBits(combn[i]), nrow(x))) 
  }
  
  weight <- W
  elements <- vector()
  value <- 0
  for(i in 1:nrow(bin)){
    temp_weight <- sum(x[,1][as.logical(bin[i,])])
   
     if(temp_weight <= W){
      temp_value <- sum(x[,2][as.logical(bin[i,])])
      
      if(temp_value > value || (temp_value == value && temp_weigth < weight)){
        weigth <- temp_weight
        value <- temp_value
        elements <- which(as.logical(bin[i,]))
      }
    }
  }
  
  return(list("value"=value, "elements"=elements))
}


