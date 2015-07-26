#i.- The data was downloaded, and uncompressed by linux 
#    (extracting phase).
#    staying in my working Directory

wget "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
mv "getdata%2Fprojectfiles%2FUCI HAR Dataset.zip" getdata_projectfiles_UCI_HAR_Dataset.zip
unzip getdata_projectfiles_UCI_HAR_Dataset.zip
mv "UCI HAR Dataset" UCI_HAR_Dataset
#tar -xvf getdata_projectfiles_UCI_HAR_Dataset.zip
#and a new work directory was created.

#ii.- The Data comes noisy, in order to be used adequately I filtered
#     the extra character contains, like excesive blanks characters, ^M
#     Characters, excesive carriage return, etc.
#     At the begining I used the linux sed, like
#        %sed -e "s/^M//g" myfile > myfile2
#     but finally I used the linux awk filter in order to expose data
#     as we need, a columnar aspect. the data row and a carriage return,
#     the data row and cariage return and so on...
# generally over the measured files
#  %awk '{ print$1' }' mytest/mytrain.txt > mytest2/mytrain2.txt
#the complete shells script was:

# the xxxx_test2 and yyyy_train2 files

(cd  UCI_HAR_Dataset/test;
 awk -F" " 'BEGIN{cta=0;}{ print $1; cta++ }END{}' X_test.txt > X_test2.txt;
 cd Inertial*;
 awk '{print $1}' body_acc_x_test.txt > body_acc_x_test2.txt
 awk '{print $1}' body_acc_y_test.txt > body_acc_y_test2.txt
 awk '{print $1}' body_acc_z_test.txt > body_acc_z_test2.txt
 awk '{print $1}' body_gyro_x_test.txt > body_gyro_x_test2.txt
 awk '{print $1}' body_gyro_y_test.txt > body_gyro_y_test2.txt
 awk '{print $1}' body_gyro_z_test.txt > body_gyro_z_test2.txt
 awk '{print $1}' total_acc_x_test.txt > total_acc_x_test2.txt
 awk '{print $1}' total_acc_y_test.txt > total_acc_y_test2.txt
 awk '{print $1}' total_acc_z_test.txt > total_acc_z_test2.txt
)
# Train 
(cd  UCI_HAR_Dataset/train;
 awk -F" " 'BEGIN{cta=0;}{ print $1; cta++ }END{}' X_train.txt > X_train2.txt;
 cd Inertial*;
 awk '{print $1}' body_acc_x_train.txt > body_acc_x_train2.txt
 awk '{print $1}' body_acc_y_train.txt > body_acc_y_train2.txt
 awk '{print $1}' body_acc_z_train.txt > body_acc_z_train2.txt
 awk '{print $1}' body_gyro_x_train.txt > body_gyro_x_train2.txt
 awk '{print $1}' body_gyro_y_train.txt > body_gyro_y_train2.txt
 awk '{print $1}' body_gyro_z_train.txt > body_gyro_z_train2.txt
 awk '{print $1}' total_acc_x_train.txt > total_acc_x_train2.txt
 awk '{print $1}' total_acc_y_train.txt > total_acc_y_train2.txt
 awk '{print $1}' total_acc_z_train.txt > total_acc_z_train2.txt
)

