data <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available", stringsAsFactors = FALSE)
outcome <- data[,c(2,7,11)] ##heart_attack
names(outcome)<-c("hospital","state","outcome")
outcome <- outcome[complete.cases(outcome),]
outcome <- outcome[order(outcome$state,decreasing=FALSE),]
outcomelist <- split(outcome, outcome$state)
##outcomelist <- lapply(outcomelist,order,)

for (i in seq_along(outcomelist)) {
    outcomelist[[i]] <- outcomelist[[i]][order(outcomelist[[i]]$hospital,decreasing=FALSE),]
    outcomelist[[i]] <- outcomelist[[i]][order(outcomelist[[i]]$outcome,decreasing=FALSE),]
}
num <- 20
result = data.frame("hospital" = character(),"state" = character())
# for (i in seq_along(outcomelist)) {
#     result[nrow(result)+1,] <- c(outcomelist[[i]]$hospital[num],names(outcomelist[i]))
# }

##outcomedf <- as.data.frame(split(outcome, outcome$state)["MD"])
##names(outcomedf)<-c("hospital","state","outcome")
##outcomedf <- outcomedf[complete.cases(outcomedf),]