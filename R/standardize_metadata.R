standarize_metadata <- function(metadata) {
  # Standardizes variable names in the REDCap metadata file.
  # Renames columns in a REDCap metadata file according to the
  # format defined in
  #   https://github.com/SpectrumHealthResearch/REDCapRITS/blob/master/R/R/REDCap_split.r
  #
  # Args:
  #   REDCap metadata in REDCap's standard format.
  # Returns:
  #   REDCap metadata in the SpectrumHealthResearch format
  #
  names(metadata) <- c(
    "field_name", "form_name", "section_header", "field_type",
    "field_label", "select_choices_or_calculations", "field_note",
    "text_validation_type_or_show_slider_number", "text_validation_min",
    "text_validation_max", "identifier", "branching_logic", "required_field",
    "custom_alignment", "question_number", "matrix_group_name", "matrix_ranking",
    "field_annotation"
  )
  return(metadata)
}
