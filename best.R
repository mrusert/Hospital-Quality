sort_hospital_data <- function(state, outcome) {
  
  if(outcome == "heart attack") {                                               ## Check if correct outcome was passed 
    colNum <- 11                                                                ## if data is correct, assign colNum value
  } else if (outcome == "heart failure") {   
    colNum <- 17
  } else if (outcome == "pneumonia") {
    colNum <- 23
  } else {
    stop("invalid outcome")
  }
  
  states <- c(state.abb,"DC")                                                    ## initiate states vector and add missing "DC"
  if (!is.element(state, states)) {                                              ## check if correct state value passed                                          
    stop("invalid state")
  } 
  
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")     ## Read in data from csv file
  data_by_state <- subset(data, State == state)                                  ## subset data by state 
  data_by_state[,colNum] <- suppressWarnings(as.numeric(data_by_state[,colNum])) ## convert outcome column to numeric w/ suppress warning NA coercion
  data_by_state <- data_by_state[complete.cases(data_by_state[,colNum]),]        ## remove NA values 
  sorted_data <- data_by_state[order(data_by_state[,colNum],data_by_state[,2]),] ## sort data set by outcome column and by Hospital Name
}

best <- function(state, outcome) {
    
  sorted_data <-sort_hospital_data(state, outcome)                               ## function returns dataset sorted by outcome (rate), for given state and outcome
  
  hospital <- sorted_data[1,2]                                                   ## assign and return hospital name
  hospital
}