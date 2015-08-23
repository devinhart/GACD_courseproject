library(plyr)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" ## Setting URL
download.file(fileUrl, destfile="rawdata.zip", method="curl") ## downloading zip
unzip("rawdata.zip") ##unpacking zip
setwd("./UCI HAR Dataset") ## setting working directory to unpacked folder

## Step 1: Merging the training and the test sets to create one data set

## loading in training data sets
x_train <- read.table("train/X_train.txt") 
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

## loading in the test data sets
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

## Create merged data set for X
x_merged <- rbind(x_train, x_test)

## Create merged data set for Y
y_merged <- rbind(y_train, y_test)

## Create merged data set for subject
subject_merged <- rbind(subject_train, subject_test)


## Step 2: Extract only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("features.txt")

## Isolate mean and standard deviation
isolated_features <- grep("-(mean|std)\\(\\)", features[, 2])

## Subset bassed on the isolated features
x_merged <- x_merged[, isolated_features]

## Update column names
names(x_merged) <- features[isolated_features, 2]


## Step 3: Use descriptive activity names to name the activities in the data set

activity_labels <- read.table("activity_labels.txt")

## Update with names from activity labels
y_merged[, 1] <- activity_labels[y_merged[, 1], 2]

## Update colmn names
names(y_merged) <- "activity"

## Step 4: Appropriately label the data set with descriptive variable names

## Update with names
names(subject_merged) <- "subject"

## combine all data sets into single data set
all_merged <- cbind(x_merged, y_merged, subject_merged)

## Step 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject

averages <- ddply(all_merged, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averages, "averages.txt", row.name=FALSE)