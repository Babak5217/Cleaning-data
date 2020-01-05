##the first downlod data set
download.file("https://d396qusza40orc.cloudfront.net",
             destfile = "./getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              method = "curl")
 library(dplyr)
unzip("C:/Users/mzars/Downloads/UCI HAR Dataset.zip")
##read the data
              X_test <- read.table("C:/Users/mzars/Downloads/UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")
                
               y_test <- read.table("~/UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="")
               subject_test <- read.table("~/UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="")
               colnames(subject_test)="subject"
               X_train <- read.table("~/UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")
                 View(X_train)
              y_train <- read.table("~/UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")
                 View(y_train)
                 subject_train <- read.table("~/UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")
                 colnames(subject_train)="subject"
               features <- read.table("~/UCI HAR Dataset/features.txt", quote="\"", comment.char="")
                 View(features)
              activity_labels <- read.table("~/UCI HAR Dataset/activity_labels.txt", quote="\"", comment.char="")
##Uses descriptive activity names to name the activities in the data set
              names(X_test) = features$V2
              names(X_train) = features$V2
##Appropriately labels the data set with descriptive variable names
              y_test[y_test=="1"]<- "WALKING"
              y_test[y_test=="2"]<- "WALKING_UPSTAIRS"
               y_test[y_test=="3"]<- "WALKING_DOWNSTAIRS"
               y_test[y_test=="4"]<- "SITTING"
               y_test[y_test=="5"]<- "STANDING"
               y_test[y_test=="6"]<- "LAYING"
               y_train[y_train=="1"]<- "WALKING"
               y_train[y_train=="2"]<- "WALKING_UPSTAIRS"
                y_train[y_train=="3"]<- "WALKING_DOWNSTAIRS"
                y_train[y_train=="4"]<- "SITTING"
                y_train[y_train=="5"]<- "STANDING"
                y_train[y_train=="6"]<- "LAYING"
## merge x_test and y_test
                testbind<-cbind(subject_test,X_test,y_test)
                trainbind<- cbind(subject_train ,X_train,y_train)
##Merges the training and the test sets to create one data set.(the first one of project)
                databind<-rbind(testbind,trainbind)
##We constructed a new data frame (mean.std) by extracting variables containing
##means and standard deviations.
                mean.std <-data.frame(databind$`tBodyAcc-mean()-X`,
                                      databind$`tBodyAcc-mean()-Y`,
                                      databind$`tBodyAcc-mean()-Z`,
                                      databind$`tBodyAcc-std()-X`,
                                      databind$`tBodyAcc-std()-Y`,
                                      databind$`tBodyAcc-std()-Z`,
                                      databind$`tGravityAcc-mean()-X`,
                                      databind$`tGravityAcc-mean()-Y`,
                                      databind$`tGravityAcc-mean()-Z`,
                                      databind$`tGravityAcc-std()-X`,
                                      databind$`tGravityAcc-std()-Y`,
                                      databind$`tGravityAcc-std()-Z`,
                                      databind$`tBodyAccJerk-mean()-X`,
                                      databind$`tBodyAccJerk-mean()-Y`,
                                      databind$`tBodyAccJerk-mean()-Z`,
                                      databind$`tBodyAccJerk-std()-X`,
                                      databind$`tBodyAccJerk-std()-Y`,
                                      databind$`tGravityAcc-std()-Z`,
                                      databind$`tBodyAccJerk-mean()-X`,
                                      databind$`tBodyAccJerk-mean()-Y`,
                                      databind$`tBodyAccJerk-mean()-Z`,
                                      databind$`tBodyAccJerk-std()-X`,
                                      databind$`tBodyAccJerk-std()-Y`,
                                      databind$`tBodyAccJerk-std()-Z`,
                                      databind$`tBodyGyro-mean()-X`,
                                      databind$`tBodyGyro-mean()-Y`,
                                      databind$`tBodyGyro-mean()-Z`,
                                      databind$`tBodyGyro-std()-X`,
                                      databind$`tBodyGyro-std()-Y`,
                                      databind$`tBodyGyro-std()-Z`,
                                      databind$`tBodyGyroJerk-mean()-X`,
                                      databind$`tBodyGyroJerk-mean()-Y`,
                                      databind$`tBodyGyroJerk-mean()-Z`,
                                      databind$`tBodyGyroJerk-std()-X`,
                                      databind$`tBodyGyroJerk-std()-Y`,
                                      databind$`tBodyGyroJerk-std()-Z`,
                                      databind$`tBodyAccMag-mean()`,
                                      databind$`tBodyAccMag-std()`,
                                      databind$`tGravityAccMag-mean()`,
                                      databind$`tGravityAccMag-std()`,
                                      databind$`fBodyBodyAccJerkMag-mean()`,
                                      databind$`fBodyBodyAccJerkMag-std()`,
                                      databind$`fBodyBodyGyroMag-mean()`,
                                      databind$`fBodyBodyGyroMag-std()`,
                                      databind$`fBodyBodyGyroJerkMag-mean()`,
                                      databind$`fBodyBodyGyroJerkMag-std()`,
                                      databind$`angle(tBodyAccMean,gravity)`,
                                      databind$`angle(tBodyAccJerkMean),gravityMean)`,
                                      databind$`angle(tBodyGyroMean,gravityMean)`,
                                      databind$`angle(tBodyGyroJerkMean,gravityMean)`,
                                      databind$`angle(X,gravityMean)`,
                                      databind$`angle(Y,gravityMean)`,
                                      databind$`angle(Z,gravityMean)`,
                                      databind$V1,databind$subject)
    
## spilit activitis
                dataspilit<-split(mean.std,mean.std$databind.V1)
##calculated means of data for each type of activitiis
                Finallist<- mean.std%>% group_by(databind.subject,databind.V1)%>%
summarise_all(list(mean))
                 write.table(Finallist,"Finallist.txt", row.name=FALSE)
