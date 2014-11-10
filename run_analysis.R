# Program: run_analysis.R  
# Author: Ricardo Rodriguez Erdmenger 2014/11
#

# NOTES About the Dataset.
# License:
#   ========
#   Use of this dataset in publications must be acknowledged by referencing the following publication [1] 
# 
# [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
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

## Setting up the working environment:
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

#
#  Loading auxiliary scripts with functions
#
source(paste0(I_Programs,"/dirFunctions.R"))
source(paste0(I_Programs,"/Files_mdl.R"))

#
# Change working Directory, validating existance & saving active working directory
# 3rd parameter makes dWorkingDir as the working directory 
#
if ( ! manageDir(dWorkingDir, FALSE, TRUE) ) {
    setwd(I_Directory)
    stop(paste("Directory error ",dWorkingDir))
}

#
# Data Directory verification and creation
#
dDataDir <- paste0(dWorkingDir,I_Data)
if ( ! manageDir( dDataDir, TRUE, FALSE) ) {
  setwd(I_Directory)
  stop(paste("Directory error ",dDataDir))  
}

#
# Data Export Directory verification and creation
#
dExportDataDir <- paste0(dWorkingDir,I_export_Data)
if ( ! manageDir( dExportDataDir, TRUE, FALSE) ) {
    setwd(I_Directory)
    stop(paste("Directory error ",dExportDataDir))  
}


#
# Downloading files from WWW
#
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
docFile <- paste0(dDataDir,"/SmartphonesDS.zip")

if ( ! getFile( fileUrl, docFile) ) {
  # call_marshall
  setwd(I_Directory)
  stop(paste("File ",docFile,"no available"))  
  
}

# fUnzipfile
#   unzip the files and load directory structure in the 
#   propper vectors training and test
#   to be merge
#
# NOTE: fUnzipfile second parameter use TRUE to load
#       only the vectors with the file names.
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
# Dissecting directory paths and file names
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

#
#  Code Book
#

#
# Activities
#       - varaible: vactivities -
# File          UCI HAR Dataset/activity_labels.txt
# Columns       activity_labels.txt(2)
# ColumnNames   activity_id             Numeric 1..6
#               activity_description    character

#
# Subjects
#
# File          UCI HAR Dataset/XXXXXXXX/subject_XXXXXXXX.txt
#               c("test","train")
# Columns       subject_XXXXXXXX.txt(1) 
# ColumnNames   subject_id              Numeric 1..n 
#               subject_code            character       "subject" + subject_id 
#               subject_group           character       cGroup=<"train"|"test">

# Secuencia de Merge
#
# Files:        UCI HAR Dataset/XXXXXXXX/
# Columns       subject_XXXXXXXX.txt(1) y_XXXXXXXX.txt(1) X_XXXXXXXX.txt(561)
# ColumnNames   subject_id              Numeric 1..n              
#               activity_id             Numeric 1..5
#               features.txt[,2][1:561] Real 

# Files:        UCI HAR Dataset/XXXXXXXX/Inertial Signals/
# Columns       subject_XXXXXXXX.txt(1) y_XXXXXXXX.txt(1) X_XXXXXXXX.txt(561)
# ColumnNames   subject_id              Numeric 1..n              
#               activity_id             Numeric 1..5
#               features.txt[,2][1:561] Real 
#

#   lDirectorypaths <- sapply(lDaSet,function(x) x[grep("/$",x)])
# vDirectorypaths <<- lDaSet[grep("/$",lDaSet[,"Name"]),"Name"]
#
# Find file path for activities.txt and features.txt
#
# hard code file name detection 
#

vactivities <- NULL
vfeatures <- NULL

vtrainFileNames <- NULL
vtestFileNames <- NULL

vactivities <- vDirectorypaths[grep("activity_labels.txt$",vDirectorypaths[,"Name"]),"Name"]
vfeatures <- vDirectorypaths[grep("features.txt$",vDirectorypaths[,"Name"]),"Name"]

cPath <- paste0( dDataDir )
cFile <- paste0( cPath, "/", vactivities)
ndf <- read.table(cFile, sep = "", col.names = c("activity_id","activity_description"))
#
# Writes the ACTIVITY ndf (NewDataFrame) to disk
#
#
# Export activity.csv
#   dWorkingDir                     I_export_Data / activity.csv
#   C:/ricardor/Coursera/getdata-009 /tidyData    / activity.csv"
#  dExportDataDirth = dWorkingDir + I_export_Data
cwFile <- paste0( dExportDataDir, "/", "activity.csv")
writeMyndf(ndf,cwFile)

#
# Detecting subjects, I wanted to know which subjects are in training and which on the test group
#
# reading subjects
#
ndf <- find_subject_group("train",vDirectorypaths[,"Name"])
ndf <- rbind(ndf,find_subject_group("test",vDirectorypaths[,"Name"]))
ndf <- ndf[order(ndf$subject_id),]
#
# Export subject.csv
#   dWorkingDir                     I_export_Data / subject.csv
#   C:/ricardor/Coursera/getdata-009 /tidyData    / subject.csv"
#  dExportDataDir = dWorkingDir + I_export_Data
cwFile <- paste0( dExportDataDir, "/", "subject.csv")
writeMyndf(ndf,cwFile)

#
# Reading and merging the files
#
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
# Merging Directory
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

#
# Assures that only ONE final filename will prevail
#
vMerge1 <- unique(c(gsub("train","XXXXXXXX",vtrainFileNames),gsub("test","XXXXXXXX",vtestFileNames)))


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

# vDirectorypaths[grep("/$",vDirectorypaths[,"Name"]),"Name"]

#
# Read - vfeatures -
#       UCI HAR Dataset/features.txt
#       to be able to use as column names for x_XXXXXXXX.txt
#
cFile <- paste0(dDataDir,"/",vfeatures)
dfFeatures <- read.table(cFile, sep = "", col.names = c("feature_id","feature_field_name"))
#
# Replace "-" by "_"
#
dfFeatures[,2] <- gsub("-","_",dfFeatures[,2])
#
# Replace "()" by "_fn"
#
dfFeatures[,2] <- gsub("\\(\\)","_fn",dfFeatures[,2])
#
# Replace "," by "_to_"
#
dfFeatures[,2] <- gsub(",","_to_",dfFeatures[,2])
#
# Replace "(" by "_fn_"
#
dfFeatures[,2] <- gsub("\\(","_fn_",dfFeatures[,2])
#
# Replace ")" by "_fn"
#
dfFeatures[,2] <- gsub("\\)","_fn",dfFeatures[,2])


cFile <- paste0(dDataDir,"/","UCI HAR Dataset/test/subject_test.txt")
df_subject <- read.table(cFile, sep = "", col.names = c("subject_id"))

cFile <- paste0(dDataDir,"/","UCI HAR Dataset/test/y_test.txt")
df_activity <- read.table(cFile, sep = "", col.names = c("activity_id"))

cFile <- paste0(dDataDir,"/","UCI HAR Dataset/test/X_test.txt")
df_x <- read.table(cFile, sep = "", col.names = dfFeatures[,2])

#
# Merge first set
#
df_merge <- cbind(df_subject,df_activity,df_x)

cFile <- paste0(dDataDir,"/","UCI HAR Dataset/train/subject_train.txt")
df_subject <- read.table(cFile, sep = "", col.names = c("subject_id"))

cFile <- paste0(dDataDir,"/","UCI HAR Dataset/train/y_train.txt")
df_activity <- read.table(cFile, sep = "", col.names = c("activity_id"))

cFile <- paste0(dDataDir,"/","UCI HAR Dataset/train/X_train.txt")
df_x <- read.table(cFile, sep = "", col.names = dfFeatures[,2])

df_merge <- rbind(df_merge, cbind(df_subject,df_activity,df_x) )

#
# write merged file
#
######### Cambiar el Directorio a Temp
cwFile <- paste0( dExportDataDir, "/", "smartphones_summary.csv")
writeMyndf(df_merge,cwFile)
df_x <- ""
#
# clean memory
#
rm("df_x","df_subject","df_activity","df_merge")




#
for ( eachFileName in vMerge1[grep("Inertial Signals",vMerge1)] ) {
    #
    # Hardcode pattern _XXXXXXXX defines the result merging filename 
    #
    vtMFile <- paste0( dWorkingDir,I_temp,"/",gsub("XXXXXXXX","merged",eachFileName))
    vt1File <- paste0( dDataDir,"/",gsub("XXXXXXXX","train",eachFileName))
    vt2File <- paste0( dDataDir,"/",gsub("XXXXXXXX","test",eachFileName))
    #
    # load Data Frames
    #
    cMergeCommand <- NULL
    iFlCnt <- 0
    if (file.exists( vt1File ) ) {
#        message(paste("merging ",vt1File))
        cMergeCommand <- c(cMergeCommand,vt1File)
    }
    if (file.exists( vt2File ) ) {
#        message(paste("merging ",vt2File))        
        cMergeCommand <- c(cMergeCommand,vt2File)
    }  

    #
    # Merging the files
    #
#    message(paste("in      ",vtMFile))
    if ( is.null(cMergeCommand) == TRUE ) {
        next    
    }
    basic.DataFrame <- data.frame()
    for (dfReadFile in cMergeCommand ) {
        ndfM <- read.table(dfReadFile, sep = "")
        rbind(basic.Dataframe,ndfM)
    }
    print(basic.DataFrame)
    
} # end for merging

# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
#
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
# "
#
cFile <- paste0( dDataDir, "/", vfeatures)
ndf <- read.table(cFile, sep = "", col.names = c("feature_id","feature_description"))

tFeatures_mean <<- ndf[grep("mean",ndf[,c(2)], ignore.case = TRUE),]
tFeatures_std <<- ndf[grep("std",ndf[,c(2)], ignore.case = TRUE),]


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