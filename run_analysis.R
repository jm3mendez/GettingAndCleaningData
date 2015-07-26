# My Project   GettingAndCleaningData
# JM3
# You should create one R script called run_analysis.R 
# that does the following: 
#
# 1.- Merges the training and the test sets to create one 
#     data set.

library(dplyr)

setwd('/home/jmendez/Coursera/Getting-And-Cleaning-Data/Project')

subtest=as.vector(read.csv('UCI_HAR_Dataset/test/subject_test.txt',sep="\n",header=F))
subtrain=as.vector(read.csv('UCI_HAR_Dataset/train/subject_train.txt',sep="\n",header=F))


xtest=as.vector(read.csv('UCI_HAR_Dataset/test/X_test.txt',sep="\n",header=F))
ytest=as.vector(read.csv('UCI_HAR_Dataset/test/y_test.txt',sep='\n',header=F))

baxtest=as.vector(read.csv('UCI_HAR_Dataset/test/Inertial\ Signals/body_acc_x_test5.txt',sep='\n',header=F))
baytest=as.vector(read.csv('UCI_HAR_Dataset/test/Inertial Signals/body_acc_y_test2.txt',sep='\n',header=F))
baztest=as.vector(read.csv('UCI_HAR_Dataset/test/Inertial Signals/body_acc_z_test2.txt',sep='\n',header=F))

bgxtest=as.vector(read.csv('UCI_HAR_Dataset/test/Inertial\ Signals/body_gyro_x_test2.txt',sep='\n',header=F))
bgytest=as.vector(read.csv('UCI_HAR_Dataset/test/Inertial\ Signals/body_gyro_y_test2.txt',sep='\n',header=F))
bgztest=as.vector(read.csv('UCI_HAR_Dataset/test/Inertial\ Signals/body_gyro_z_test2.txt',sep='\n',header=F))

taxtest=as.vector(read.csv('UCI_HAR_Dataset/test/Inertial\ Signals/total_acc_x_test2.txt',sep='\n',header=F))
taytest=as.vector(read.csv('UCI_HAR_Dataset/test/Inertial\ Signals/total_acc_y_test2.txt',sep='\n',header=F))
taztest=as.vector(read.csv('UCI_HAR_Dataset/test/Inertial\ Signals/total_acc_z_test2.txt',sep='\n',header=F))

#

xtrain=as.vector(read.csv('UCI_HAR_Dataset/train/X_train2.txt',sep="\n",header=F))
ytrain=as.vector(read.csv('UCI_HAR_Dataset/train/y_train.txt',sep='\n',header=F))

baxtrain=as.vector(read.csv('UCI_HAR_Dataset/train/Inertial\ Signals/body_acc_x_train2.txt',sep='\n',header=F))
baytrain=as.vector(read.csv('UCI_HAR_Dataset/train/Inertial\ Signals/body_acc_y_train2.txt',sep='\n',header=F))
baztrain=as.vector(read.csv('UCI_HAR_Dataset/train/Inertial\ Signals/body_acc_z_train2.txt',sep='\n',header=F))

bgxtrain=as.vector(read.csv('UCI_HAR_Dataset/train/Inertial\ Signals/body_gyro_x_train2.txt',sep='\n',header=F))
bgytrain=as.vector(read.csv('UCI_HAR_Dataset/train/Inertial\ Signals/body_gyro_y_train2.txt',sep='\n',header=F))
bgztrain=as.vector(read.csv('UCI_HAR_Dataset/train/Inertial\ Signals/body_gyro_z_train2.txt',sep='\n',header=F))

taxtrain=as.vector(read.csv('UCI_HAR_Dataset/train/Inertial\ Signals/total_acc_x_train2.txt',sep='\n',header=F))
taytrain=as.vector(read.csv('UCI_HAR_Dataset/train/Inertial\ Signals/total_acc_y_train2.txt',sep='\n',header=F))
taztrain=as.vector(read.csv('UCI_HAR_Dataset/train/Inertial\ Signals/total_acc_z_train2.txt',sep='\n',header=F))

# Generate vectors

Subject=c(subtest$V1,subtrain$V1)

X=c(xtest$V1,xtrain$V1)
Y=c(ytest$V1,ytrain$V1)

tBodyAccX=c(baxtest$V1,baxtrain$V1)
tBodyAccY=c(baytest$V1,baytrain$V1)
tBodyAccZ=c(baztest$V1,baztrain$V1)

tBodyGyroX=c(bgxtest$V1,bgxtrain$V1)
tBodyGyroY=c(bgytest$V1,bgytrain$V1)
tBodyGyroZ=c(bgztest$V1,bgztrain$V1)

tTotalAccX=c(taxtest$V1,taxtrain$V1)
tTotalAccY=c(taytest$V1,taytrain$V1)
tTotalAccZ=c(taztest$V1,taztrain$V1)

# df: Tidy 1
df=data.frame(Subject,X,Y,tBodyAccX,tBodyAccY,tBodyAccZ,tBodyGyroX,tBodyGyroY,tBodyGyroZ,tTotalAccX,tTotalAccY,tTotalAccZ)

# 2.- Extracts only the measurements on the mean and 
#     standard deviation for each measurement. 

dfMean=lapply(as.list(df),mean)
dfSd=lapply(as.list(df),sd)

MeanX=dfMean$X
MeanY=dfMean$Y

tBodyAccMeanX=dfMean$tBodyAccX
tBodyAccMeanY=dfMean$tBodyAccY
tBodyAccMeanZ=dfMean$tBodyAccZ

tBodyGyroMeanX=dfMean$tBodyGyroX
tBodyGyroMeanY=dfMean$tBodyGyroY
tBodyGyroMeanZ=dfMean$tBodyGyroZ

tTotalAccMeanX=dfMean$tTotalAccX
tTotalAccMeanY=dfMean$tTotalAccY
tTotalAccMeanZ=dfMean$tTotalAccZ

#ojo time frequency ti unsamble

SdTimeFrecuency=dfSd$X
SdActivity=dfSd$Y

tBodyAccSdX=dfSd$tBodyAccX
tBodyAccSdY=dfSd$tBodyAccY
tBodyAccSdZ=dfSd$tBodyAccZ

tBodyGyroSdX=dfSd$tBodyGyroX
tBodyGyroSdY=dfSd$tBodyGyroY
tBodyGyroSdZ=dfSd$tBodyGyroZ

tTotalAccSdX=dfSd$tTotalAccX
tTotalAccSdY=dfSd$tTotalAccY
tTotalAccSdZ=dfSd$tTotalAccZ

# 3.- Uses descriptive activity names to name the 
#     activities in the data set
#     Activities code
#     1.- Walking
#     2.- Walking_Upstairs
#     3.- Walking_Downstairs
#     4.- Sitting
#     5.- Standing
#     6.- Laying

for (i in 1:length(df$Y)) {
  if(df$Y[i]==1)
    df$Y[i]='Walking'
  else if(df$Y[i]==2)
    df$Y[i]='Walking_Upstairs'
  else if(df$Y[i]==3)
    df$Y[i]='Walking_Downstairs'
  else if(df$Y[i]==4)
    df$Y[i]='Sitting'
  else if(df$Y[i]==5)
    df$Y[i]='Standing'
  else if(df$Y[i]==6)
    df$Y[i]='Laying'  
}

#checking it, ok
select(df,Y)

# 4.- Appropriately labels the data set with descriptive 
#     variable names. 
#
names(df)[3]="Activity"
# the others  Done Before
names(df)

#5.-  From the data set in step 4, creates a second, 
# independent tidy data set with the average of each 
# variable for each activity and each subject.
#
# New TINY
library(reshape2)

tiny2=group_by(df,Activity,Subject)

meltdf=melt(df,id=c("Activity","Subject"),measure.vars=c("X","tBodyAccX","tBodyAccY","tBodyAccZ","tBodyGyroX","tBodyGyroY","tBodyGyroZ","tTotalAccX","tTotalAccY","tTotalAccZ"))

newtiny=dcast(meltdf,Activity + Subject~variable,mean)
group_by(newtiny,Subject,Activity)

write.table(newtiny,file='tiny.txt',row.name=FALSE)

# jm3
#
