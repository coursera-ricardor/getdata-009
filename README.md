getdata-009
===========

Coursera repository Getting and Cleaning Data

You will be required to submit: 
1) a tidy data set as described below, 
2) a link to a Github repository with your script for performing the analysis, and 
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.

# Program: run_analysis.R  
# Author: Ricardo Rodriguez Erdmenger 2014/11
#
#  The objective of this script is to:
#
#   You should create one R script called run_analysis.R 
#   
   1) Merges the training and the test sets to create one data set.
   2) Extracts only the measurements on the mean and standard deviation for each measurement. 
   3) Uses descriptive activity names to name the ACTIVITIES in the data set
   4) Appropriately labels the data set with descriptive variable names.

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Note:
a) The step 4 was included in the merging process, expandind the "features" as a field names of the calculated data set.
b) Maybe you will see lots of unnecesary code and steps added to the simple merging process.
   I used this project as a personal training to learn more about R.
   
IMPORTANT:
a) You need to EDIT the script "run_analysis.R" to set your PERSONAL preferences in where to run the script and store all
the files downloaded, expanded and produced.
Look for the variables "I_" specially "dWorkingDir". The script won't run if you don't change this variable.

