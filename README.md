
<!-- README.md is generated from README.Rmd. Please edit that file -->

# classifynewboRns

<!-- badges: start -->
<!-- badges: end -->

Classify newborns with size for gestational age based on sex, age at
birth in weeks, and birth weight

## Installation

You can install the development version of classifynewboRns from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("simpar1471/classifynewboRns")
library(classifynewboRns)
```

## Functionalities

### Built-in datasets

`classifynewboRns` comes with several in-built datasets for you to test
its functions with. These include `bweight_centiles` (used to work out
size for gestational age) and `bweight_data` (an example data input).

``` r
birthweight_centiles <- classifynewboRns::bweight_centiles
head(birthweight_centiles$male, 3); head(birthweight_centiles$female, 3); head(birthweight_centiles$unknown, 3)
#>   gestational_age_at_birth_weeks   C10   C90
#> 1                       24.00000 0.377 0.619
#> 2                       24.14286 0.385 0.632
#> 3                       24.28571 0.393 0.645
#>   gestational_age_at_birth_weeks   C10   C90
#> 1                       24.00000 0.356 0.585
#> 2                       24.14286 0.364 0.597
#> 3                       24.28571 0.371 0.609
#>   gestational_age_at_birth_weeks    C10    C90
#> 1                       24.00000 0.3665 0.6020
#> 2                       24.14286 0.3745 0.6145
#> 3                       24.28571 0.3820 0.6270
```

``` r
birthweight_data <- classifynewboRns::bweight_data
head(birthweight_data, 3)
#>   birthweight_grams gestational_age_at_birth_weeks newborn_sex birthweight_kg
#> 1              3200                             39      female           3.20
#> 2              2920                             38     unknown           2.92
#> 3              3400                             40      female           3.40
```

### Calculating size for gestational age

Size for gestational age for newborns can be calculated using
`annotate_bweight_table()` if the provided table has data on sex, age at
birth and birth weight in kg:

``` r
birthweight_data_sga <- classifynewboRns::annotate_bweight_table(birthweight_data)
head(birthweight_data_sga, 3)
#> # A tibble: 3 × 5
#>   birthweight_grams gestational_age_at_birth_weeks newborn_sex birthwe…¹ size_…²
#>               <int>                          <int> <chr>           <dbl> <chr>  
#> 1              3200                             39 female           3.2  AGA    
#> 2              2920                             38 unknown          2.92 AGA    
#> 3              3400                             40 female           3.4  AGA    
#> # … with abbreviated variable names ¹​birthweight_kg, ²​size_for_ga

# Summary counts for observations of size for gestational age categories can be easily retrieved:
table(birthweight_data_sga$size_for_ga)
#> 
#> AGA LGA 
#>  62  28
```

You can also calculate size for gestational age for one newborn:

``` r
classifynewboRns::get_size_for_gestational_age(sex = "male", gestational.age.at.birth = 44, birthweight.in.kg = 3.42)
#> [1] "AGA"
```
