library(dslabs)
male <- heights$height[heights$sex == "Male"]
female <- heights$height[heights$sex == "Female"]

# 1
length(female)
length(male)

# 2
female_percentiles = quantile(female, c(0.1, 0.3, 0.5, 0.7, 0.9))
male_percentiles = quantile(male, c(0.1, 0.3, 0.5, 0.7, 0.9))
df = data.frame(female_percentiles, male_percentiles)

# 3
## Asia

# 4
## Africa

# 5
## 20 

# 6
## b

# 7
## Asia

# 8
library(dslabs)
x <- heights$height[heights$sex=="Male"]

length(x[x > 69 & x < 72])/length(x)

### 8.9

# 1 
## c

# 2
heights %>% 
  ggplot(aes(height))

# 3
heights %>% 
  ggplot(aes(height)) + 
  geom_histogram()

# 4
heights %>% 
  ggplot(aes(height)) + 
  geom_histogram(binwidth = 1)

# 5
heights %>% 
  ggplot(aes(height)) + 
  geom_density()

# 6
heights %>% 
  ggplot(aes(height)) + 
  geom_density(aes(group = sex))

# 7
heights %>% 
  ggplot(aes(height)) + 
  geom_density(aes(color = sex))

# 8
heights |> 
  ggplot(aes(height, fill = sex)) + 
  geom_density(alpha = 0.2) 
