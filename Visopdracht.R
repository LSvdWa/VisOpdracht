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


Categorie <- c("Aantasting", "Verplichte compensatie", "Compensatie door project")
Waardes <- c(8.26, 15.14, 33)
df <- data.frame(Categorie, Waardes)
df <- df %>%
  mutate(Categorie = factor(Categorie, levels = Categorie[order(Waardes)]))

ggplot(df, aes(x = Categorie, y = Waardes, fill = Categorie)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("red", "skyblue", "green")) +
  labs(x = "Categorie", y = "Waarde", title="Compensatie Natuurnetwerk Nederland") +
  theme_minimal()

data4 <- data.frame(
  A = c("Pseudogene/ambiguous, 17%", "5' to known gene, 22%", "Novel, 24%", "Within or 3' flanking to a known gene, 36%"),
  B = c(17, 22, 24, 36)
)



colors <- c("lightblue", "purple", "lightyellow", "maroon")

pie(
  data4$B,                     # values
  labels = data4$A,            # labels
  col = colors,                # colors
  main = "Distribution of all TFBS Regions",
  clockwise = TRUE,
  cex = 0.8                     # optional: make labels smaller
)

