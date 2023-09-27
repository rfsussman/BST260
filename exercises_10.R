library(dslabs)

# 1
## c and d

# 2
## b

# 3
## c

# 4
dat <- us_contagious_diseases |>  
  filter(year == 1967 & disease=="Measles" & !is.na(population)) |>
  mutate(rate = count / population * 10000 * 52 / weeks_reporting)

state <- dat$state
rate <- dat$count/dat$population*10000*52/dat$weeks_reporting

state = reorder(state, rate)

# 5
dat <- us_contagious_diseases |>  
  filter(year == 1967 & disease=="Measles" & !is.na(population)) |>
  mutate(rate = count / population * 10000 * 52 / weeks_reporting,
         state = reorder(state, rate))

dat %>%
  ggplot(aes(state, rate)) + geom_bar(stat = "identity") + coord_flip()

# 6
## c

# 7
murders %>% mutate(rate = total/population*100000, 
                   region_ordered = reorder(region, rate)) %>%
  ggplot(aes(region_ordered, rate)) + 
  geom_boxplot()

# 8
## a
                   