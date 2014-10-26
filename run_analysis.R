#
# Reads training and test data set and
# merges them to create a new set
#
#######################################################################
# 1. Merges the training and the test sets to create one data set.
#######################################################################
# x
xtrain_ds <- read.table("./UCI HAR Dataset/train/X_train.txt")
xtest_ds <- read.table("./UCI HAR Dataset/test/X_test.txt")
x <- rbind(xtrain_ds,xtest_ds)

# s
subjtest_ds <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subjtrain_ds <- read.table("./UCI Har Dataset/train/subject_train.txt")
s <- rbind(subjtrain_ds, subjtest_ds)
colnames(s) <- "subject"


# y
ytrain_ds <- read.table("./UCI HAR Dataset/train/y_train.txt")
ytest_ds <- read.table("./UCI HAR Dataset/test/y_test.txt")
y <- rbind(ytrain_ds, ytest_ds)


######################################################################
# 2. Extracts only the measurements on the mean and standard 
#    deviation for each measurement. 
######################################################################
features <- read.table("./UCI HAR Dataset/features.txt")
colnames(x) <- features$V2
x.subset <- x[,c(grep("mean\\(\\)|std\\(\\)", colnames(x)))]


## Merged Data
md <- cbind(s, x.subset, y)

#######################################################################
# 3. Uses descriptive activity names to name the activities in the 
#    data set
#######################################################################

#activity_labels
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
md$V1 <- (activities[md$V1,2])

######################################################################
#  4. Appropriately labels the data set with descriptive variable names. 
######################################################################
colnames(md) <- gsub("\\-mean\\(\\)\\-*", "Mean", colnames(md))
colnames(md) <- gsub("\\-std\\(\\)\\-*", "Std", colnames(md))
colnames(md) <- sub("V1", "activity", colnames(md))

######################################################################
#
# Write out the merged data result 
#
######################################################################
write.table(md, "merged.txt")


######################################################################
#  5. From the data set in step 4, creates a second, independent tidy
#     data set with the average of each variable for each activity and 
#     each subject.
######################################################################

tidySet <- aggregate(md[,2:67], by=list(md$subject, md$activity), FUN=mean)
colnames(tidySet)[1] <- "subject"
colnames(tidySet)[2] <- "activity"
colnames(tidySet) <- gsub("tBody", "avg.tBody", colnames(tidySet))
colnames(tidySet) <- gsub("fBody", "avg.fBody", colnames(tidySet))
colnames(tidySet) <- gsub("tGravity", "avg.tGravity", colnames(tidySet))

write.table(tidySet, "tidy.txt")
