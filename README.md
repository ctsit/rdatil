# About

**REDCap** data and metadata utilities for R.


# Functions overview

`get_categorical_field_labels`: Generates a dataset with key-value pairs mapping variable names to their corresponding labels.

`standarize_metadata`: Standardizes variable names in the metadata file according to the [SpectrumHealthResearch](https://github.com/SpectrumHealthResearch/REDCapRITS/blob/master/R/R/REDCap_split.r) format.

`get_latest_data_file_names`: Obtains the latest downloaded data and metadata data filenames (in terms of date) from the provided from_directory based on the given pattern, as well as the date provided in their filenames.

`print_table`: Outputs a table with the percentage and count of the given factor input data.

`trim_repeating_instruments`: removes all REDCap repeating instruments from a dataframe using tidy tools.
