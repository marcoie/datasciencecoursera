pollutantmean <- function(directory, pollutant, id = 1:332) {
# 'directory' is a character vector of length 1 indicating
# the location of the csv files
# 'pollutant' is a character vector of iength 1 indicating
# the name of the pollutant for which we will calculate the
# mean; either "sulfate" or "nitrate".
# ‘id’ is an integer vector indicating the monitor ID number
# to be used
    
# first step is to get the target files for the id vector
    target_pfiles <- list.files(directory,full.names=TRUE)[id]
    
# then we use lapply to combine the reading of the polluntant column needed 
# for the selected files 

    rawdata <- lapply(target_pfiles,function(x) read.csv(x)[[pollutant]])
# we got a list of vector (1 per file read) that we need to combine in a single
# vecor so we "unlist" the raw data ..

    obsvector <- unlist(rawdata)

# And return the mean without the NA values
        mean(obsvector,na.rm=TRUE)
}