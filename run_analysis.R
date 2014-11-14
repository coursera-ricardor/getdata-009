# Program: run_analysis.R  
# Author: Ricardo Rodriguez Erdmenger 2014/11
#

# NOTES About the Dataset.
# License:
#   ========
#   Use of this dataset in publications must be acknowledged by referencing the following publication [1] 
# 
# [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
# Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 
# International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
# 
# This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
# 
# Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
#

#  The objective of this script is to:
#
#   You should create one R script called run_analysis.R 
#   
#   1) Merges the training and the test sets to create one data set.
#   2) Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#

# =================================================================================
# Setting up the working environment:
# =================================================================================
##
##  Directory structure:
##      The directory structure for this application is controlled by some predefined variables, and it is
##      represented by this structure:
##
##      dWorkingDir
##      dWorkingDir/I_Data
##      dWorkingDir/I_export_Data
##      dWorkingDir/I_programs | Any other valid path set in the I_programs variable.
##
##      These variables should be modified to setup your personal working environment preferences, and allow you
##      to decide where do you want to store the application and its results.
##  VARIABLES:
##
##      dWorkingDir - First part of the root directory path where the application is installed
##                  NOTE: This directory path MUST exist.
##      
##  I_<varaibles>
##
##      I_Data - Is the working directory path where the program will download, expand and store the working files files.
##              NOTE: if the directory path doesn't exist, it will be created by the script.
##      I_temp - Is the temporary directory path.
##              NOTE: if the directory path doesn't exist, it will be created by the script.
##      I_export_Data - Is the directory path where the program will create the new files to be reviewed.
##              NOTE: if the directory path doesn't exist, it will be created by the script.
##      I_Programs - Is the directory path where the auxiliary programs and scripts are stored.
##
#
# Modify this line to use your own directory path 
#  NOTE: (dWorkingDir) 
#     In blank would be the actual working directory
#
dWorkingDir <- "" 
dWorkingDir <- "C:/ricardor/Coursera/getdata-009"

I_Data <- "/data"
I_export_Data <- "/tidyData"
#
# Directory path for temporary files
# Recommended use paste0(dWorkingDir,I_temp)
I_temp <- "/tmp"  

#
I_Programs <- "/programs"
I_Programs <- paste0(dWorkingDir,I_Programs)
#
# I_Programs <- "Your own directory path where the scripts are stored"
#

I_Directory <- getwd() ## Saves the actual working directory

# =================================================================================
#  Loading auxiliary scripts with functions
# =================================================================================
source(paste0(I_Programs,"/dirFunctions.R"))
source(paste0(I_Programs,"/Files_mdl.R"))

# =================================================================================
# Validate Directory structure.
# Create directories if necesary.
# =================================================================================
source(paste0(I_Programs,"/set_directories.R"))


# =================================================================================
# Downloading files from WWW
# =================================================================================
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
docFile <- paste0(dDataDir,"/SmartphonesDS.zip")

if ( ! getFile( fileUrl, docFile) ) {
  # call_marshall
  setwd(I_Directory)
  stop(paste("File ",docFile,"no available"))  
  
}

# =================================================================================
# Uncompresing the zip file
# =================================================================================
# fUnzipfile
#   unzip the files and load directory structure in the 
#   propper vectors training and test
#   to be merge
#
# NOTE: fUnzipfile second parameter use TRUE to load
#       only the vectors ( vDirectorypaths ) with the file names.
#       In this case, It runs twice the same
#       function to get the RELATIVE paths to work later with them
#
# load the vectors and unzip the files
#   Next version could ASK if the file names are
#   detected in the directory
#
vDirectorypaths <- fUnzipfile(docFile, FALSE, dDataDir)
if ( is.null(vDirectorypaths) == TRUE  ) {
  # call_marshall
  setwd(I_Directory)
  stop(paste("Unziping file error :",docFile))  
}
#
# fUnzipfile
#   ONLY load the vectors to get the directory structure
#
vDirectorypaths <- fUnzipfile(docFile, TRUE)
if ( is.null(vDirectorypaths) == TRUE  ) {
    # call_marshall
    setwd(I_Directory)
    stop(paste("Unziping file error :",docFile))  
}
#
rm(docFile,fileUrl)


# =================================================================================
# Dissecting directory paths and file names
# =================================================================================
#   - variable: vDirectorypaths -
#   UCI HAR Dataset/activity_labels.txt
#   UCI HAR Dataset/features.txt
#   training Data
#       "UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt" 
#       "UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt" 
#       "UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt" 
#       "UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt"
#       "UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt"
#       "UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt"
#       "UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt"
#       "UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt"
#       "UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt"
#       "UCI HAR Dataset/train/subject_train.txt"                     
#       "UCI HAR Dataset/train/X_train.txt"                           
#       "UCI HAR Dataset/train/y_train.txt"  
#   test Data ...
#
# NOTE: Variables with the <<- are in the Global Environment and
#       they will be modify. eq: assign("<var>","<value>",envir = .GlobalEnv)

# =================================================================================
#  Code Book
# =================================================================================
#
# Activities
#       - varaible: vactivities -
# File          UCI HAR Dataset/activity_labels.txt
# Columns       activity_labels.txt(2)
# ColumnNames   activity_id             Numeric 1..6
#               activity_description    character

#
# Features
#       - varaible: vfeatures -
# File          UCI HAR Dataset/features.txt
# Columns       features.txt(2)
# ColumnNames   feature_id             Numeric 1..561
#               feature_field_name    character

#
# Subjects
#
# File          UCI HAR Dataset/XXXXXXXX/subject_XXXXXXXX.txt
#               c("test","train")
# Columns       subject_XXXXXXXX.txt(1) 
# ColumnNames   subject_id              Numeric 1..n 
#               subject_code            character       "subject" + subject_id 
#               subject_group           character       cGroup=<"train"|"test">
#   NOTE: To produce "subject_group", two step reading subjects from directories "train" and "test"

# =================================================================================
# Secuencia de Merge
# =================================================================================
# Two sets of merging, information allready "processed" and "Intertial Signals" sets of files
# will be merged.
#
# Two step merge process to avoid row group confusions after the merge, linking subjects and activities.
#
#       1.1) Identify Subjects from UCI HAR Dataset/XXXXXXXX/subject_XXXXXXXX.txt file, where
#           XXXXXXXX could be "test" or "train"
#       1.2) Identify Activities from UCI HAR Dataset/XXXXXXXX/y_XXXXXXXX.txt file, where
#           XXXXXXXX could be "test" or "train"
#       1.3) Data from UCI HAR Dataset/XXXXXXXX/X_XXXXXXXX.txt file, where
#           XXXXXXXX could be "test" or "train"
#           note: field names are taken from "vfeatures" file pre-processed.
#       2.0) The results of the step 1, will be merged obtaining an structure like: 
#
# Files:        UCI HAR Dataset/XXXXXXXX/
# Columns       subject_XXXXXXXX.txt(1) y_XXXXXXXX.txt(1) X_XXXXXXXX.txt(561)
# ColumnNames   subject_id              Numeric 1..n              
#               activity_id             Numeric 1..5
#               features.txt[,2][1:561] Real 
#
# For the Inertial signals, will aplly the same logic to produce the merged files.
#
# Files:        UCI HAR Dataset/XXXXXXXX/Inertial Signals/
# Columns       subject_XXXXXXXX.txt(1) y_XXXXXXXX.txt(1) X_XXXXXXXX.txt(128)
# ColumnNames   subject_id              Numeric 1..n              
#               activity_id             Numeric 1..5
#               interval_[1:128]        scientific 
#

# =================================================================================
# Create the files:
#   Subject.csv
#   activity.csv
#   features.csv
# =================================================================================
source(paste0(I_Programs,"/subject_activity_feature.R"))


# =================================================================================
# Reading and merging the files
# =================================================================================
# LOGIC:
#     Use training directory as the main guide to merge the
#     files. 
#     Double way check. XXXXXXX - allows to combine generic names.
#         train   test
#           YES     YES
#           YES     NO
#           NO      YES
#
# hard code file extension detection 
#   two sets of files
#   - train Training files
#   - test  Test files
#   lFileNames <- sapply(lDaSet,function(x) x[grep("txt$",x)])
#
# =================================================================================
# Merging Directory
# =================================================================================
#    Validates existance of the export Directory
#   if it does not exist, the directory is created
#
vMergeDir <- vDirectorypaths[grep("/$",vDirectorypaths[,"Name"]),"Name"]
# vMergeDir <- gsub("train","XXXXXXXX",vMergeDir)
# vMergeDir <- gsub("test","XXXXXXXX",vMergeDir)
vMergeDir <- unique(gsub("test|train","XXXXXXXX",vMergeDir))
vMergeDir <- gsub("XXXXXXXX","merged",vMergeDir)
for ( eachDirName in vMergeDir ) {
    # Creates the Directory, does not set it as a WD.
    manageDir(paste0(dWorkingDir,I_temp,"/",eachDirName), TRUE, FALSE)
} # end for Directory creation    

vtrainFileNames <<- vDirectorypaths[grep("train.txt$",vDirectorypaths[,"Name"]),"Name"]
vtestFileNames <<- vDirectorypaths[grep("test.txt$",vDirectorypaths[,"Name"]),"Name"]

# vDirectorypaths[grep("/$",vDirectorypaths[,"Name"]),"Name"]
vMerge1 <- unique(c(gsub("train","XXXXXXXX",vtrainFileNames),gsub("test","XXXXXXXX",vtestFileNames)))

# =================================================================================
#
# Assures that only ONE final filename will prevail
#
# =================================================================================
# 
# NOTE:
#       vMergeDir, vDirectorypaths, vtrainFileNames and vtestFileNames vectors have
#       the RELATIVE Directory path. In this script the use of these variables would be like:
#
#       Basic string with generic value (XXXXXXXX) changable to: train, test, merged
#       "UCI HAR Dataset/XXXXXXXX/Inertial Signals/body_acc_x_XXXXXXXX.txt"
#
#       IMPORT -
#       dWorkingDir                       I_Data / vtrainFileNames[1]
#       C:/ricardor/Coursera/getdata-009 /data   / UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt
#       dWorkingDir                       I_Data / vtestFileNames[1]
#       C:/ricardor/Coursera/getdata-009 /data   / UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt
#       EXPORT -
#       dWorkingDir                       I_temp / gsub("XXXXXXXX","merged",eachFileName[1])
#       C:/ricardor/Coursera/getdata-009 /tmp    / UCI HAR Dataset/merged/Inertial Signals/body_acc_x_merged.txt

# =================================================================================
# Merge calculated Datasets
# =================================================================================
source(paste0(I_Programs,"/merge_test_train_calcs.R"))

# =================================================================================
# Merge Inertial Signals
# =================================================================================
source(paste0(I_Programs,"/merge_inertial_signals.R"))
            


# =================================================================================
# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
#
# Note:
#
#   Subject  file ( subject.csv  ) is store in the path:
#   dExportDataDirth = dWorkingDir + I_export_Data
#      dWorkingDir                     I_export_Data / subject.csv
#      <your directory configuration> /tidyData    / subject.csv"

#   Activity file ( activity.csv ) is store in the path:
#   dExportDataDirth = dWorkingDir + I_export_Data
#      dWorkingDir                     I_export_Data / activity.csv
#      <your directory configuration> /tidyData    / activity.csv"

#   Features file ( features.csv ) is store in the path:
#   dExportDataDirth = dWorkingDir + I_export_Data
#      dWorkingDir                     I_export_Data / features.csv
#      <your directory configuration> /tidyData    / features.csv"

#   Merged Files ( smartphones_summary.csv )  are stored in the path: 
#    vMergeDir1[1] 
#       [1] "UCI HAR Dataset/merged/"
#       paste0(dWorkingDir,I_temp,"/",vMergeDir[1])
#       "<your directory configuration>/tmp/UCI HAR Dataset/merged/"
#
# =================================================================================
# Getting all records with mean or std to identify the varaible columns to be merge.
#
#   Load features.txt to obtain the field with
#   the patern <mean> and <std> in the field description
#   Validations:
#       561 rows as the definition in the README.txt file.
#   QUOTE:
# " For each record it is provided:
#     ======================================
#     
#   - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
#   - Triaxial Angular velocity from the gyroscope. 
#   - A 561-feature vector with time and frequency domain variables. 
#   - Its activity label. 
#   - An identifier of the subject who carried out the experiment.
#
# Change Patterns - README.TXT -
#
#       These time domain signals (prefix 't' to denote time) 
#       body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) 
#           tBodyAcc-XYZ        time_Body_Accelerometer
#           tGravityAcc-XYZ     time_Gravity_Accelerometer
#           tBodyGyro-XYZ       time_Body_Gyroscope
#
#       Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
#           tBodyAccJerk-XYZ    time_Body_Accelerometer_Jerk
#           tBodyGyroJerk-XYZ   time_Body_Gyroscope_Jerk
#
#       Magnitude of these three-dimensional signals were calculated using the Euclidean norm 
#       (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
#           tBodyAccMag
#           tGravityAccMag
#           tBodyGyroMag
#           tBodyAccJerkMag
#           tBodyGyroJerkMag
#
#       Fast Fourier Transform (FFT) was applied to some of these signals producing 
#       fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag
#           fBodyAcc-XYZ
#           fBodyAccJerk-XYZ
#           fBodyGyro-XYZ
#           fBodyAccMag
#           fBodyAccJerkMag
#           fBodyGyroMag
#           fBodyGyroJerkMag

#       These signals were used to estimate variables of the feature vector for each pattern:  
#     '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
# 
#       The set of variables that were estimated from these signals are: 
#     
#       mean(): Mean value
#       std(): Standard deviation
#       mad(): Median absolute deviation 
#       max(): Largest value in array
#       min(): Smallest value in array .....
# "
#
# =================================================================================
# Analysis:
#
# =================================================================================
#
# Load the merged dataset
#
cTmpDir <- paste0(dWorkingDir,I_temp,"/",vMergeDir[1])
#
cFile <- paste0( cTmpDir, "smartphones_summary.csv")
mergeDataSet <- read.csv(cFile)
#
# Detect the fields with mean or std ignoring case
# only will process mean() -> mean_fn and std() -> std_fn
# dfMeanStd<- mergeDataSet[,c(1,2,grep("mean|std",names(mergeDataSet),ignore.case = TRUE))]
dfMeanStd<- mergeDataSet[,c(1,2,grep("mean|std",names(mergeDataSet)))]
#
# Testings
#
# test01 <- dfMeanStd[c(1:20),c(1,2,grep("tBodyAcc_mean_fn",names(dfMeanStd),ignore.case = TRUE))]
# test02 <- gather(test01,Tranformation,value,-(1:2))

#
# test10 <- dfMeanStd[c(1:10),]
# test12 <- gather(test10,Tranformation,value,-(1:2))
#
# Process different groups
# 1st group - ending with X,Y,Z
#
test01 <- dfMeanStd[c(1:100),c(1,2,grep("[_X|_Y|_Z]$",names(dfMeanStd),ignore.case = TRUE))]
#
# Construct the Columns to be parsed
#
test02 <- gather(test01,Formula,value,-(1:2))


test03 <- separate(test02,Formula,c("origin","base","device","measure","txt","axis"),sep="_")
#
# Process Jerk
#
test03[,5] <- gsub("AccJerk","AJerk",test03[,5])
test03[,5] <- gsub("GyroJerk","GJerk",test03[,5])
#
test03[,5] <- gsub("Acc","Accelerometer",test03[,5])
test03[,5] <- gsub("Gyro","Gyroscope",test03[,5])
#
test03[,5] <- gsub("AJerk","Accelerometer_Jerk",test03[,5])
test03[,5] <- gsub("GJerk","Gyroscope_Jerk",test03[,5])


# call marshall
# rm(mergeDataSet)
#
# HELP from tidyr
#
library(tidyr)


#
# Memory Marshaling
#
setwd(I_Directory)
rm(dDataDir)
rm(dWorkingDir)
# Documents
rm(docFile)
rm(fileUrl)

# Environment variables
rm(I_Data)
rm(I_Directory)
rm(I_Programs)
# functions
rm(manageDir)
rm(getFile)
#
# The easiest way
#
rm(list=ls())
# Packages
# detach("package:<name>")