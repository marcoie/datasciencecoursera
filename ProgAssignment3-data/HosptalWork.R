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
    outcome_data <- outcome_data[order(outcome_data$hospital,decreasing=FALSE),]
    outcome_data <- outcome_data[order(outcome_data$outcome,decreasing=FALSE),]
    ## Return hospital name in that state with lowest 30-day death rate
    outcome_data$hospital[1]
}

rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## if !(Valid State) then stop("invalid state")
    ## Check that outcome ("heart attack”, “heart failure”, or “pneumonia”) are valid
    ## if !(Valid Outcome) then stop("invalid outcome")
    ## Check that num is numeric or ("best”, “worst”) is valid
    ## if !(Valid num) then stop("invalid outcome")
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
}

rankall <- function(outcome, num = "best") {
    ## Read outcome data
    ## Check that outcome and num are valid
    ## For each state, find the hospital of the given rank
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
}
