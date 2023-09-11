library(dslabs)

### 4.2 
# 1
head(co2)
## d

# 2
head(ChickWeight)
## b

# 3 
head(BOD)
## c

# 4
head(BJsales) # no
head(EuStockMarkets) # yes
head(DNase) # yes
head(Formaldehyde) # yes
head(Orange) # yes
head(UCBAdmissions) # no

### 4.4
library(dplyr)
library(dslabs)

# 1
murders = murders %>% mutate(population_in_hundredThousands = population / 10^5,
                             rate = total/population_in_hundredThousands)

# 2 
murders = murders %>% mutate(rank = rank(-rate))

# 3 
murders %>% select(state, abb)

# 4 
murders %>% filter(rank >= 46)

# 5
no_south = murders %>% filter(region != "South")
nrow(no_south)

# 6
murders_nw = murders %>% filter(region %in% c("Northeast", "West"))

# 7 
my_states = murders_nw %>% filter(rate < 1) %>% select(state, rate, rank)

### 4.6
# 1
my_states = murders %>%
  mutate(rate = total/population * 100000,
         rank = rank(-rate)) %>%
  filter(region %in% c("Northeast", "West"),
         rate < 1) %>%
  select(state, rate, rank)

### 4.10
# 1 
library(NHANES)
ref = NHANES %>% filter(Gender == "female", AgeDecade == " 20-29") %>% summarise(avg_SBP = mean(BPSysAve, na.rm = TRUE),
                                                                                 sd_SBP = sd(BPSysAve, na.rm = TRUE))

# 2
ref_avg = ref %>% pull(avg_SBP)

# 3
NHANES %>% filter(Gender == "female", AgeDecade == " 20-29") %>% summarise(min_SBP = min(BPSysAve, na.rm = TRUE),
                                                                           max_SBP = max(BPSysAve, na.rm = TRUE))

# 4
NHANES %>% group_by(AgeDecade) %>% filter(Gender == "female") %>% summarise(avg_SBP = mean(BPSysAve, na.rm = TRUE),
                                                                            sd_SBP = sd(BPSysAve, na.rm = TRUE))

# 5
NHANES %>% group_by(AgeDecade) %>% filter(Gender == "male") %>% summarise(avg_SBP = mean(BPSysAve, na.rm = TRUE),
                                                                          sd_SBP = sd(BPSysAve, na.rm = TRUE))
# 6
NHANES %>% group_by(AgeDecade, Gender) %>% summarise(avg_SBP = mean(BPSysAve, na.rm = TRUE),
                                                     sd_SBP = sd(BPSysAve, na.rm = TRUE))

# 7
NHANES %>% filter(Gender == "male", AgeDecade == " 40-49") %>% 
  group_by(Race1) %>% summarise(avg_SBP = mean(BPSysAve, na.rm = TRUE),
                                sd_SBP = sd(BPSysAve, na.rm = TRUE)) %>%
  arrange(avg_SBP)
  
## 4.15
# 1
head(murders)
class(murders)
## b

# 2
murders_tibble = as_tibble(murders)

# 3
murders_grouped = murders_tibble %>% group_by(region)

# 4
murders %>% pull(population) %>% log() %>% mean() %>% exp()

# 5
library(purrr)
compute_s_n <- function(n, colname){
  x <- 1:n
  tibble(sum = sum(x))
}

tibble(n = 1:100) %>% mutate(s_n = map_df(n, compute_s_n) %>% pull(sum),
                             s_n_2 = map_df(s_n, compute_s_n) %>% pull(sum))

