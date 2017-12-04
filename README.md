# `nspvowels`: NSP vowel distributions

[![Travis-CI Build Status](https://travis-ci.org/kleinschmidt/nspvowels.svg?branch=master)](https://travis-ci.org/kleinschmidt/nspvowels)

This package contains data (F1 and F2 values for isolated "hVd" vowel
productions from the Nationwide Speech Project corpus: Clopper, C. G., Pisoni,
D. B., & de Jong, K. J. (2005). Acoustic characteristics of the vowel systems of
six regional varieties of American English. _The Journal of the Acoustical
Society of America, 118(3)_, 1661-1676. https://doi.org/10.1121/1.2000774

## Installation

```r
devtools::install_github("kleinschmidt/nspvowels")
```

## Use

``` r
library(nspvowels)
nsp_vows          
#> # A tibble: 2,659 x 10
#>    Talker      Dialect    Sex   Age  Word  Vowel Vowel_ipa Token    F1
#>    <fctr>        <chr> <fctr> <int> <chr> <fctr>    <fctr> <int> <int>
#>  1    A18 Mid-Atlantic      f    18   had     ae         æ     1  1062
#>  2    A18 Mid-Atlantic      f    18   had     ae         æ     2  1074
#>  3    A18 Mid-Atlantic      f    18   had     ae         æ     3  1093
#>  4    A18 Mid-Atlantic      f    18   had     ae         æ     4  1070
#>  5    A18 Mid-Atlantic      f    18   had     ae         æ     5  1025
#>  6    A18 Mid-Atlantic      f    18 hawed     ao         ɔ     1   754
#>  7    A18 Mid-Atlantic      f    18 hawed     ao         ɔ     2   876
#>  8    A18 Mid-Atlantic      f    18 hawed     ao         ɔ     3   807
#>  9    A18 Mid-Atlantic      f    18 hawed     ao         ɔ     4   730
#> 10    A18 Mid-Atlantic      f    18 hawed     ao         ɔ     5   622
#> # ... with 2,649 more rows, and 1 more variables: F2 <int>
```
