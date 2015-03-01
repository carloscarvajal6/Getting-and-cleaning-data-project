## clean workspace
rm(list=ls())

## setwd

setwd("C:/Users/mishen'ka/Documents/Coursera/data-science-coursera/gandcdata/UCI HAR Dataset")

#read data
features = read.table("./features.txt",header=FALSE);
activityLabels = read.table("./activity_labels.txt",header=FALSE);
subjectTrain = read.table("./train/subject_train.txt",header=FALSE);
xTrain = read.table("./train/X_train.txt",header=FALSE);
yTrain = read.table("./train/y_train.txt",header=FALSE);
subjectTest = read.table("./test/subject_test.txt",header=FALSE);
xTest = read.table("./test/X_test.txt",header=FALSE);
yTest = read.table("./test/y_test.txt",header=FALSE);

#assign column names
colnames(activityLabels) = c('activityId','activityType');
colnames(subjectTrain) = "subjectId";
colnames(xTrain) = features[,2]; 
colnames(yTrain) = "activityId";
colnames(subjectTest) = "subjectId";
colnames(xTest) = features[,2]; 
colnames(yTest) = "activityId";

## 1) Merges the training and the test sets to create one data set.

#mix train and test data separately, and then all together

train = cbind(xTrain,yTrain,subjectTrain);
test = cbind(xTest,yTest,subjectTest);
data = rbind(train,test);

## 2) Extracts only the measurements on the mean and standard deviation for each measurement. 

validFeats <- grep("-(mean|std)\\(\\)", names(data));

meanStd <- data[,validFeats];

#re-add activity ID as column and correct its name
data = cbind(data$activityId,meanStd);
colnames(data)[1] = "activityId";

## 3) Uses descriptive activity names to name the activities in the data set

data = merge(data,activityLabels,by='activityId',all.x=TRUE);

## 4) Appropriately labels the data set with descriptive variable names. 

#use names list
varNames <- names(data);

#background cleanup

for (i in 1:length(varNames)){
      varNames[i] = gsub("\\(\\)","",varNames[i]);
      varNames[i] = gsub("-mean","Mean",varNames[i]);
      varNames[i] = gsub("-std","StandardDeviation",varNames[i]);
      varNames[i] = gsub("^t","Time",varNames[i]);
      varNames[i] = gsub("^f","Frequency",varNames[i]);
      varNames[i] = gsub("Acc","Acceleration",varNames[i]);
      varNames[i] = gsub("Mag","Magnitude",varNames[i]);
      varNames[i] = gsub("BodyBody","Body",varNames[i]);
}

#and actual assignment of sexier names

colnames(data) = varNames;

## 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#finish this... think of subjectID

