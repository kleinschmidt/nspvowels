library(readr)

"Dialect,Vowel,Competitor
North,ae,eh
North,eh,uh
North,uh,ao
North,aa,ae
South,eh,ey
South,ey,eh
South,ey,ih
South,ih,iy
South,ow,oo
Midland,aa,ao
Mid-Atlantic,ao,ow
Mid-Atlantic,ao,uh
West,aa,ao
New England,aa,ao" %>%
  read_csv() ->
  clopper_competitors

devtools::use_data(clopper_competitors, overwrite=TRUE)
