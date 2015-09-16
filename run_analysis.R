file.dest <- "getdata_projectfiles_UCI HAR Dataset.zip"
file.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
extractfile <- "UCI HAR Dataset"
destinationfolder <- "destination"

##Install required packacets  
# looks if package is installed

if(!is.element("plyr", installed.packages()[,1])){
  print("Installing plyr package")
  install.packages("plyr")
}

library(plyr)

## Download data   
# verifies the zip file has been downloaded
if(!file.exists(file.dest)){
  
  ##Downloads the data file
  print("downloading Data")
  download.file(file.url,file.dest, mode = "wb")
  
}

#verify if the destination folder esists otherwise create it
if(!file.exists(destinationfolder)){
  print("Creating destination folder")
  dir.create(destinationfolder)
} 

##Extract a table from the zip data file and applies cols
extractTable <- function (tableName,cols = NULL){
  
  print(paste("Extracting table:", tableName))
  
  #Extract the table from the zip archive
  tbl <- unz(file.dest, paste(extractfile,tableName,sep="/"))
  
  #create a data frame to hold the table
  df <- data.frame()
  
  if(is.null(cols)){
    df <- read.table(tbl,sep="",stringsAsFactors=F)
  } else {
    df <- read.table(tbl,sep="",stringsAsFactors=F, col.names= cols)
  }
  
  
  df
  
}

##Extract and creates a data set
extractAndCombineData <- function(type, features){
  
  print(paste("Extracting table", type))
  
  subjectData <- extractTable(paste(type,"/","subject_",type,".txt",sep=""),"id")
  yData <- extractTable(paste(type,"/","y_",type,".txt",sep=""),"activity")    
  xData <- extractTable(paste(type,"/","X_",type,".txt",sep=""),features$V2) 
  
  return (cbind(subjectData,yData,xData)) 
}

##saves the dataset into a csv file in the destination folder
saveDataSet <- function (dataset,fileName){
  
  file <- paste(destinationfolder, "/", fileName,".csv" ,sep="")
  write.csv(dataset,file)
}



##PROCESS STARTS HERE

#features used for col names when creating train and test data sets
features <- extractTable("features.txt")

## Extract and combine the train and test data sets
train <- extractAndCombineData("train",features)
test <- extractAndCombineData("test",features)

## 1. Merges the training and the test sets to create one data set.
# Row bind the train and test sets together
data <- rbind(train, test)

# rearrange the data using id
data <- arrange(data, id)



## 3. Uses descriptive activity names to name the activities in the data set
#Use the activity labels for the activity names
activityLabels <- extractTable("activity_labels.txt")

## 4. Appropriately labels the data set with descriptive activity names.
#Encode the activity vector with the extracted labels
data$activity <- factor(data$activity, levels=activityLabels$V1, labels=activityLabels$V2)


## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
colnames(data) <- gsub("\\.", "_", colnames(data))
dataSet1 <- data[,c(1,2,grep("std", colnames(data)), grep("mean", colnames(data)))]



# save dataset1 into results folder
saveDataSet(dataSet1,"dataSet1")

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#create a second dataset from the first by applying the colMeans function
dataSet2 <- ddply(dataSet1, .(id, activity), .fun=function(x){ colMeans(x[,-c(1:2)]) })

# Adds "Mean" using colnames on the new mean columns
colnames(dataSet2)[-c(1:2)] <- paste(colnames(dataSet2)[-c(1:2)], "Mean", sep="")

# Save dataset2 
saveDataSet(dataSet2,"dataSet2")



