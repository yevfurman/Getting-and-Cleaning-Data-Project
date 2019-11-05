## Initialization

# Set proper working directory
setwd("C:/Users/yevfu/Documents/Data Science/Projects/Course 3 - Cleaning Data/Week 4/Project")
# Name of directory with data
datadir<-"./UCI HAR Dataset"


## Read initial data

# Read activity labels
activity_labels<-read.table(paste(datadir,"activity_labels.txt",sep="/"),stringsAsFactors = F)
# Read feature names
features<-read.table(paste(datadir,"features.txt",sep="/"))
# Build colClass vector, with NA in all features which contain "mean()" or "std()" in their name
ind<-rep("NULL",dim(features)[1])
ind[grep("mean\\(\\)|std\\(\\)",features[,2])]<-NA


## Read test data

# read ID of subjects
testDT<-data.frame(read.table(paste(datadir,"test/subject_test.txt",sep="/"),col.names = "ID"))
# add to data those columns
testDT<-cbind(testDT,read.table(paste(datadir,"test/X_test.txt",sep="/"),colClasses = ind))
#change their name to the feature name
colnames(testDT)[2:dim(testDT)[2]]<-grep("mean\\(\\)|std\\(\\)",features[,2],value = T)
# read activity data
testDT<-cbind(testDT,read.table(paste(datadir,"test/y_test.txt",sep="/"),col.names = "activity"))
# change activity numbers to names
testDT$activity<-activity_labels[testDT$activity,2]


## Read train data

# read ID of subjects
trainDT<-data.frame(read.table(paste(datadir,"train/subject_train.txt",sep="/"),col.names = "ID"))
# add to data those columns
trainDT<-cbind(trainDT,read.table(paste(datadir,"train/X_train.txt",sep="/"),colClasses = ind))
#change their name to the feature name
colnames(trainDT)[2:dim(trainDT)[2]]<-grep("mean\\(\\)|std\\(\\)",features[,2],value = T)
# read activity data
trainDT<-cbind(trainDT,read.table(paste(datadir,"train/y_train.txt",sep="/"),col.names = "activity"))
# change activity numbers to names
trainDT$activity<-activity_labels[trainDT$activity,2]


## Combine data sets
DT<-rbind(testDT,trainDT)


## Find mean by groups of user and activity
DT2<-DT%>%group_by(ID,activity)%>%summarise_at(vars(names(DT)[2:(dim(DT)[2]-1)]),mean,na.rm=T)