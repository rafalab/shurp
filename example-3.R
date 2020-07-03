library(tidyverse)
library(dslabs)
data(murders)

# select
# filter
# mutate
# the pipe %>%
# group_by and summarize

select(murders, state, abb)

filter(murders, population > 10^7)

mutate(murders, rate = total / population * 10^5)

## find states with rates below 1 and only want 
## to state abb and rate

mutate(murders, rate = total / population * 10^5) %>%
  filter(rate <= 1) %>%
  select(abb, rate)

mutate(murders, rate = total / population * 10^5) %>%
  group_by(region) %>%
  summarize(median_rate = median(rate),
            q25 = quantile(rate, 0.25),
            q75 = quantile(rate, 0.75),
            min = min(rate),
            max = max(rate))

## How to read excel

library(readxl)
fn <- "data/2010_bigfive_regents.xls"
tab <- read_xls(fn)

## if you have sheets you can do this
fn <- "data/20_0615-Grafica y Tablas Pruebas Moleculares COVID- semana 15 junio.xlsx"
## look at the sheet names
sheets <- excel_sheets(fn)
## read the ith sheet
i <- 2
tab <- read_xlsx(fn, sheet = sheets[i])

