# R script called run_analysis.R that does the following. 

# 1 - Merges the training and the test sets to create one data set.
# 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3 - Uses descriptive activity names to name the activities in the data set
# 4 - Appropriately labels the data set with descriptive variable names. 
# 5 - From the data set in step 4, creates a second, independent tidy data set with 
#     the average of each variable for each activity and each subject.

library(data.table)
library(reshape2)
library(dplyr)


# Read in header of feature names 
features <- fread('features.txt')
features = features[[2]]
#full_featured = append(features, c() )

# Read in table of feature values, subject identification number and
# the activity being preformed (test set)
test_DT = read.table(paste0(getwd(),'/test/X_test.txt'), header = FALSE)
test_subject = read.table(paste0(getwd(),'/test/subject_test.txt'), header = FALSE)
test_activity = read.table(paste0(getwd(),'/test/Y_test.txt'), header = FALSE)
# Combine into a single data frame with subject id, feature values and activity number
test_DF = data.frame(test_subject, test_activity, test_DT)


# Read in table of feature values, subject identification number and
# the activity being preformed (test set)
train_DT = read.table(paste0(getwd(),'/train/X_train.txt'), header = FALSE)
train_subject = read.table(paste0(getwd(),'/train/subject_train.txt'), header = FALSE)
train_activity = read.table(paste0(getwd(),'/train/Y_train.txt'), header = FALSE)
# Combine into a single data frame with subject id, feature values and activity number
train_DF = data.frame(train_subject, train_activity, train_DT)

# Combine all the data into a single data frame
combo_DF = rbind(test_DF,train_DF)

# Add feature names for subject id and activity type, then combine with the data
# frame to add names for all columns
feat_names = append(c('subjectidnumber', 'activity'), features)
#feat_names = append(feat_names, 'activityidnumber')
feat_names = tolower(feat_names)
feat_names = gsub('-|--|,','',feat_names)
feat_names = make.names(feat_names)

#feat_names = gsub(".","",feat_names)
print(feat_names)
colnames(combo_DF) <- feat_names

# Find columns where the feature is a 'mean' or a, 'standard deviation' (std) measure
# or either of the two added columns for Subject and Activity identification.
# Keep the columns listed above and remove the rest
keep_features <- grep('*mean*|*std*|*number*|*activity*', feat_names, ignore.case = TRUE)
combo_DF <- combo_DF[keep_features]

# Replace the Activity id numbers with a descriptive lable (ie walking)
# First load lookup table that matches Activity id # to Activity description
act_tab = read.table(paste0(getwd(),'/activity_labels.txt'), header = FALSE)
# then replace ids with activities
combo_DF$activity <- act_tab[,2][match(combo_DF$activity,act_tab[,1])]

# Create a table that finds the mean of each feature for each activity of each subject
# Set up grouping of data
grp_sub_act <- group_by(combo_DF, subjectidnumber, activity)
# Create table of means
tbl_of_means <- summarise_each(grp_subject_act, funs(mean))
# write table to txt file
write.table(tbl_of_means,paste0(getwd(),'/means_table.txt'),row.names = FALSE)


# Read the table of means file back into workspace to view the data in r
data_test <- read.table(paste0(getwd(),'/means_table.txt'), header = TRUE)
View(data_test,'Table of Means Viewer')


