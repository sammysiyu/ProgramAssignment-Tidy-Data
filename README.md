# ProgramAssignment-Tidy-Data
   This repository is to show the work of how to get tidy data from the Samsung phone's data.
   CodeBook.md explains the meaning of each variable I defined in my R code.
   run_analysis.R is the code I used to get the required data.
# Woring Process
    1.Merges the training and the test sets to create one data set.
      I read the train/test data, their corresponding activity label and subject label into R and created 6 different data.frame.
      Combine train/test with activity label and subject label by columns separately. Then combine train and test data by row to 
      get the big data frame "wholedata". Rename its column by the "features.txt" file.
      
    2.Extracts only the measurements on the mean and standard deviation for each measurement.
      Get the column number of the features which include information about "mean". Get the row column of the features which 
      include information about "std". Then select the required columns from the original data.frame to generate a new one 
      "wholedata_extract"
      
    3.Uses descriptive activity names to name the activities in the data set
      Merge the data.frame, which I get from the last step, with "label.txt" file, which includes the specific activity label 
      information and generate a new data.frame "wholedata_label"
      
    4.Appropriately labels the data set with descriptive variable names. 
      Convert the column name of "wholedata_label" to characters.
      
    5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each 
    activity and each subject.
      I split "wholedata_label" into 30 groups by subject label and create a list "list_subject". For each element in the list, 
      I split it again by activity label and get the new list "t". For each element in t, which is a data.frame, I get the mean 
      of its column value and return a one row data.frame. Then I combine each subject's activity to one data.frame to get 
      toally 30 data.frame. Finally I combine these 30 data.frame to get the tidy data which is required by the question.
      
  
    
    
