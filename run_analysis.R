## clean workspace
rm(list=ls())

## setwd
setwd("C:/Users/mishen'ka/Documents/Coursera/data-science-coursera/gandcdata/UCI HAR Dataset");

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

train = cbind(subjectTrain,yTrain,xTrain);
test = cbind(subjectTest,yTest,xTest);
data = rbind(train,test);

## 2) Extracts only the measurements on the mean and standard deviation for each measurement. 

#mean and std
meanStdFeats <- grep("-(mean|std)\\(\\)", names(data));
#ids
idsFeats <- grep("Id", names(data));
#valid features
validFeats <- sort(c(meanStdFeats,idsFeats));

data <- data[,validFeats];

## 3) Uses descriptive activity names to name the activities in the data set

data = merge(activityLabels,data,by='activityId',all.y=TRUE);

## 4) Appropriately labels the data set with descriptive variable names. 

#direct cleanup
names(data) <- gsub("\\(\\)","",names(data));
names(data) <- gsub("-mean","Mean",names(data));
names(data) <- gsub("-std","StandardDeviation",names(data));
names(data) <- gsub("^t","Time",names(data));
names(data) <- gsub("^f","Frequency",names(data));
names(data) <- gsub("Acc","Acceleration",names(data));
names(data) <- gsub("Mag","Magnitude",names(data));
names(data) <- gsub("BodyBody","Body",names(data));

## 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#import plyr for ddply
library(plyr);

#apply colMeans to each unique triplet
tidyDF <- ddply(data, .(activityId,activityType,subjectId), function(x){colMeans(x[,-c(1,2,3)])});

#correct names
names(tidyDF)[-c(1,2,3)] <- paste0("MeanOf", names(tidyDF)[-c(1,2,3)]);

#save file
write.table(tidyDF, "tidyDF.txt", row.names = FALSE)
