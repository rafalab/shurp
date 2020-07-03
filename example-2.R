library("tidyverse")
library("lubridate")

states <- read_csv("https://covidtracking.com/api/v1/states/daily.csv") %>%
  mutate(date = ymd(date))

us <- read_csv("https://covidtracking.com/api/v1/us/daily.csv") %>%
  mutate(date = ymd(date))

us %>% filter(date >= make_date(2020, 3, 15)) %>%
  mutate(total_test = positiveIncrease + negativeIncrease) %>%
  ggplot(aes(date, positiveIncrease/total_test)) +
  geom_line() 

us %>% filter(date >= make_date(2020, 3, 15)) %>%
  mutate(total_test = positiveIncrease + negativeIncrease) %>%
  ggplot(aes(date, positiveIncrease)) +
  geom_line() 

us %>% filter(date >= make_date(2020, 3, 15)) %>%
  ggplot(aes(date, deathIncrease)) +
  geom_line() 

states %>% 
  #filter(state %in% c("NY", "MA", "NJ", "PA","CT", "IL", "MI")) %>% 
  filter(state %in% c("TX", "AZ", "FL", "CA")) %>%
  filter(date >= make_date(2020, 3, 15) &
           date <= make_date(2020, 6, 20)) %>%
  ggplot(aes(date, positiveIncrease)) +
  geom_line() +
  facet_wrap(~state)
  
