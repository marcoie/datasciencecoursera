##load needed libraries
library(readr)
library(tidyr)
library(dplyr)

#Read the base "activity" and "features" data so we can prepare "better labels" and use "activity name" instead of just the number
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("activity_id","activity_name"))
features <- read.table("./UCI HAR Dataset/features.txt", col.names = c("feat_id","feature_name"))

#Fix the Names of Features - including removal of "(" ")" "," and other symbols
features$feature_name <- gsub('-', '_', features$feature_name, fixed = TRUE) #Set underscore as base multi word separator
features$feature_name <- gsub('^t', 'Time', features$feature_name) #Label Time based features
features$feature_name <- gsub('^f', 'Freq', features$feature_name) #Label Freq based feaures
features$feature_name <- gsub('()', '', features$feature_name, fixed = TRUE) ##remove parenthesis
features$feature_name <- gsub(',', '-', features$feature_name, fixed = TRUE) ##rchange ,
##Specific rename for the angle features that had a complex nesting of parenthesis
    features$feature_name <- gsub('angle(tBodyAccMean-gravity)','angleOftBodyAccMean-gravity', features$feature_name, fixed = TRUE)
    features$feature_name <- gsub('angle(tBodyAccJerkMean)-gravityMean)','angleOftBodyAccJerkMean-gravityMean', features$feature_name, fixed = TRUE)
    features$feature_name <- gsub('angle(tBodyGyroMean-gravityMean)','angleOftBodyGyroMean-gravityMean', features$feature_name, fixed = TRUE)
    features$feature_name <- gsub('angle(tBodyGyroJerkMean-gravityMean)','angleOftBodyGyroJerkMean-gravityMean', features$feature_name, fixed = TRUE)
    features$feature_name <- gsub('angle(X-gravityMean)','angleOfX-gravityMean', features$feature_name, fixed = TRUE)
    features$feature_name <- gsub('angle(Y-gravityMean)','angleOfY-gravityMean', features$feature_name, fixed = TRUE)
    features$feature_name <- gsub('angle(Z-gravityMean)','angleOfZ-gravityMean', features$feature_name, fixed = TRUE)


##Read the Data for train set - set proper column names and combine Subject, Activity and Sensor Data in 1 DF
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$feature_name)
y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt", col.names = c("activity_id")) %>% 
    left_join(activity_labels,by = "activity_id") %>% 
    select(activity_name) ##get JUST activity labels
s_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = c("subject_id"))
full_train <- cbind(s_train, y_train, x_train)

##Read the Data for test set - set proper column names and combine Subject, Activity and Sensor Data in 1 DF
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$feature_name)
y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt", col.names = c("activity_id")) %>% 
    left_join(activity_labels,by = "activity_id") %>% 
    select(activity_name) ##get activity and labels
s_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = c("subject_id"))
full_test <- cbind(s_test, y_test, x_test)

#Assembly ONE single experiment dataset
experiment_data <- rbind(full_train, full_test)

#Extracts only the measurements of mean and std for each experiment line
selected_set <- as_tibble(cbind(experiment_data[,1:2], experiment_data[,grepl("mean",names(experiment_data))], experiment_data[,grepl("std",names(experiment_data))]))

##Create New TIDY set with "means" computed and grouped by Subject and activity and write to a new TEXT File
new_tidy_tbl <- selected_set %>% group_by(subject_id, activity_name) %>% summarise_all(funs(mean, "mean",mean(.,na.rm=TRUE)))
write.table(new_tidy_tbl, file = "new_tidy_dataset.txt", row.names = FALSE)

