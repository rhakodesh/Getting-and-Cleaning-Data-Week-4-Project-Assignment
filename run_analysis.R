# Samuel Tandoh
# Getting and Cleaning Data WK4 Project
# 08-01-2020

# INSTALL PACKAGES
 #install.packages("dplyr")
 #install.packages("data.table")
 

# LOAD LIBRARY PACKAGES
library(dplyr)
library(data.table)

# SET WORKING DIRECTORY
#setwd("C:/Users/RHAKODESH/Documents/R")

# DOWNLOAD DATASET FROM WEBSITE
if(!file.exists("./wk4projectdata")){dir.create("./wk4projectdata")}
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "./wk4projectdata/projectdataset.zip")

# UNZIP PROJECT DATASET
unzip(zipfile = "./wk4projectdata/projectdataset.zip", exdir = "./wk4projectdata")


# A. MERGING TRAINING AND TEST DATASETS

      # A.1 READING FILES
            setwd("C:/Users/RHAKODESH/Documents/R/wk4projectdata/UCI HAR Dataset")
            
            # A.1.1 Reading training datasets
                    x_train <- read.table("C:/Users/RHAKODESH/Documents/R/wk4projectdata/UCI HAR Dataset/train/X_train.txt")
                    y_train <- read.table("C:/Users/RHAKODESH/Documents/R/wk4projectdata/UCI HAR Dataset/train/y_train.txt")
                    subject_train <- read.table("C:/Users/RHAKODESH/Documents/R/wk4projectdata/UCI HAR Dataset/train/subject_train.txt")
            
            
            # A.1.2 Reading test datasets
                    x_test <- read.table("C:/Users/RHAKODESH/Documents/R/wk4projectdata/UCI HAR Dataset/test/X_test.txt")
                    y_test <- read.table("C:/Users/RHAKODESH/Documents/R/wk4projectdata/UCI HAR Dataset/test/y_test.txt")
                    subject_test <- read.table("C:/Users/RHAKODESH/Documents/R/wk4projectdata/UCI HAR Dataset/test/subject_test.txt")
                    


           # A.1.3 Reading feature vector
                    features <- read.table("C:/Users/RHAKODESH/Documents/R/wk4projectdata/UCI HAR Dataset/features.txt")
                   
           # A.1.4 Reading activity labels
                    activity_labels = read.table("C:/Users/RHAKODESH/Documents/R/wk4projectdata/UCI HAR Dataset/activity_labels.txt")
                    
     # A.2 ASSIGNING VARIABLE NAMES
                    colnames(x_train) <- features[,2]
                    colnames(y_train) <- "activityID"
                    colnames(subject_train) <- "subjectID"
                    
                    colnames(x_test) <- features[,2]
                    colnames(y_test) <- "activityID"
                    colnames(subject_test) <- "subjectID"
                    
                    colnames(activity_labels) <- c("activityID", "activityType")
                    
    # A.3 MERGING ALL DATASETS 
                    all_train <- cbind(y_train, subject_train, x_train)
                    all_test <- cbind(y_test, subject_test, x_test)
                    final_dataset <- rbind(all_train, all_test)
                    
                    
                    
# B. EXTRACTING ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION FOR EACH MEASUREMENT
                    
    # B.1 READING COLUMN NAMES
          col_names <- colnames(final_dataset)
                    
    # B.2 Create vector for defining ID, mean, and sd
          mean_and_std <- (grepl("activityID", col_names) |
                           grepl("subjectID", col_names) |
                            grepl("mean..", col_names) |
                            grepl("std...", col_names)
                         )
                    
    # B.3 Making relevant subset
          set_mean_and_std <- final_dataset[ , mean_and_std == TRUE]
          
          
  
# C. USE DESCRIPTIVE ACTIVITY NAMES
          set_activity_names <- merge(set_mean_and_std, activity_labels,
                                        by = "activityID",
                                        all.x = TRUE)
          
# D.LABELLING THE DATA SETS WITH DESCRIPTIVE VARIABLE NAMES
          # see A.3, B.2, B.3
          
          
          
# E. CREATING A SECOND, INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT
        
    # E.1 Making a second tidy data set
          tidy_data <- aggregate(. ~subjectID + activityID, set_activity_names, mean)
          tidy_data <- tidy_data[order(tidy_data$subjectID, tidy_data$activityID), ]
          
    # E.2 Writing second tidy data set into a txt file
          write.table(tidy_data, "tidydata.txt", row.names = FALSE)