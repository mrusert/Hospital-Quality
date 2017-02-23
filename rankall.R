source("rankhospital.R")

rankall <- function(outcome, num = "best") {
      df <- data.frame()                                                    ## instantiate data frame
      states <- c("DC", state.abb)
      
      for (state in sort(states)) {                                         ## run rank hospital function for each state
          hospital <- rankhospital(state, outcome, num)                     ## assign returned hospital name or NA
          df <- rbind(df, data.frame(hospital = hospital, state = state))   ## add row to data frame with hospital and 
      }
      
      df                                                                    ## return data frame
}