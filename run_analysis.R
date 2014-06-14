########################
# settings & constants #
########################

fileSep <- .Platform$file.sep
samsungDir <- "UCI HAR Dataset"
testDir <- "test"
trainDir <- "train"
trainSuffix <- "_train"
testSuffix <- "_test"
fileExtension <- ".txt"
subjectFile <- "subject"
activityFile <- "Y"
activityLabels <- c("walking","walking upstairs","walking downstairs","sitting",
                    "standing","laying")
featureVectorFile <- "X"
featureVectorLabelsFile <- paste0(samsungDir,fileSep,"features",fileExtension)

##############################
# load feature vector labels #
##############################

message("Loading feature vector labels ...")
featureVectorLabelsTemp <- read.csv(featureVectorLabelsFile,sep=" ",
                                    header=FALSE,stringsAsFactors=FALSE)
featureVectorLabels <- featureVectorLabelsTemp[[2]]
message("Feature vector labels loaded.")

#####################
#load training data #
#####################

message("Loading training data ...")
subjectTrain <- read.csv(paste0(samsungDir,fileSep,trainDir,fileSep,subjectFile,
                                trainSuffix,fileExtension),
                         header=FALSE)
activityIdTrain <- read.csv(paste0(samsungDir,fileSep,trainDir,fileSep,
                                   activityFile,trainSuffix,fileExtension),
                            header=FALSE)
activityTrain <- character(0)
for (i in 1:length(activityIdTrain[[1]])){
    activityTrain[i] <- activityLabels[activityIdTrain[[1]][i]]
}
featureVectorTrain <- read.csv(paste0(samsungDir,fileSep,trainDir,fileSep,
                                      featureVectorFile,trainSuffix,
                                      fileExtension), sep="", header=FALSE, 
                               colClasses="numeric")
message("Training data loaded.")

##################
# load test data #
##################

message("Loading test data ...")
subjectTest <- read.csv(paste0(samsungDir,fileSep,testDir,fileSep,subjectFile,
                                testSuffix,fileExtension),
                         header=FALSE)
activityIdTest <- read.csv(paste0(samsungDir,fileSep,testDir,fileSep,
                                   activityFile,testSuffix,fileExtension),
                            header=FALSE)
activityTest<- character(0)
for (i in 1:length(activityIdTest[[1]])){
    activityTest[i] <- activityLabels[activityIdTest[[1]][i]]
}
featureVectorTest <- read.csv(paste0(samsungDir,fileSep,testDir,fileSep,
                                      featureVectorFile,testSuffix,
                                      fileExtension), sep="", header=FALSE, 
                              colClasses="numeric")
message("Test data loaded.")

##############
# merge data #
##############

message("Merging data ...")
subject <- c(subjectTrain[[1]],subjectTest[[1]])
activity <- c(activityTrain, activityTest)
data <- data.frame(subject)
data <- cbind(data,activity)
for(i in 1:length(featureVectorLabels)){
    data <- cbind(data, c(featureVectorTrain[[i]], featureVectorTest[[i]]))
}
# polish colnames
featureVectorLabels <- gsub("[(),-]","",featureVectorLabels)
featureVectorLabels <- gsub("^f","frequency",featureVectorLabels)
featureVectorLabels <- gsub("^t","time",featureVectorLabels)
colnames(data) <- c("subject","activity",featureVectorLabels)
message("Data merged.")

########################################
# create second, independent tidy data #
########################################

message("Creating the tidy data set ...")
final <- aggregate(.~subject+activity, data=data, FUN=mean)
final <- final[sort.list(as.numeric(final$subject)),]
message("The tidy data set created.")

####################################
# write the tidy dataset to a file #
####################################

message("Writing the data set to tidy.txt ...")
write.table(final, "tidy.txt", row.names=FALSE)
message("Done.")