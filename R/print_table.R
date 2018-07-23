#' Makes a pretty table with the given data and labels.
#'
#' @param data A data frame containing the data.
#' @param columns A vector containing the column names.
#' @return A kable.
#' @examples
#' print_table(data, columns)
print_table <- function(data, columns) {
  fig <- round(prop.table(table(data))*100, digits = 1)
  fig <- as.data.frame(fig)
  names(fig) <- columns

  return(knitr::kable(fig, booktabs = T) %>% kableExtra::kable_styling(latex_options = "striped"))
}
