# Program: codebook.R  
# Author: Ricardo Rodriguez 2014/11
#   Script to create the basic information for the CodeBook.md
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

setwd(dWorkingDir)


dData <- paste0(dWorkingDir,I_export_Data)

lFile <- c("activity.csv","subject.csv","features.csv",
           "smartphones_Mean_tidy_Axis_5.csv",
           "smartphones_Mean_tidy_Magnitude_5.csv",
           "smartphones_MeanStd_descriptive_3.csv")

df_CodeBook <- NULL

for ( eachFile in lFile ) {
    #
    df_CodeBook <- rbind(df_CodeBook ,paste("Table:",eachFile))
    #
    cFile <- paste0(dData,"/",eachFile)
    if (! file.exists(cFile) ) {
        next
    }
    dfTable <- read.csv(cFile, stringsAsFactors = FALSE )
    nrep <- paste(replicate(7,"-"), collapse = "")
    nrep <- paste0("     |",nrep,">")
    #
    # Process fields to get possible values except for "result.fn"
    #
    for ( eachField in names(dfTable) ) {
        cFieldDesc <- paste0(nrep,eachField,"    ")
        #
        # Integer
        #
        if ( class(dfTable[1,eachField]) == "integer" ) {
            cFieldDesc <- paste0(cFieldDesc,"integer   ", "[",min(dfTable[,eachField]) , ".." ,max(dfTable[,eachField]),"]")
            df_CodeBook <- rbind(df_CodeBook ,cFieldDesc)
            next
        } #end integer
        #
        # Character
        #
        if ( class(dfTable[1,eachField]) == "character" ) {
            cFieldDesc <- paste0(cFieldDesc,"character ", "[",paste(unique(dfTable[,eachField]),collapse="|"),"]")
            df_CodeBook <- rbind(df_CodeBook ,cFieldDesc)
            next
        } #end character
        #
        # Check for result.fn field
        #
        df_CodeBook <- rbind(df_CodeBook ,cFieldDesc)
        
        
            
    }
#    df_CodeBook <- rbind( df_CodeBook ,cbind(paste0(nrep,names(dfTable) )))
    
} # end for File

row.names(df_CodeBook) <- NULL

# print(df_CodeBook)
cFile <- paste0(dWorkingDir,"/CodeBook/R_CodeBook.txt")
write.table(df_CodeBook,cFile,row.names = FALSE, col.names = FALSE, quote = FALSE)

setwd(I_Directory)

rm("dfTable","df_CodeBook","eachFile","eachField")
rm("lFile","nrep","cFieldDesc","dData")
rm("dWorkingDir","cFile")
rm(list = ls(pattern = "I_"))