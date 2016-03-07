pollutantmean <- function(directory, pollutant = "sulfate", id = 1:332){
  
  #Choose the working directory
  if(grep("specdata",directory) == 1){
      directory <- ("./specdata/")
  }
  
  #blank vector to hold data
  mean_vector <- c()
  
  #for all files in the specdata folder
  all_files <- as.character(list.files(directory))
  file_paths <- paste(directory, all_files, sep = "")
  for(i in id){
      current_file <- read.csv(file_paths[i], header=T, sep=",")
      head(current_file)
      pollutant
  #remove NA rows
      na_removed <- current_file[!is.na(current_file[, pollutant]), pollutant]
      mean_vector <- c(mean_vector, na_removed)
  }
  result <- mean(mean_vector)
  return(round(result,3))
}