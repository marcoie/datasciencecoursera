best <- function(state, outcome) {
    ## Check that "outcome" is valid using a "named vector" for each data possible data colum 
    outcomes <- c("heart attack"=11, "heart failure"=17, "pneumonia"=23)
    ## if !(Valid Outcome) then stop("invalid outcome")
    if (is.na(outcomes[outcome])) { stop("invalid outcome") }
    
    ## Read outcome data (set NA String value and ignore string value as factors)
    outcome_data <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available", stringsAsFactors = FALSE)
    
    ## strip "valid states" from data (as state.abb do not have all states and protectorates)
    valid_states <- unique(outcome_data$State)
    ## if !(Valid State) then stop("invalid state")
    if (!(state %in% valid_states)) { stop("invalid state") }
 
    ## and immediatelly after subset the columns from data ...
    outcome_data <- outcome_data[,c(2,7,outcomes[outcome])]
    ## ... set friendly names ...
    names(outcome_data)<-c("hospital","state","outcome")
    ## ... agd split/get data for desired State ...
    outcome_data <- as.data.frame(split(outcome_data, outcome_data$state)[state])
    names(outcome_data)<-c("hospital","state","outcome")

    ## .. order by outcome (small = best to larger = worst) and hospital (alphabetic) name
    outcome_data <- outcome_data[order(outcome_data$outcome,outcome_data$hospital,decreasing=FALSE),]

    ## Return hospital name in that state with lowest 30-day death rate
    outcome_data$hospital[1]
}

rankhospital <- function(state, outcome, num = "best") {
    ## Check that "outcome" is valid using a "named vector" for each data possible data colum 
    outcomes <- c("heart attack"=11, "heart failure"=17, "pneumonia"=23)
    ## if !(Valid Outcome) then stop("invalid outcome")
    if (is.na(outcomes[outcome])) { stop("invalid outcome") }
    
    ## Read outcome data (set NA String value and ignore string value as factors)
    outcome_data <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available", stringsAsFactors = FALSE)
    
    ## strip "valid states" from data (as state.abb do not have all states and protectorates)
    valid_states <- unique(outcome_data$State)
    ## if !(Valid State) then stop("invalid state")
    if (!(state %in% valid_states)) { stop("invalid state") }

    
    ## and immediatelly after subset the columns from data ...
    outcome_data <- outcome_data[,c(2,7,outcomes[outcome])]
    ## ... set friendly names ...
    names(outcome_data)<-c("hospital","state","outcome")
    ## ... and split/get data for desired State ...
    outcome_data <- as.data.frame(split(outcome_data, outcome_data$state)[state])
    ## ... set names (again)
    names(outcome_data)<-c("hospital","state","outcome")

    ## ... remoe NA using complete cases
    outcome_data <- outcome_data[complete.cases(outcome_data),]
    ## .. order by outcome (small = best to larger = worst) and hospital (alphabetic) name
    outcome_data <- outcome_data[order(outcome_data$outcome,outcome_data$hospital,decreasing=FALSE),]

    ## Return hospital name in that state with the given rank (num)
    ## 30-day death rate
    if (num == "best") { num <- 1 }
    else if (num == "worst") { num <- length(outcome_data$hospital) }
    outcome_data$hospital[num]
}

rankall <- function(outcome, num = "best") {
    ## Check that "outcome" is valid using a "named vector" for each data possible data colum 
    outcomes <- c("heart attack"=11, "heart failure"=17, "pneumonia"=23)
    ## if !(Valid Outcome) then stop("invalid outcome")
    if (is.na(outcomes[outcome])) { stop("invalid outcome") }

    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available", stringsAsFactors = FALSE)

    ## Fetch only the needed columns, including selected outcome column
    outcome_data <- data[,c(2,7,outcomes[outcome])] 
    ## ... set simple names
    names(outcome_data)<-c("hospital","state","outcome")
    ## ... get rid of NA values
    outcome_data <- outcome_data[complete.cases(outcome_data),]
    ## ... sort the data ...
    outcome_data <- outcome_data[order(outcome_data$state,outcome_data$outcome,outcome_data$hospital,decreasing=FALSE),]
    ## ... break the data by state
    outcomelist <- split(outcome_data, outcome_data$state)

    ## ... asses which "num" we will use, note that in case is "worst" it needs to be based
    ## ... upon each "state list" lenght...
    hosplist <- lapply(outcomelist, function(x) {
        if (num == "best")  {index = 1} 
        else if (num == "worst") {index = nrow(x)}
        else {index <- num }
        x[index,1] 
    })
    hosplist <- data.frame(hospital = unlist(hosplist), state = names(hosplist))
}

plotoutcome <- function(outcome="heart attack") {
    ## Check that "outcome" is valid using a "named vector" for each data possible data colum 
    outcomes <- c("heart attack"=11, "heart failure"=17, "pneumonia"=23)
    ## if !(Valid Outcome) then stop("invalid outcome")
    if (is.na(outcomes[outcome])) { stop("invalid outcome") }
    ## read the data
    data <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available", stringsAsFactors = FALSE)
    outcome_data <- data[,c(2,7,outcomes[outcome])] 
    hist(outcome_data[,3],main=paste("Histogram of", outcome), xlab = paste(outcome))
}
