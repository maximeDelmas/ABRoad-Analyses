library(tidyverse)

data <- read_csv("/home/mdelmas/Documents/ABRoad/data/Analyses/KG-NaturalProducts-stats/data/taxon-np-list.csv")

list.of.np <- unique(data$pubchemId)
write.table(data.frame(CID = list.of.np), file = "/home/mdelmas/Documents/ABRoad/data/Analyses/KG-NaturalProducts-stats/data/all_np.csv", row.names = F, col.names = F)
