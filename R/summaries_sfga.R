#' Generate table of counts of size for gestational age classications
#' @param sfga.vector Vector containing size for gestational age classifications (i.e. 'SGA', 'AGA', 'LGA').
#' @return Data frame with three columns (one for each size for gestational age classifications) and one row with counts for each classification in sfga.vector
#' @export
get_sfga_summaries <- function(sfga.vector) {
  sfga.classes <- c("SGA" = "SGA", "AGA" = "AGA", "LGA" = "LGA")
  if (length(dplyr::setdiff(sfga.vector, sfga.classes)) != 0) {
    stop(paste0("You provided invalid values for size for gestational age classifications in sfga.vector. Accepted
                values are 'SGA', 'AGA' or 'LGA'."))
  }
  out_dataframe <- purrr::map_dfr(
    .x = sfga.classes,
    .f = ~ {
      count <- as.integer(table(sfga.vector)[.x])
      if (is.na(count)) return(as.integer(0)) else return(count)
    })
  return(out_dataframe)
}