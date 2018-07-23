# Create the standardized metadata from a GUI-downloaded REDCap data dictionary and the
# standarize_metadata function.  standarize_metadata is also part of the rdatil library

library(rdatil)
col_classes <- c(
  "factor", # field_name
  "factor",
  "character",
  "factor",
  "character",
  "character", # select_choices_or_calculations
  "character",
  "factor",
  "integer",
  "integer",
  "logical", # identifier
  "character",
  "factor",
  "logical",
  "logical",
  "logical", # matrix_group_name
  "logical",
  "logical"
)
animal_metadata <- read.csv("AnimalIdentification_DataDictionary.csv", colClasses = col_classes)
animal_metadata <- standarize_metadata(animal_metadata)
save(animal_metadata, file="animal_metadata.RData")
