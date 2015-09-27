# CourseProject
Getting and Cleaning Data Course Project

# Introduction
The data used in this project comes from experiments conducted by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto, Smartlab - Non Linear Complex Systems Laboratory, DITEN - Universit‡ degli Studi di Genova. The experiment collected data on 30 subjects performing 6 activities. Raw data was collected from a smartphone (Samsung Galaxy S II) accelerometer and gyroscope. Raw data was then procesed by a noise filter and then low pass filter to remove gravity components. The triaxial data (x,y,z) of both linear (accelerometer) and angular (gyroscope) acceleration were then combined to generate a 561 feature vector.

# run_analysis script description

The run_analysis.R script has 5 objectives.
 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names. 
 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The script follows these objectives in order, more or less.

# Getting and organizing data
Read in table of feature values, subject identification number and the activity being preformed (test set). The data can be found [here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) The testing and training data files are combined and the subject and activity identification numbers are appended to the data set so that they make up the first two columns of the data frame

# Features
The features of the data set (561 items excluding subject and activity id) are imported from the features.txt file. The feature values then have to be converted to remove parentheses, dashes and commas. To further comply with tidy data standards, the feature names are then coverted to lower case. After all the manipluations are complete, the features are set as the column names of the data frame.

# Activity names
The activity_labels.txt table is imported as a table. The table matches the id numbers 1 to 6 to the activity labels walking, walking upstairs, walking downstairs, sitting, standing and laying. The activity_labels table is applied to the data frame so that activity id numbers are replaced with label names.

# Return tidy data table of means
The data is grouped by subject id and then activity so that there are 180 (30 subjects X 6 activities) subsets. The mean of each feature for each subset is calculated to populate a table of subject and activity feature means. The table is written to a .txt file called TidyData_TableMeas.txt
 
 
