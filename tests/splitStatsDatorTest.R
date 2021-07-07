library(tidyverse)
library(devtools)
library(basilisk)
devtools::document()
#rm(list = c("calcSplitVotPval"))
library(SplitStats)

source('/home/tchari/testFolder/R/scripts/distFuncs.R')


#Senate member voting records
Sall_votes <- as_tibble(read_csv("/home/tchari/testFolder/R/data/Sall_votes_withPartyAndNames.csv") )

#Information on each vote (rollcall number)
Sall_vote_dates <- as_tibble(read.csv("/home/tchari/testFolder/R/data/Sall_rollcalls.csv", colClasses = c("numeric","character","numeric","character","character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric","character","character","character","character","character")))


# ------------- Make distance matrix and nexus output for 116th congresses -------------
cong <- 116
Sall_votes_sub  <- Sall_votes %>% filter(congress == cong)

fname <- paste("/home/tchari/testFolder/R/data/dist_",as.character(cong),"th.nex",sep="")




#Demonstrate split-network functions on 116th Senate rollcall data
allVals <- makeDistMat2(Sall_votes_sub)

#Get distance matrix between votes and labels for all observations/members (rows of matrix)
mat <- allVals[1]$Dists
labels <- allVals[2]$Labs


#Get cycle ordering of observations and splits comprising the split network
d <- getSplits(labels, mat)

cycle <- d[1][[1]]
splits <- d[2][[1]]

#Get distance along splits from each query label to remaining (reference) labels
dists <- getSplitDist(labels, labels[1:45], labels[46:98], splits)

#Get visualization of splits graph (outline) and NEXUS file output for use with SplitsTree GUI
getSplitVis(labels,cycle,splits,mat,'splitgraph.pdf','splitnetwork.nex')

#Get p-values for votes contributing to split of interest (Dem Presidential candidates vs rest of Senate members)
votes_df <- makeVoteMat(Sall_votes_sub) #Original observationsxfeatures matrix (membersxvotes)
votes <- unname(as.matrix(votes_df))

demCandsPvals <- calcVotPval(votes,labels,c("BOOKER_C_Dem","SANDERS_B_Ind","KLOBUCHAR_A_Dem","WARREN_E_Dem","HARRIS_K_Dem")) #--> works fine
