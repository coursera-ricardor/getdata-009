# Program: merge_inertial_signals.R  
# Author: Ricardo Rodriguez 2014/11
#
# Code to merge the files contained in the 
# directories:
#       Basic string with generic value (XXXXXXXX) changable to: train, test
#       "UCI HAR Dataset/XXXXXXXX/Inertial Signals/body_acc_x_XXXXXXXX.txt"
#
# =================================================================================
for ( eachFileName in vMerge1[grep("Inertial Signals",vMerge1)] ) {
    # Assemble the File Names
    #
    # Notation:
    # window[1..128].inertial_signal.[filename]
    field_names_file <- paste0( ".inertial_signal.",
                                make.names( basename( gsub("_XXXXXXXX.txt","",eachFileName) ) ) )
    field_names_file <- paste0("window_",c(1:128),field_names_file)
    #
    # load Data Frames Subject / Activity per group
    #
    df_merge <- NULL
    test_group <- c("test","train")
    for ( ch_Origin in test_group ) {
        
        #
        # 4 next versions ( improve this readings) - load once use many -
        #
        cFile <- paste0(dDataDir,"/","UCI HAR Dataset/",ch_Origin,"/subject_",ch_Origin,".txt")
        df_subject <- read.table(cFile, sep = "", col.names = c("subject_id"))
        cFile <- paste0(dDataDir,"/","UCI HAR Dataset/",ch_Origin,"/y_",ch_Origin,".txt")
        df_activity <- read.table(cFile, sep = "", col.names = c("activity_id"))
        
        #
        # Read first file to merge
        #
        vt1File <- paste0( dDataDir,"/",gsub("XXXXXXXX",ch_Origin,eachFileName))
        if (file.exists( vt1File ) ) {
            df_File <- read.table(vt1File, sep = "", col.names = field_names_file)
            #
            # Creates the Data Frame
            #
            df_merge <- rbind(df_merge, cbind(df_subject,df_activity,df_File) )
            
        } # end if file.exist
    }
    
    if (! is.null(df_merge )  ) {
        #
        # Hardcode pattern _XXXXXXXX defines the result merging filename 
        #
        vtMFile <- paste0( dWorkingDir,I_temp,"/",gsub("XXXXXXXX","merged",eachFileName))
        writeMyndf(df_merge,vtMFile)
        
        
    } # end if df_merge
    
} # end for merging
rm("cFile","df_File","df_merge","vtMFile","ch_Origin")
rm("vt1File","df_activity","df_subject")
rm("field_names_file","test_group")
rm("eachFileName","eachDirName")
