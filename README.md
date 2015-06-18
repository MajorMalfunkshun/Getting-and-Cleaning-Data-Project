# Getting-and-Cleaning-Data-Project
Getting-and-Cleaning-Data-Project

This project contains one R script called run_analysis() that does the following. 

<li>1. Merges the training and the test sets to create one data set.
<li>2. Extracts only the measurements on the mean and standard deviation for each measurement. 
<li>3. Uses descriptive activity names to name the activities in the data set
<li>4. Appropriately labels the data set with descriptive variable names. 
<li>5. From the data set in step 4, creates a second, independent tidy data set `(tidydata.txt)` with the average of each variable for each activity and each subject.

Test Files:
x_test.txt, y_test.txt, subject_test.txt

Train Files:
x_train.txt, y_train.txt, subject_test.txt

Other Files:
features.txt <- contains the values that will become the column labels
activity_labels <- contains the id and label for each activity type (WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING,STANDING,LAYING)
