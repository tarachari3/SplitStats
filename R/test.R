#' Test function
#'
#' Does nothing but test that we can load modules from different virtual environments.
#'
#' @return A list of names of objects exposed in each module.
#' @author Tara Chari
#' 
#' @examples
#' test()
#' @export
#' @importFrom reticulate import
#' @importFrom basilisk basiliskStart basiliskRun basiliskStop
test <- function() {
  cl <- basiliskStart(env4)
  split.names <- basiliskRun(cl, function() {
    path <- system.file("splitspy", package = 'SplitStats')
    X <- reticulate::import_from_path("splitspy", path = path)
    names(X)
  })
  basiliskStop(cl)
  

  list(splitspy=split.names)
}

