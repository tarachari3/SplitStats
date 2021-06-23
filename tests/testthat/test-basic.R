# This tests that we can install basilisk-dependent packages.
# library(testthat); source("test-basic.R")

test_that("internal test package installs correctly", {
    xpath <- basilisk.utils::getEnvironmentDir("SplitStats")

    #output <- SplitStats::test()
    expect_true(file.exists(file.path(xpath, "env1")))
    #expect_true(file.exists(file.path(xpath, "env2")))


    #expect_identical(output$dummy, "My name is Aaron")
})
