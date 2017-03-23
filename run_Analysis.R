
# This script needs to do the following.

# Merge the training and the test sets to create one data set.
# Extract only the measurements on the mean and standard deviation for each measurement.
# Use descriptive activity names to name the activities in the data set
# Appropriately label the data set with descriptive variable names.
# Create an independent tidy data set with the average of each variable for each activity and each subject.


# First we need to collect the data from the link provided, download and unzip.
# I have changed the file name from UCI HAR Dataset to rawdata to reduce typing. (pretty lazy)

url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile="rawdata.zip",method="curl")
unzip("rawdata.zip")
file.rename("UCI HAR Dataset", "rawdata")

# Will use data.table package to read .txt files as data frames.

library(data.table)

# Read the text components and assign to elements

XTest = read.table("./rawdata/test/X_test.txt")
YTest = read.table("./rawdata/test/Y_test.txt")
SubjectTest = read.table("./rawdata/test/subject_test.txt")
XTrain = read.table("./rawdata/train/X_train.txt")
YTrain = read.table("./rawdata/train/Y_train.txt")
SubjectTrain = read.table("./rawdata/train/subject_train.txt")
ActivityLabels = read.table("./rawdata/activity_labels.txt")
Features = read.table("./rawdata/features.txt")

# Assign self describng names to labels/variables
# Label the XTest and XTrain datasets with variables from Features.

names(ActivityLabels) = c("ActivityID", "ActivityType")
names(XTest) = Features$V2
names(YTest) = "ActivityID"
names(SubjectTest) = "SubjectID"
names(XTrain) = Features$V2
names(YTrain) = "ActivityID"
names(SubjectTrain) = "SubjectID"

# cbind Test, Train and Subject datasets

TestDataSet = cbind(XTest, YTest, SubjectTest)
TrainDataSet = cbind(XTrain, YTrain, SubjectTrain)

#Extract mean and standard deviation variables using grepl function

ExtractedTest <<- TestDataSet[,grepl("SubjectID|ActivityID|mean\\(\\)|std\\(\\)",colnames(TestDataSet))]
ExtractedTrain <<- TrainDataSet[,grepl("SubjectID|ActivityID|mean\\(\\)|std\\(\\)",colnames(TrainDataSet))]

# Merge the extracted datasets with ActivityLables
# Merge the two resulted datasets to get the total combined dataset with extracted mean and std variables.

FinalTestDataSet = merge(ExtractedTest, ActivityLabels, all = TRUE)
FinalTrainDataSet = merge(ExtractedTrain, ActivityLabels, all = TRUE)
MergedDataSet = merge(FinalTestDataSet, FinalTrainDataSet, all = TRUE)

# Assign an element to the columns for which we need e average.

AggrColumns = colnames(MergedDataSet[,3:68])

# Will use reshape2 package to melt data, calulate mean and create a new reshaped dataset.

library(reshape2)
MeltData = melt(MergedDataSet, id =c("SubjectID", "ActivityType"), measure.vars=AggrColumns)
TidyDataSet = dcast(MeltData, SubjectID + ActivityType ~ variable, mean)

# Create tidydataset text file

write.table(TidyDataSet, file = "tidydataset.txt", row.names = FALSE)


