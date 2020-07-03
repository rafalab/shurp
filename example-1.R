library("tidyverse")

murders %>% arrange(desc(total))

murders %>% ggplot(aes(population, total/population * 10^5, 
                       label = abb, 
                       color = region)) +
  geom_text(cex = 2)

