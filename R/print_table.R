print_table <- function(data, columns) {
  # Makes a pretty table with the given data and labels.
  #
  # Args:
  #   the data to be displayed and the column names
  # Returns:
  #   a kable
  fig <- round(prop.table(table(data))*100, digits = 1)
  fig <- as.data.frame(fig)
  names(fig) <- columns

  return(knitr::kable(fig, booktabs = T) %>% kableExtra::kable_styling(latex_options = "striped"))
}