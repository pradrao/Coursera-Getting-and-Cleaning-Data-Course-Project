Author:Pradeep Rao
Date: 10/10/2016(dd/mm/yyyy)
Program Name: run_analysis

----------------------------------------------------------------
Script Objective: Is to create a tidy data based on input files
and instructions mentioned in the Getting and Cleaning Data final week course project
----------------------------------------------------------------
High Level Program Logic:
1. Read the files downloaded in the working directory into R 
2. Rename Variables to their corresponding descriptions from Features 
   file
3. Rename Variable names in the Subject and Activity files 
4. Replace activity codes with their corresponding labels 
5. Add subject and activity columns to each of the training and 
   test data sets
6. Merge training and test data sets
7. Extracy columns containing mean and standard deviation from the
   merged files
8. Tidy the above file and write the tidy data set in the working 
   directory
---------------------------------------------------------------------
Input Files:
1. Features.txt (as input for logic in point 2 of the previous section
2. activity_labels.txt(as input for logic in point 4 of the previous 
   section
3. X_train(training data set -relevant to point 1 of the previous section
4. y_train(training data set -relevant to point 3 and 5 of the previous 
   section
5. X_test(test data set -relevant to point 1 of the previous section
6. y_test(test data set -relevant to point 3 and 5 of the previous
   section
7. subject_train(relevant to point 3 and 5 of previous section)
8. subject_train(relevant to point 3 and 5 of previous section)
----------------------------------------------------------------------
Output File:
tidydata.txt stored in the working directory

