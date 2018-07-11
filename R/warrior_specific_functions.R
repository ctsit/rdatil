get_latest_data_file_names <- function(from_directory='~/Downloads/', patterns) {
  # Gets the latest downloaded files (in terms of date) from the provided
  # from_directory, as well as the date reflected in the filenames.
  # If no arguments are provided, the directory is assumed to be the '~/Downloads/' folder.
  #
  # Args:
  #   from_directory = a directory where to find the latest data,
  #   patterns = key-value pairs containing label and regex patter.
  # Example:
  #   patterns <- c("data" = "WARRIOR_DATA_20\\d\\d.*\\.csv", "date" = "\\d{4}-\\d{2}-\\d{2}")
  # Returns:
  #   a list containing of key-value pairs where the keys are the labels in 'patterns'
  #   and the values are the latest file names according to the patterns.
  # Examples:
  #   returned_list[['data']] to get the data file name and
  #   returned_list[['date']] to get the date associated with the data.
  find_latest_data <- function(x, dir) head(sort(list.files(path = dir, pattern = x), decreasing=TRUE), n=1)
  file_names <- unlist(lapply(patterns[names(patterns) != 'date'] , FUN=find_latest_data, dir=from_directory))
  date <- stringr::str_extract(file_names[1], patterns['date'])
  file_names <- c(file_names, date)
  names(file_names) <- c(names(patterns[names(patterns) != 'date']), 'date')

  return(file_names)
}
