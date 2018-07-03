get_categorical_field_labels <- function(metadata) {
  # Generates a row of key-value pair data for each key in each
  # categorical variable in a REDCap metatdata file.
  #
  # Args:
  #   metadata an REDCap metadata file in with columns in the
  #   standardized format defined in
  #      https://github.com/SpectrumHealthResearch/REDCapRITS/blob/master/R/R/REDCap_split.r
  # Returns:
  #   a dataframe with the columns, "field_name", "form_name", "key", and "value"
  #
  categorical_fields <- metadata %>%
    filter(field_type %in% c("checkbox", "radio", "yesno")) %>%
    select(c(field_name, field_label, form_name, select_choices_or_calculations))

  # Split column into rows by '|'
  categorical_fields <- categorical_fields %>% mutate(select_choices_or_calculations = strsplit(as.character(select_choices_or_calculations), "\\|\\s?")) %>% unnest(select_choices_or_calculations)

  # Split column into two columns by ','
  categorical_fields <- categorical_fields %>% separate(select_choices_or_calculations, c("key", "value"), sep="\\,", extra = "merge")

  return(categorical_fields)
}
