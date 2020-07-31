## error bars
library(dslabs)
results <- gapminder %>% filter(year == 2015) %>%
  group_by(continent) %>%
  summarize(n = n(), mean = mean(population), se = sd(population)/sqrt(n))
  
results %>% 
  ggplot(aes(continent, mean))+
  geom_point() + 
  geom_errorbar(aes(ymin = mean - 2*se, ymax = mean + 2*se))
  
results %>% 
  ggplot(aes(continent, mean))+
  geom_errorbar(aes(ymin = mean - 2*se, ymax = mean + 2*se), width = 0.5) +
  geom_bar(stat = "identity") +
  geom_point(data = gapminder %>% filter(year == 2015), aes(y=population))


results %>% 
  ggplot(aes(continent, mean))+
  geom_point(data = gapminder %>% filter(year == 2015), aes(y=population), alpha = 0.5) +
  geom_point() + 
  geom_errorbar(aes(ymin = mean - 2*se, ymax = mean + 2*se), color = "blue") +
  scale_y_log10()

 