library(tidyverse)
library(tsibble)

trump_approval_raw <- read_csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vS-FKWVTTFtJT6u56e0bqdfoMcXvDO1DUChsJ3jQAMB2lZk2SMqVfmg7dGjclTYkYWz-Pm5lfcLPjp4/pub?output=csv")
trump_approval_raw

trump_approval <- trump_approval_raw |>
  filter(subgroup == "All polls", pollster == "YouGov", sponsors == "Economist") |> 
  transmute(date = mdy(enddate), approve)

write_rds(trump_approval, here::here("data", "trump_approval.rds"))
