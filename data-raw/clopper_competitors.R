library(magrittr)
library(readr)

"Dialect,Vowel,Competitor,Description
North,ae,eh,Northern cities shift
North,eh,uh,Northern cities shift
North,uh,ao,Northern cities shift
North,aa,ae,Northern cities shift
North,ao,aa,Caught-cot non-merger
North,aa,ao,Caught-cot non-merger
South,eh,ey,EH tensing
South,ey,eh,EY laxing
South,ey,ih,EY laxing
South,ih,iy,IH tensing
South,iy,ih,IY laxing
South,ow,oo,OW fronting
South,ao,aa,Caught-cot non-merger
South,aa,ao,Caught-cot non-merger
Mid-Atlantic,ao,ow,AO raising
Mid-Atlantic,ao,uh,AO raising
Mid-Atlantic,ao,aa,Caught-cot non-merger
Mid-Atlantic,aa,ao,Caught-cot non-merger
" %>%
  read_csv() ->
  clopper_competitors

devtools::use_data(clopper_competitors, overwrite=TRUE)
