# week4prj--Getting and Cleaning Data

There are the following files in this repository for the assignment of "Getting and Cleaning Data" course available in *COURSERA*.  
* R script file:  
 - run_analysis.R  
* Documentation files:  
 - output.txt  
 - README.md  
 
Here are the data for the R script:  
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> 

# How the script works 

The script run_analysis.R does the following 5 steps: 
 
1. The training and test set are merged by rbind() to create one one data set.  
2. Only the measurements on the mean and standard deviation for each measurement is extracted by filter().  
3. The data set is labeled with descriptive variable names by names().  
4. "activity" and "subject" as the column are merged to the data set by cbind() and merge().  
5. From the data set in step 4, independent tidy data set with the average of each variable for each activity and each subject is created by summarise_each.  
 
- - -
