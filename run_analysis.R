#This is the Course Project for Getting and Cleaning Data
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
setwd("~/Documents/Coursera/Getting and Cleaning Data/Program")
download.file(url,destfile="./data.zip",method="curl")

## 1.Merges the training and the test sets to create one data set.
## Read training set and training labels 
setwd("~/Documents/Coursera/Getting and Cleaning Data/Program/UCI HAR Dataset/train")
train = read.table("./X_train.txt",header=FALSE,sep="")
train_label = read.table("./y_train.txt",header=FALSE)
subject_label = read.table("./subject_train.txt",header=FALSE)
#Combine train data with its coressponding label
labeltrain = cbind(train_label,train)
labeltrain = cbind(subject_label,labeltrain)

setwd("~/Documents/Coursera/Getting and Cleaning Data/Program/UCI HAR Dataset/test")
test = read.table("./X_test.txt",header=FALSE,sep="")
test_label = read.table("./y_test.txt",header=FALSE)
subject_label = read.table("./subject_test.txt",header=FALSE)
#Combine test data with its coressponding label
labeltest = cbind(test_label,test)
labeltest = cbind(subject_label,labeltest)

#Combine test data and train data
wholedata = rbind(labeltest,labeltrain)

#Load the column names
setwd("~/Documents/Coursera/Getting and Cleaning Data/Program/UCI HAR Dataset")
features = read.table("./features.txt",header=FALSE,sep="")
colnames(wholedata) = c("Subject_label","Activity_label",features[,1])


##2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#Get the column number which includes mean information
mean_row = grep("mean",features[,2])
#Get the column number which includes std information
std_row = grep("std",features[,2])
#Combine the column information
mean_std = c(mean_row,std_row)
#Fine the corresponding column ID
mean_std_id = features[mean_std,1]+2
#Extracts the measurements
wholedata_extract = wholedata[,c(1,2,mean_std_id)]


##3. Uses descriptive activity names to name the activities in the data set
#Load the activity names with the corresponding label
setwd("~/Documents/Coursera/Getting and Cleaning Data/Program/UCI HAR Dataset")
label = read.table("./activity_labels.txt",header=FALSE,sep="")
colnames(label) = c("Activity_label","Activity_name")
wholedata_label = merge(label,wholedata_extract)


##4.Appropriately labels the data set with descriptive variable names. 
colnames(wholedata_label)[4:ncol(wholedata_label)] = as.character(features[mean_std,2])

##5. From the data set in step 4, creates a second, independent tidy data set 
##   with the average of each variable for each activity and each subject.
#Split the data.frame by subject
list_subject = split(wholedata_label,wholedata_label[,3])
#For each subject,split by the activity and get the mean value of each variable
per_value = function(x){
    t = split(x,x[,1])
    v = lapply(t,function(x){
        g = apply(x[,4:82],2,mean)
        r = as.data.frame(c(x[1,1:3],g))
        return(r)
    })
    c = as.data.frame(matrix(0,1,82))
    colnames(c) = colnames(v[[1]])
    for(i in 1:6){
        c = rbind(c,v[[i]])
    }
    return(c)
}
ddd = lapply(list_subject,per_value)
c = as.data.frame(matrix(0,1,82))
colnames(c) = colnames(ddd[[1]])
for (i in 1:30){
    c = rbind(c,ddd[[i]][-1,])
}
tidy_data = c[-1,]

#Write the data file
write.table(tidy_data,file="Tidy Data.txt",sep = " ",row.names=F,col.names=T)




