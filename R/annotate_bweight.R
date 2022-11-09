#' Get size for gestational age relative to gestational age and sex (if known) in newborns using birthweight in kg.
#' @param sex The newborn's sex (if known). No default.
#' @param gestational.age.at.birth Gestational age of newborn at birth. No default.
#' @param birthweight.in.kg Newborn birthweight, measured in kg. No default.
#' @return Size classification for given parameters. Will be one of 'SGA', 'AGA' or 'LGA'.
#' @export
get_size_for_gestational_age <- function(sex, gestational.age.at.birth, birthweight.in.kg) {
  relevant_row <- dplyr::filter(classifynewboRns::bweight_centiles[[tolower(x = sex)]],
                                gestational_age_at_birth_weeks == gestational.age.at.birth)
  if (birthweight.in.kg < relevant_row[1, 2]) {
    return("SGA")
  } else if (birthweight.in.kg > relevant_row[1, 3]) {
    return("LGA")
  } else return("AGA")
}

#' Annotate data frame with birthweight, gestational ages at birth and sexes (if known) with size for gestational age
#' @param bweight.data Data frame with columns 'newborn_sex', 'gestational_age_at_birth' and 'birthweight_kg'.
#' @return Data frame with appended column 'size_for_ga' with sizes for each newborn in `bweight.data`.
#' @export
annotate_bweight_table <- function(bweight.data) {
  req_cols <- c("newborn_sex", "gestational_age_at_birth_weeks", "birthweight_kg")
  if (! all(purrr::map_lgl(req_cols, .f = ~ .x %in% colnames(bweight.data)))) {
    stop("Birthweight table did not have correct column names.")
  }
  bweight.data |>
    dplyr::rowwise() |>
    dplyr::mutate(size_for_ga = classifynewboRns::get_size_for_gestational_age(sex = newborn_sex,
                                                                               gestational.age.at.birth = gestational_age_at_birth_weeks,
                                                                               birthweight.in.kg = birthweight_kg)) |>
    dplyr::ungroup()
}