library(tidyverse)
library(janitor)

us_turnout_raw <- read_csv(
  "https://election.lab.ufl.edu/data-downloads/turnoutdata/Turnout_1980_2022_v1.2.csv"
)

us_turnout <- us_turnout_raw |>
  clean_names() |>
  filter(state == "United States", year >= 1998) |>
  transmute(year, turnout_rate = as.numeric(str_remove(vep_turnout_rate, "%")))

us_turnout

write_rds(us_turnout, here::here("data", "us_turnout.rds"))
