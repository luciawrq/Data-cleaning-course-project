#Code Book

##Original Data

The experiments have been carried out with a group of 30 subjects and each person performed six activities. The original data set of 561 features was collected from the accelerometers and gyroscope from the Samsung Galaxy S. The dataset has been randomly partitioned into train set and test set.

##Transforms

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Variables

* ID: subject ID (1-30)
* Activity: one of the six activities performed, 1 WALKING
 2 WALKING_UPSTAIRS
 3 WALKING_DOWNSTAIRS 
4 SITTING 
5 STANDING 
6 LAYING

* column 3:68: average of selected features as described below

From original data  
These signals were used to estimate variables of the feature vector for each pattern (a total of 33):    
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.  
tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The set of variables that were estimated from these signals are:   
mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.   
iqr(): Interquartile range   
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal   
kurtosis(): kurtosis of the frequency domain signal   
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between to vectors.

Out of above variables, mean() and std() were selected for the new Data set.  
Therefore, total feature variables are 33*2=66  

For mean values
The acceleration signals (Acc) are in standard gravity units 'g'.  
The angular velocity signals (Gyro) units are radians/second.   