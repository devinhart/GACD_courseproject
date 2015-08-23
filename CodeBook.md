# R Script Function
The script run_analysis.Rperforms the 5 steps described in the course project's instructions

First, all the similar data is merged using the rbind() function. By similar, we address those files having the same number of columns and referring to the same entities.
Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.
As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.
On the whole dataset, those columns with vague column names are corrected.
Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called averages_data.txt, and uploaded to this repository.
ddply() from the plyr package is used to apply colMeans().

# Variables
x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
x_merged, y_merged and subject_merged are the merged data sets for test/train pairs for each of x,y and subject.
features contains the correct names for the x_merged dataset, which are applied to the column names stored in isolated_features, a numeric vector used to extract the desired data.
A similar approach is taken with activity names through the activities variable.
all_merged merges x_merged, y_data and subject_merged in a single dataset.
Finally, averages contains the relevant averages which will be later stored in a .txt file.