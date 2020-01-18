##the first downlod data set
download.file("https://d396qusza40orc.cloudfront.net",
             destfile = "./getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              method = "curl")
 library(dplyr)
##unzip("C:/Users/mzars/Downloads/UCI HAR Dataset.zip")
##read the data
              X_test <- read.table("C:/Users/mzars/Downloads/UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")
               y_test <- read.table("~/UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="",col.names ="Activity")
               subject_test <- read.table("~/UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="")
               colnames(subject_test)="subject"
               
               X_train <- read.table("~/UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")
              y_train <- read.table("~/UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="",col.names ="Activity")
                 subject_train <- read.table("~/UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")
                 colnames(subject_train)="subject"
                 
               features <- read.table("~/UCI HAR Dataset/features.txt", quote="\"", comment.char="")
                 View(features)
              activity_labels <- read.table("~/UCI HAR Dataset/activity_labels.txt", quote="\"", comment.char="")
              
##Uses descriptive activity names to name the activities in the data set
              names(X_test) = features$V2
              names(X_train) = features$V2
              
##Appropriately labels the data set with descriptive variable names
              
               listmeanstd<-features$V2
               mean.std<- grep("(mean|std)\\(\\)" ,listmeanstd)
               mean.stddata<-features$V2[mean.std]
              
## merge x_test and y_test
                testbind<-cbind(X_test,y_test,subject_test)
                trainbind<- cbind(X_train,y_train,subject_train)
##Merges the training and the test sets to create one data set.(the first one of project)
                databind<-rbind(testbind,trainbind)
                
                ## labeled Activitis
                databind$Activity<-factor(databind$Activity,levels = activity_labels$V1,activity_labels$V2)
                
##We constructed a new data frame (tidydata) by extracting variables containing
##means and standard deviations.
                listmeanstd<-features$V2
                mean.std<- grep("(mean|std)\\(\\)" ,listmeanstd)
                mean.stddata<-features$V2[mean.std]
                tidydata<-databind[,mean.std]
                tidydata<- cbind(tidydata,databind$Activity, databind$subject)
                
## spilit activitis
                dataspilit<-split(tidydata,tidydata$`databind$Activity`)
                
##calculated means of data for each type of activitiis
                Finallist<- tidydata%>% group_by(databind$subject,databind$Activity)%>%
summarise_all(list(mean))
                
                 write.table(Finallist,"Finallist.txt", row.name=FALSE)
