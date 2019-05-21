### Plot fitness across training and test simulation

## Final product: generations on x axis and fitness on y axis
# Show clearly shift between training and test
# Have a different color for each type of test simulation (same problem/different problem)

library(plyr)
library(stringr)


# Define main simulation directory
simulDir <- file.path("../Simulation_results/20190521/logit/")

## Import and annotate phenotype files from training simulation
trainDir <- dir(path = simulDir, pattern = ".0", full.names = T)
trainPheno <- list.files(path = trainDir, pattern = "PHEN.*", full.names = T)
trainPhenoList <- lapply(
  X = trainPheno, 
  FUN = fread, 
  header = FALSE,
  col.names = c("Replicate", "Generation", "Individual", "Environment", "Trait", "Phenotype", "Fitness")
)
names(trainPhenoList) <- str_extract(string = as.character(trainPheno), pattern = "(?<=[//])[A-C]0")
trainPhenoData <- ldply(trainPhenoList)
trainPhenoData$training <- factor(x = rep(1, nrow(trainPhenoData)), levels = c(0,1))
trainPhenoData$problem1 <- factor(x = str_extract(string = trainPhenoData$.id, pattern = "^."))
trainPhenoData$problem2 <- factor(x = str_extract(string = trainPhenoData$.id, pattern = ".$"), levels = c(0,"A","B") )
## Import and annotate phenotype files from test simulations

## Merge files


## Plot