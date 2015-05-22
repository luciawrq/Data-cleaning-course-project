test <- read.table("UCI HAR Dataset/test/X_test.txt", header=T)
testLabel <- read.table("UCI HAR Dataset/test/y_test.txt", header=T)
testSub <- read.table("UCI HAR Dataset/test/subject_test.txt", header=T)
train <- read.table("UCI HAR Dataset/train/X_train.txt", header=T)
trainSub <- read.table("UCI HAR Dataset/train/subject_train.txt", header=T)
trainLabel <- read.table("UCI HAR Dataset/train/y_train.txt", header=T)

feature <- read.table("UCI HAR Dataset/features.txt", header=TRUE)
feature1 <- rbind(feature[1,], feature)
feature2 <- feature1[,2]
v.names <- c("mean()","std()")
  
colnames(test) <- feature2
test2 <- test[,grep(paste0(v.names, collapse="|"),colnames(test))]
test3 <- test2[,grep(paste0("Freq", collapse="|"),colnames(test2), invert=TRUE)]
testData <- cbind(testSub, testLabel, test3)
colnames(testData)[1:2] <- c("ID", "Activity")

colnames(train) <- feature2
train2 <- train[,grep(paste0(v.names, collapse="|"),colnames(train))]
train3 <- train2[,grep(paste0("Freq", collapse="|"),colnames(train2), invert=TRUE)]
trainData <- cbind(trainSub, trainLabel, train3)
colnames(trainData)[1:2] <- c("ID", "Activity")

Data <- rbind(trainData, testData)
colnames(Data)[3] <- "tBodyAcc-mean()-X"
colnames(Data)[4] <- "tBodyAcc-mean()-Y"

Data[,2] <- gsub(1, "walk", Data[,2])
Data[,2] <- gsub(2, "walk_up", Data[,2])
Data[,2] <- gsub(3, "walk_down", Data[,2])
Data[,2] <- gsub(4, "sit", Data[,2])
Data[,2] <- gsub(5, "stand", Data[,2])
Data[,2] <- gsub(6, "lay", Data[,2])
Data <- Data[order(Data$ID),]

library(plyr)
new <- ddply(Data,.(ID, Activity),numcolwise(mean))

write.table(new, "./newData.txt", row.names=FALSE)
