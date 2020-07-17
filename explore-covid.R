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

## cases and deaths
## comparing positivity rates for NY and FL
dat %>% 
  filter(state %in% c("NY") &
           date >= make_date(2020, 3, 21)) %>% 
  ggplot(aes(date, deathIncrease)) +
  geom_point() +
  geom_line()

dat %>% 
  filter(state %in% c("NY") &
           date >= make_date(2020, 3, 21)) %>%
  ggplot(aes(date, positiveIncrease/(positiveIncrease+negativeIncrease))) +
  geom_point() +
  geom_line()

dat %>% 
  filter(state %in% c("IL", "MA", "NY", "CT", "PA","LA",
                      "FL","AZ","TX","CA") &
           date >= make_date(2020, 3, 21)) %>%
  mutate(rate = positiveIncrease/(positiveIncrease+negativeIncrease),
         pct_death = deathIncrease/max(deathIncrease)) %>%
  ggplot(aes(x = date)) +
  geom_point(aes(y = rate), col = "red")+
  geom_point(aes(y = pct_death), col = "blue")+
  geom_smooth(aes(y = rate), col = "red", span = 0.2)+
  geom_smooth(aes(y = pct_death), col = "blue", span = 0.2) +
  facet_wrap(~state, scales = "free_y")

dat %>% 
  filter(state %in% c("NY") ) %>% 
  ggplot(aes(x = date, y = positiveIncrease/(positiveIncrease+negativeIncrease),
             color = state)) +
  geom_point() +
  geom_line(show.legend = FALSE)




