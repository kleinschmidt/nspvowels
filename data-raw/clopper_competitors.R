library(magrittr)
library(readr)

"Dialect,Vowel,Competitor,Description
North,ae,eh,Northern cities shift
North,eh,uh,Northern cities shift
North,uh,ao,Northern cities shift
North,aa,ae,Northern cities shift
South,eh,ey,Southern chain shift
South,ey,eh,Southern chain shift
South,ey,ih,Southern chain shift
South,ih,iy,Southern chain shift
South,ow,oo,OW fronting
Midland,aa,ao,Caught-cot merger
Mid-Atlantic,ao,ow,AO raising
Mid-Atlantic,ao,uh,AO raising
Mid-Atlantic,ao,aa,Caught-cot merger
Mid-Atlantic,aa,ao,Caught-cot merger
West,aa,ao,Caught-cot merger
West,ao,aa,Caught-cot merger
New England,aa,ao,Caught-cot merger
New England,ao,aa,Caught-cot merger" %>%
  read_csv() ->
  clopper_competitors

devtools::use_data(clopper_competitors, overwrite=TRUE)
