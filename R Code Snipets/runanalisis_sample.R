##https://github.com/TheDuongSandbox/DataScienceCoursera_C3W4.git
##transform_names.R function
transformNames <- function(names) {
    # Abbreviation patterns
    patterns <- matrix(c(
        '^t', 'Timed', 
        '^f', 'Frequency',
        'Acc', 'Accelerometer',
        'Gyro', 'Gyroscope',
        'Mag', 'Magnitude',
        '\\.mean', '\\.Mean',
        '\\.std', '\\.StandardDevication',
        '(\\w+)\\.(\\w+)', 'The\\2Of\\1', # Move mean and std to the front
        '\\.+(\\w)$', '-\\1', # Add `-` before X/Y/Z
        '\\.+$', '' # Remove trailing dots (.).
    ), ncol = 2, byrow = TRUE)
    # Converting abbreviations back to their final form
    apply(patterns, 1, function(pattern) {
        names <<- sub(pattern[[1]], pattern[[2]], names)
    })
    
    return(names)
}

## run_analysis.R section
require(dplyr)
source('transform_names.R')

dataDir <- 'data'
outputDir <- 'output'

activity_info <- read.delim(file.path(dataDir, 'activity_labels.txt'), col.names = c('ActivityId', 'Activity'), header = FALSE, sep = '')
feature_info <- read.delim(file.path(dataDir, 'features.txt'), col.names = c('FeatureId', 'Feature'), header = FALSE, sep = '')

getData <- function(dataName, dataFolder = dataDir) {
    getFilePath <- function(fileName) {
        return(file.path(dataFolder, dataName, fileName))
    }
    
    subjects <- read.delim(getFilePath(paste0('subject_', dataName, '.txt')), col.names = c('SubjectId'), header = FALSE, sep = '')
    
    activities <- read.delim(getFilePath(paste0('y_', dataName, '.txt')), col.names = c('ActivityId'), header = FALSE, sep = '') %>% 
        left_join(activity_info, by = 'ActivityId') %>% 
        dplyr::select(Activity)
    
    # Read the measurement data and take only the mean and standard deviation data
    measurements <- read.delim(getFilePath(paste0('X_', dataName, '.txt')), col.names = feature_info[,2], header = FALSE, sep = '') %>%
        dplyr::select(matches('\\.(mean|std)\\.'))
    # Converting the variable names to something more meaningful
    names(measurements) <- transformNames(names(measurements))
    
    return(bind_cols(subjects, activities, measurements))
}

tidyData <- bind_rows(getData('train'), getData('test')) %>% # Bind all rows in the `train` and `test` data set together
    group_by(Activity, SubjectId) %>% # Group them by the `Activity` and `SubjectId` values
    summarise_all(funs(mean)) # Get mean of all the other variables in the dataset

if(!file.exists(outputDir)) {
    dir.create(outputDir)
}

write.table(tidyData, file = file.path(outputDir, 'tidydata.txt'), row.names = FALSE)

## generate_codebook.R
require(memisc)

tidyData <- within(as.data.set(read.table('output/tidydata.txt', header = TRUE)), {
    description(Activity) <- 'The activity monitored'
    description(SubjectId) <- 'The ID of the subject'
})
# Generate the basic CodeBook.md
Write(codebook(tidyData), 'output/CodeBook.md')

