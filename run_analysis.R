library(data.table)
library(dplyr)

# Read each data

testw4_X_test <- fread("./test/X_test.txt")
testw4_y_test <- fread("./test/y_test.txt",col.names = "activity")
testw4_subject_test <- fread("./test/subject_test.txt",col.names = "subject")
testw4_X_train <- fread("./train/X_train.txt")
testw4_y_train <- fread("./train/y_train.txt",col.names = "activity")
testw4_subject_train <- fread("./train/subject_train.txt",col.names = "subject")
testw4_feature <- fread("./features.txt")
testw4_activity_labels <- fread("./activity_labels.txt",col.names = c("no","activityname"))

# Merges the training and the test sets to create one data set.

X_test_train <- rbind(testw4_X_test,testw4_X_train)
activity_test_train <- rbind(testw4_y_test,testw4_y_train)
subject_test_train <- rbind(testw4_subject_test,testw4_subject_train)

# Extracts only the measurements on the mean and standard deviation for each measurement.
# Appropriately labels the data set with descriptive variable names.

feature_with_mean_std <- testw4_feature%>%
  filter(V2 %in% grep("mean[()]|std[()]",testw4_feature$V2,value=TRUE))
X_mean_std <- X_test_train[,c(feature_with_mean_std$V1),with=F]
names(X_mean_std) <- c(feature_with_mean_std$V2)

# Uses descriptive activity names to name the activities in the data set

X_mean_std_with_actv_sbjct <- cbind(X_mean_std,activity_test_train)
X_mean_std_with_actv_sbjct <- cbind(X_mean_std_with_actv_sbjct,subject_test_train)
X_mean_std_with_actv_sbjct <- merge(x=X_mean_std_with_actv_sbjct,y=testw4_activity_labels,by.x = "activity",by.y = "no")

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

X_second <- X_mean_std_with_actv_sbjct%>%
  group_by(activity,activityname,subject)%>%
  summarise_each(funs(mean))

  
