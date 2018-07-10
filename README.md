# About

**REDCap** data and metadata utilities for R.


# Functions overview

`get_categorical_field_labels`: Generates a dataset with key-value pairs mapping variable names to their corresponding labels.

`standarize_metadata`: Standardizes variable names in the metadata file according to the [SpectrumHealthResearch](https://github.com/SpectrumHealthResearch/REDCapRITS/blob/master/R/R/REDCap_split.r) format.

`get_latest_warrior_data_file_names`: This function is specific to the **WARRIOR** project. It obtains the latest downloaded **WARRIOR** data and metadata data filenames (in terms of date) from the provided from_directory, as well as the date provided in their filenames.
