#' Generates a row of code-label pair data for each code in each
#' categorical variable in a REDCap metatdata file.
#'
#' @param metadata A REDCap metadata file with columns in the standardized format defined in
#'        https://github.com/SpectrumHealthResearch/REDCapRITS/blob/master/R/R/REDCap_split.r
#' @return A dataframe with the columns, "field_name", "field_type", form_name", "code", and "label".
#' @import dplyr
#' @importFrom utils head
#' @export
#' @examples
#' metadata <- read.csv('AnimalIdentification_DataDictionary.csv')
#' get_categorical_field_labels(metadata)
get_categorical_field_labels <- function(metadata) {
  categorical_fields <- metadata %>%
    dplyr::filter(field_type %in% c("checkbox", "radio", "yesno", "dropdown")) %>%
    dplyr::select(c(field_name, field_type, field_label, form_name, select_choices_or_calculations))

  # Fill out categorical data for fields of type 'yesno'
  categorical_fields$select_choices_or_calculations[categorical_fields$select_choices_or_calculations == "" &
                                                      categorical_fields$field_type == "yesno"] = '1, Yes|0, No'

  # Split columns into rows by '|'
  categorical_fields <- categorical_fields %>%
    dplyr::mutate(select_choices_or_calculations = strsplit(as.character(select_choices_or_calculations), "\\|\\s?")) %>%
    unnest(select_choices_or_calculations)

  # Split columns into two columns by ','
  categorical_fields <- categorical_fields %>%
    separate(select_choices_or_calculations, c("code", "label"), sep=",\\s?", extra = "merge") %>%
    mutate(key=code, value=label)

  return(categorical_fields)
}
