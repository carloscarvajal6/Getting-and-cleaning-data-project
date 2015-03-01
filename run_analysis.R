## clean workspace
rm(list=ls())

## setwd

setwd("C:/Users/mishen'ka/Documents/Coursera/data-science-coursera/gandcdata/UCI HAR Dataset")

## 1) Merges the training and the test sets to create one data set.

#read data
features = read.table('./features.txt',header=FALSE);
activityLabels = read.table('./activity_labels.txt',header=FALSE);
subjectTrain = read.table('./train/subject_train.txt',header=FALSE);
xTrain = read.table('./train/X_train.txt',header=FALSE);
yTrain = read.table('./train/y_train.txt',header=FALSE);

## 2) Extracts only the measurements on the mean and standard deviation for each measurement. 



## 3) Uses descriptive activity names to name the activities in the data set



## 4) Appropriately labels the data set with descriptive variable names. 



## 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
