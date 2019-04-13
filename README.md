# Getting-and-cleaning-data-assignment

##Unzipping data set and localizing data in a single file

###List files ("./data") displays uploaded file List files ("./data/UCI HAR Datset") list all files that need to be merged and cleaned
### pathdata was created to pull all files together and files are put into "files" object
###verication that files command was created correclty the object was called to veiw the number of items in the files ([1]=28

Data sets were created and defined without headers xtrain, ytrain, subject_train, xtest, ytest, subject_test, features, and activityLabels

Coloumn headers were changed to better ID columns to merge (activityId, and subjectId) in the ytrain, ytest, subject_train, and subject_test data tables
Test and train data sets are then merged into 'Allinone' object

Mean and std is calucated in the in the AllInone merged table set

secTidySet object is created the aggerated tables are put together using the aggregate function and the subject and activity IDs 

setwithActivitives and mean are listed as well in the new secTidySet object

The table is written using the write.table function and created as a text file
