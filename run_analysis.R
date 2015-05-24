
library(plyr)

HumanActivitydataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(HumanActivitydataUrl, "./Dataset.zip")
unzip("Dataset.zip")


SubjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt") 
SubjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt") 
SubjectData <-   rbind(SubjectTest, SubjectTrain)
# head(SubjectData); nrow(SubjectData)


TestSet <- read.table("./UCI HAR Dataset/test/X_test.txt")  
TrainSet <- read.table("./UCI HAR Dataset/train/X_train.txt")
SetData <- rbind(TestSet, TrainSet)
#; head(SetData); nrow(SetData)


TestLabels <- read.table("./UCI HAR Dataset/test/y_test.txt")
TrainLabels <- read.table("./UCI HAR Dataset/train/y_train.txt")
LabelsData <- rbind(TestLabels,TrainLabels)

###########################################################################################################

# 1. Merges the training and the test sets to create one data set.
HumanActRecg <- cbind(SubjectData,LabelsData, SetData)
#head(HumanActRec)
Features <- read.table("./UCI HAR Dataset/features.txt")
colnames(HumanActRecg) <- c("Subject", "Activity", as.vector(Features$V2))

BodyAccXTestSet <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
BodyAccXTrainSet <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
BodyAccXSet <- rbind(BodyAccXTestSet, BodyAccXTrainSet)
#nrow(BodyAccXSet)

BodyAccYTestSet <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
BodyAccYTrainSet <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
BodyAccYSet <- rbind(BodyAccYTestSet, BodyAccYTrainSet)

BodyAccZTestSet <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")
BodyAccZTrainSet <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")
BodyAccZSet <- rbind(BodyAccZTestSet, BodyAccZTrainSet)


BodyGyroXTestSet <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
BodyGyroXTrainSet <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
BodyGyroXSet <- rbind(BodyGyroXTestSet, BodyGyroXTrainSet)


BodyGyroYTestSet <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
BodyGyroYTrainSet <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
BodyGyroYSet <- rbind(BodyGyroYTestSet, BodyGyroYTrainSet)

BodyGyroZTestSet <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")
BodyGyroZTrainSet <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")
BodyGyroZSet <- rbind(BodyGyroZTestSet, BodyGyroZTrainSet)


TotalAccXTestSet <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
TotalAccXTrainSet <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
TotalAccXSet <- rbind(TotalAccXTestSet, TotalAccXTrainSet)

TotalAccYTestSet <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
TotalAccYTrainSet <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
TotalAccYSet <- rbind(TotalAccYTestSet, TotalAccYTrainSet)

TotalAccZTestSet <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")
TotalAccZTrainSet <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")
TotalAccZSet <- rbind(TotalAccZTestSet, TotalAccZTrainSet)


###########################################################################################################


#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#HumanActRecgColNames <- as.vector(colnames(HumanActRecg))
#HumanActRecgColNamesMeanStd <-HumanActRecgColNames[sort(c(grep ("mean",colnames(HumanActRecg), ignore.case = FALSE ) ,
#      grep ("std",colnames(HumanActRec), ignore.case = FALSE )))]
#length(HumanActRecgColNamesMeanStd)


HumanActRecgMeanStd <- 
  cbind(HumanActRecg$Subject, HumanActRecg$Activity,
        HumanActRecgMeanMed <- HumanActRecg[ ,sort(c(grep ("mean",colnames(HumanActRecg), ignore.case = FALSE ) ,
                                                     grep ("std",colnames(HumanActRecg), ignore.case = FALSE )))])

HumanActRecgMeanStdColNames <- colnames(HumanActRecgMeanStd)
HumanActRecgMeanStdColNames[1]="Subject"
HumanActRecgMeanStdColNames[2]="Activity"
colnames(HumanActRecgMeanStd) <- HumanActRecgMeanStdColNames
##HumanActRecgMeanStdColNames is the data frame which has the measurements on the mean and standard deviation for each measurement.

###########################################################################################################

#3. Uses descriptive activity names to name the activities in the data set

ActivityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(ActivityLabels) <- c("Activity", "ActivityDesc")

HumanActRecgActTemp1 <- cbind(SubjectData,LabelsData, SetData)
HumanActRecgActTemp1colnames <- colnames(HumanActRecgActTemp1)
colnames(HumanActRecgActTemp1) <- c("Subject", "Activity", HumanActRecgActTemp1colnames[3: 563])
HumanActRecgActTemp2 <- merge(HumanActRecgActTemp1, ActivityLabels, by = "Activity")
HumanActRecgAct <- HumanActRecgActTemp2[,c(2,564, 3:563)]


HumanActRecgMeanStdActTemp <- merge(HumanActRecgMeanStd, ActivityLabels, by = "Activity")
HumanActRecgMeanStdAct <- HumanActRecgMeanStdActTemp[,c(2,82, 3:81)]

## HumanActRecgMeanStdAct is the data frame which uses descriptive activity names to name the activities in the data set.
###########################################################################################################

# 4. Appropriately labels the data set with descriptive variable names. 
colnames(HumanActRecgAct) <- c("Subject", "ActivityDesc", as.vector(Features$V2))

# write.table(colnames(HumanActRecgAct), file = "./HumanActRecgActCols")
# write.table(colnames(HumanActRecgAct), file = "./HumanActRecgActCols")
###########################################################################################################
# 5. From the data set in step 4, creates a second, independent tidy data set with the 
#average of each variable for each activity and each subject.

groupColumns = c("Subject","ActivityDesc")
dataColumns = c(colnames(HumanActRecgAct)[3:563])
HumanActRecgActAggregrate = ddply(HumanActRecgAct, groupColumns,  function(x) colMeans(x[dataColumns]))
colnames(HumanActRecgActAggregrate) <- c("Subject", "ActivityDesc", paste("Mean",as.vector(colnames(HumanActRecgActAggregrate))[3:563] ))
write.table(HumanActRecgActAggregrate, file = "./TidyDataSet.txt",row.name=FALSE)