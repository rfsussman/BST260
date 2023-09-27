## 7.14

library(dplyr)
library(ggplot2)
library(dslabs)

# 1
p = ggplot(data = murders)
class(p)

# 2
p
## b

# 3
p = heights %>% ggplot()

# 4
class(p)

# 5
str(murders)
## c

# 6
murders %>% 
  ggplot(aes(x = total, y = population)) +
  geom_point()

# 7
murders %>% 
  ggplot(aes(total, population)) +
  geom_point()

# 8
murders %>% 
  ggplot(aes(total, population)) +
  geom_label()
## a

# 9
murders %>% 
  ggplot(aes(total, population)) +
  geom_label(aes(label = abb))

# 10
## d

# 11
murders %>% 
  ggplot(aes(total, population)) +
  geom_label(aes(label = abb), color = "blue")

# 12
## b

# 13
murders %>% 
  ggplot(aes(total, population)) +
  geom_label(aes(label = abb, color = region))

# 14
p <- murders |> 
  ggplot(aes(population, total, label = abb, color = region)) +
  geom_label()  + 
  scale_x_log10()

# 15
p <- murders |> 
  ggplot(aes(population, total, label = abb, color = region)) +
  geom_label()  + 
  scale_x_log10() + 
  scale_y_log10() 
  
# 16
p <- murders |> 
  ggplot(aes(population, total, label = abb, color = region)) +
  geom_label()  + 
  scale_x_log10() + 
  scale_y_log10() + 
  ggtitle("Gun murder data")
