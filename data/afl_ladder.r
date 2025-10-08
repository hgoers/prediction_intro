library(tidyverse)
library(fitzRoy)
library(janitor)

aflm_2024_ladder_raw <- map(1:25, ~ fetch_ladder_afltables(season = 2024, 
                                                           round = .x)) |> 
  bind_rows()

aflm_2024_ladder_raw

afl_ladder <- aflm_2024_ladder_raw |> 
  clean_names()

write_rds(afl_ladder, here::here("data", "afl_ladder.rds"))
