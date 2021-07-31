#' @title 116th Senate Pairwise Distances
#'
#' @description A data set with a matrix for pairwise distances between Senators in the 116th Senate and a list of label names for each Senator
#'
#' @format A data frame with 98 rows and 2 variables:
#' \describe{
#'   \item{Dists}{Matrix of pairwise distances}
#'   \item{Labs}{Row labels for each Senator}
#' }
#' @source <https://www.github.com/tarachari3/SplitStats>
"dists"


#' @title 116th Senate Votes
#'
#' @description A data set with a matrix for Senator Rollcall votes (0,1/2,1) for (Nay,Abstain,Yea)
#'
#' @format A matrix with 98 members by 168 rollcall votes:
#' \describe{
#'   \item{1}{Matrix of Senate member votes}
#' }
#' @source <https://www.github.com/tarachari3/SplitStats>
"votes"
