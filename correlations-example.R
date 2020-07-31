library(tidyverse)
library(readxl)

dat <- read_xlsx("data/mayo2_Análisis_ecológico_por_condados.xlsx")

names(dat) <- c("st", "state", "id_county", "fips", "geo_name", "population", "hispanic_population",
                "porciento_pr", "ep_pov", "ep_unemp", "ep_age65", "ep_crowd", "ep_limeng", "ep_uninsur", "ep_minrty",
                "ep_disabl", "ep_nohsdp", "cases", "deaths", "rpl_themes")

dat %>% filter(population > 100000 & state %in% c("New York", "New Jersey", "Florida", "Massachusetts")) %>%
  ggplot(aes(porciento_pr, deaths/population)) +
  geom_point() +
  geom_smooth(method = "loess", span = 0.75, method.args = list(degree=1)) +
  facet_wrap(~state)

dat %>% filter(population > 100000 & state %in% c("New York", "New Jersey", "Florida", "Massachusetts")) %>%
  ggplot(aes(porciento_pr, cases/population)) +
  geom_point() +
  geom_smooth(method = "loess", span = 0.75, method.args = list(degree=1)) +
  facet_wrap(~state)


dat %>% filter(state == "New Jersey" & population > 100000) %>%
  ggplot(aes(porciento_pr, cases/population)) +
  geom_point() +
  geom_smooth(method = "lm")

x <- dat %>% filter(state == "New Jersey" & population > 100000) #
cor(x$porciento_pr, x$cases/x$population)

%>%
  ggplot(aes(porciento_pr, cases/population)) +
  geom_point() +
  geom_smooth(method = "lm")


dat %>% filter(population > 100000 & state %in% "New Jersey") %>%
  mutate(y = deaths/population) %>%
  lm(y ~ porciento_pr, data = .)  %>%
  summary %>%
  .$coef



dat %>% filter(state == "New Jersey" & population > 100000) %>% pr

dat %>% filter(State == "New Jersey") %>%
  ggplot(aes(porc_pr_en_condado, `5/31/20_contagios`/`Estimate!!SEX AND AGE!!Total population`)) +
  geom_point() +
  geom_smooth()