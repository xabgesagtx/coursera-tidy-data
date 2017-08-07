# load pac
library(reshape2)
library(dplyr)

# Main function to create a tidy data set of the UCI HAR Dataset
createTable <- function(directory = "UCI HAR Dataset") {
  
  # Create table from either the test or train dataset
  # acitivites and subject ids will be added to table of feature values
  # name: specifies to use train or test dataset
  createTableForDataSet <- function(name) {
    mainPath <- paste0(directory, "/", name)
    mainTable <- read.table(paste0(mainPath, "/X_", name, ".txt"))
    subjects <- read.table(paste0(mainPath, "/subject_", name, ".txt"))
    activities <- read.table(paste0(mainPath, "/y_", name, ".txt"))
    cbind(subjects, activities, mainTable)
  }
  
  # Add appropriate column names. I.e. add the feature labels
  addColumnNames <- function(tableObj) {
    features <- read.table(paste0(directory, "/features.txt"), stringsAsFactors = FALSE)
    columnNames <- c(c("Subject", "Activity"), features[[2]])
    names(tableObj) <- columnNames
    tableObj
  }
  
  # Select only the mean and standard deviation values
  selectOnlyMeanAndStd <- function(tableObj) {
    toSelect <- grep("Subject|Activity|mean\\(|std\\(", names(tableObj))
    filteredT <- tableObj[,toSelect]
  }
  
  # Set descriptive activity names by using the activity labels
  setActivities <- function(tableObj) {
    activityLabels <- read.table(paste0(directory, "/activity_labels.txt"), stringsAsFactors = FALSE)
    tableObj$Activity <- activityLabels[tableObj$Activity,2]
    tableObj
  }
  
  # Make variable names more readable
  adjustVariableNames <- function(tableObj) {
    varNames <- names(tableObj) %>%
      gsub(pattern = "-std\\(\\)-", replacement = ".Std.") %>%
      gsub(pattern = "-mean\\(\\)-", replacement = ".Mean.") %>%
      gsub(pattern = "-std\\(\\)", replacement = ".Std") %>%
      gsub(pattern = "-mean\\(\\)", replacement = ".Mean") %>%
      gsub(pattern = "^f", replacement = "Frequency.") %>%
      gsub(pattern = "^t", replacement = "Time.")
    names(tableObj) <- varNames
    tableObj
  }
  
  # Create data set with the average of each variable for each activity and each subject.
  createMeanDataSet <- function(tableObj) {
    melted <- melt(tableObj, id.vars = c("Subject","Activity"))
    dcast(melted, Subject + Activity ~ variable, mean) 
  }
  
  # Step 1: Merges the training and the test sets to create one data set.
  testTable <- createTableForDataSet("test")
  trainTable <- createTableForDataSet("train")
  mainTable <- rbind(testTable,trainTable) 
  
  mainTable %>% 
    addColumnNames %>% 
    # Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
    selectOnlyMeanAndStd %>% 
    # Step 3: Uses descriptive activity names to name the activities in the data set
    setActivities %>%
    # Step 4: Appropriately labels the data set with descriptive variable names
    adjustVariableNames %>%
    # Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    createMeanDataSet
}

# Run step 1 to 5
tidyDs <- createTable()

# Save data to file
write.table(tidyDs, file = "tidy.csv")