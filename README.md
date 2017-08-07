# Getting and Cleaning Data
## Course project

This repository contains a script to analyse the "Human Activity Recognition Using Smartphones Data Set". A full description is available [online](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The data set can be downloaded is available as [zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## R based analysis of the data set

All analysis can be done by sourcing the file [run_analysis.R](run_analysis.R)

The analysis contains the following steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

As a result of the analyis a single file will be created
* [tidy.csv](tidy.csv) holds the means of each variable for each activity and each subject

A code is available for the data set in the file [CodeBook.md](CodeBook.md)

## Requirements

You need to have the following packages installed
* dplyr
* reshape2

If you don't have them installed run the following commands
```
install.packages("dplyr")
install.packages("reshape2")
```

## How to run

* checkout this repository
* download the [dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* unzip the dataset to the root folder of the repository
* open an R console in the repository root or set the working directory to the repository
* source the script [run_analysis.R](run_analysis.R)

## What will happen when I run the script?

* the function createTable will be called and create the tidy dataset
* this second tidy dataset will be saved to the filed [tidy.csv](tidy.csv)