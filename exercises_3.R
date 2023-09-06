# 1
## "Not all positives"

# 2
## d

# 3
new_names = murders[nchar(murders$state) > 8, "abb"]

# 4
sum_n = function(n){
  return(sum(1:n))
}
sum_n(1000)

# 5
altman_plot = function(x, y){
  plot(sum(x, y), y-x)
}
altman_plot(1, 2)

# 6
x <- 3
my_func <- function(y){
  x <- 5
  y+5
}
## 3

# 7
compute_s_n = function(n){
  return(sum((seq(1, n))^2))
}
compute_s_n(10)

# 8
s_n = vector("numeric", 25)
for(i in 1:25){
  s_n[i] = compute_s_n(i)
}

# 9
s_n = sapply(1:25, compute_s_n)

# 10
library(purrr)
s_n = map_dbl(1:25, compute_s_n)

# 11
plot(1:25, s_n)

# 12
compute_s_n(25) == (25*(25+1)*(2*25+1))/6
