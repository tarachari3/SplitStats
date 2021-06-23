#' @importFrom basilisk BasiliskEnvironment
env1 <- BasiliskEnvironment("env1", pkgname="SplitStats",
                            packages=c("scipy==1.6.2","matplotlib==3.4.2","pillow==8.2.0","numpy==1.21.0"), path="splitFuncs")
