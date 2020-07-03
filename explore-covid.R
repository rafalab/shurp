library("tidyverse")
library("lubridate")
dat <- read_csv("https://covidtracking.com/api/v1/states/daily.csv") %>%
  mutate(date = ymd(date))

## NY Cases
dat %>% 
  filter(state == "NY") %>%
  ggplot(aes(x = date, y = positiveIncrease)) +
  geom_point() +
  geom_line(show.legend = FALSE)

## comparing positivity rates for NY and FL
dat %>% 
  filter(state %in% c("NY", "FL") & positiveIncrease+negativeIncrease>250) %>% 
  ggplot(aes(x = date, y = positiveIncrease/(positiveIncrease+negativeIncrease), color = state)) +
  geom_point() +
  geom_line(show.legend = FALSE)

## Puerto Rico
dat %>% 
  filter(state == "PR") %>%
  ggplot(aes(x = date, y = positiveIncrease)) +
  geom_point() +
  geom_line(show.legend = FALSE)

## Hawaii
dat %>% 
  filter(state == "HI"  & positiveIncrease+negativeIncrease>250) %>%
  ggplot(aes(x = date, y = positiveIncrease/(positiveIncrease+negativeIncrease))) +
  geom_point() +
  geom_line(show.legend = FALSE)

## FL Cases
dat %>% 
  filter(state == "FL") %>%
  ggplot(aes(x = date, y = positiveIncrease)) +
  geom_point() +
  geom_line(show.legend = FALSE)


pop <- tibble(state =c("AZ", "FL", "NY"), 
                  population = c(7.279 * 10^6,
                                 21.48 * 10^6,
                                 19.45 * 10^6))

## comparing positivity rates for NY and FL
dat %>% 
  filter(state %in% c("NY", "FL", "AZ") ) %>% 
  left_join(pop, by = "state") %>%
  ggplot(aes(x = date, y = deathIncrease/population * 10^6,
             color = state)) +
  geom_point() +
  geom_line(show.legend = FALSE)

