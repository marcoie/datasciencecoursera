Human Activity Recognition Using Smartphones Dataset Version 1.0 (Reviewed)
================

CodeBook Review
---------------

This is review of the original Data Set Codebook **features\_info.txt** and **features.txt**. Original **Train** and **Test** sets were combined together in one single set. Subject Id as well as Activity Id were added as the first two columns of new set. Activity Id is ket a numeric value to be interpreted as pr **activity\_labels.txt**.

New Derived Dataset
-------------------

New **new\_tidy\_dataset.csv** data set, CSV coded, as been derived for all original Mean and Standar Deviation measurements, and for each the Mean has benn computed grouped by **Subject Id** and **Activity Id**.

\[1\] "subject\_id" "activity\_id" "tBodyAccStdX\_mean"
\[4\] "tBodyAccStdY\_mean" "tBodyAccStdZ\_mean" "tGravityAccStdX\_mean"
\[7\] "tGravityAccStdY\_mean" "tGravityAccStdZ\_mean" "tBodyAccJerkStdX\_mean"
\[10\] "tBodyAccJerkStdY\_mean" "tBodyAccJerkStdZ\_mean" "tBodyGyroStdX\_mean"
\[13\] "tBodyGyroStdY\_mean" "tBodyGyroStdZ\_mean" "tBodyGyroJerkStdX\_mean"
\[16\] "tBodyGyroJerkStdY\_mean" "tBodyGyroJerkStdZ\_mean" "tBodyAccMagStd\_mean"
\[19\] "tGravityAccMagStd\_mean" "tBodyAccJerkMagStd\_mean" "tBodyGyroMagStd\_mean"
\[22\] "tBodyGyroJerkMagStd\_mean" "fBodyAccStdX\_mean" "fBodyAccStdY\_mean"
\[25\] "fBodyAccStdZ\_mean" "fBodyAccJerkStdX\_mean" "fBodyAccJerkStdY\_mean"
\[28\] "fBodyAccJerkStdZ\_mean" "fBodyGyroStdX\_mean" "fBodyGyroStdY\_mean"
\[31\] "fBodyGyroStdZ\_mean" "fBodyAccMagStd\_mean" "fBodyBodyAccJerkMagStd\_mean"
\[34\] "fBodyBodyGyroMagStd\_mean" "fBodyBodyGyroJerkMagStd\_mean" "tBodyAccMeanX\_mean"
\[37\] "tBodyAccMeanY\_mean" "tBodyAccMeanZ\_mean" "tGravityAccMeanX\_mean"
\[40\] "tGravityAccMeanY\_mean" "tGravityAccMeanZ\_mean" "tBodyAccJerkMeanX\_mean"
\[43\] "tBodyAccJerkMeanY\_mean" "tBodyAccJerkMeanZ\_mean" "tBodyGyroMeanX\_mean"
\[46\] "tBodyGyroMeanY\_mean" "tBodyGyroMeanZ\_mean" "tBodyGyroJerkMeanX\_mean"
\[49\] "tBodyGyroJerkMeanY\_mean" "tBodyGyroJerkMeanZ\_mean" "tBodyAccMagMean\_mean"
\[52\] "tGravityAccMagMean\_mean" "tBodyAccJerkMagMean\_mean" "tBodyGyroMagMean\_mean"
\[55\] "tBodyGyroJerkMagMean\_mean" "fBodyAccMeanX\_mean" "fBodyAccMeanY\_mean"
\[58\] "fBodyAccMeanZ\_mean" "fBodyAccMeanFreqX\_mean" "fBodyAccMeanFreqY\_mean"
\[61\] "fBodyAccMeanFreqZ\_mean" "fBodyAccJerkMeanX\_mean" "fBodyAccJerkMeanY\_mean"
\[64\] "fBodyAccJerkMeanZ\_mean" "fBodyAccJerkMeanFreqX\_mean" "fBodyAccJerkMeanFreqY\_mean"
\[67\] "fBodyAccJerkMeanFreqZ\_mean" "fBodyGyroMeanX\_mean" "fBodyGyroMeanY\_mean"
\[70\] "fBodyGyroMeanZ\_mean" "fBodyGyroMeanFreqX\_mean" "fBodyGyroMeanFreqY\_mean"
\[73\] "fBodyGyroMeanFreqZ\_mean" "fBodyAccMagMean\_mean" "fBodyAccMagMeanFreq\_mean"
\[76\] "fBodyBodyAccJerkMagMean\_mean" "fBodyBodyAccJerkMagMeanFreq\_mean" "fBodyBodyGyroMagMean\_mean"
\[79\] "fBodyBodyGyroMagMeanFreq\_mean" "fBodyBodyGyroJerkMagMean\_mean" "fBodyBodyGyroJerkMagMeanFreq\_mean"

New Derived Data Set - Summary
------------------------------

You can find here the summary of new data set:
