# 1 
n = 100
n*(n+1)/2

# 2
n = 1000
n*(n+1)/2

# 3
n <- 1000
x <- seq(1, n)
sum(x)
## b

# 4
log(sqrt(100))

# 5
## b

# 6
library(dslabs)
murders = murders
str(murders)
## c

# 7
names(murders)

# 8 
a = murders$abb
class(a)

# 9
b = murders[, "abb"]
class(b)
identical(a, b)

# 10
class(murders$region)
length(levels(murders$region))

# 11
table(murders$region)

# 12
temp = c(35, 88, 42, 84, 81, 30)

# 13
city = c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")

# 14
names(temp) = city

# 15
city[1:3]

# 16
temp[c("Paris", "San Juan")]

# 17
12:73

# 18
seq(1, 99, by = 2)

# 19
seq(6, 54, by = 4/7)
length(seq(6, 54, by = 4/7))

# 20
a <- seq(1, 10, 0.5)
class(a)

# 21
a <- seq(1, 10)
class(a)

# 22
class(1L)

# 23 
x <- c("1", "3", "5")
as.integer(x)

# 24
pop = murders$population
sort(pop)[1]

# 25
pop[order(pop)][1]

# 26
pop[which.min(pop)]

# 27
states = murders$state
states[which.min(pop)]

# 28
ranks = states[order(rank(pop))]
my_df = data.frame(states, rank(pop))

# 29
ind = order(my_df$rank.pop., decreasing = TRUE)
my_df[ind, ]

# 30
ind = is.na(na_example)
sum(ind)

# 31
mean(na_example[!is.na(na_example)])

# 32
temp <- c(35, 88, 42, 84, 81, 30)
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", 
          "San Juan", "Toronto")
city_temps <- data.frame(name = city, temperature = temp)
city_temps$c = (5/9)*(city_temps$temperature - 32)

# 33
sum((1/seq(1, 100))^2)

# 34
murders$murder_rate = (murders$total / murders$population)*100000
mean(murders$murder_rate)

# 35
low = murders$murder_rate < 1

# 36
which(low)

# 37
murders$state[low]

# 38
murders$state[murders$region == "Northeast" & low]

# 39
sum(murders$murder_rate < mean(murders$murder_rate))

# 40
ind = match(c("AK", "MI", "IA"), murders$abb)
murders$state[ind]

# 41
which(c("MA", "ME", "MI", "MO", "MU") %in% murders$abb)

# 42
which(!(c("MA", "ME", "MI", "MO", "MU") %in% murders$abb))

# 43
population_in_millions <- murders$population/10^6
total_gun_murders <- murders$total
plot(log10(population_in_millions), log10(total_gun_murders))

# 44
hist(murders$population)

# 45
boxplot(population ~ region, data = murders)
