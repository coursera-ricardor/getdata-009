# Program: subject_activity_feature.R  
# Author: Ricardo Rodriguez 2014/11
#
# Create the files in the tidy data directory:
#
#   subject.csv
#   activities.csv
#   features.csv
#
#   Note:
#       function "writeMyndf" External in programs/Files_mdl.R
#       To run independently requires:
#           I_ variables defined
#           vDirectorypaths defined
#       features row 556 corrected from _ to:
#               angle(tBodyAccJerkMean),gravityMean)
#               angle(tBodyAccJerkMean,gravityMean)
#           compared with row 558
#               angle(tBodyGyroJerkMean,gravityMean)
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

#
# Activities
#
vactivities <- vDirectorypaths[grep("activity_labels.txt$",vDirectorypaths[,"Name"]),"Name"]
cFile <- paste0( dDataDir, "/", vactivities)
ndf <- read.table(cFile, sep = "", col.names = c("activity_id","activity_description"))
#
# Writes the ACTIVITY ndf (NewDataFrame) to disk
#
# Export activity.csv
#   dWorkingDir                     I_export_Data / activity.csv
#   C:/ricardor/Coursera/getdata-009 /tidyData    / activity.csv"
#  dExportDataDir = dWorkingDir + I_export_Data
cwFile <- paste0( dExportDataDir, "/", "activity.csv")
writeMyndf(ndf,cwFile)
rm(ndf,cwFile,cFile)
#
# Subjects
#
# Detecting subjects, I wanted to know which subjects are in training and which on the test group
# Note: find_subject_group() in programs/Files.mdl.R
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
rm(ndf,cwFile)

#
# Features
#
vfeatures <- vDirectorypaths[grep("features.txt$",vDirectorypaths[,"Name"]),"Name"]
#
# Read - vfeatures -
#       UCI HAR Dataset/features.txt
#       to be able to use as column names for x_XXXXXXXX.txt
# NOTE:
#       field names in R requires a valid character set specification
#       by default the function "make.names" change all invalid characters to "."
#       in this case, the notations will be process with this rules:
#       
#
#
cFile <- paste0(dDataDir,"/",vfeatures)
## Easy way - Convert factors as string
##
dfFeatures <- read.table(cFile, sep = "", col.names = c("feature_id","feature_field_name"), stringsAsFactors = FALSE)
#
#
# Undestanding Levels - por las piedritas -
# Error, the source of k NO ledge
#
## dfFeatures <- read.table(cFile, sep = "", col.names = c("feature_id","feature_field_name"))
#
# dfFeatures length 2 561 rows, 
# class(df[1,1]) integer    561 
# class(df[1,2]) factor     477 levels length(levels(dfFeatures[,2])) - table(df[,2])
# tbl_err <- table(dfFeatures[,2])[table(dfFeatures[,2])>1] # rows - same name codification err.
#
# fix row 556 
#
## Easy way - Convert factors as string
## dfFeatures[556,2] <- gsub("\\),",",",dfFeatures[556,2])
## Warning message:
## In `[<-.factor`(`*tmp*`, iseq, value = "angle(tBodyAccJerkMean,gravityMean)") :
##    invalid factor level, NA generated
dfFeatures[556,2] <- gsub("\\),",",",dfFeatures[556,2])

#
# Replace "-" by "_"
#
dfFeatures[,2] <- gsub("-","_",dfFeatures[,2])
#
# Replace "()" by "_fn"
#
dfFeatures[,2] <- gsub("\\(\\)",".fn",dfFeatures[,2])
#
# Replace "," by "_to_"
#
dfFeatures[,2] <- gsub(",",".to.",dfFeatures[,2])
#
# Replace "(" by "_fn_"
#
dfFeatures[,2] <- gsub("\\(","_fn.",dfFeatures[,2])
#
# Replace ")" by "_fn"
#
dfFeatures[,2] <- gsub("\\)",".fn",dfFeatures[,2])
#
# Replace "BodyBody"  by "Body"
#
dfFeatures[,2] <- gsub("BodyBody","Body",dfFeatures[,2])

#
# Fixing the duplicate names, I guess the name was truncated or missing the Axis
# fBodyGyro_bandsEnergy_fn_1_to_8 - appears 3 times -
tbl_err <- table(dfFeatures[,2])[table(dfFeatures[,2])>1]
if ( length( tbl_err ) > 0 ) {
    # field Names Duplicated 42 X 3 = 126 Rows = FND
    # 126 duplicated rows + 477 levels - 42 duplicated levels included FND = 561
    tbl_err <- names(tbl_err)
    # fBodyGyro_bandsEnergy_fn_1_to_8
    # fBodyGyro_bandsEnergy_fn_1_to_8.1
    # fBodyGyro_bandsEnergy_fn_1_to_8.2
    dfFeatures[,2] <- make.names(dfFeatures[,2], unique = TRUE)
    #
    # Brute force to fix the column names assuming order X Y Z 
    # following pattern. This not assure the correct order.
    #
    for (eachErr in tbl_err) {

        # Fix X
        row_2_fix <- grep(paste0(eachErr,"$"),dfFeatures[,2])
        if ( row_2_fix > 0) {
           dfFeatures[row_2_fix,2] <- gsub(eachErr,paste0(eachErr,"_X"),dfFeatures[row_2_fix,2]) 
        } # end replace X
        
        # Fix Y
        row_2_fix <- grep(paste0(eachErr,".1$"),dfFeatures[,2])
        if ( row_2_fix > 0) {
            dfFeatures[row_2_fix,2] <- gsub(paste0(eachErr,".1"),paste0(eachErr,"_Y"),dfFeatures[row_2_fix,2]) 
        } # end replace Y
        
        # Fix Z
        row_2_fix <- grep(paste0(eachErr,".2$"),dfFeatures[,2])
        if ( row_2_fix > 0) {
            dfFeatures[row_2_fix,2] <- gsub(paste0(eachErr,".2"),paste0(eachErr,"_Z"),dfFeatures[row_2_fix,2]) 
        } # end replace Z
        
        
    } # end for fix col names
}
#
# Keep splitting
#
dfFeatures[,2] <- gsub("^tBody","time_Body_",dfFeatures[,2])
dfFeatures[,2] <- gsub("^tGravity","time_Gravity_",dfFeatures[,2])
dfFeatures[,2] <- gsub("^fBody","fourier_Body_",dfFeatures[,2])

# call marshall
rm("tbl_err","row_2_fix","eachErr")

#
# Save the file features.csv
#
cwFile <- paste0( dExportDataDir, "/", "features.csv")
writeMyndf(dfFeatures,cwFile)
#
rm(cFile,dfFeatures,cwFile)
rm(vactivities,vfeatures,vtestFileNames,vtrainFileNames)