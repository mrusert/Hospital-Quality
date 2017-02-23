outcome <- function(f = "outcome-of-care-measures.csv", colnum = 11) {
      data <- read.csv(f, colClasses = "character")
      data[,colnum] <- as.numeric(data[,colnum])
      hist(data[,colnum])
}