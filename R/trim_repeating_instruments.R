trim_repeating_instruments <- function(records) {
  # Removes repeating instruments.
  #
  # Args:
  #   the records
  # Returns:
  #   the records with no repeating instruments
  records <- records %>% filter(redcap_repeat_instrument == "" | is.na(redcap_repeat_instrument)) %>% select(-redcap_repeat_instrument, -redcap_repeat_instance)

  return(records)
}
