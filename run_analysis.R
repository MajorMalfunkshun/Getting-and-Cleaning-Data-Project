## This function does the following. 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.


run_analysis <- function() {
## Clean workspace and load the required libararies
rm(list = ls())
library(plyr)
library(data.table)
library(reshape2)

## set the working directory to where the unzipped files are
setwd("C://Users//cg6814//Documents//R//data//UCI_HAR_Dataset")

## Read in Training Data
xtrain<-read.table("train/X_train.txt")
ytrain<-read.table("train/y_train.txt")
subjtrain<-read.table("train/subject_train.txt")

## Read in Test Data
xtest<-read.table("test/X_test.txt")
ytest<-read.table("test/y_test.txt")
subjtest<-read.table("test/subject_test.txt")

## Get the list of column names
features<-read.table("features.txt", stringsAsFactors = FALSE)
## Get the activity labels
activitylabels<-read.table("activity_labels.txt", stringsAsFactors = FALSE)

## Merge the training and test data
mergedx<-rbind(xtrain,xtest)
mergedy<-rbind(ytrain,ytest)
mergedsubj<-rbind(subjtrain, subjtest)
merged_sub_act<-cbind(mergedy, mergedsubj)

## Rename the columns to be descriptive
names(activitylabels)[1]<-"activityid"
names(activitylabels)[2]<-"activityname"
names(merged_sub_act)[1]<-"activityid"
names(merged_sub_act)[2]<-"subjectid"

## Merge the tables together to get the activity description
temp<-merge(merged_sub_act, activitylabels, BY="activityid")

## Get the user id and activity name
subjectactivity<-temp[,c(2:3)]

## Get the names of the columns from the feature table
new_col_names<-as.vector(features$V2)

## Rename the columns in the merged data set
setnames(mergedx, old=c(names(mergedx)), new=c(new_col_names))

## Get only the list of features that are standard deviation or mean
## using a regular expression
colfiltered<-mergedx[, grep("-(mean|std)\\(\\)", names(mergedx))]

## Cbind everything together for a final result set
finalresults<-cbind(subjectactivity, colfiltered)

## Clean up special characters in the column names and add descriptor prefix
for (i in 1:length(colnames(finalresults))) {
 colnames(finalresults)[i]= gsub("\\()","",names(finalresults)[i])
 colnames(finalresults)[i] = gsub("^(t)","time-",colnames(finalresults[i]))
 colnames(finalresults)[i] = gsub("^(f)","freq-",colnames(finalresults[i]))
 colnames(finalresults)[i] = tolower(colnames(finalresults)[i])
}

# Write the final result set to a file
write.table(finalresults, file = "alldata.txt", row.name=FALSE)

## Use the group by function to get a grouping by subjed, activity
## and the mean of the rest of the numerical fiels in the set.
tidyData <- group_by(finalresults, subjectid, activityname) %>% summarise_each(funs(mean))

# Write the final result set to a file
write.table(tidyData, file = "tidydata.txt", row.name=FALSE)

}
