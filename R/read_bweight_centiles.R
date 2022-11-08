#' Read birth weight centile data from CSV files with a specific format.
#'
#' @param bweight.centiles.path Path to correctly-formatted CSV with birthweight centile data. No default.
#' @returns List of three data frames containing 10th and 90th percentile birthweight values for each gestational age at birth.
#' @export
read_bweight_centiles <- function(bweight.centiles.path) {
  temp <- utils::read.csv(file = bweight.centiles.path) |>
    dplyr::rename(gestational_age_at_birth_weeks = "Gestational.age.at.birth..weeks.",
                  C10_male_kg = "C10_Boys..Kg.", C90_male_kg = "C90_Boys..Kg.",
                  C10_female_kg = "C10_Girls..Kg.", C90_female_kg = "C90_Girls..Kg.",
                  C10_unknown_kg = "C10_Unknown_Sex..Kg.", C90_unknown_kg = "C90_Unknown_Sex..Kg.")
  out_li <- list(
    male = temp |> dplyr::select(gestational_age_at_birth_weeks, tidyselect::contains(match = "_male_")),
    female = temp |> dplyr::select(gestational_age_at_birth_weeks, tidyselect::contains(match = "_female_")),
    unknown = temp |> dplyr::select(gestational_age_at_birth_weeks, tidyselect::contains(match = "_unknown_"))) |>
    purrr::map(.f = ~ .x |>
      dplyr::rename_with(.cols = tidyselect::matches(match = "C(1|9)0"),
                         .fn = ~ stringr::str_remove(.x, pattern = "_.*_kg")))
}