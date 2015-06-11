Getting and Cleaning Data (Coursera). Course Project Codebook
==============================================================


## Original Data

There original data comes from the smartphone accelerometer and gyroscope 3-axial raw signals, 
which have been processed using various signal processing techniques to measurement vector consisting
of 561 features.

- [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
- [description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


## Data sets

### Raw data set

The raw dataset was created using the following regular expression to filter out the columns as required
in the project assignment only those measurements of mean or standard deviation.

`grep("-(mean|std)\\(\\)"`

This results in selecting only 66 columns from the original data set.
Subject identifiers `subjectid` and activity labels 'activityname' were added as additional colums
to the dataset, resulting in a total of 68 columns in the raw data set.

The training and test subsets of the original dataset were combined to produce final raw dataset.

### Tidy data set

Tidy data set contains the average of all feature standard deviation and mean values of the raw dataset. 
Original variable names were modified in the following way:

 1. Removed parenthesis `()`
 2. Changed t prefix to more descriptive "time"
 3. Changed f prefix to more descriptive "freq"
 4. Replaced `BodyBody` with `Body`
 5. Changed column names to all lower case

#### Sample of renamed variables compared to original variable name

 Raw data            | Tidy data 
 --------------------|--------------
 `tBodyAcc-mean()-X` | `time-bodyacc-mean-x`
 `tBodyAcc-mean()-Y` | `time-bodyacc-mean-y`
 `tBodyAcc-mean()-Z` | `time-bodyacc-mean-z`
 `tBodyAcc-std()-X`  | `time-bodyacc-std-x`
 `tBodyAcc-std()-Y`  | `time-bodyacc-std-y`
 `tBodyAcc-std()-Z`  | `time-bodyacc-std-z`
 'fBodyAcc-mean()-X' | 'freq-bodyacc-mean-x'
 'fBodyAcc-mean()-Y' | 'freq-bodyacc-mean-y'
 'fBodyAcc-mean()-Z' | 'freq-bodyacc-mean-z'
