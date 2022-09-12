out <- vector("double", 5)
out <- rep(NA, 5)

for(i in 1:5){
  out[[i]] <- i*2
}
out

for(i in c('this','is', 'some', 'text')){
  print(i)
}
