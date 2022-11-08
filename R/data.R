#' Newborn birthweight centile data
#'
#' A list with sex-specific tables containing 10th and 90th percentile values for birthweights (in kg) in newborns with
#' and without known sexes.
#'
#' @format ## `bweight_centiles`
#' A list with three data frames of 161 rows and 3 columns:
#' \describe{
#'   \item{gestational_age_at_birth_weeks}{Gestational age of newborn in weeks}
#'   \item{C10}{10th percentile of birth weights in kg}
#'   \item{C90}{90th percentile of birth weights in kg}
#' }
#' @source Provided by Eric Ohuma, London School of Hygiene and Tropical Medicine.
"bweight_centiles"

#' Newborn birthweight data
#'
#' A dataframe containing sex, gestational age and birthweight data for 90 newborns.
#'
#' @format ## `bweight_data`
#' A data frame of 90 rows and 4 columns:
#' \describe{
#'   \item{birthweight_grams}{Birthweight of newborn in grams}
#'   \item{gestational_age_at_birth_weeks}{Gestational age of newborn in weeks}
#'   \item{newborn_sex}{Sex of newborn, if known}
#'   \item{birthweight_in_kg}{Birthweight of newborn in kilograms}
#' }
#' @source Provided by Eric Ohuma, London School of Hygiene and Tropical Medicine.
"bweight_data"

#' Newborn birthweight centile data
#'
#' A dataframe containing sex, gestational age and birthweight data for 90 newborns, as well as annotations of size for
#' gestational age for each newborn.
#' @format ## `bweight_data_annotated`
#' A list with three data frames of 161 rows and 3 columns:
#' \describe{
#'   \item{birthweight_grams}{Birthweight of newborn in grams}
#'   \item{gestational_age_at_birth_weeks}{Gestational age of newborn in weeks}
#'   \item{newborn_sex}{Sex of newborn, if known}
#'   \item{birthweight_in_kg}{Birthweight of newborn in kilograms}
#'   \item{size_for_ga}{Size for gestational age of newborn (one of SGA, AGA or LGA)}
#' }
#' @source Provided by Eric Ohuma, London School of Hygiene and Tropical Medicine; edited by Simon Parker.
"bweight_data_annotated"