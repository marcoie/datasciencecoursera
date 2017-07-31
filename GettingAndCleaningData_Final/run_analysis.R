library(readr)
library(tidyr)
library(dplyr)
#Merges the training and the test sets to create one data set.
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activity_labels) <- c("activity_id","activity_name")
features <- read.table("./UCI HAR Dataset/features.txt")
#get descriptive activity names to name the activities in the data set
names(features) <- c("feat_id","feature_name")

x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
s_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

names(s_train) <- c("subject_id")
#Uses descriptive activity names to name the activities in the data set
names(x_train) <- gsub(")","",gsub("(",".",gsub("-","",gsub(",","-",gsub("()","",features$feature_name, fixed = TRUE), fixed = TRUE),fixed = TRUE),fixed = TRUE),fixed = TRUE)
names(y_train) <- c("activity_id")

full_train <- cbind(s_train, y_train, x_train)

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
s_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

names(s_test) <- c("subject_id")
#Uses descriptive activity names to name the activities in the data set
names(x_test) <- gsub(")","",gsub("(",".",gsub("-","",gsub(",","-",gsub("()","",features$feature_name, fixed = TRUE), fixed = TRUE),fixed = TRUE),fixed = TRUE),fixed = TRUE)
names(y_test) <- c("activity_id")

full_test <- cbind(s_test, y_test, x_test)

experiment_data <- rbind(full_train, full_test)

#Extracts only the measurements on the mean and standard deviation for each measurement
selected_set <- cbind(experiment_data[,1:2], experiment_data[,grepl("std",names(experiment_data))], experiment_data[,grepl("mean",names(experiment_data))])
#Appropriately labels the data set with descriptive variable names
names(selected_set) <- gsub("std","Std",names(selected_set), fixed = TRUE)
names(selected_set) <- gsub("mean","Mean",names(selected_set), fixed = TRUE)

#from the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subjec
selected_tbl <- as_tibble(selected_set)

new_tbl <- selected_tbl %>% group_by(subject_id, activity_id) %>% summarise_all(funs(mean, "mean",mean(.,na.rm=TRUE)))
