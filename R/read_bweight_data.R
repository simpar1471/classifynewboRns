#' Read in birth weight CSVs with a specific format
#'
#' @param bweight.csv.path Path to birthweight CSV. No default.
#' @description Reads in CSV containing birthweight data and automatically renames columns to be more R-friendly.
#' @export
read_bweight_data <- function(bweight.csv.path) {
  utils::read.csv(file = bweight.csv.path) |>
    dplyr::rename(birthweight_grams = "Birthweight..grams.",
                  gestational_age_at_birth_weeks = "Gestational.age.at.birth..weeks.",
                  newborn_sex = "Newborn.sex") |>
    dplyr::mutate(newborn_sex = tolower(ifelse(newborn_sex == "", yes = "unknown", no = newborn_sex)),
                  birthweight_kg = birthweight_grams / 1000)
}