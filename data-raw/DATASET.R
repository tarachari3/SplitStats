# Load raw data from .Rda file
load("data-raw/senateData.Rda")
load("data-raw/senateVotes.Rda")


usethis::use_data(dists, overwrite = TRUE)
usethis::use_data(votes, overwrite = TRUE)
