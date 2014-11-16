# Program: run_analysis.R  
# Author: Ricardo Rodriguez Erdmenger 2014/11
#   additional information in the README.md file

# NOTES About the Dataset.
# License:
# =================================================================================
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
#  Loading main program
# =================================================================================
source(paste0(I_Programs,"/main.R"))

#
# Memory Marshaling
#
setwd(I_Directory)
#
rm(dDataDir)
rm(dWorkingDir)
rm(cTmpDir)
rm(dExportDataDir)
rm("vMerge1","vMergeDir")
rm("vDirectorypaths")
rm("vtestFileNames","vtrainFileNames")
# 
# Environment variables
#
rm(I_Data)
rm(I_Directory)
rm(I_Programs)
rm(I_export_Data)
rm(I_temp)
#
# functions
#
rm(manageDir)
rm(getFile)
rm(fUnzipfile)
rm(find_subject_group)
rm(writeMyndf)
#
# The easiest way
#
# rm(list=ls())
# Packages
# detach("package:<name>")