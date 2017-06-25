complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of lenght 1 indicating
    ## the location of csv files
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## get Target File List
    target_pfiles <- list.files(directory,full.names=TRUE)[id]
    rdf <- data.frame()
    for (i in seq_along(id)) {
        rawdata = read.csv(target_pfiles[i])
        cs <- sum(complete.cases(rawdata))
        rdf <- rbind(rdf,c(id[i],cs))
    }
    names(rdf)[1]<-paste("id")
    names(rdf)[2]<-paste("nobs")
    print(rdf)
    ## Return a data.frame of the form
    ## id nobs
    ## 1 117
    ## 2 1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the number of complete cases
    
}