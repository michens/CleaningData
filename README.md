README
======

This repository includes a set of files that process the [Human Activity Recognition Using Smartphones Data Set ](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

run_analysis.R performs the following actions:

1.  Reads the raw data
2.  Merges the training and test sets
3.  Joins subject and activity labels to measurement data
4.  Filters data to only include mean and standard deviation data for each measurement
5.  Groups variables by subject and activity
6.  Summarizes grouped variables by taking their means

run_analysis.txt contains the result of running run_analysis.R.