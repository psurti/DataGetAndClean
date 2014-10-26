Getting and Cleaning Data - Peer Course Project
================================================
This repository contains run_analysis.R script that reads the data collected from the accelerometers from the Samsung Galaxy S smartphone.

```
The actual source of the data is located at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

```
```
Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

```
### Steps
* In order to run the script unzip the data into a directory. Make sure the run_analysis.R script is copied to the root directory (i.e. sibling of the "UCI HAR Dataset" directory). Please make sure the working directory is set to the root directory as well in R/RStudio

* Source the script with source("run_analysis.R")

* The script will generate two files namely "merged.txt" and "tidy.txt" in the current working directory:
  - merged.txt contains the merged and cleaned data with 10299 observations and 68 variables
  - tidy.txt contains the average of the variables by subject and activity. It summaries with 180 observations and 68 variables.
  
* In order to view the tidy data set use: tidy <- read.table("tidy.txt") command
