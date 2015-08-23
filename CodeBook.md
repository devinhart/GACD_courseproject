# R Script Function
The script run_analysis.Rperforms the 5 steps described in the course project's instructions

First, all the similar data is merged using rbind().
Then, only those columns with the mean and standard deviation measures (searched for by name) are taken from the whole dataset. After extracting these columns the names are corrected with the ones specified in features.txt.
Then, the activity names and IDs from activity_labels.txt are substituted in the dataset. This corrects all of the ambiguous naming.
A new table with all the averages of each subject and activity type is created. The output file averages_data.txt is written to the working directory.
ddply() from the plyr package is used to apply colMeans().

# Variables
x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.

x_merged, y_merged and subject_merged are the merged data sets for test/train pairs for each of x,y and subject.
features contains the correct names for the x_merged dataset, which are applied to the column names stored in isolated_features, a numeric vector used to extract the desired data.
The process was completed with activity names as it was for features through the activities variable.
all_merged merges x_merged, y_merged and subject_merged in a single dataset.
averages contains the specified output which is then written to a .txt file.