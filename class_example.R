out <- vector("double", 5)
out <- rep(NA, 5)

for(i in 1:5){
  out[[i]] <- i*2
}
out

for(i in c('this','is', 'some', 'text')){
  print(i)
}


doubler <- function(x) x*2
out<- rep(NA, 5)
for(i in 1:5){
  out[i]<-doubler(i)
}

out


mylist <- list(1, 2, 3, 'some', 'text', 2, 5)
mylist

sum(unlist(lapply(mylist, is.character)))

sum(unlist(lapply(mylist, is.numeric)))


summary <- function(x){
  funs <- c(mean, median, sd, mad, IQR)
  lapply(funs, function(f) f(x, na.rm = TRUE))
}

#function is the object here, being applied as object

summary(c(1,2,3))
summary(c(2,3,5,9,8,14,2))




