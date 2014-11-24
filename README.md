getdata-009
===========

Coursera repository Getting and Cleaning Data

Update- 24/11/2014 - As you will see, I didn't read the instructions very well.
You won't find:
independent tidy data set with the average of each variable for each activity and each subject.
- It is NOT calculated in my program.

Quick View at the end of the script:
Working Directory  (created by Git)

	+___data (created by script)
		|___UCI HAR Dataset
			|___test
				|___Inertial Signals
			|___train
				|___Inertial Signals
	|___programs (created by Git) <- Scripts
	|___tidyData (created by script)
	|___tmp (created by script)
		|___UCI HAR Dataset
			|___merged
				|___Inertial Signals

Libraries used
data.table
tidyr

To run the script<br>
**Please, READ the "IMPORTANT" section in this document.**

**source('directory where you download Git/run_analysis.R')**	

Tasks
You will be required to submit: 

1. a tidy data set as described below, 
2. a link to a Github repository with your script for performing the analysis, and 
3. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.

 Program: run_analysis.R  
 Author: Ricardo Rodriguez Erdmenger 2014/11

  The objective of this script is to:

   You should create one R script called run_analysis.R 
   
   1. Merges the training and the test sets to create one data set.
   2. Extracts only the measurements on the mean and standard deviation for each measurement. 
   3. Uses descriptive activity names to name the ACTIVITIES in the data set
   4. Appropriately labels the data set with descriptive variable names.

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

**Note:**

* a. The step 4 was included in the merging process, expandind the "features" as a field names of the calculated data set.
* b. Maybe you will see lots of unnecesary code and steps added to the simple merging process.
   I used this project as a personal training to learn more about R.
   
**IMPORTANT:**

* a. You need to EDIT the script "run_analysis.R" to set your PERSONAL preferences in where to run the script and store all
the files downloaded, expanded and produced.
Look for the variables "I_" specially "dWorkingDir". The script won't run if you don't change this variable.
* b. the output files will be in csv format, not txt.This to read them faster in Excel and see the contents.

=================================================================================
* Merge calculated Datasets*

       1.1) Identify Subjects from UCI HAR Dataset/XXXXXXXX/subject_XXXXXXXX.txt file, where
           XXXXXXXX could be "test" or "train"
       1.2) Identify Activities from UCI HAR Dataset/XXXXXXXX/y_XXXXXXXX.txt file, where
           XXXXXXXX could be "test" or "train"
       1.3) Data from UCI HAR Dataset/XXXXXXXX/X_XXXXXXXX.txt file, where
           XXXXXXXX could be "test" or "train"
           note: field names are taken from "vfeatures" file pre-processed.
		   
		1.1, 1.2) EXPORT - source(paste0(I_Programs,"/subject_activity_feature.R"))
		Create the files:
			Subject.csv
			activity.csv
			features.csv
			   dWorkingDir                     I_export_Data / subject.csv
			   C:/ricardor/Coursera/getdata-009 /tidyData    / subject.csv"
			   dExportDataDir = dWorkingDir + I_export_Data
		1.3) EXPORT - source(paste0(I_Programs,"/merge_test_train_calcs.R"))
       dWorkingDir                       I_temp / gsub("XXXXXXXX","merged",eachFileName[1])
       C:/ricardor/Coursera/getdata-009 /tmp    / UCI HAR Dataset/merged/Inertial Signals/body_acc_x_merged.txt
	   
*Merge Inertial Signals Directory*

       Basic string with generic value (XXXXXXXX) changable to: train, test, merged
       "UCI HAR Dataset/XXXXXXXX/Inertial Signals/body_acc_x_XXXXXXXX.txt"

       IMPORT -
       dWorkingDir                       I_Data / vtrainFileNames[1]
       C:/ricardor/Coursera/getdata-009 /data   / UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt
       dWorkingDir                       I_Data / vtestFileNames[1]
       C:/ricardor/Coursera/getdata-009 /data   / UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt
       EXPORT -
       dWorkingDir                       I_temp / gsub("XXXXXXXX","merged",eachFileName[1])
       C:/ricardor/Coursera/getdata-009 /tmp    / UCI HAR Dataset/merged/Inertial Signals/body_acc_x_merged.txt
=================================================================================

