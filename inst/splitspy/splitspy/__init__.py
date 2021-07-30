from splitspy.splits.basic_split import split_dist, split_dist_sets

import splitspy.outlines.outline_algo as outline_algorithm
import splitspy.nnet.distances as distances
from splitspy.graph import draw
from splitspy.splits import splits_io
import splitspy.nnet.nnet_algo as nnet_algorithm



import scipy.stats as stats
import matplotlib.pyplot as plt
#import seaborn as sns
#import pandas as pd
import numpy as np
from itertools import compress
from subprocess import Popen

import warnings
warnings.filterwarnings("ignore")




def calcSplits(labels, matrix):
	"""
	Parameters :
	labels: Vector of observation labels
	matrix: Distance matrix between observations (members)
	Returns :
	Cycle ordering of observations, and collection of split objects generated by the NNet algorithm
	"""
	cycle, splits = nnet_algorithm.neighbor_net(labels, matrix)
	print('Cycle and Splits Determined')
	return cycle, splits


def splitDists(labels, queryLabs, refLabs, splits):
	"""
	Parameters :
	labels: Vector of observation labels
	queryLabs: Observations on one side of a split
	refLabs: Remaining observations (labels)
	splits: Collection of split objects generated by the NNet algorithm
	Returns :
	(Split) Distances from each query input to set of all observations in refLabs
	"""

	q = [i in queryLabs for i in labels]
	ref = [i in refLabs for i in labels]
	obsPos = range(1,len(labels)+1)

	dists = split_dist_sets(list(compress(obsPos, q)), list(compress(obsPos, ref)), splits)


	return dists


def makeVis(labels,cycle,splits,matrix,outfilePhylo,outfileNexus,show=True,width = 1000, height = 800,m_left = 100, m_right = 100, m_top = 100, m_bot = 100, font_size = 12, scale_factor =5):
	"""
	Parameters :
	labels : List of labels for members in dataset
	cycle : List of circular ordering of labels (members)
	splits : List of split objects between members
	matrix : Distance matrix (used as input to nnet)
	outfilePhylo : Filename for phylogenetic outline image of splits network
	outfileNexus : Filename for NEXUS output of splits network (SplitsTree compatible)
	Outputs :
	Image and NEXUS files for split network
	"""

	#Get split network outline
	graph, angles = outline_algorithm.compute(labels, cycle, splits, rooted=False, out_grp="", alt=False)

	#Find non-negative least-squares weights for splits
	fit = distances.ls_fit(matrix, split_dist(len(labels), splits))

	#Draw split network outline
	draw.draw(outfilePhylo, graph, angles, fit, int(width), int(height),int(m_left), int(m_right), int(m_top), int(m_bot), int(font_size), int(scale_factor))

	#Show plot
	if show:
		Popen('open %s' % outfilePhylo,shell=True)

	#Add code for NEXUS output/SplitsTree5 compatible output
	splits_io.print_splits_nexus(labels, splits, cycle, fit, filename=outfileNexus)





