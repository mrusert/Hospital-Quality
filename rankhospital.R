source("best.R")

rankhospital <- function(state, outcome, num = "best") {
    
    sorted_data <- sort_hospital_data(state, outcome)     ## function returns dataset sorted by outcome (rate), for given state and outcome
    
    if (num == "best") {                                  ## check value of num and return appropriate hospital or NA if num is invalid
        return(sorted_data[1,2])
    } else if (num == "worst") {
        return(sorted_data[nrow(sorted_data),2])
    } else if (num > nrow(sorted_data) || num < 0) {
        return(NA)
    } else {
        return(sorted_data[num,2])
    }
    
}