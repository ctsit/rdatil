# Create the standardized metadata from a GUI-downloaded REDCap data dictionary and the
# standarize_metadata function.  standarize_metadata is also part of the rdatil library

library(rdatil)
animal_metadata <- read.csv("AnimalIdentification_DataDictionary.csv")
animal_metadata <- standarize_metadata(animal_metadata)
save(animal_metadata, file="animal_metadata.RData")
