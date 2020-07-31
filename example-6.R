library(dslabs)
library(tidyverse)


## This one tells you have many observations in each region
murders %>% 
  ggplot(aes(region)) +
  geom_bar()

## This one tells you the population in each state
murders %>% 
 ggplot(aes(abb, population)) +
  geom_bar(stat = "identity") +
  coord_flip()

## This one is as above but ordering the states by size
murders %>% 
  mutate(abb = reorder(abb, population)) %>%
  ggplot(aes(abb, population)) +
  geom_bar(stat = "identity") +
  coord_flip()


## 
gapminder %>% filter(year == 2015) %>%
  ggplot(aes(continent, population/10^6)) +
  geom_boxplot() +
  scale_y_continuous(trans = "log10", limits = c(1,2000), breaks = c(1,50,100,1000,10000))




