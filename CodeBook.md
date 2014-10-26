Samsung Galaxy S smartphone Accelerometers CodeBook
========================================================
This document describes the transformation made to the data and a description of variables of the tidy data set.

```
The actual source of the data is located at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

```
```
Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

```
* The run_analysis.R script performs the following steps to transform the data
### Data Cleaning and Transformation
1. Reads the X_train.txt and X_test.txt and appends rows of X_train.txt with X_test.txt and stores them to *x*. *x* is a data frame of 10299 obs. of 561 variables

2. Reads the subject_train.txt and subject_test.txt and appends rows of subject_train.txt with subject_test.txt and assigns the column name to *subject*. The variable assigned is *s*.*s* is a data frame of 10299 obs. of 1 variable.

3. Reads the y_train.txt and y_test.txt and appends rows of y_train.txt with y_test.txt and stores them to *y*. *y* is a data frame of 10299 obs. of 1 variable.

4. Reads the features.txt and assigns the column names with the seconds column of features (V2). Then a new smaller subset of *x* is created by only columns that have mean and std in them. This is accomplished by performing a regular expression match. At this point *x.subset* has 10299 objs. of 66 variables

5. Now a merged data set is created by concatenating the columns of *s*, *x.subset* and *y*. The assigned variable is *md*

6. Reads the activity_labels.txt so that user-friendly activity names to the merged data set (*md*).

7. Cleans up the column names by removing any "-" in them and camel case mean and std in them. Also the activity column name is set to activity.

8. A completed cleansed data set is written out in a file called "merged.txt". This results with 10299 observations with 68 variables.

9. The next plhase creates a new data set to a file called "tidy.txt" which aggregates the merged.txt by the subject and activity and applies the *mean* function to the rest of the numerical columns.

10. Finally all the numerical columns are renamed so that "avg." is prepended with them using regular expressions functions. The subject and activity columns exist too. The final result is written out to a "tidy.txt" file. The result is 180 observations of 68 variables.

### Tidy Data Descriptions
* This describes all the variables and their descriptions:

 * subject                     : int - id of the subject the performed the experiment
 * activity                    : Factor w/ 6 levels ("WALKING", "WALKING UPSTAIRS", "WALKING DOWNSTAIRS", "SITTING", "STANDING", "LAYING") - The activity the subject performed
 * avg.tBodyAccMeanX           : 
  avg.tBodyAccMeanY           : 
  avg.tBodyAccMeanZ           : numerical - Average value of the mean of body acceleration signal in one of the three directions (X,Y,Z), for the given subject and activity

 * avg.tBodyAccStdX            : 
  avg.tBodyAccStdY            :
  avg.tBodyAccStdZ            : numerical -  Average value of the standard deviation of body acceleration signal in one of the three directions (X,Y,Z), for the given subject and activity

 * avg.tGravityAccMeanX        : 
  avg.tGravityAccMeanY        : 
  avg.tGravityAccMeanZ        : numerical -  Average value of the mean of gravity acceleration signal in one of the three directions (X,Y,Z), for the given subject and activity

 * avg.tGravityAccStdX         : 
  avg.tGravityAccStdY         : 
  avg.tGravityAccStdZ         : numerical -  Average value of the standard deviation of gravity acceleration signal in one of the three directions (X,Y,Z), for the given subject and activity

 * avg.tBodyAccJerkMeanX       : 
  avg.tBodyAccJerkMeanY       : 
  avg.tBodyAccJerkMeanZ       : numerical - Average value of the mean of body acceleration jerk signal in one of the three directions (X,Y,Z), for the given subject and activity


 * avg.tBodyAccJerkStdX        : 
  avg.tBodyAccJerkStdY        : 
  avg.tBodyAccJerkStdZ        : numerical - Average value of the standard deviation of body acceleration jerk signal in one of the three directions (X,Y,Z), for the given subject and activity

 * avg.tBodyGyroMeanX          : 
  avg.tBodyGyroMeanY          : 
  avg.tBodyGyroMeanZ          : numerical -   Average value of mean of the gyroscope angular velocity signal in one of the three directions (X,Y,Z), for the given volunteer and activity
 
 * avg.tBodyGyroStdX           : 
  avg.tBodyGyroStdY           : 
  avg.tBodyGyroStdZ           : numerical - Average value of the standard deviation of the gyroscope angular velocity signal in one of the three directions (X,Y,Z), for the given volunteer and activity
 
 * avg.tBodyGyroJerkMeanX      : 
  avg.tBodyGyroJerkMeanY      : 
  avg.tBodyGyroJerkMeanZ      : numerical - Average value of mean of the gyroscope angular velocity jerk signal in one of the three directions (X,Y,Z), for the given volunteer and activity

 * avg.tBodyGyroJerkStdX       : 
  avg.tBodyGyroJerkStdY       : 
  avg.tBodyGyroJerkStdZ       : numerical -  Average value of the standard deviation of the gyroscope angular velocity jerk signal in one of the three directions (X,Y,Z), for the given volunteer and activity

 * avg.tBodyAccMagMean         : 
  avg.tBodyAccMagStd          : numerical - Average value of the mean & std. dev of body acceleration signal mag. for the given subject and activity
 
 * avg.tGravityAccMagMean      : 
  avg.tGravityAccMagStd       : numerical - Average value of the mean & std. dev of gravity acceleration signal mag. for the given subject and activity
 
 * avg.tBodyAccJerkMagMean     : 
  avg.tBodyAccJerkMagStd      : numerical - Average value of the mean & std. dev of body acceleration jerk signal mag. for the given subject and activity
 
 * avg.tBodyGyroMagMean        : 
  avg.tBodyGyroMagStd         : numerical - Average value of the mean & std. dev of gyroscope angular velocity  mag. for the given subject and activity
 
 * avg.tBodyGyroJerkMagMean    : 
  avg.tBodyGyroJerkMagStd     : numerical -  Average value of the mean & std. dev of gyroscope angular velocity jerk mag. for the given subject and activity
 
 
The following descriptions are the same as above but it is an average on Fast Fourier Transform applied to the signals.
 
 * avg.fBodyAccMeanX           : 
  avg.fBodyAccMeanY           : 
  avg.fBodyAccMeanZ           : numerical - Average value of the mean of body acceleration signal in one of the three directions (X,Y,Z), for the given subject and activity
 
 * avg.fBodyAccStdX            : 
  avg.fBodyAccStdY            : 
  avg.fBodyAccStdZ            : numerical -  Average value of the standard deviation of body acceleration signal in one of the three directions (X,Y,Z), for the given subject and activity

 
 * avg.fBodyAccJerkMeanX       : 
  avg.fBodyAccJerkMeanY       : 
  avg.fBodyAccJerkMeanZ       : numerical - Average value of the mean of body acceleration jerk signal in one of the three directions (X,Y,Z), for the given subject and activity
 
 * avg.fBodyAccJerkStdX        : 
  avg.fBodyAccJerkStdY        : 
  avg.fBodyAccJerkStdZ        : numerical - Average value of the standard deviation of the gyroscope angular velocity jerk signal in one of the three directions (X,Y,Z), for the given volunteer and activity
 
 * avg.fBodyGyroMeanX          : 
  avg.fBodyGyroMeanY          : 
  avg.fBodyGyroMeanZ          : numerical - Average value of mean of the gyroscope angular velocity signal in one of the three directions (X,Y,Z), for the given volunteer and activity
 
 * avg.fBodyGyroStdX           : 
  avg.fBodyGyroStdY           : 
  avg.fBodyGyroStdZ           : numerical - Average value of the standard deviation of the gyroscope angular velocity signal in one of the three directions (X,Y,Z), for the given volunteer and activity
 
 
 * avg.fBodyAccMagMean         : 
  avg.fBodyAccMagStd          : numerical - Average value of the mean & std. dev of body acceleration signal mag. for the given subject and activity
 
 
 * avg.fBodyBodyAccJerkMagMean : 
  avg.fBodyBodyAccJerkMagStd  : numerical - Average value of the mean & std. dev of body acceleration jerk signal mag. for the given subject and activity
 
 
 * avg.fBodyBodyGyroMagMean    : 
  avg.fBodyBodyGyroMagStd     : numerical - Average value of mean and std.devof the gyroscope angular velocity signal in one of the three directions (X,Y,Z), for the given volunteer and activity
 
 * avg.fBodyBodyGyroJerkMagMean: 
  avg.fBodyBodyGyroJerkMagStd : numerical - Average value of the mean & standard deviation of the gyroscope angular velocity signal in one of the three directions (X,Y,Z), for the given volunteer and activity
 
