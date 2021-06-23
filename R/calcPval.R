#' A Function to return raw p-values for feature contribution to a split
#'
#' @param featureMat Unnamed matrix of observationsxfeature
#' @param labels Vector of observation labels (e.g. member names)
#' @param queryLabs Subset of labels vector on one side of split
#' @return P-values for contribution of feature to split
#' @export

# ---------------------- Rank votes by p-value for given split ------------------ (FOR PACKAGE)
calcSplitVotPval2 <- function(featureMat,labels, queryLabs) {

  bin_names <- as.integer(labels %in% queryLabs)

  feats <- unique(as.vector(featureMat))

  rollcallNums <- 1:dim(featureMat)[2]
  pvals <- numeric(dim(featureMat)[2])
  #For each vote (Col of votesDem)
  for (i in rollcallNums){

    votes <- featureMat[,i]


    #Construct contingency table for each vote relative to split of interest
    zero_names <-  bin_names == 0
    one_names <-  bin_names == 1

    zeroFilt_votes <- votes[zero_names]
    oneFilt_votes <- votes[one_names]

    row1 <- rep(0,length(feats))
    row2 <- rep(0,length(feats))

    for (p in c(1:length(feats))){

      row1[p] <- sum(zeroFilt_votes == feats[p])
      row2[p] <- sum(oneFilt_votes == feats[p])
    }


    pvals[i] <- fisher.test(rbind(row1,row2), alternative="two.sided")$p.value

  }
  return(pvals)
}


#' Get splits from NNet generated split network
#'
#'
#'
#' @return List of observations in cycle ordering and split objects
#' @author Tara Chari
#'
#' @param labels Vector of observation labels (e.g. member names)
#' @param matrix (Square) Distance matrix with no labels (unnamed)
#' @export
#' @importFrom reticulate import
#' @importFrom basilisk basiliskStart basiliskRun basiliskStop
getSplits <- function(labels, matrix) {

  cl <- basiliskStart(env)
  cycSplit <- basiliskRun(cl, function() {
    X <- reticulate::import("splitFuncs/splitFuncs")
    X$calcSplits(labels, matrix)
  })
  basiliskStop(cl)

  return(cycSplit)
}
