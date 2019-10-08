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
#' brute_force_knapsack2(x = knapsack_objects[1:8,], W = 3500)
#' brute_force_knapsack2(x = knapsack_objects[1:12,], W = 3500)
#' brute_force_knapsack2(x = knapsack_objects[1:8,], W = 2000)
#' brute_force_knapsack2(x = knapsack_objects[1:12,], W = 2000)
#' 
#' @references \url{http://data.riksdagen.se/}
#'
#' @import parallel
#' @import foreach
#' @import doParallel
#'
#' @export
#' 


# Function
brute_force_knapsack2 <- function(x, W, parallel = FALSE){
  combn <- 1:(2^nrow(x))
  
  .calculate_row <- function(i, span, x, W){
    bin <- as.logical(head(intToBits(span[i]), nrow(x)))
    temp_weight <- sum(x[,1][bin])
    
    if(temp_weight <= W){
      return(c(temp_weight,
             sum(x[,2][bin])))
    }else{
      return(c(NA,NA))
    }
  }
  
  result <- list()
  
  if(parallel){
    # Leave 1 core for other processes to not lock the computer.
    no_cores <- max(1, detectCores() - 1)
    
    if(Sys.info()['sysname'] == "Windows"){
      cl <- makeCluster(no_cores, type="PSOCK") 
    }else{
      cl <- makeCluster(no_cores, type="FORK") 
    }
    result <- parLapply(cl=cl, X=combn, fun=.calculate_row, combn, x, W, chunk.size = as.integer(combn/no_cores))
    
    #registerDoParallel(cl)
    #result <- foreach(i=combn) %dopar% .calculate_row(i, combn, x, W)
    stopCluster(cl)
  }else{
    for(i in combn){
      result[[i]] <- .calculate_row(i, combn, x, W)
    }
  }
  
  result <- matrix(unlist(result), byrow = TRUE, ncol=2)
  result_index <- which.max(result[,2])
  value <- result[result_index, 2]
  elements <- which(as.logical(head(intToBits(result_index), nrow(x))))
  
  return(list("value"=value, "elements"=elements))
}


