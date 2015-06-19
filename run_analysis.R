## This is code for creating a tidy data set for the programming
## assignment, for class "Getting and Cleaning Data"
## For details regarding how the code works, the code is broken down into
## sections, which can be referred to in the accompanying file
## README.txt

## For information on the individual variables, please refer to the
## codebook which also accompanies this assignment

## 1.
library(dplyr)
library(tidyr)
## a.
test <- read.table("./UCI_HAR_Dataset/test/X_test.txt", sep = "", header=F)
test0 <- read.table("./UCI_HAR_Dataset/test/y_test.txt",  
                    sep = "", header=F)
test1 <- read.table("./UCI_HAR_Dataset/test/subject_test.txt", 
                    colClasses = "factor", sep = "", header=F)
## b.
train <- read.table("./UCI_HAR_Dataset/train/X_train.txt", sep = "", header=F)
train0 <- read.table("./UCI_HAR_Dataset/train/y_train.txt", colClasses = "factor",
                     sep = "", header=F)
train1 <- read.table("./UCI_HAR_Dataset/train/subject_train.txt", colClasses = "factor",
                     sep = "", header=F)
## c. 
features <- read.table("./UCI_HAR_Dataset/features.txt", colClasses = c("factor",
                     "character"), sep = "", header = F)
## d. 
activity <- read.table("./UCI_HAR_Dataset/activity_labels.txt")

## 2. 
colnames(test) <- features$V2
colnames(train) <- features$V2
colnames(test0) <- "level"
colnames(train0) <- "level"
colnames(test1) <- "subject"
colnames(train1) <- "subject"
activity <- rename(activity, level = V1)
activity <- rename(activity, activity = V2)

## 3. 
test2 <- bind_cols(test0, test)
test2 <- bind_cols(test1, test2)
test3 <- merge(activity, test2, "level")

train2 <- bind_cols(train0, train)
train2 <- bind_cols(train1, train2)
train3 <- merge(activity, train2, "level")

## 4. 
# a. 
test3 <- mutate(test3, train.or.test = "TEST")
train3 <- mutate(train3, train.or.test = "TRAIN")
# b.
combined <- bind_rows(test3, train3)

## 5.
## a.
combined <- select(combined, contains("level"), contains("activity"), contains("subject"), 
                   contains("train.or.test"), contains("mean"), contains("std"))
## b.
combined <- select(combined, -contains("freq"), -contains("angle"), -contains("level"))

## 6.
combined$train.or.test <- as.factor(combined$train.or.test)
combined$activity <- as.factor(combined$activity)
combined$subject <- as.factor(combined$subject)

## 7. 
names <- gsub("-","",names(combined))
names <- tolower(names)
colnames(combined) <- names

## 8.
combined <- select(combined, -train.or.test)
combined <- group_by(combined, subject, activity)
tidydata <- summarise_each(combined, funs(mean))

## 9.
write.table(tidydata, file = "tidydata.txt", row.names = FALSE)
