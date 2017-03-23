## Getting and Cleaning Data Course Project

* The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

### Objectives
* Collect raw data from data link below which represents data collected from the accelerometers from the Samsung Galaxy S smartphone.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Create a tidy data set as a text file called tidydataset.txt
* Create a script for performing the task called run_analysis.R
* Create a code book that describes the variables, the data, and any transformations or work that were performed to clean up the data called CodeBook.md

### How the script works
* First we need to collect the data from the link provided, download and unzip.
* I have changed the file name from UCI HAR Dataset to rawdata to reduce typing. (pretty lazy)
* Will use data.table package to read .txt files as data frames.
* Read the text components and assign to elements
* Assign self describng names to labels/variables
* Label the XTest and XTrain datasets with variables from Features.
* cbind Test, Train and Subject datasets
* Extract mean and standard deviation variables using grepl function
* Merge the extracted datasets with ActivityLables
* Merge the two resulted datasets to get the total combined dataset with extracted mean and std variables.
* Assign an element to the columns for which we need e average.
* Will use reshape2 package to melt data, calulate mean and create a new reshaped dataset.
* Create tidydataset text file
