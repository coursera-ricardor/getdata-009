# Program: extract_mesurements.R  
# Author: Ricardo Rodriguez 2014/11
#
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
# Analysis:
#
#
# Load the merged dataset
#
# To facilitate the reviewing process, copy the file to tidyData Directory
#
cTmpDir <- paste0(dWorkingDir,I_temp,"/",vMergeDir[1])
cFile <- paste0( cTmpDir, "smartphones_summary.csv")
file.copy(cFile,dExportDataDir)
#
cFile <- paste0( dExportDataDir, "/","smartphones_summary.csv")
mergeDataSet <- read.csv(cFile)
#
# Detect the fields with mean or std ignoring case
# only will process mean() -> mean_fn and std() -> std_fn
# dfMeanStd<- mergeDataSet[,c(1,2,grep("mean|std",names(mergeDataSet),ignore.case = TRUE))]

#
# Make it GLOBAL
#
dfMeanStd <<- mergeDataSet[,c(1,2,grep("mean.fn|std.fn",names(mergeDataSet)))]
cFile <- paste0( dExportDataDir, "/","smartphones_mean_std_2.csv")
writeMyndf(dfMeanStd,cFile)
#
rm(mergeDataSet)