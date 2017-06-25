cr?debug
corr <- function (directory, thresold = 0){
    ## 'directory' is a character vector of lenght 1 indicating
    ## the location of csv files
    target_pfiles <- list.files(directory,full.names=TRUE)
    
    ## 'thresold' is a numeric vector of lenght 1 indicating the
    ## number of completely observed observations (on all variables)
    ## required to compute the correlation between nitrate and sulfate; the default is 0
    cvec <- vector()
    for (i in seq_along(target_pfiles)) {
        rawdata = read.csv(target_pfiles[i])
        if (sum(complete.cases(rawdata)) > thresold) {
            cvec <- append(cvec,cor(rawdata$sulfate,rawdata$nitrate,use="complete.obs"))
        }        
    }
    cvec
    ## Return a numeric vector of correlations
    ## NOTE: DO not round the results
    
}