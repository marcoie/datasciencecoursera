## This function creates a "list" object that will hold a "matrix" object 
## along several "functions" to get and set an "mt" matrix content
## and also to calculate-set and get thier inverse matriz
makeCacheMatrix <- function(x = matrix()) {
    mt <- NULL ## This is the cached Inverse Matrix place holder
    set <- function(y) {
        x <<- y            ## if we change the matrix content (aka X)
        mt <<- NULL        ## we must reset the cached inverse matrix
    }
    get <- function() x   ## get the base matrix
    setinverse <- function(invmat) mt <<- invmat  ## Store the Inverted Matrix
    getinverse <- function() mt ## get the chached inverse matrix
    ## return the list object
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}

## Next Funtion uses an makeCacheMatrix object (a list containing the source x
## matrix, and the inverse mt matrix )...
## and asses if the inverse has or not been calculated to return it
cacheSolve <- function(x, ...) {
    ## Get the cached Inverted MAtrix and check if it has a value or is null
    im <- x$getinverse()
    if(!is.null(im)) {
        ## if not null, return the cached inverted matrix
        message("getting cached data")
        return(im)
    }
    ## if null then get the data (aka base "x" matrix from makeCacheMatrix 
    ## object received as the parameter here)
    data <- x$get()
    ## find inverse matrix
    im <- solve(data, ...)
    ## store it back
    x$setinverse(im)
    im
}
