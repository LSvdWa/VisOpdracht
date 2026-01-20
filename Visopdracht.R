setwd(".")

dataVI <- read.csv("./datas.csv")
dataVI
saveRDS(dataVI, "./data.rds")
dataVIS <- readRDS("./data.rds")

dataVI

library(ggplot2)

ggplot(dataVI, aes(x=year, y=temp)) +
  geom_line() +
  geom_point()

ggplot(tail(dataVI, 30), aes(x=year, y=temp)) +
  geom_line() +
  geom_point() +
  geom_text(
    data = tail(arrange(dataVI, temp), 1),
    aes(label = round(temp, 2)),
    vjust = -1,
    colour = "black",
    size = 4
  ) + theme_minimal()


dataV <- read.csv("./Data2.csv")

library(dplyr)
library(tidyr)
library(ggplot2)

df_long <- dataV %>%
  arrange(desc(X2022.2022)) %>%
  slice(2:17) %>%
  pivot_longer(
    cols = c(X2017.2017, X2022.2022),
    names_to = "Year",
    values_to = "Value"
  )
library(forcats)

ggplot(df_long,
       aes(x = fct_rev(reorder(Exports.by, X2022)),
           y = Value/1000,
           fill = Year)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = NULL, y = "Exports (x Billion dollars)") +
  scale_fill_manual(values = c("X2017.2017" = "orange", "X2022.2022" = "blue"), 
                    labels = c("2017", "2022")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

