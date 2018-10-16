#' Makes a pretty table with the given data and labels.
#'
#' @param data A data frame containing the data.
#' @param columns A vector containing the column names.
#' @return A kable.
#' @export
#' @examples
#' data <- c('Female', 'Female', 'Female', 'Male')
#' main_column_name <- c('Gender')
#' print_table(data, main_column_name)
print_table <- function(data, main_column_name) {
  fig <- as.data.frame(round(prop.table(table(data))*100, digits = 1))
  fig <- fig %>%
    left_join(., as.data.frame(table(data)), by="data") %>%
    mutate (!!main_column_name := data) %>%
    mutate (
      `Percent (Count)` = paste0(Freq.x, "% (", Freq.y, ")")
    ) %>%
    select(-Freq.x, -Freq.y, -data)

  return(knitr::kable(fig, booktabs = T) %>% kableExtra::kable_styling(latex_options = "striped"))
}
