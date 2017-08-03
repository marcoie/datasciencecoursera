Code Book
=========

This is a codebook for a derived data set from [Human Activity
Recognition Using Smartphones Dataset Version
1.0](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The derived data Set will Contain a sumarized version from both Train
and Test sets together, that includes The SUbject Id, the Activity
Description and the Averages of the Standard Deviation and Mean based
measures from original dataset after grouping all individual test by
Subject and Activity.

Basic Set Information
---------------------

The Dimensions of the resulting set is:

    ## [1] "[180 x 81]"

Variables Present
-----------------

Allvariables are of type double, with the excetion of Subject\_ID that
is Integer and Activity\_Description that is a character string:

    ##  [1] "subject_id"                           
    ##  [2] "activity_name"                        
    ##  [3] "TimeBodyAcc_mean_X_mean"              
    ##  [4] "TimeBodyAcc_mean_Y_mean"              
    ##  [5] "TimeBodyAcc_mean_Z_mean"              
    ##  [6] "TimeGravityAcc_mean_X_mean"           
    ##  [7] "TimeGravityAcc_mean_Y_mean"           
    ##  [8] "TimeGravityAcc_mean_Z_mean"           
    ##  [9] "TimeBodyAccJerk_mean_X_mean"          
    ## [10] "TimeBodyAccJerk_mean_Y_mean"          
    ## [11] "TimeBodyAccJerk_mean_Z_mean"          
    ## [12] "TimeBodyGyro_mean_X_mean"             
    ## [13] "TimeBodyGyro_mean_Y_mean"             
    ## [14] "TimeBodyGyro_mean_Z_mean"             
    ## [15] "TimeBodyGyroJerk_mean_X_mean"         
    ## [16] "TimeBodyGyroJerk_mean_Y_mean"         
    ## [17] "TimeBodyGyroJerk_mean_Z_mean"         
    ## [18] "TimeBodyAccMag_mean_mean"             
    ## [19] "TimeGravityAccMag_mean_mean"          
    ## [20] "TimeBodyAccJerkMag_mean_mean"         
    ## [21] "TimeBodyGyroMag_mean_mean"            
    ## [22] "TimeBodyGyroJerkMag_mean_mean"        
    ## [23] "FreqBodyAcc_mean_X_mean"              
    ## [24] "FreqBodyAcc_mean_Y_mean"              
    ## [25] "FreqBodyAcc_mean_Z_mean"              
    ## [26] "FreqBodyAcc_meanFreq_X_mean"          
    ## [27] "FreqBodyAcc_meanFreq_Y_mean"          
    ## [28] "FreqBodyAcc_meanFreq_Z_mean"          
    ## [29] "FreqBodyAccJerk_mean_X_mean"          
    ## [30] "FreqBodyAccJerk_mean_Y_mean"          
    ## [31] "FreqBodyAccJerk_mean_Z_mean"          
    ## [32] "FreqBodyAccJerk_meanFreq_X_mean"      
    ## [33] "FreqBodyAccJerk_meanFreq_Y_mean"      
    ## [34] "FreqBodyAccJerk_meanFreq_Z_mean"      
    ## [35] "FreqBodyGyro_mean_X_mean"             
    ## [36] "FreqBodyGyro_mean_Y_mean"             
    ## [37] "FreqBodyGyro_mean_Z_mean"             
    ## [38] "FreqBodyGyro_meanFreq_X_mean"         
    ## [39] "FreqBodyGyro_meanFreq_Y_mean"         
    ## [40] "FreqBodyGyro_meanFreq_Z_mean"         
    ## [41] "FreqBodyAccMag_mean_mean"             
    ## [42] "FreqBodyAccMag_meanFreq_mean"         
    ## [43] "FreqBodyBodyAccJerkMag_mean_mean"     
    ## [44] "FreqBodyBodyAccJerkMag_meanFreq_mean" 
    ## [45] "FreqBodyBodyGyroMag_mean_mean"        
    ## [46] "FreqBodyBodyGyroMag_meanFreq_mean"    
    ## [47] "FreqBodyBodyGyroJerkMag_mean_mean"    
    ## [48] "FreqBodyBodyGyroJerkMag_meanFreq_mean"
    ## [49] "TimeBodyAcc_std_X_mean"               
    ## [50] "TimeBodyAcc_std_Y_mean"               
    ## [51] "TimeBodyAcc_std_Z_mean"               
    ## [52] "TimeGravityAcc_std_X_mean"            
    ## [53] "TimeGravityAcc_std_Y_mean"            
    ## [54] "TimeGravityAcc_std_Z_mean"            
    ## [55] "TimeBodyAccJerk_std_X_mean"           
    ## [56] "TimeBodyAccJerk_std_Y_mean"           
    ## [57] "TimeBodyAccJerk_std_Z_mean"           
    ## [58] "TimeBodyGyro_std_X_mean"              
    ## [59] "TimeBodyGyro_std_Y_mean"              
    ## [60] "TimeBodyGyro_std_Z_mean"              
    ## [61] "TimeBodyGyroJerk_std_X_mean"          
    ## [62] "TimeBodyGyroJerk_std_Y_mean"          
    ## [63] "TimeBodyGyroJerk_std_Z_mean"          
    ## [64] "TimeBodyAccMag_std_mean"              
    ## [65] "TimeGravityAccMag_std_mean"           
    ## [66] "TimeBodyAccJerkMag_std_mean"          
    ## [67] "TimeBodyGyroMag_std_mean"             
    ## [68] "TimeBodyGyroJerkMag_std_mean"         
    ## [69] "FreqBodyAcc_std_X_mean"               
    ## [70] "FreqBodyAcc_std_Y_mean"               
    ## [71] "FreqBodyAcc_std_Z_mean"               
    ## [72] "FreqBodyAccJerk_std_X_mean"           
    ## [73] "FreqBodyAccJerk_std_Y_mean"           
    ## [74] "FreqBodyAccJerk_std_Z_mean"           
    ## [75] "FreqBodyGyro_std_X_mean"              
    ## [76] "FreqBodyGyro_std_Y_mean"              
    ## [77] "FreqBodyGyro_std_Z_mean"              
    ## [78] "FreqBodyAccMag_std_mean"              
    ## [79] "FreqBodyBodyAccJerkMag_std_mean"      
    ## [80] "FreqBodyBodyGyroMag_std_mean"         
    ## [81] "FreqBodyBodyGyroJerkMag_std_mean"
