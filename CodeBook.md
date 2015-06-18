Getting and Cleaning Data (Coursera). Course Project Codebook
==============================================================


## Original Data

There original data represents data collected from the accelerometer and gyroscope 3-axial raw signals from the Samsung Galaxy S smartphone.  It contains measurements of 561 features.

- [Original Source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
- [Data Set Description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


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
 2. Changed `t` prefix to more descriptive `time`
 3. Changed `f` prefix to more descriptive `freq`
 4. Replaced `BodyBody` with `Body`
 5. Changed column names to all lower case

#### Sample of renamed variables compared to original variable name

      Raw data       |      Tidy data 
 --------------------|--------------
 `tBodyAcc-mean()-X` | `time-bodyacc-mean-x`
 `tBodyAcc-mean()-Y` | `time-bodyacc-mean-y`
 `tBodyAcc-mean()-Z` | `time-bodyacc-mean-z`
 `tBodyAcc-std()-X`  | `time-bodyacc-std-x`
 `tBodyAcc-std()-Y`  | `time-bodyacc-std-y`
 `tBodyAcc-std()-Z`  | `time-bodyacc-std-z`
 `fBodyAcc-mean()-X` | `freq-bodyacc-mean-x`
 `fBodyAcc-mean()-Y` | `freq-bodyacc-mean-y`
 `fBodyAcc-mean()-Z` | `freq-bodyacc-mean-z`
 
## Methodology
 
 1. Read in the three files for the x, y and suject for test and then train, resulting in three data tables for each.
 2. Read the features and activity labels, into to additional data tables
 3. Rowbind the x, y and subject tables for training and test into three new data tables (`mergedx,mergedy,mergedsubj`).
 4. Colbind the merged table and subject table into `merged_sub_act`
 5. Rename the columns in activitylabels (`activityid, activityname`) and mergedsubj (`activityid, subjectid`)
 6. Merget the two data tables togeher on activityid
 7. Rename the columns in the merged data based on a vector of values from the V2 columns of features
 8. Extract only the columns for mean and std based on a regular expression
 9. Colbind the subject id and activity labels to the extracted columns to get `finalresults`
 10. Rename the columsn in `finalresults` to clean them up
 11. Write the results to a file, `alldata.txt`
 12. Use ddply to apply the means function over the extracted columns to create a tidy data set, `tidydata.txt`
