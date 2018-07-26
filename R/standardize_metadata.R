#' Renames columns in a REDCap metadata file according to the format defined in
#' https://github.com/SpectrumHealthResearch/REDCapRITS/blob/master/R/R/REDCap_split.r
#' and fills out the categorical data for fields of type 'yesno'.
#'
#' @param metadata A REDCap metadata in REDCap's standard format.
#' @return A REDCap metadata in the SpectrumHealthResearch format
#'         with filled out categorical data for 'yesno' fields.
#' @export
#' @examples
#' standarize_metadata(metadata)
standarize_metadata <- function(metadata) {
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
