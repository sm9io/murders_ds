library(tidyverse)
load("rda/murders.rda")
murders %>% mutate(abb = reorder(abb, rate)) %>%
  ggplot(aes(abb, rate, color = cut(rate, quantile(rate)))) +
  geom_bar(width = 0.5, stat = "identity") +
  coord_flip() + 
  labs(color = "Range", x = "State", y = "Murders per 100,000", title = "US Gun Murders 2010")

ggsave("figs/barplot.png", scale = 2)
