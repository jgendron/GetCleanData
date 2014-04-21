##Please review the README.md file regarding the proper placement
##of file so this script works

##Read in the eight necessary data frames
features<-read.table("./UCI HAR Dataset/features.txt")
activityLabels<-read.table("./UCI HAR Dataset/activity_labels.txt")
yTest<-read.table("./UCI HAR Dataset/test/y_test.txt")
xTest<-read.table("./UCI HAR Dataset/test/X_test.txt")
subjTest<-read.table("./UCI HAR Dataset/test/subject_test.txt")
subjTrain<-read.table("./UCI HAR Dataset/train/subject_train.txt")
yTrain<-read.table("./UCI HAR Dataset/train/y_train.txt")
xTrain<-read.table("./UCI HAR Dataset/train/X_train.txt")

##Merge Test and Train files and remove source files from environment
##Merge subjects
subjects<-rbind(subjTest,subjTrain)
rm(subjTest,subjTrain)
#Merge activities
activities<-rbind(yTest,yTrain)
rm(yTest,yTrain)
#Merge explanatory variables
data<-rbind(xTest,xTrain)
rm(xTest,xTrain)

##Extract measures for mean() and std() from "data"
intmean<-grep("mean",features$V2)
intsd<-grep("std",features$V2)
interest<-append(intmean,intsd)
rm(intmean,intsd)
interest<-sort(interest)
##create subset of full explanatory variable dataset
dataInt<-data[,c(interest)]

##Create descriptive activity variable names made of plain names
activity<-activities
activity$V1[which(activity$V1==1)]<- "walking"
activity$V1[which(activity$V1==2)]<- "walkingupstairs"
activity$V1[which(activity$V1==3)]<- "walkingdownstairs"
activity$V1[which(activity$V1==4)]<- "sitting"
activity$V1[which(activity$V1==5)]<- "standing"
activity$V1[which(activity$V1==6)]<- "laying"

##Join columns into new data frame
transData<-cbind(subjects,activity,dataInt)

##Label dataset with descriptive variable names
firstTwo<-c("subjectid","activity")
featuresInt<-tolower(as.character(features[c(interest),2]))
featuresInt<-gsub("()","",featuresInt,fixed=TRUE)
featuresInt<-gsub("bodybody","body",featuresInt)
varNames<-append(firstTwo,featuresInt)
colnames(transData)<-varNames

##Create a second, independent tidy dataset with average of variable
##by activity and subject
library(data.table)
tidyData<- data.table(transData)
tidyData<- tidyData[, lapply(.SD, mean), by=c("subjectid", "activity")]
tidyData<- tidyData[order(tidyData$subjectid,tidyData$activity),]

#Lastly, generate a tab-delimited text version of tidy dataset
#which can be easily ingested into other platforms for viewing
write.table(tidyData, "tidy_dataset.txt", sep="\t")

