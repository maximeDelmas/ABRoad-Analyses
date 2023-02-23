dataset <- read_tsv("data/dataset.tsv")
dataset <- dataset %>% select(fungi_id, pubchem_id) %>% mutate(ID=paste0(fungi_id, pubchem_id))

all_refs <- read_tsv("/home/mdelmas/Documents/ABRoad/data/Analyses/KG-NaturalProducts-stats/data/old-2022/taxon-np-list.tsv")
all_refs <- all_refs[all_refs$TAX_SOURCE == "mycobank-taxonomy",]
all_refs <- all_refs %>% select(cpd_related_taxa_ID, pubchemId, ref) %>% mutate(ID=paste0(cpd_related_taxa_ID, pubchemId))
colnames(all_refs) <- c("fungi_id", "pubchem_id", "ref", "ID")
dataset <- dataset %>% select(fungi_id, pubchem_id) %>% mutate(ID=paste0(fungi_id, pubchem_id))

dataset <- dataset %>% left_join((all_refs %>% select(ID, ref)), by = "ID")