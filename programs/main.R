# Program: main.R  
# Author: Ricardo Rodriguez Erdmenger 2014/11
#
#    Funtions to run the script
#

# main <- function () {
  
  if (! file.exists(dWorkingDir ) ){
      stop(paste("Working Directory ",dWorkingDir," not available"))        
  }
  # =================================================================================
  #  Loading auxiliary scripts with functions
  # =================================================================================
  source(paste0(I_Programs,"/dirFunctions.R"))
  source(paste0(I_Programs,"/Files_mdl.R"))
  
  # =================================================================================
  # Validate Directory structure.
  # Create directories variables.
  # Create directories if necesary.
  # =================================================================================
  source(paste0(I_Programs,"/set_directories.R"))
  
  
  # =================================================================================
  # Downloading files from WWW
  # =================================================================================
  message("Downloading the file...")
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  docFile <- paste0(dDataDir,"/SmartphonesDS.zip")
  
  if ( ! getFile( fileUrl, docFile) ) {
      # call_marshall
      setwd(I_Directory)
      stop(paste("File ",docFile,"not available"))  
      
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
  vDirectorypaths <<- fUnzipfile(docFile, FALSE, dDataDir)
  if ( is.null(vDirectorypaths) == TRUE  ) {
      # call_marshall
      setwd(I_Directory)
      stop(paste("Unziping file error :",docFile))  
  }
  #
  # fUnzipfile
  #   ONLY load the vectors to get the directory structure
  #
  vDirectorypaths <<- fUnzipfile(docFile, TRUE)
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
  message("Processing Subject, Activity and Feature files ...")
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
  #
  # Make it GLOBAL
  #
  vMergeDir <<- gsub("XXXXXXXX","merged",vMergeDir)
  for ( eachDirName in vMergeDir ) {
      # Creates the Directory, does not set it as a WD.
      # Fix to test file.exists Directory path ending with "/"
      manageDir(dirname(paste0(dWorkingDir,I_temp,"/",eachDirName,".")), TRUE, FALSE)
  } # end for Directory creation    
  
  vtrainFileNames <- vDirectorypaths[grep("train.txt$",vDirectorypaths[,"Name"]),"Name"]
  vtestFileNames <- vDirectorypaths[grep("test.txt$",vDirectorypaths[,"Name"]),"Name"]
  
  # vDirectorypaths[grep("/$",vDirectorypaths[,"Name"]),"Name"]
  #
  # Make it GLOBAL
  #
  vMerge1 <<- unique(c(gsub("train","XXXXXXXX",vtrainFileNames),gsub("test","XXXXXXXX",vtestFileNames)))
  
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
  
  # =================================================================================
  # Merge calculated Datasets:
  #       smartphones_summary.csv NOTE: I_temp Directory
  #
  #       1.1) Identify Subjects from UCI HAR Dataset/XXXXXXXX/subject_XXXXXXXX.txt file, where
  #           XXXXXXXX could be "test" or "train"
  #       1.2) Identify Activities from UCI HAR Dataset/XXXXXXXX/y_XXXXXXXX.txt file, where
  #           XXXXXXXX could be "test" or "train"
  #       1.3) Data from UCI HAR Dataset/XXXXXXXX/X_XXXXXXXX.txt file, where
  #           XXXXXXXX could be "test" or "train"
  #           note: field names are taken from "vfeatures" file pre-processed.
  #       EXPORT -
  #           vMergeDir1[1] 
  #              [1] "UCI HAR Dataset/merged/"
  #       dWorkingDir                       I_temp / gsub("XXXXXXXX","merged",eachFileName[1])
  #       C:/ricardor/Coursera/getdata-009 /tmp    / UCI HAR Dataset/merged/  smartphones_summary.csv
  #       
  # =================================================================================
  message("1) Processing test train files  ...")
  source(paste0(I_Programs,"/merge_test_train_calcs.R"))
  
  # =================================================================================
  # Merge Inertial Signals
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
  message("Processing RAW Data test train files in Intertial Signals Directory ...")
  source(paste0(I_Programs,"/merge_inertial_signals.R"))
  
  # =================================================================================
  # 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
  # =================================================================================
  message("2) Extracting mesurements mean and std from the merged data set ...")
  source(paste0(I_Programs,"/extract_mesurements.R"))
  # Returns dfMeanStd - Should be converted as a function -
  
  # =================================================================================
  #
  # 3) Uses descriptive activity names to name the ACTIVITIES in the data set
  #
  # =================================================================================
  message("3) Descriptive activity names to name the ACTIVITIES in the data set")
  cFile <- paste0( dExportDataDir, "/", "activity.csv")
  df_activity <- read.csv(cFile)
  #
  # HELP from data.table
  #
  library(data.table)
  #
  # dt_activity <- data.table(df_activity) # - 1.9.4 
  # setkey(dt_activity,activity_id) 
  dt_activity <- data.table(df_activity, key = "activity_id")
  rm(df_activity)
  #
  # dt_MeanStd <- data.table(dfMeanStd)
  # setkey(dt_MeanStd,activity_id)
  dt_MeanStd <- data.table(dfMeanStd, key = "activity_id")
  rm(dfMeanStd)
  
  
  # =================================================================================
  # 4) Appropriately labels the data set with descriptive variable names.
  # =================================================================================
  message("4) Appropriately labels the data set with descriptive variable names.")
  #
  # merge by key
  #
  dt_MeanStd_descriptive <- merge(dt_activity,dt_MeanStd)
  cFile <- paste0( dExportDataDir, "/", "smartphones_MeanStd_descriptive_3.csv")
  writeMyndf(dt_MeanStd_descriptive,cFile)
  #
  rm("dt_MeanStd","dt_activity","dt_MeanStd_descriptive")
  # detach("package:<name>")
  detach("package:data.table")
  
  # =================================================================================
  # 5) From the data set in step 4, creates a second, independent tidy data set with 
  # the average of each variable for each activity and each subject.
  # =================================================================================
  message("5) creates a second, independent tidy data set")
  #
  # HELP from tidyr
  #
  library(tidyr)
  cFile <- paste0( dExportDataDir, "/", "smartphones_MeanStd_descriptive_3.csv")
  df_MeanStd_descriptive <- read.csv(cFile)
  #
  # with the average of each variable for each activity and each subject.
  #
  dfMean <- df_MeanStd_descriptive[,c(1,2,3,grep("mean.fn",names(df_MeanStd_descriptive)))]
  rm(df_MeanStd_descriptive)
  #
  # Analysis
  #
  # Two set of possible variables:
  #   3 underscores - ending with ".fn"
  #   4 underscores - ending with "_X|_Y|_Z"
  #       two sets of files
  #
  set01fn <- dfMean[,c(1,2,3,grep(".fn$",names(dfMean)))]
  set02XYZ <- dfMean[,c(1,2,3,grep("[_X|_Y|_Z]$",names(dfMean)))]
  rm(dfMean)
  
  # test02 <- gather(test01,Tranformation,value,-(1:3))
  #
  # First Dataset Magnitude
  #
  set01fn <- gather(set01fn,Transformation,result.fn,-(1:3))
  # Separate
  set01fn <- separate(set01fn,Transformation,c("origin","base","magnitude","measure"),sep="_")
  # fix Magnitude column
  set01fn[,"magnitude"] <- gsub("Mag","",set01fn[,"magnitude"])
  
  #
  # Second Dataset Axial
  #  - ending with X,Y,Z
  #
  set02XYZ <- gather(set02XYZ,Transformation,result.fn,-(1:3))
  set02XYZ <- separate(set02XYZ,Transformation,c("origin","base","device","measure","axis"),sep="_")
  
  #
  # writing the files
  #
  cFile <- paste0( dExportDataDir, "/", "smartphones_Mean_tidy_Magnitude_5.csv")
  cFile2 <- paste0( dExportDataDir, "/", "smartphones_Mean_tidy_Magnitude_5.txt")
  writeMyndf(set01fn,cFile)
  # Export in txt format
  # write.table(set01fn, file = cFile2, row.names = FALSE)
  #
  cFile <- paste0( dExportDataDir, "/", "smartphones_Mean_tidy_Axis_5.csv")
  cFile2 <- paste0( dExportDataDir, "/", "smartphones_Mean_tidy_Axis_5.txt")
  writeMyndf(set02XYZ,cFile)
  # Export in txt format
  # write.table(set02XYZ, file = cFile2, row.names = FALSE)
  rm("set01fn","set02XYZ","cFile","cFile2")
  # detach("package:<name>")
  detach("package:tidyr")

# }
