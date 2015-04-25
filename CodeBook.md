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
