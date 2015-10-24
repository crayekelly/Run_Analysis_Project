#Assignment 3, merge, relabel and summarize data

Test<-list.files("UCI HAR Dataset/test",full.names=TRUE)
Train<-list.files("UCI HAR Dataset/train",full.names=TRUE)

#load libraries
  library(dplyr)
  library(stringr)

#merge subject, measures, and activity for Test and Train
  dat<-data.frame(read.table(Test[2]))
  for(i in 3:4){
    
    dat<-cbind(dat, read.table(Test[i]))
  }
  
  dat2<-data.frame(read.table(Train[2]))
  for(i in 3:4){
    
    dat2<-cbind(dat2, read.table(Train[i]))
  }
  
#Merge datasets together
  dataset<-rbind(dat, dat2)

#Extract Features
  HAR_Dataset<-list.files("UCI HAR Dataset", full.names=TRUE)
  
  Features<-read.table(HAR_Dataset[2])

#Create Logical vector to define which columns have mean or std in name and keep subject and activity    
  Subset_Logical<-c(TRUE, grepl(c("mean|std"), Features$V2, ignore.case=TRUE), TRUE)
  
#Extract measurements on the mean and std
  data_subset<-dataset[,Subset_Logical]

#Rename Activity Labels
  data_subset$V1.2[data_subset$V1.2==1]<-"Walking"
  data_subset$V1.2[data_subset$V1.2==2]<-"Walking_Upstairs"
  data_subset$V1.2[data_subset$V1.2==3]<-"Walking_Downstairs"
  data_subset$V1.2[data_subset$V1.2==4]<-"Sitting"
  data_subset$V1.2[data_subset$V1.2==5]<-"Standing"
  data_subset$V1.2[data_subset$V1.2==6]<-"Lying"
  
#Create vector to Name the Subset of Data
  Subset_Labels<-c("Subject",as.character(Features[grepl(c("mean|std"), Features$V2, ignore.case=TRUE),2]),"Activity")

#Assign Labels to data_subset
  colnames(data_subset)<-Subset_Labels
  
#Reorder Columns such that Subject is first, then Activity, then Measures  
  data_subset<-data_subset[,c(1,88,2:87)]
  
#summarize mean by Subject and Activity, expect 180 observations  
  final_dataset<-summarise_each(group_by(data_subset, Subject, Activity),funs(mean))
  
#write to a table  
  write.table(final_dataset, file="final_dataset.txt", row.names=FALSE)
