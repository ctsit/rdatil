get_latest_warrior_data <- function(from_directory='~/Downloads/') {
  # Gets the latest (in terms of date) downloaded warrior data and dictionary data
  # from the given from_directory.
  #
  # Args:
  #   from_directory a directory where to find the latest data
  # Returns:
  #   a list containing two files: the latest warrior data and the latest dictionary data
  # from the given from_directory
  #

  subDir <- "warrior_data"
  download_directory <- file.path(from_directory, subDir)
  dir.create(file.path(from_directory, subDir), showWarnings = FALSE)
  require("knitr")
  opts_knit$set(root.dir = download_directory)

  # locate latest files for each input
  input <- c("data", "dictionary")
  pattern <- c("WARRIOR_DATA_20\\d\\d.*\\.csv", "WARRIOR_DataDictionary_20\\d\\d.*\\.csv")
  input_files <- data.frame(input, pattern, stringsAsFactors=FALSE)
  latest_file <- function(x, dir) head(sort(list.files(path = dir, pattern = x), decreasing=TRUE), n=1)
  latest <- unlist(lapply(input_files$pattern , FUN=latest_file, dir=download_directory))
  input_files <- data.frame(input_files, latest, stringsAsFactors=FALSE)

  return(input_files)
}
