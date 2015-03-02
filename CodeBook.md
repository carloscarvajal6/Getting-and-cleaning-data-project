# Getting-and-cleaning-data-project

## Data Set Information (from website)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Attribute Information

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

# Log for the project

## 1) Merges the training and the test sets to create one data set.

Here, I read into tables and use cbind() and rbind() to merge the data present in the train and test folders: X_train.txt, X_train.txt, y_test.txt, y_train.txt, subject_test.txt, and subject_train.txt . I put them in such order that subject and activity Id will be the first two columns, and I don't need to reorder later (subjectTrain,yTrain,xTrain; for example).

## 2) Extracts only the measurements on the mean and standard deviation for each measurement. 

Get the valid columns by using grep with the names() of the columns, and consider only those columns. Use mean, std, and Id to keep required data, and overwrite the data frame to "filter" it.

## 3) Uses descriptive activity names to name the activities in the data set

Merge the activity labels data frame with the current data frame via activityId. Use the labels in "x" so activityId and activityType are next to each other.

## 4) Appropriately labels the data set with descriptive variable names. 

Use the gsub function to adapt the existing text into a "better looking" (sexier? :P) text. Looking at names() to see what needs to be modified. Here, removing brackets and adapting text was my chosen way to go. Replace "t" and "f" by Time and Frequency, besides enlarging shortened words that I could get, as acceletarion and magnitude. I opted for leaving Gyro and Jerk as they were, because they were noticeable enough. 

## 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

