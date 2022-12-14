% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/annotate_bweight.R
\name{annotate_bweight_table}
\alias{annotate_bweight_table}
\title{Annotate data frame with birthweight, gestational ages at birth and sexes (if known) with size for gestational age}
\usage{
annotate_bweight_table(bweight.data)
}
\arguments{
\item{bweight.data}{Data frame with columns 'newborn_sex', 'gestational_age_at_birth' and 'birthweight_kg'.}
}
\value{
Data frame with appended column 'size_for_ga' with sizes for each newborn in `bweight.data`.
}
\description{
Annotate data frame with birthweight, gestational ages at birth and sexes (if known) with size for gestational age
}
