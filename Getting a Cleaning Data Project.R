#Getting and cleaning Data Project

##Unzipping data set and localizing data in a single file

unzip(zipfile = "/Users/Trey Barnes/Desktop/RWDir/W4Dataset.zip",exdir = "./data")

list.files("./data")

list.files("./data/UCI HAR Dataset")

pathdata= file.path("./data", "UCI HAR Dataset")

files=list.files(pathdata, recursive = TRUE)

###verification
files

#### Result is 28 files in files


#Making the sets

xtrain = read.table(file.path(pathdata, "train", "X_train.txt"),header = FALSE)
ytrain = read.table(file.path(pathdata, "train", "y_train.txt"),header = FALSE)
subject_train = read.table(file.path(pathdata, "train", "subject_train.txt"),header = FALSE)

xtest = read.table(file.path(pathdata, "test", "X_test.txt"),header = FALSE)
ytest = read.table(file.path(pathdata, "test", "y_test.txt"),header = FALSE)
subject_test = read.table(file.path(pathdata, "test", "subject_test.txt"),header = FALSE)

features = read.table(file.path(pathdata, "features.txt"),header = FALSE)

activityLabels = read.table(file.path(pathdata, "activity_labels.txt"),header = FALSE)

#REname columns

colnames(xtrain) = features[,2]
colnames(ytrain) = "activityId"
colnames(subject_train) = "subjectId"

colnames(xtest) = features[,2]
colnames(ytest) = "activityId"
colnames(subject_test) = "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

#Merging the test and train data

mrg_train = cbind(ytrain, subject_train, xtrain)
mrg_test = cbind(ytest, subject_test, xtest)

AllInOne = rbind(mrg_train, mrg_test)

#Setting up summary columns mean and stndev
colNames = colnames(AllInOne)

mean_and_std = (grepl("activityId" , colNames) | grepl("subjectId" , colNames) | grepl("mean.." , colNames) | grepl("std.." , colNames))

setForMeanAndStd <- AllInOne[ , mean_and_std == TRUE]

setWithActivityNames = merge(setForMeanAndStd, activityLabels, by='activityId', all.x=TRUE)


secTidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
secTidySet <- secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]

write.table(secTidySet, "secTidySet.txt", row.name=FALSE)
