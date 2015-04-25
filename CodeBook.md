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
      
#  The set of variables I created to get the tidy data:
    train/test: data.frame includes the train/test value
    test_label: the corresponding activity label of test value
    train_label: the corresponding activity label of train value
    subject_label: the corresponding subject label [Note: test and train's subject label share the same variable name. 
                   I use it by replacing the previous one after use]
    wholedata: data include both test and train
    features: the column information of train/test
    label: activity label with its corresponding activity name
    labeltest/labeltrain: combined train/test with its label
    wholedata_extract: data after selecting the required columns
    wholedata_label: data whose row is matched by its activity'name
    mean_row: row number of element which include mean information
    std_row: row number of element which include std information
    mean_std: row number of element which either include std or mean information
    mean_std_id: adjusted column number for mean and std information
    ddd: the list includes 30 element and each element corresponds to one subject
