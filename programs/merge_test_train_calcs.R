# Program: merge_test_train_calcs.R  
# Author: Ricardo Rodriguez Erdmenger 2014/11
#
# Code to merge the files contained in the 
# directories:
#       Basic string with generic value (XXXXXXXX) changable to: train, test
#       "UCI HAR Dataset/XXXXXXXX/X_XXXXXXXX.txt
# NOTE: 
#   Before the training and test merge dataser, the keys to link to Subject and Activity are added to
#   avoid recod mismatch.
# This section could be converted in a function.
#
# =================================================================================
#
# Process the test group
#
#       1.1) Identify Subjects from UCI HAR Dataset/XXXXXXXX/subject_XXXXXXXX.txt file, where
#           XXXXXXXX could be "test" or "train"
cFile <- paste0(dDataDir,"/","UCI HAR Dataset/test/subject_test.txt")
df_subject <- read.table(cFile, sep = "", col.names = c("subject_id"))
#       1.2) Identify Activities from UCI HAR Dataset/XXXXXXXX/y_XXXXXXXX.txt file, where
#           XXXXXXXX could be "test" or "train"
cFile <- paste0(dDataDir,"/","UCI HAR Dataset/test/y_test.txt")
df_activity <- read.table(cFile, sep = "", col.names = c("activity_id"))
#       1.3) Data from UCI HAR Dataset/XXXXXXXX/X_XXXXXXXX.txt file, where
#           XXXXXXXX could be "test" or "train"
#           note: field names are taken from "vfeatures" file pre-processed.
cFile <- paste0(dExportDataDir,"/features.csv")
dfFeatures <- read.csv(cFile)
#
cFile <- paste0(dDataDir,"/","UCI HAR Dataset/test/X_test.txt")
df_x <- read.table(cFile, sep = "", col.names = dfFeatures[,2])

#
# Merge first set creating the keys to link Subject and Activity
#
df_merge <- cbind(df_subject,df_activity,df_x)

#
# Applies the same procedure to the train dataset.
#
cFile <- paste0(dDataDir,"/","UCI HAR Dataset/train/subject_train.txt")
df_subject <- read.table(cFile, sep = "", col.names = c("subject_id"))

cFile <- paste0(dDataDir,"/","UCI HAR Dataset/train/y_train.txt")
df_activity <- read.table(cFile, sep = "", col.names = c("activity_id"))

cFile <- paste0(dDataDir,"/","UCI HAR Dataset/train/X_train.txt")
df_x <- read.table(cFile, sep = "", col.names = dfFeatures[,2])

df_merge <- rbind(df_merge, cbind(df_subject,df_activity,df_x) )

#
# Writes in the Tempo Directory the result of the merge
#   vMergeDir1[1] 
#   [1] "UCI HAR Dataset/merged/"
cwFile <- paste0( dWorkingDir,I_temp,"/",vMergeDir[1], "smartphones_summary.csv")
writeMyndf(df_merge,cwFile)
#
# clean memory
#
rm("df_x","df_subject","df_activity","df_merge","cFile","cwFile")