#test function

test <- function(x){
  x-2
}

test2 <- function(x){
  x^2
  }

library(ggplot2)

plot(test, col = "blue", lwd = 2)
plot(test2, col = "red", lwd = 2)

