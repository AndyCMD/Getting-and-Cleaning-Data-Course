# *Codebook for run_analysis.R*

### This codebook is organized by section, which is numbered in the original file run_analysis.R

#### **1.** The first step we need to take to create the tidy dataset is to read in the files, into R. Following is the code which accomplishes this:

First, we need to load the *dplyr* and *tidyr* packages which will be used extensively.

  * a. The first data that we need to load in are the *test* datasets. This includes *X_test.txt*, *y_test.txt*, and *subject_test.txt*
  * b. The next data we need to load in are the *training* datasets. This includes *X_train.txt*, *y_train.txt*, and *subject_train.txt*
  * c. Finally, we need to load in the text file with descriptive names for the features (which will become the variables) and activities (which we'll use later). This is *features.txt* and *activity_labels.txt*

#### **2.** The next step we need to take is to create accurate column (variable) names for each independent dataset.

  * We use the *features* dataframe to name the variables of the test and training datasets
  * We then need to give column names to the dataframes which code for the subject number and number corresponding to activities.
  * To make it easier to merge datasets, we'll rename the variables of *activity* dataset as shown, to *level* and *activity*

#### **3.** Using the *bind_cols* function from *dplyr* and the *merge* function, we then bind the separate datasets together.

#### **4.** We then need to combine the training and test datasets.

  * a. Although not required, I wanted to create a separate variable indicating whether the data is from the *training* or *test* datasets, to check my work.
  * b. We then create a combined dataset which is called **combined**, using the *bind_rows* function.

#### **5.** Next, we are going to select only the variables that we need to create the final dataset.

We want to keep the variables indicating activity, subject, train or test. Since we only want the variables which have the mean or the standard deviation, we'll need to include those as well.

  * a. Using the function *select* and *contains*, we can select out the columns by name that have the variables we want to include.
  * b. There are a few columns that have a frequency mean and/or include an angle calculation that is based on a mean, but not a mean itself. These should be excluded.

#### **6.** We then need to convert the following variables to factors: *train.or.test*, *activity*, and *subject*.

#### **7.** Per the principles of tidy data, we will try to create descriptive variables.

  * First, we'll get rid of the dashes from the variables using *g_sub*
  * Next, we'll make them all lower case using *tolower* command.
  * Finally, we'll use this new vector of column names and set them as the new column names using *colnames*.

#### **8.** Next step, we will create a second, independent tidy data set with average of each variable for each activity and each subject.

  * Although I needed the *train.or.test* variable at the start, I don't need it anymore, so will remove this using *select*
  * Next, we'll use the *group_by* command to group all the rows by subject and activity so that we can summarize the data
  * Finally, we create a new dataset called "tidydata", by using the *summarise_each* command, calculating the mean.

#### **.9** The final step is to write the dataset to a .txt file, called "tidydata.txt"
