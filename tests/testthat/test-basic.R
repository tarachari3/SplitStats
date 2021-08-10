# This tests that we can install basilisk-dependent packages.
# library(testthat); source("test-basic.R")

test_that("internal test package installs correctly", {
  xpath <- basilisk.utils::getExternalDir()

  output <- SplitStats::test()
  expect_true(file.exists(file.path(xpath, "SplitStats/0.1.0/env4")))

  expect_type(output$splitspy, "character")
  expect_true(length(output$splitspy) > 0L)

})
