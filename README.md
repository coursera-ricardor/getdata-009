getdata-009
===========

Coursera repository Getting and Cleaning Data
Analysis 
1)	Read features.txt – variable names for the data set provided (561 columns)
2)	The column description contains characters not valid as field name in R.
“fBodyAcc-bandsEnergy()-33,40”  or “fBodyGyro-mean()-X” or “angle(tBodyAccJerkMean),gravityMean)” [Typing error in the row 556, comparing with the other two rows, “angle(tBodyGyroMean,gravityMean)” and “angle(tBodyGyroJerkMean,gravityMean)”, it is possible to observe the error “Mean),gravity” and extra “)”. ]
a.	 ERROR: features row 556 corrected from “angle(tBodyAccJerkMean),gravityMean)” to “angle(tBodyAccJerkMean,gravityMean)” compared with row 558 ”angle(tBodyGyroJerkMean,gravityMean)”
b.	Transform “-“ to “_”. (?make.name Prior to R version 1.9.0, underscores were not valid in variable names.. for example, S-PLUS and some DBMSs)
c.	Transform “()” to “_fn”. Indicate the notation “Function”.
d.	Transform “(“ to “_fn_”. Indicate the notation “start Function”.
e.	Transform “)” to “ _fn”. Indicate the notation “end Function”.
f.	ERROR: features rows containing “-bandsEnergy()” have missing the AXIS identification [X|Y|Z].  This is not required to fix, the function make.names could take care of it. This error was detected when comparing rows expected (561) vs levels loaded (477).
g.	WARNING: field names with BodyBody instead of Body included.

