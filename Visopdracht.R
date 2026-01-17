dataRDS <- read.csv("./dataset.rds")
dataRDS <- na.omit(dataRDS) # removes NA from important columns
saveRDS(dataRDS, "./dataset.rds")
dataset <- readRDS("./dataset.rds")
