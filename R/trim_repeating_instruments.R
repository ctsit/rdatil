#' Removes repeating instruments.
#'
#' @param records A data frame containing the records.
#' @return A data frame containing the records with no repeating elements.
#' @export
#' @examples
#' trim_repeating_instruments(Medication_records)
trim_repeating_instruments <- function(records) {
  records <- records %>% filter(redcap_repeat_instrument == "" | is.na(redcap_repeat_instrument)) %>% select(-redcap_repeat_instrument, -redcap_repeat_instance)

  return(records)
}
