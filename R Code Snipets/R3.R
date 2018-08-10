activityLabels <- read.table("./activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
features <- read.table("./features.txt")
features[,2] <- as.character(features[,2])

vars <- grep(".*mean.*|.*std.*", features[,2])
vars.names <- features[vars,2]
vars.names = gsub('-mean', 'Mean', vars.names)

str(vars.names)

vars.names = gsub('-std', 'Std', vars.names)
vars.names <- gsub('[-()]', '', vars.names)


trainX <- read.table("./train/X_train.txt")[vars]
trainY <- read.table("./train/Y_train.txt")
trainSub <- read.table("./train/subject_train.txt")

train <- cbind(trainX, trainY, trainSub)
View(train)


testX <- read.table("./test/X_test.txt")[vars]
testY <- read.table("./test/Y_test.txt")
testSub <- read.table("./test/subject_test.txt")

test <- cbind(testX, testY, testSub)

data <- rbind(train, test)
colnames(data) <- c(vars.names, "activity", "subject")

data$activity <- factor(data$activity, levels = activityLabels[,1], labels = activityLabels[,2])
data$subject <- as.factor(data$subject)

library(plyr)
data2 <-aggregate(. ~subject + activity, data, mean)
data3 <- data2[order(data2$subject,data2$activity),]
write.table(data3, file = "tidydata.txt",row.name=FALSE)