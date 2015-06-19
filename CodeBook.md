# CodeBook for the tidydata set.

## Background

The tidydata set which is included in this assignment is a neat, tidy summary of some of the data from the Human Activity Recognition Using Smartphones Dataset (UCI HAR Dataset). For more information, please refer to the README.txt which is included with the original dataset download, and the features_info.txt files.

**Briefly, to quote from the original database README.txt:**

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data."

## Tidydata

These data have been compressed from a much larger dataset (the UCI HAR dataset), and both the training and test datasets have been combined to form a larger dataset. For each subject, there are numerous observations of each variable, and so a mean for each activity was calculated. Only the variables indicating a "mean" or "std" (standard deviation) had the mean calculated, other variables were omitted. For more technical details regarding the transformations performed, please consult the README.md file associated with this dataset.

## Data Dictionary
subject: This is a number indicating the individual subject number

activity: This is a label indicating the type of activity: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

Following are the data from the accelerometer and gyroscope which have been summarized as described above. For more information regarding technical details for these variables, please consult the features_info.txt file in the original dataset.

tbodyaccmean() (*x, y, and z*)

tgravityaccmean() (*x, y, and z*)

tbodyaccjerkmean() (*x, y, and z*)

tbodygyromean() (*x, y, and z*)

tbodygyrojerkmean() (*x, y, and z*)

tbodyaccmagmean()

tgravityaccmagmean()

tbodyaccjerkmagmean()

tbodygyromagmean()

tbodygyrojerkmagmean()

fbodyaccmean() (*x, y, and z*)

fbodyaccjerkmean() (*x, y, and z*)

fbodygyromean() (*x, y, and z*)

fbodyaccmagmean()

fbodybodyaccjerkmagmean()

fbodybodygyromagmean()

fbodybodygyrojerkmagmean()

tbodyaccstd() (*x, y, and z*)

tgravityaccstd() (*x, y, and z*)

tbodyaccjerkstd() (*x, y, and z*)

tbodygyrostd() (*x, y, and z*)

tbodygyrojerkstd() (*x, y, and z*)

tbodyaccmagstd()

tgravityaccmagstd()

tbodyaccjerkmagstd()

tbodygyromagstd()

tbodygyrojerkmagstd()

fbodyaccstd() (*x, y, and z*)

fbodyaccjerkstd() (*x, y, and z*)

fbodygyrostd() (*x, y, and z*)

fbodyaccmagstd()

fbodybodyaccjerkmagstd()

fbodybodygyromagstd()

fbodybodygyrojerkmagstd()
