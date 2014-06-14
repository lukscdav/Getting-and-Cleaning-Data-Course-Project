ReadMe
========================================

* Since there are only six activity labels, I made a hardcoded list of activity names where index = number assigned to the activity in activity_labels.txt. 
* There are too many features -> too many labels. Feature vector labels are loaded at runtime from features.txt. 
* I have removed chars that are illegal in variable names in R ('(', ')', ',' and '-') from feature vector labels. 
* In the feature vector labels, "f" prefix has been replaced by more descriptive "frequency" to indicate that the variable is from frequency domain. The same applies to "t" prefix that has been replaced with "time". 
* Since I use aggregate() in the final step and some feature labels are not unique (e.g. label "fBodyAcc-bandsEnergy()-1,16" is present three times), there are less than 561 averages in my tidy data set. It is questionable whether multiple columns with the same name should be considered one variable (in regards to the fifth task of the assignment: "Creates a second, independent tidy data set with the average of **each variable** for each activity and each subject.") or not. 
