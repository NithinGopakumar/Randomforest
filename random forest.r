data <- read.table("pml-training.csv", header = TRUE, sep = ",", na.strings = c("","NA"))
data
colstrain <- colnames(data[,colSums(is.na(data)) < 0.5*nrow(data)])
train <- data[,colstrain]
train
train <- train[,8:60]
train
Test <- read.table("pml-testing.csv", header = TRUE, sep = ",", na.strings = c("","NA"))
Test
colstest <- colnames(Test[,colSums(is.na(Test)) < 0.5*nrow(Test)])
colstest
Testing <- Test[,colstest]
Testing
testing <- Testing[,8:59]
testing
install.packages("caTools")
require(caTools)

set.seed(101) 
sample = sample.split(train$classe, SplitRatio = .8)
train1 = subset(train, sample == TRUE)
test  = subset(testing, sample == FALSE)


install.packages("randomForest")
library("randomForest")
randomF=randomForest(classe~.,data=train1,importance=FALSE)
randomF
pre=predict(randomF,newdata = test,type = 'class')
pre
table(pre,test$classe)

predict(randomF,newdata = data2,type = 'class')

