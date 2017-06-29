data <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available", stringsAsFactors = FALSE)
outcome <- data[,c(2,7,11)] ##heart_attack
names(outcome)<-c("hospital","state","outcome")
outcome <- outcome[complete.cases(outcome),]
outcome <- outcome[order(outcome$state,outcome$outcome,outcome$hospital,decreasing=FALSE),]
outcomelist <- split(outcome, outcome$state)
num <- 20
hosplist <- lapply(outcomelist, function(x) {
    if (num == "best")  {index = 1} 
    else if (num == "worst") {index = nrow(x)}
    else {index <- num }
    x[index,1] 
    })
hosplist2 <- data.frame(hospital = unlist(hosplist), state = names(hosplist))
