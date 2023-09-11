library(tidyverse)
library(lubridate)
library(purrr)
library(pdftools)
library(dslabs)

fn <- system.file("extdata", "RD-Mortality-Report_2015-18-180531.pdf",
                  package="dslabs")
dat <- map_df(str_split(pdf_text(fn), "\n"), function(s){
  s <- str_trim(s)
  header_index <- str_which(s, "2015")[1]
  tmp <- str_split(s[header_index], "\\s+", simplify = TRUE)
  month <- tmp[1]
  header <- tmp[-1]
  tail_index  <- str_which(s, "Total")
  n <- str_count(s, "\\d+")
  out <- c(1:header_index, which(n == 1), 
           which(n >= 28), tail_index:length(s))
  s[-out] |>  str_remove_all("[^\\d\\s]") |> str_trim() |>
    str_split_fixed("\\s+", n = 6) |> _[,1:5] |> as_tibble() |> 
    setNames(c("day", header)) |>
    mutate(month = month, day = as.numeric(day)) |>
    pivot_longer(-c(day, month), names_to = "year", values_to = "deaths") |>
    mutate(deaths = as.numeric(deaths))
}) |>
  mutate(month = recode(month, # 1
                        "JAN" = 1, "FEB" = 2, "MAR" = 3, 
                        "APR" = 4, "MAY" = 5, "JUN" = 6, 
                        "JUL" = 7, "AGO" = 8, "SEP" = 9, 
                        "OCT" = 10, "NOV" = 11, "DEC" = 12)) |>
  mutate(date = make_date(year, month, day)) |> # 2
  filter(date <= "2018-05-01") # 4

# 3
ggplot(dat, aes(date, deaths)) + geom_point()   

# 5
ggplot(dat, aes(yday(date), deaths, col = year)) + geom_point()   

# 6
dat %>%
  mutate(regarding_920 = ifelse(date >= "2017-09-20", "pre", "post")) %>%
  drop_na() %>%
  ggplot(aes(yday(date), deaths, col = regarding_920)) +
  geom_point()

# 7
dat %>%
  filter(!is.na(date)) %>% 
  mutate(regarding_920 = ifelse(date >= "2017-09-20", "pre", "post"),
         no_year_date = as.Date(parse_date_time(yday(date), orders = "j"))) %>%
  drop_na() %>%
  ggplot(aes(no_year_date, deaths, col = regarding_920)) +
  geom_point() + 
  scale_x_date(date_breaks = "1 month", date_labels = "%b")

# 8
dat %>%
  filter(!is.na(date)) %>% 
  mutate(no_year_date = as.Date(parse_date_time(yday(date), orders = "j")),
         no_year_week = round_date(no_year_date, unit = "week")) %>%
  drop_na() %>%
  group_by(no_year_week) %>%
  summarise(deaths = mean(deaths)) %>% 
  ggplot(aes(no_year_week, deaths)) +
  geom_point() + 
  scale_x_date(date_breaks = "1 month", date_labels = "%b")

# 9
dat %>%
  mutate(no_year_date = as.Date(parse_date_time(yday(date), orders = "j")),
         no_year_month = round_date(no_year_date, unit = "month")) %>%
  drop_na() %>%
  group_by(no_year_month) %>%
  summarise(deaths = mean(deaths)) %>% 
  ggplot(aes(no_year_month, deaths)) +
  geom_point() + 
  scale_x_date(date_breaks = "1 month", date_labels = "%b")
