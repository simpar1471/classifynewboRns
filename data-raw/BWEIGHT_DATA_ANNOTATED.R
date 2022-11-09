bweight_data_annotated <- annotate_bweight_table(bweight.data = bweight_data)
# readr::write_csv(bweight_data_annotated, file = "data/Birthweight_Data_Annotated.csv") --> to send to Eric
usethis::use_data(bweight_data_annotated, overwrite = TRUE)