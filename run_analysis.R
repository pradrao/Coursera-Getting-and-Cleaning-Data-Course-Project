# Getting and Cleaning data: Course Project

#Set working directory
setwd("~/Data Science Course from John Hopkins/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")
#files were downloaded already in local folder. Reading files into R 
train_x<-read.table("./train/X_train.txt")
train_y<-read.table("./train/y_train.txt")
test_x<-read.table("./test/X_test.txt")
test_y<-read.table("./test/y_test.txt")
subject_train<-read.table("./train/subject_train.txt")
subject_test<-read.table("./test/subject_test.txt")
feature_names<-read.table("./features.txt")
#Below code is to rename variables by their corresponding descriptions from features file
feature_names<-as.character(feature_names$V2)
names(train_x)<-feature_names
names(test_x)<-feature_names
library(dplyr) #loading dplyr package to utilise rename function
# Renaming column names in subject files
subject_train<-rename(subject_train,Subject=V1)
subject_test<-rename(subject_test,Subject=V1)
#Renaming column nams in Activity files
train_y<-rename(train_y,Activity=V1)
test_y<-rename(test_y,Activity=V1)
#Below lines of code is to replace Activity Codes with their corresponding labels
list1_train<-train_y$Activity==1
list2_train<-train_y$Activity==2
list3_train<-train_y$Activity==3
list4_train<-train_y$Activity==4
list5_train<-train_y$Activity==5
list6_train<-train_y$Activity==6
train_y$Activity<-replace(train_y$Activity,list1_train,"WALKING")
train_y$Activity<-replace(train_y$Activity,list2_train,"WALKING_UPSTAIRS")
train_y$Activity<-replace(train_y$Activity,list5_train,"STANDING")
train_y$Activity<-replace(train_y$Activity,list4_train,"SITTING")
train_y$Activity<-replace(train_y$Activity,list6_train,"LAYING")
train_y$Activity<-replace(train_y$Activity,list3_train,"WALKING_DOWNSTAIRS")
list1_test<-test_y$Activity==1
list2_test<-test_y$Activity==2
list3_test<-test_y$Activity==3
list4_test<-test_y$Activity==4
list5_test<-test_y$Activity==5
list6_test<-test_y$Activity==6
test_y$Activity<-replace(test_y$Activity,list1_test,"WALKING")
test_y$Activity<-replace(test_y$Activity,list2_test,"WALKING_UPSTAIRS")
test_y$Activity<-replace(test_y$Activity,list5_test,"STANDING")
test_y$Activity<-replace(test_y$Activity,list4_test,"SITTING")
test_y$Activity<-replace(test_y$Activity,list6_test,"LAYING")
test_y$Activity<-replace(test_y$Activity,list3_test,"WALKING_DOWNSTAIRS")
#Add subject and activity columns to each of training & test data sets
train_cons<-cbind(subject_train,train_y,train_x)
test_cons<-cbind(subject_test,test_y,test_x)
# Merge training and test data sets
merged_train_test<-rbind(train_cons,test_cons)
# Extract only columns with descriptions containing mean and std
mean_columns<-grep("mean()",names(merged_train_test),fixed = TRUE,value= TRUE)
std_columns<-grep("std()",names(merged_train_test),fixed = TRUE,value= TRUE)
merged_data_mean_std<-merged_train_test[,c("Subject","Activity",mean_columns,std_columns)]
# Tidying final data set
names(merged_data_mean_std)<-gsub("^t", "time", names(merged_data_mean_std))
names(merged_data_mean_std)<-gsub("^f", "frequency", names(merged_data_mean_std))
names(merged_data_mean_std)<-gsub("Acc", "Accelerometer", names(merged_data_mean_std))
names(merged_data_mean_std)<-gsub("Gyro", "Gyroscope", names(merged_data_mean_std))
names(merged_data_mean_std)<-gsub("Mag", "Magnitude", names(merged_data_mean_std))
names(merged_data_mean_std)<-gsub("BodyBody", "Body", names(merged_data_mean_std))
# calculating mean of columns by Subject and Activity and writing file
average_grouped_data<-aggregate(.~Subject + Activity,merged_data_mean_std,mean)
average_grouped_data<-average_grouped_data[order(average_grouped_data$Subject,average_grouped_data$Activity),]
write.table(average_grouped_data,file="./tidydata.txt",row.name=FALSE)

