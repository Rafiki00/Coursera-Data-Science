library("plyr")

#Loading the files to be merged together
subject_test <- read.table("test/subject_test.txt")
X_test <- read.table("test/X_test.txt")
activity_test <- read.table("test/y_test.txt")

X_test <- cbind(X_test, subject_test)
X_test <- cbind(X_test, activity_test)

subject_train <- read.table("train/subject_train.txt")
X_train <- read.table("train/X_train.txt")
activity_train <- read.table("train/y_train.txt")

X_train <- cbind(X_train, subject_train)
X_train <- cbind(X_train, activity_train)

#Binding the data frames together to create all-inclusive data set. Then, keep relevant columns. 
#Variables and variable names manually introduced via vector
test_train <- rbind(X_test, X_train)
vars <- c(1, 2, 3, 4, 5, 6, 41, 42, 43, 44, 45, 46, 81, 82, 83, 84, 
          85, 86, 121, 122, 123, 124, 125, 126, 161, 162, 163, 164, 
          165, 166, 201, 202, 214, 215, 227, 228, 240, 241, 253, 254,
          266, 267, 268, 269, 270, 271, 345, 346, 347, 348, 349, 350,
          424, 425, 426, 427, 428, 429, 503, 504, 516, 517, 529, 530, 542, 543, 562, 563)

test_train <- test_train[,vars]

names(test_train) <- c("tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z", "tBodyAcc-std()-X", "tBodyAcc-std()-Y", "tBodyAcc-std()-Z",
                       "tGravityAcc-mean()-X", "tGravityAcc-mean()-Y", "tGravityAcc-mean()-Z", "tGravityAcc-std()-X", "tGravityAcc-std()-Y", "tGravityAcc-std()-Z",
                       "tBodyAccJerk-mean()-X", "tBodyAccJerk-mean()-Y", "tBodyAccJerk-mean()-Z", "tBodyAccJerk-std()-X", "tBodyAccJerk-std()-Y", "tBodyAccJerk-std()-Z",
                       "tBodyGyro-mean()-X", "tBodyGyro-mean()-Y", "tBodyGyro-mean()-Z", "tBodyGyro-std()-X", "tBodyGyro-std()-Y", "tBodyGyro-std()-Z",
                       "tBodyGyroJerk-mean()-X", "tBodyGyroJerk-mean()-Y", "tBodyGyroJerk-mean()-Z", "tBodyGyroJerk-std()-X", "tBodyGyroJerk-std()-Y",
                       "tBodyGyroJerk-std()-Z", "tBodyAccMag-mean()", "tBodyAccMag-std()", "tGravityAccMag-mean()", "tGravityAccMag-std()", "tBodyAccJerkMag-mean()",
                       "tBodyAccJerkMag-std()", "tBodyGyroMag-mean()", "tBodyGyroMag-std()", "tBodyGyroJerkMag-mean()", "tBodyGyroJerkMag-std()", 
                       "fBodyAcc-mean()-X", "fBodyAcc-mean()-Y", "fBodyAcc-mean()-Z", "fBodyAcc-std()-X", "fBodyAcc-std()-Y", "fBodyAcc-std()-Z",
                       "fBodyAccJerk-mean()-X", "fBodyAccJerk-mean()-Y", "fBodyAccJerk-mean()-Z", "fBodyAccJerk-std()-X", "fBodyAccJerk-std()-Y", "fBodyAccJerk-std()-Z",
                       "fBodyGyro-mean()-X", "fBodyGyro-mean()-Y", "fBodyGyro-mean()-Z", "fBodyGyro-std()-X", "fBodyGyro-std()-Y", "fBodyGyro-std()-Z", "fBodyAccMag-mean()",
                       "fBodyAccMag-std()", "fBodyBodyAccJerkMag-mean()", "fBodyBodyAccJerkMag-std()", "fBodyBodyGyroMag-mean()", "fBodyBodyGyroMag-std()",
                       "fBodyBodyGyroJerkMag-mean()", "fBodyBodyGyroJerkMag-std()", "subject", "activity")

#Use of dplyr package to apply function colMeans keeping subject and activity intact.
datameans <- ddply(test_train, .(subject, activity), function(x) colMeans(x[, 1:66]))

#Naming the activities for a more descriptive dataset and writing final results into table
datameans[which(datameans$activity==1), 2] <- "WALKING"
datameans[which(datameans$activity==2), 2] <- "WALKINGUP"
datameans[which(datameans$activity==3), 2] <- "WALKINGDOWN"
datameans[which(datameans$activity==4), 2] <- "SITTING"
datameans[which(datameans$activity==5), 2] <- "STANDING"
datameans[which(datameans$activity==6), 2] <- "LAYING"

write.table(datameans, "tidy_set.txt", row.name=FALSE)