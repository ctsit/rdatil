#' Gets the latest downloaded files (in terms of date) from the provided
#' from_directory, as well as the date reflected in the filenames.
#' If no arguments are provided, the directory is assumed to be the '~/Downloads/' folder.
#'
#' @param from_directory A directory where to find the latest data.
#' @param patterns A key-value pairs vector containing the label and regex pattern.
#' @return A vector containing key-value pairs where the keys are the labels in 'patterns'
#'         and the values are the latest file names according to the patterns.
#' @export
#' @examples
#' get_latest_data_file_names(from_directory, patterns)
#' get_latest_data_file_names(patterns = patterns)
get_latest_data_file_names <- function(from_directory='~/Downloads/', patterns) {
  find_latest_data <- function(x, dir) head(sort(list.files(path = dir, pattern = x), decreasing=TRUE), n=1)
  file_names <- unlist(lapply(patterns[names(patterns) != 'date'] , FUN=find_latest_data, dir=from_directory))
  date <- stringr::str_extract(file_names[1], patterns['date'])
  file_names <- c(file_names, date)
  names(file_names) <- c(names(patterns[names(patterns) != 'date']), 'date')

  return(file_names)
}
