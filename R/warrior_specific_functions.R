get_latest_warrior_data_file_names <- function(from_directory='~/Downloads/') {
  # Gets the latest (in terms of date) downloaded warrior data and dictionary data
  # from the given from_directory.
  #
  # Args:
  #   from_directory a directory where to find the latest data
  # Returns:
  #   a list containing two files: the latest warrior data and the latest dictionary data
  # from the given from_directory

  # Locates latest files for each input
  input <- c("data", "metadata")
  pattern <- c("WARRIOR_DATA_20\\d\\d.*\\.csv", "WARRIOR_DataDictionary_20\\d\\d.*\\.csv")
  find_latest_data <- function(x, dir) head(sort(list.files(path = dir, pattern = x), decreasing=TRUE), n=1)
  file_names <- unlist(lapply(pattern , FUN=find_latest_data, dir=from_directory))
  names(file_names) <- input

  return(file_names)
}
