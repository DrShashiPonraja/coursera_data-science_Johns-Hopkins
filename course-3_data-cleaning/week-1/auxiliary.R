testRunTime400 <- function(functionToTest, ...){
  totalLoops <- 1:400

    system.time({
      for (i in seq_along(totalLoops)){
        functionToTest(...)
      }

    })
  
}

