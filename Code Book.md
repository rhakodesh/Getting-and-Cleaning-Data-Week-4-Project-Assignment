#WEEK 4 PROJECT CODE BOOK

##How to get to the tidydata.txt:
1. Download data from the link below and unzip it into working directory of R Studio.
2. Execute the R script.

## SOURCE CODE
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The data for the project could be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## About R script
The following steps were taken with direction from the assignment process:   
A. READING AND MERGING TRAINING AND TEST DATASETS.   
  A.1 READING FILES    
    A.1.1 Reading trainings tables   
    A.1.2 Reading testing tables   
    A.1.3 Reading feature vector   
    A.1.4 Reading activity labels   
  A.2 Assigning variable names   
  A.3 Merging all data in one set   
B. EXTRACTING ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION FOR EACH MEASUREMENT   
  B.1 Reading variable names  
  B.2 Create vector for defining ID, mean and standard deviation   
  B.3 Making nessesary subset from merged data set   
C. USING DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA SET   
D. APPROPRIATELY LABELING THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES   
E. CREATING A SECOND, INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT  
  E.1 Making second tidy data set   
  E.2 Writing second tidy data set in txt file   

  


