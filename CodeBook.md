------------------------------------------------------
CodeBook for Getting and Cleaning Data: Course Project 
------------------------------------------------------
Author:
Pradeep Rao
Date:10/10/2016
-------------------------------------------------------

This file describes the variables, the data, and any 
transformations performed to clean up the data. 

The site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The run_analysis.R script performs the following steps to clean the data:
Note: The actual script contains comments at appropriate places for code readability
1. Read the files downloaded in the working directory into R 
2. Rename Variables to their corresponding descriptions from Features 
   file
3. Rename Variable names in the Subject and Activity files 
4. Replace activity codes with their corresponding labels(to facilitate 
   use of replace function logical vectors were created as index vectors
   for each of the 6 activities.These logical index vectors were fed to 
   the replace function to replace codes with corresponding activity 
   descriptions e.g. 1 with "Walking")
5. Add subject and activity columns to each of the training and 
   test data sets
6. Merge training and test data sets
7. Extract columns containing mean and standard deviation from the
   merged files
8. Tidy the above file and write the tidy data set in the working 
   directory

Variables created in the script:
Data Frames as below with explanation
train_x (data frame to store training data set)
train_y (data frame to store activities corresponding to the training data set)
test_x  (data frame to store test data set)
test_y  (data frame to store activities corresponding to the test data set)
subject_train(data frame to store subjects data related to training data set)
subject_test(data frame to store subjects data related to test data set)
feature_names (data frame to store feature descriptions)
train_cons (consolidated training data set containing subject and activity columns)
test_cons(consolidated test data set containing subject and activity columns)
merged_train_test(training and test data set merged)
merged_data_mean_std(extract of merged training and test data set with mean and standard deviation columns only)
average_grouped_data(containing mean of the columns grouped by subject and activity)

Transformations:
1. 

