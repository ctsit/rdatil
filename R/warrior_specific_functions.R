get_latest_warrior_data_file_names <- function(from_directory='~/Downloads/') {
  # Gets the latest downloaded warrior data and metadata data files
  # names (in terms of date) from the provided from_directory. If no
  # arguments are provided, the directory is assumed to be the '~/Downloads/' folder.
  #
  # Args:
  #   from_directory a directory where to find the latest data
  # Returns:
  #   a list containing two strings: the latest warrior data and the latest
  #   dictionary data file names. To access them, you may use
  #   returned_list[['data']] to get the data file name and
  #   returned_list[['metadata']] to get the metadata file name.

  input <- c("data", "metadata")
  pattern <- c("WARRIOR_DATA_20\\d\\d.*\\.csv", "WARRIOR_DataDictionary_20\\d\\d.*\\.csv")
  find_latest_data <- function(x, dir) head(sort(list.files(path = dir, pattern = x), decreasing=TRUE), n=1)
  file_names <- unlist(lapply(pattern , FUN=find_latest_data, dir=from_directory))
  names(file_names) <- input

  return(file_names)
}
